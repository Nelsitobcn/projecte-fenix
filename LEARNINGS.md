# Lecciones Aprendidas

Este archivo es la memoria del proyecto. Cada bug corregido se documenta aquí
para no repetirlo nunca. LEER ANTES de hacer cambios. ACTUALIZAR después de cada fix.

---

## Formato de entrada

### [CATEGORÍA] Descripción breve
- **Date**: YYYY-MM-DD
- **Bug**: Qué pasó
- **Root cause**: Por qué pasó
- **Fix**: Qué se hizo
- **Rule**: Regla permanente para que no vuelva a pasar
- **Files affected**: Archivos implicados

---

### [DEPLOY] Firebase deploy al proyecto equivocado — sobreescribió PsicoPro
- **Date**: 2026-03-13
- **Bug**: `firebase deploy --only hosting --project psicopro-plataforma` ejecutado desde el directorio de Projecte Fènix. Desplegó 281 archivos de Fènix al hosting de PsicoPro, sobreescribiendo toda la web de producción.
- **Root cause**: Se usó `--project psicopro-plataforma` explícitamente, ignorando el `.firebaserc` local que apunta a `projecte-fenix-tmb`.
- **Fix**: Redesplegado PsicoPro desde `psicotecnicos-proseleccion/dist_temp/`. Luego desplegado Fènix al proyecto correcto.
- **Rule**: NUNCA usar `--project X` si X no coincide con el `.firebaserc` del directorio actual. SIEMPRE verificar con `cat .firebaserc` antes de desplegar. SIEMPRE verificar la web después del deploy.
- **Files affected**: Hosting de psicopro-plataforma.web.app (restaurado)
