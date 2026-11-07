# Estado del proyecto — Notas de narrativa

Actualizado: 2026-11-06 17:25 America/Lima

## Resumen ejecutivo (para asesora)

| Dimensión | Estado |
|-----------|--------|
| Construcción en G12 | Avance práctico significativo; urgencia empresarial |
| Pilotos | Realizados con resultado aceptable |
| Producción plena | **No** afirmar “ya en producción / 95%” |
| Pendiente operativo | **Transición**: capacitación y cierre de implantación |
| Pendiente académico | Poner TAP en regla (estructura ISUR + cimientos) |

## Qué sí se puede decir

1. Existe un sistema real (panel web PHP + app Android) orientado a viáticos y comprobantes.
2. La empresa impulsó el desarrollo por necesidad operativa.
3. Hubo uso piloto; el cierre formal (transición) está pendiente.
4. El trabajo académico actual es documentar con rigor (método, arquitectura, RF/UML/ER, resultados).

## Qué no se debe decir

- “Recién empezamos de cero.”
- “Ya está terminado / en producción estable al 95%.”
- Exponer datos sensibles de la empresa o hacer públicos los repos de código.

## Metodología acordada para el informe

**Híbrido**

- **Cascada** → orden del TAP: requisitos → análisis/UML/ER → implementación → pruebas → transición.
- **Ágil** → construcción real con G12 en iteraciones:
  1. Viaje / fondos  
  2. Gastos / OCR  
  3. Revisión  
  4. Cierre / reportes  

Ver `docs/08-metodologia-cascada-agil.md`.

## Próximos pasos técnicos (agente / alumno)

1. ~~Clonar en Cloud con secreto~~ — bypass: inventario desde PC del alumno (HTTPS + PAT local).
2. ~~Inventariar módulo~~ — hecho (`docs/13-inventario-codigo-real.md`).
3. ~~Actualizar `docs/04`, `09`, `10`~~ — nombres reales de API/tablas/pantallas.
4. ~~Schema `viaticos_schema.sql`~~ — completo (~250 líneas) en `docs/04`.
5. Repo tesis consolidado: índice `docs/00`, README casa/trabajo.
6. Pasar borrador `docs/15` al Word (`docs/11`) + capturas + transición.
7. Pulsar **Create repo** en Cursor para remoto estable usable en casa y trabajo.
8. Flujo: PC → push BLUTM0ND → docs TAP aquí (`docs/14`).
