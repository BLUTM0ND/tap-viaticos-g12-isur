# Requisitos — Sistema de viáticos G12

Fuente viva para el capítulo de Desarrollo y Anexos (RF). Contrastar con código tras clonar repos privados.

## Actores

| Actor | Descripción |
|-------|-------------|
| Colaborador / viajero | Solicita fondos, registra gastos, adjunta comprobantes, rinde |
| Supervisor / jefe | Autoriza viajes/fondos, revisa rendiciones |
| Contabilidad / tesorería | Valida comprobantes, cierra rendiciones, reportes |
| Administrador sistema | Usuarios, parámetros, catálogos |
| Sistema (OCR / notificaciones) | Extrae datos de comprobantes; empuja alertas (FCM) |

---

## Requisitos funcionales (RF)

| ID | Requisito | Prioridad | Notas |
|----|-----------|-----------|-------|
| RF-01 | Autenticación de usuarios (web y móvil) | Alta | Sesión / token según implementación real |
| RF-02 | Registrar solicitud de viaje / viáticos | Alta | Destino, fechas, motivo, monto estimado |
| RF-03 | Aprobar / rechazar solicitud de fondos | Alta | Flujo supervisor |
| RF-04 | Entregar / registrar desembolso de fondos | Alta | Tesorería |
| RF-05 | Registrar gastos del viaje | Alta | Categoría, monto, fecha, observación |
| RF-06 | Adjuntar foto/PDF de comprobante | Alta | App móvil + web |
| RF-07 | Escanear / OCR de comprobante | Alta | Extracción RUC, serie, número, monto, fecha |
| RF-08 | Validar y corregir datos OCR antes de guardar | Alta | Usuario confirma lectura |
| RF-09 | Enviar rendición a revisión | Alta | Estado del viaje/caja |
| RF-10 | Revisar rendición (aprobar/observar/rechazar) | Alta | Contabilidad / supervisor |
| RF-11 | Notificar cambios de estado | Media | Push FCM / correo según exista |
| RF-12 | Consultar historial de viajes y gastos | Media | Filtros por usuario/fechas |
| RF-13 | Generar reportes / exportación | Media | Panel web |
| RF-14 | Administrar catálogos (tipos gasto, centros de costo, etc.) | Media | Admin |
| RF-15 | Cerrar viaje / liquidar saldo | Alta | Devolución o reembolso |

> **Actualización pendiente:** mapear cada RF a pantallas PHP y Activities/Fragments Android reales (post-clon).

---

## Requisitos no funcionales (RNF)

| ID | Requisito | Criterio |
|----|-----------|----------|
| RNF-01 | Disponibilidad | Acceso desde campo (móvil) y oficina (web) |
| RNF-02 | Usabilidad móvil | Flujo de captura de comprobante en pocos pasos |
| RNF-03 | Seguridad | Credenciales no en cliente; HTTPS; control de roles |
| RNF-04 | Integridad de evidencia | Comprobantes almacenados y asociados al gasto |
| RNF-05 | Trazabilidad | Estados y auditoría de cambios en la rendición |
| RNF-06 | Rendimiento OCR | Respuesta usable en condiciones de red típicas de viaje |
| RNF-07 | Compatibilidad | Android (versión mínima a documentar desde `build.gradle`) |
| RNF-08 | Mantenibilidad | Separación panel web / API PHP / app |

---

## Reglas de negocio (borrador)

1. No se rinde sin solicitud/fondo asociado (salvo excepciones documentadas).
2. Todo gasto con comprobante debe tener archivo adjunto.
3. Montos OCR son sugerencia; prevalece confirmación del usuario / contabilidad.
4. Solo roles autorizados cambian estado a “aprobado/cerrado”.
5. Saldo del viaje = fondos entregados − gastos aprobados (± devoluciones).
