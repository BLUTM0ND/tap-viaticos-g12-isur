# Flujo de trabajo — PC trabajo ↔ GitHub ↔ Cloud Agent ↔ TAP

## Respuesta corta

**Sí: el proceso está bien.**

1. En la PC Linux del trabajo desarrollas el sistema real (original).  
2. Un botón / script **actualiza y hace push** a los repos privados `BLUTM0ND` (`g12-public-html`, `g12-android-2222`).  
3. El Cloud Agent (o tú con inventario local) **lee ese código** y alimenta la documentación académica.  
4. Este proyecto Cursor/Origin es el **repo de avances / tesis (TAP)** — no el código de producción.

```text
[PC G12 - código real]
        │ push (tu botón)
        ▼
[GitHub privado BLUTM0ND]
        │ lee (PAT / inventario)
        ▼
[Repo académico Cursor = TAP]
        │ editas Word con docs/*
        ▼
[Informe TAP ISUR + anexos]
```

## Qué va en cada sitio

| Sitio | Contenido | ¿Público? |
|-------|-----------|-----------|
| `BLUTM0ND/g12-public-html` | Panel PHP / API / SQL | **No** (empresa) |
| `BLUTM0ND/g12-android-2222` | App Android | **No** (empresa) |
| Este repo Cursor + GitHub público | Markdown TAP, guiones, ER, arquitectura | https://github.com/BLUTM0ND/tap-viaticos-g12-isur |
| Word TAP (local) | Informe formal ISUR | Entrega a asesora |

## Qué no hace falta

- No hace falta otro GitHub de **código** en otra cuenta (el código ya está en BLUTM0ND).  
- Si más adelante quieres un GitHub solo del **informe** (Markdown/PDF), se puede crear aparte; hoy el cuaderno académico **ya es este repo**.

## Secretos

- `GH_TOKEN_GIT` en Cursor: opcional para que el agente clone solo.  
- Mientras el Cloud no inyecte el secreto, el inventario desde la PC (como hiciste) es válido y suficiente.
