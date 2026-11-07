# Casos de uso — Viáticos G12

Diagramas en Mermaid para anexos / capítulo Desarrollo. Ajustar nombres de pantallas tras análisis de código.

## Diagrama de actores y casos (visión general)

```mermaid
flowchart LR
  Colab[Colaborador]
  Sup[Supervisor]
  Cont[Contabilidad]
  Adm[Administrador]
  Sys[Sistema OCR/FCM]

  Colab --> CU01
  Colab --> CU02
  Colab --> CU03
  Colab --> CU04
  Sup --> CU05
  Cont --> CU06
  Cont --> CU07
  Adm --> CU08
  Sys --> CU09
  Sys --> CU10

  CU01[CU-01 Solicitar viáticos]
  CU02[CU-02 Registrar gasto]
  CU03[CU-03 Escanear comprobante]
  CU04[CU-04 Enviar rendición]
  CU05[CU-05 Autorizar fondos]
  CU06[CU-06 Revisar rendición]
  CU07[CU-07 Reportes]
  CU08[CU-08 Administrar catálogos]
  CU09[CU-09 Procesar OCR]
  CU10[CU-10 Notificar estado]
```

## CU-01 Solicitar viáticos

| Campo | Detalle |
|-------|---------|
| Actor | Colaborador |
| Precondición | Usuario autenticado |
| Flujo básico | Abrir solicitud → datos viaje → monto → enviar |
| Postcondición | Solicitud en estado pendiente de autorización |
| Excepciones | Datos incompletos; usuario sin permiso |

## CU-03 Escanear comprobante (detalle)

```mermaid
sequenceDiagram
  actor U as Colaborador
  participant App as App Android
  participant API as API PHP
  participant OCR as Motor OCR
  participant BD as Base de datos

  U->>App: Captura foto comprobante
  App->>API: Sube imagen + id gasto/viaje
  API->>OCR: Solicita extracción
  OCR-->>API: RUC, serie, número, monto, fecha
  API->>BD: Guarda archivo + lectura sugerida
  API-->>App: Datos OCR
  U->>App: Confirma / corrige
  App->>API: Confirma datos finales
  API->>BD: Actualiza gasto
```

## Matriz casos de uso ↔ RF

| CU | RF |
|----|-----|
| CU-01 | RF-02 |
| CU-02 | RF-05, RF-06 |
| CU-03 | RF-07, RF-08 |
| CU-04 | RF-09 |
| CU-05 | RF-03, RF-04 |
| CU-06 | RF-10, RF-15 |
| CU-07 | RF-12, RF-13 |
| CU-08 | RF-14 |
| CU-09 | RF-07 |
| CU-10 | RF-11 |
