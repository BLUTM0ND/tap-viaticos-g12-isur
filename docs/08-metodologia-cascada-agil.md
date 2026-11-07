# Metodología — Cascada, ágil e híbrido (recomendado para 5a)

Documento para cimentar el capítulo **5. Desarrollo → Metodología** del TAP, según pedido de la asesora.

---

## 1. Cascada (waterfall)

### Idea central
Secuencia de fases con entregables documentales: requisitos → análisis/diseño → implementación → pruebas → transición/mantenimiento.

### Cómo se usa en este TAP
La **documentación académica** sigue cascada para cumplir la estructura ISUR:

| Fase cascada | Entregable en el TAP |
|--------------|----------------------|
| Requisitos | RF/RNF, casos de uso (`docs/02`, `03`) |
| Análisis / diseño | UML, ER, arquitectura (`docs/03`, `04`, `09`) |
| Implementación | Descripción de módulos web/app/API (`docs/10`) |
| Pruebas | Resultados de pilotos / casos de prueba |
| Transición | Capacitación, cierre de implantación (pendiente operativo) |

### Fortalezas para el informe
- Orden claro para la asesora y el jurado.
- Facilita trazabilidad objetivo → requisito → diseño → evidencia.

### Limitaciones
- No describe bien el ritmo real de construcción con la empresa (cambios por urgencia).

---

## 2. Métodos ágiles

### Idea central
Entregar valor en **iteraciones cortas**, con feedback del usuario (colaboradores, contabilidad, jefatura).

### Cómo se usó en G12 (construcción real)

| Iteración | Alcance | Valor para el negocio |
|-----------|---------|------------------------|
| 1 | Viaje / solicitud / fondos | Control de salida de dinero |
| 2 | Gastos + captura + OCR | Menos digitación, evidencia |
| 3 | Revisión / estados | Control contable |
| 4 | Cierre / reportes | Liquidación y visibilidad |

Prácticas ágiles aplicables (nombrar solo las que se puedan sustentar):
- Priorización por urgencia del negocio  
- Demostraciones / pilotos con usuarios reales  
- Ajuste de pantallas según feedback de campo  
- Backlog implícito del módulo viáticos  

### Fortalezas
- Encaja con la urgencia de G12.
- Explica por qué hay avance práctico antes del TAP “perfecto”.

### Limitaciones
- Sin rituales formales (si no hubo Scrum completo, **no inventar** sprints/ceremonias). Decir “enfoque iterativo / incremental inspirado en ágil”.

---

## 3. Enfoque híbrido (recomendado)

```text
                    ┌─────────────────────────────┐
                    │  INFORME TAP (Cascada)      │
                    │  requisitos → diseño → …    │
                    │  → pruebas → transición     │
                    └──────────────▲──────────────┘
                                   │ evidencia
                    ┌──────────────┴──────────────┐
                    │  CONSTRUCCIÓN G12 (Ágil)    │
                    │  iteraciones 1→4 + pilotos  │
                    └─────────────────────────────┘
```

**Redacción sugerida para el Word:**

> Se adoptó un enfoque híbrido: la construcción del sistema con la empresa se realizó de forma iterativa e incremental (priorizando viaje/fondos, gastos/OCR, revisión y cierre), mientras que la documentación del TAP se organiza bajo el ciclo en cascada exigido por la estructura institucional, asegurando requisitos, diseño, implementación, pruebas y plan de transición.

---

## 4. Justificación ante la asesora

1. **Cascada sola** no reflejaría la urgencia y los pilotos.  
2. **Ágil solo** no ordenaría el informe académico.  
3. **Híbrido** une verdad operativa + forma ISUR.

---

## 5. Transición (fase aún abierta)

Aunque el desarrollo esté avanzado, la cascada exige documentar **transición**:
- Capacitación a roles (viajero, supervisor, contabilidad)
- Manuales / guías rápidas
- Acompañamiento inicial
- Criterios de aceptación de cierre de implantación

Esto es el pendiente operativo a enfatizar sin negar el avance.
