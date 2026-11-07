# Índice — Repo tesis TAP (viáticos G12)

**Alumno:** Israel David Velásquez Gonzales  
**Uso:** casa y trabajo — toda la información académica del TAP vive **aquí**.

## Cómo usarlo

| Dónde | Qué haces |
|-------|-----------|
| Trabajo (PC G12) | Código real → botón push a `BLUTM0ND` |
| Casa o trabajo | Abres este repo de tesis / agente Cursor y continúas docs |
| Word TAP | Copias desde `docs/15` + diagramas de `04`/`03`/`09` |

Flujo detallado: `docs/14-flujo-trabajo-alumno-agente.md`.

---

## Carpeta `docs/` (núcleo académico)

| # | Archivo | Para qué |
|---|---------|----------|
| 00 | `00-indice-tesis-tap.md` | Este índice |
| 01 | `01-reunion-asesora.md` | Guion reunión / narrativa |
| 02 | `02-requisitos.md` | RF / RNF |
| 03 | `03-casos-de-uso.md` | Casos de uso Mermaid |
| 04 | `04-modelo-er.md` | ER + ENUM reales del schema |
| 05 | `05-estado-proyecto.md` | Estado y narrativa |
| 06 | `06-recorrido-malla.md` | Malla DSI ↔ TAP |
| 07 | `07-checklist-estructura-tap.md` | Checklist 10 capítulos ISUR |
| 08 | `08-metodologia-cascada-agil.md` | Híbrido (5a) |
| 09 | `09-arquitectura.md` | Arquitectura con archivos reales |
| 10 | `10-procesos-viaticos-y-bd.md` | Procesos + BD |
| 11 | `11-editar-actualizar-tap.md` | Cómo editar el Word |
| 12 | `12-acceso-repos-codigo.md` | Acceso a código BLUTM0ND |
| 13 | `13-inventario-codigo-real.md` | Inventario API/pantallas/app |
| 14 | `14-flujo-trabajo-alumno-agente.md` | PC ↔ GitHub ↔ tesis |
| 15 | `15-borrador-capitulos-tap.md` | Texto listo para el Word |

## Carpeta `escritorio/` (imprimibles reunión)

- `guion-reunion.md`
- `puntos-a-proponer.md`
- `cimientos-imprimibles.md`

## `docs/fuentes/`

PDFs ISUR (`Estructura_TAP.pdf`, etc.) cuando los copies aquí.

## Código de empresa (NO va aquí)

- `BLUTM0ND/g12-public-html` — panel/API  
- `BLUTM0ND/g12-android-2222` — app  

Este repo solo documenta; no publica el código ni secretos.

## Schema SQL

`api/sql/viaticos_schema.sql` termina ~línea 250 (caja, envíos, detalle, historial, perfil).  
Tablas `viaticos_viajes` / gastos / preauth siguen documentadas por uso en PHP (`docs/13`); si aparecen en otro `.sql`, se añaden después.
