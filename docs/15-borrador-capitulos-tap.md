# Borrador de capítulos TAP (para pegar al Word)

Alumno: **Israel David Velásquez Gonzales**  
Programa: Desarrollo de Sistemas de Información — ISUR  
Empresa: **G12 Interoceánica S.A.C.**  
Tema: Sistema de gestión y rendición de viáticos de viaje (app móvil + panel web con escáner de comprobantes)

Usar con checklist `docs/07` y método `docs/08`. Editar el Word según `docs/11`.

---

## 1. Título (propuesta)

Sistema de gestión y rendición de viáticos de viaje con aplicación móvil y panel web, incluyendo digitalización asistida de comprobantes, para G12 Interoceánica S.A.C.

## 3. Resumen (borrador)

Se documenta el desarrollo de un sistema de rendición de viáticos para personal de viaje (conductores) de G12 Interoceánica S.A.C., compuesto por una aplicación Android y un panel web PHP. El sistema permite iniciar viajes, registrar gastos con o sin comprobante, asistir la captura mediante OCR, enviar rendiciones y revisarlas en un flujo de estados (operaciones, contabilidad, tesorería) con control de caja chica. La construcción en la empresa se realizó de forma iterativa; la documentación del TAP se organiza bajo un enfoque híbrido (cascada documental + desarrollo ágil/incremental). El pendiente operativo principal es la **transición** (capacitación y cierre formal de implantación).

**Palabras clave:** viáticos, OCR, aplicación móvil, panel web, rendición de cuentas, G12.

## 4. Introducción — problema y objetivos (borrador)

**Problema:** la rendición manual de viáticos genera demoras, poca trazabilidad de comprobantes y dificultad de conciliación entre fondos entregados y gastos del viaje.

**Objetivo general:** desarrollar e implantar un sistema de gestión y rendición de viáticos con app móvil y panel web, con digitalización asistida de comprobantes, que mejore el control, los tiempos y la evidencia documental en G12.

**Objetivos específicos (propuesta):**
1. Analizar el proceso de viáticos y definir requisitos (RF/RNF).  
2. Diseñar arquitectura web+móvil+API+BD+OCR+notificaciones.  
3. Implementar módulos de viaje, gastos/OCR, envío y revisión.  
4. Validar con pilotos y documentar resultados.  
5. Proponer plan de transición (capacitación y cierre).

## 5a. Metodología

Enfoque **híbrido** (texto listo en `docs/08-metodologia-cascada-agil.md`).

## 5b. Desarrollo — arquitectura y BD (apuntes)

- Portal: `g12-public-html` → `UNION-Users` + `api/`.  
- App: Android (`ViaticosActivity`, gastos, OCR, FCM).  
- BD: `ginteroc_mega_sistema` — tablas `envios_viaticos*`, `viaticos_caja_*`, `viaticos_conductor_perfil`, etc.  
- Estados de envío: `enviado`, `revision_operaciones`, `revision_contabilidad`, `validacion_tesoreria`, `observado`, `aprobado_cerrado`, `rechazado`.  
Detalle: `docs/09`, `docs/10`, `docs/04`, `docs/13`.

## 5c. Resultados

- Avance práctico en empresa; pilotos OK.  
- Evidencia: capturas app/web (anexos).  
- Pendiente: transición.

## 6–7. Conclusiones y recomendaciones

Conclusiones alineadas a objetivos; recomendar capacitación por roles (conductor / operaciones / contabilidad / tesorería), manuales cortos y criterio de cierre de implantación.

## 10. Anexos (lista)

A. RF/RNF (`docs/02`)  
B. Casos de uso (`docs/03`)  
C. ER y extracto SQL (`docs/04`)  
D. Arquitectura (`docs/09`)  
E. Inventario de archivos (`docs/13`)  
F. Capturas de pantalla  
G. Plan de transición  
