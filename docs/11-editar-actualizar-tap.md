# Cómo editar / actualizar el Word del TAP

Guía operativa para Israel (PC Linux del trabajo o casa) al incorporar lo cimentado en este repo.

---

## 1. Fuentes oficiales

Colocar en `docs/fuentes/` (no versionar datos sensibles de empresa):

- `Estructura_TAP.pdf` — capítulos obligatorios  
- `ISUR-TAP-001.pdf` — plantilla / instructivo si aplica  
- PDF de malla curricular  

## 2. Orden de edición recomendado

1. Abrir checklist `docs/07-checklist-estructura-tap.md` y marcar huecos.  
2. Actualizar **5a Metodología** con texto de `docs/08` (híbrido).  
3. Actualizar **arquitectura** con `docs/09` (y nombres reales cuando existan).  
4. Actualizar **procesos / BD** con `docs/10` y ER `docs/04`.  
5. Revisar **Introducción** (diagnóstico con cifras, problema, objetivos).  
6. Alinear **Conclusiones / Recomendaciones** con narrativa: avance + transición pendiente.  
7. Completar **Anexos** (RF, UML Mermaid exportado, ER, capturas).  
8. Revisar **Referencias**.

## 3. Exportar diagramas Mermaid

- Usar visor Mermaid (VS Code / mermaid.live) → PNG/SVG.  
- Insertar en el Word con título y fuente (“Elaboración propia”).  

## 4. Control de versiones académico

- Este repo Cursor/Origin = avances y borradores Markdown.  
- El `.docx` del TAP puede vivir fuera de Git o en carpeta local; si se sube, **sin** datos personales de terceros ni credenciales.  
- Tras cada reunión con asesora: anotar acuerdos en `docs/05-estado-proyecto.md`.

## 5. Relación con código G12

| Acción en código (PC trabajo) | Acción académica |
|-------------------------------|------------------|
| Push a `BLUTM0ND/g12-*` | Avisar / dejar que Cloud Agent re-analice |
| Nueva pantalla o endpoint | Actualizar `09` y `10` |
| Cambio de tabla | Actualizar `04` y anexo ER |
| Capacitación / transición | Actualizar recomendaciones y anexos |

## 6. Frase corta para portada / tema

Sistema de gestión y rendición de viáticos de viaje con aplicación móvil y panel web (escáner de comprobantes) — G12 Interoceánica S.A.C.
