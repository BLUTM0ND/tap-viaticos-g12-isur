# Modelo entidad-relación — Viáticos G12 (schema real)

Fuente: `api/sql/viaticos_schema.sql` (BD `ginteroc_mega_sistema`) + inventario `docs/13`.  
Motor: **MySQL/InnoDB**, charset `utf8mb4`.

## Diagrama ER (tablas del schema leído)

```mermaid
erDiagram
  VIATICOS_CAJA_CHICA ||--o{ VIATICOS_CAJA_MOVIMIENTOS : mueve
  ENVIOS_VIATICOS ||--|{ ENVIOS_VIATICOS_DETALLE : detalla
  ENVIOS_VIATICOS ||--o{ ENVIOS_VIATICOS_HISTORIAL : audita
  ENVIOS_VIATICOS ||--o{ VIATICOS_CAJA_MOVIMIENTOS : afecta
  VIATICOS_CONDUCTOR_PERFIL ||--o| VIATICOS_CAJA_CHICA : perfil

  VIATICOS_CAJA_CHICA {
    varchar conductor_usuario PK
    varchar conductor_nombre
    decimal saldo_asignado
    decimal saldo_disponible
    decimal saldo_comprometido
    datetime updated_at
  }

  VIATICOS_CAJA_MOVIMIENTOS {
    int id PK
    varchar conductor_usuario
    enum tipo
    decimal monto
    decimal saldo_despues
    int envio_viatico_id FK
    varchar descripcion
    datetime created_at
  }

  ENVIOS_VIATICOS {
    int id PK
    varchar token UK
    varchar conductor_usuario
    varchar conductor_nombre
    varchar dni
    varchar base
    varchar ruta
    longtext viaje_json
    longtext conciliacion_json
    decimal total_entregado
    decimal total_comprobantes
    decimal total_sin_comprobante
    decimal total_gastado
    decimal saldo_final
    enum estado
    datetime fecha_envio
  }

  ENVIOS_VIATICOS_DETALLE {
    int id PK
    int envio_id FK
    int orden
    enum tipo
    varchar concepto
    varchar proveedor
    decimal total
    longtext extraction_json
    varchar imagen_nombre
    enum estado_item
  }

  ENVIOS_VIATICOS_HISTORIAL {
    int id PK
    int envio_id FK
    varchar accion
    varchar desde_estado
    varchar hacia_estado
    text comentario
    longtext meta_json
    datetime created_at
  }

  VIATICOS_CONDUCTOR_PERFIL {
    varchar conductor_usuario PK
    varchar dni
    varchar codigo_trabajador
    varchar placa_tracto
    varchar placa_semiremolque
    varchar placa_bombona
  }
```

## Estados de negocio (ENUM reales)

### `envios_viaticos.estado`
`enviado` → `revision_operaciones` → `revision_contabilidad` → `validacion_tesoreria` → `aprobado_cerrado`  
Alternativas: `observado`, `rechazado`.

### `envios_viaticos_detalle.estado_item`
`pendiente` | `aprobado` | `rechazado` | `observado`

### `envios_viaticos_detalle.tipo`
`comprobante` | `sin_comprobante`

### `viaticos_caja_movimientos.tipo`
`asignacion` | `rendicion` | `devolucion` | `reembolso` | `ajuste`

## Tablas adicionales citadas en PHP

`viaticos_schema.sql` **termina ~línea 250** (el `sed 250,500` vacío lo confirma).  
Estas tablas aparecen en PHP (`usuarios_purge`, tareo, API viaje); pueden crearse en otro script o en helpers:

| Tabla | Evidencia |
|-------|-----------|
| `viaticos_viajes` | PHP / API viaje |
| `viaticos_gastos` | PHP |
| `viaticos_viaje_aportes` | PHP |
| `viaticos_recarga_solicitudes` | PHP |
| `viaticos_preautorizacion` | PHP + `viaticos_preauth_excel.php` |
| `viaticos_preauth_terceros` | PHP |

Para el TAP basta documentarlas por uso en código; si aparece otro `.sql`, se anexa.

## Notas TAP

- Nombre lógico BD en comentario del script: `ginteroc_mega_sistema` (no pegar usuarios/contraseñas).  
- OCR: campo `extraction_json` en detalle; evidencia `imagen_nombre`.  
- Auditoría: `envios_viaticos_historial` append-only (Remitir / Devolver / ítems / rechazo).
