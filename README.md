# ⚽ Viernes FC — v2

App completa de estadísticas para el fútbol del viernes. GitHub Pages + Supabase, 100% gratis.

## 🚀 Setup en 3 pasos

### 1. Crear las tablas en Supabase
1. Entrá a [supabase.com](https://supabase.com) → tu proyecto
2. SQL Editor → New query
3. Pegá el contenido de `supabase_setup.sql` → Run

### 2. Completar `config.js`
```js
const CONFIG = {
  SUPABASE_URL:     "https://xxxx.supabase.co",
  SUPABASE_KEY:     "eyJ...",       // anon/public key
  ADMIN_PASSWORD:   "tu-contraseña",
  SEASON:           "2025",
};
```
Encontrás la URL y KEY en: Supabase → Project Settings → API

### 3. Subir a GitHub Pages
1. Subí `index.html` y `config.js` al repo
2. Settings → Pages → Branch main → Save
3. Listo en `tuusuario.github.io/viernes-fc`

## 📊 Sistema de puntos
| Acción | Puntos |
|--------|--------|
| Victoria | 3 pts |
| Empate | 1 pt |
| Derrota | 0 pts |
| Cada 4 partidos jugados | +1 pt bonus |

## 🏆 Rankings de honor (sin efecto en tabla)
- Goleador del año
- MVP más votado del año

## 📅 Flujo semanal
1. Abrís el panel Admin en la app (con contraseña)
2. Seleccionás los 14 que juegan y los asignás a cada equipo
3. Después del partido, cargás los goles de cada uno
4. Seleccionás el resultado → se guarda y abre la votación MVP
5. Mandás el link al grupo de WhatsApp
6. Todos entran, ven la tabla y votan el MVP
7. Desde Admin cerrás la votación cuando quieras
