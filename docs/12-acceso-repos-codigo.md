# Acceso a repos de código (privado)

## Repos (NO hacer públicos)

| Repo | URL | Uso |
|------|-----|-----|
| Panel web / PHP | `https://github.com/BLUTM0ND/g12-public-html.git` | Endpoints, pantallas, SQL |
| App Android | `https://github.com/BLUTM0ND/g12-android-2222.git` | Activities, API client, OCR/FCM |

Cuenta GitHub: **BLUTM0ND** (código de empresa).  
Repo académico (público): https://github.com/BLUTM0ND/tap-viaticos-g12-isur  
(también sincronizado desde este proyecto Cursor/Origin).

## Secreto

- Nombre: **`GH_TOKEN_GIT`** (Runtime Secret / secreto de Cloud Agents en Cursor — token de GitHub).  
- Alias histórico: `GH_TOKEN` (si aparece, también sirve).  
- Uso: clonar/fetch de los repos privados desde el Cloud Agent.  
- **Nunca** imprimir el valor, ni commitarlo, ni pegarlo en docs.  
- Hosting de la empresa: **sin** credenciales en el agente; solo código vía GitHub.

### Inyección en el agente

Cursor inyecta secretos **al arrancar** el Cloud Agent. Si el secreto se agregó o actualizó con un agente ya en ejecución, esa VM **no** lo verá hasta iniciar un **agente nuevo** con el secreto ya guardado en [Cloud Agents → Secrets](https://cursor.com/dashboard/cloud-agents).

Comprobación segura (sin revelar el valor):

```bash
test -n "${GH_TOKEN_GIT:-}" && echo "GH_TOKEN_GIT=present" || echo "GH_TOKEN_GIT=missing"
```

## Procedimiento del agente

```bash
# Verificar presencia (sin imprimir valor)
TOKEN="${GH_TOKEN_GIT:-${GH_TOKEN:-}}"
test -n "$TOKEN" && echo present || echo missing

# Clonar en /tmp o vendor (gitignored)
git clone "https://x-access-token:${TOKEN}@github.com/BLUTM0ND/g12-public-html.git" /tmp/g12/g12-public-html
git clone "https://x-access-token:${TOKEN}@github.com/BLUTM0ND/g12-android-2222.git" /tmp/g12/g12-android-2222
```

## Flujo del alumno

1. Trabaja en PC Linux del trabajo.  
2. Botón / comando actualiza y **push** a GitHub (`BLUTM0ND`).  
3. Desde casa o trabajo, el Cloud Agent lee GitHub con `GH_TOKEN`.  
4. El agente actualiza docs académicos (04, 09, 10, etc.) y hace commit/push **solo** en este repo de avances.

## Política

- No crear otro repo público de código salvo pedido explícito del usuario.  
- No subir a este repo académico copias completas del código de producción ni dumps de BD.  
- Sí: inventarios, nombres de archivos, diagramas, extractos mínimos anonimizados si hacen falta para el TAP.
