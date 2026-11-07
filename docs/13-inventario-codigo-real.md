# Inventario real — módulo viáticos G12

Fuente: clones locales en PC del alumno (`/tmp/g12/…`), 2026-11-06 America/Lima.  
Repos: `BLUTM0ND/g12-public-html`, `BLUTM0ND/g12-android-2222` (privados).  
Sin secretos ni dumps de datos.

---

## 1. Panel web — pantallas viáticos

| Archivo | Rol aproximado |
|---------|----------------|
| `UNION-Users/viatico_detalle.php` | Detalle de envío/rendición (`envios_viaticos` + detalle) |
| `UNION-Users/viaticos_historial_imprimir.php` | Impresión historial |
| `UNION-Users/viaticos_viaje_imprimir.php` | Impresión viaje |
| `UNION-Users/viaticos_preauth_excel.php` | Export preautorización Excel |
| `UNION-Users/assets/viaticos_admin.css` | Estilos admin viáticos |

Integraciones laterales (otras pantallas UNION-Users consultan tablas de viáticos):  
`includes/notif_dashboard.php`, `includes/tareo_helpers.php`, `includes/usuarios_purge.php`.

---

## 2. API PHP (`g12-public-html/api/`)

| Endpoint / script | Función de negocio |
|-------------------|--------------------|
| `iniciar_viaje.php` | Abrir / iniciar viaje |
| `viaje_activo.php` | Consultar viaje activo |
| `cerrar_viaje.php` | Cerrar viaje / liquidar |
| `enviar_viaticos.php` | Enviar rendición / envío de viáticos |
| `registrar_gasto.php` | Registrar gasto |
| `gasto_detalle.php` | Detalle de gasto |
| `ocr.php` | OCR / parseo de comprobante |
| `viaticos_viaje_helpers.php` | Helpers compartidos del módulo |

SQL de apoyo:

- `api/sql/viaticos_schema.sql` — esquema principal  
- `api/sql/viaticos_historial.sql` — historial  
- `api/sql/viaticos_truncate.sql` — limpieza (ops)  
- Doc interno: `api/APLICATIVO DE RENDICIÓN DE CUENTAS DE VIÁTICOS.docx`

---

## 3. Tablas BD

BD referenciada en schema: `ginteroc_mega_sistema`.

### Confirmadas en `api/sql/viaticos_schema.sql` (líneas 1–250)

| Tabla | Uso |
|-------|-----|
| `viaticos_caja_chica` | Saldos asignado / disponible / comprometido por conductor |
| `viaticos_caja_movimientos` | Movimientos de caja; FK lógica `envio_viatico_id` |
| `envios_viaticos` | Cabecera rendición + totales + workflow de estados |
| `envios_viaticos_detalle` | Ítems (`comprobante`/`sin_comprobante`), OCR `extraction_json`, `imagen_nombre` |
| `envios_viaticos_historial` | Auditoría append-only de cambios de estado |
| `viaticos_conductor_perfil` | DNI, código trabajador, placas |

### Citadas en PHP (pendiente extracto SQL >250)

`viaticos_viajes`, `viaticos_gastos`, `viaticos_viaje_aportes`, `viaticos_recarga_solicitudes`, `viaticos_preautorizacion`, `viaticos_preauth_terceros`.

---

## 4. App Android (`g12-android-2222`)

### 4.1 Código vivo relevante (`app/src/main/java/...`)

- `G12PushService.kt` — push / FCM  
- `GastoFechaSinComprobante.kt`, `GastoFormularioJar.java` — formularios de gasto  
- Widgets: layouts `widget_viaticos_*`, drawables mascota viático  
- Módulos hermanos en la misma app: Tareo, Pedidos, OTM, ubicación (fuera del núcleo TAP si se delimita solo viáticos)

### 4.2 Fuentes recuperadas / backups (tesis)

Muchas clases de viáticos están como `.kt.bak` o en `FUENTES_RECUPERADOS_TESIS/decompiled_java/`:

| Componente | Evidencia |
|------------|-----------|
| `ViaticosActivity` / `ViaticosActivityKt` | Pantalla principal conductor |
| `RegistrarGastoActivity` | Alta de gasto + cámara/galería/PDF |
| `EditarGastoActivity` | Edición / eliminación gasto |
| `OcrActivity` | Flujo OCR / vouchers |
| `ViaticosApi` | Cliente HTTP hacia API PHP |
| `ComprobanteExtractor`, `OcrData`, `BitmapOcrUtils` | Extracción OCR |
| `ViaticosModels`, `ViaticosViaje`, `GastoViaje`, `ViajeActivo` | Modelos |
| `G12FcmHelper` | Registro token FCM |
| `ViaticosReportGenerator`, `ViaticosHistorialCalendar` | Reportes / historial |
| `ViaticosHomeWidget` / Compact / Medium | Widgets home |

### 4.3 OCR servidor auxiliar

- `server/ocr_server.py` (+ `README_ocr_server.md`)

### 4.4 Requisitos

- `requerimientos_viaticos.txt` en raíz del repo Android

---

## 5. Flujo técnico resumido (código)

```text
App (ViaticosActivity / RegistrarGasto / OCR)
        │ HTTPS
        ▼
api/*.php  (iniciar_viaje, registrar_gasto, ocr, enviar_viaticos, cerrar_viaje…)
        │
        ├── BD: viaticos_* / envios_viaticos*
        └── archivos comprobante (p. ej. imagen en detalle)
        │
Panel UNION-Users (viatico_detalle, impresiones, preauth excel)
        │
FCM ← G12PushService / G12FcmHelper
```
