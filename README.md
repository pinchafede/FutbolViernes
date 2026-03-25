# ⚽ Viernes FC — App de Estadísticas

App de estadísticas para el fútbol del viernes. Construida con HTML/JS puro, hosteable gratis en **GitHub Pages**, con datos en **Google Sheets**.

## 🚀 Setup rápido

### 1. Subir a GitHub Pages

1. Creá un repo en GitHub (público o privado)
2. Subí `index.html` y `config.js`
3. Settings → Pages → Branch: `main` → Save
4. Tu app estará en: `https://tuusuario.github.io/nombre-del-repo`

### 2. Crear el Google Sheet

Creá una planilla con **3 solapas**:

#### Hoja: `jugadores`
| nombre | apodo | color |
|--------|-------|-------|
| Martín | Toto | #C8F500 |
| Lucas | Luki | #00C8FF |

#### Hoja: `partidos`
| fecha | equipo_a | equipo_b | goles_a | goles_b | mvp | notas |
|-------|----------|----------|---------|---------|-----|-------|
| Vie 07/03 | Los Pibes | Los Cracks | 5 | 3 | Martín | |

#### Hoja: `stats`
| fecha | jugador | goles | asistencias | equipo |
|-------|---------|-------|-------------|--------|
| Vie 07/03 | Martín | 3 | 1 | Los Pibes |

### 3. Hacer la planilla pública

Compartir → "Cualquier persona con el enlace puede ver"

### 4. Obtener API Key

1. [console.cloud.google.com](https://console.cloud.google.com)
2. Crear proyecto → Activar **Google Sheets API**
3. Credenciales → Crear clave de API → Copiar

### 5. Configurar `config.js`

```js
const CONFIG = {
  SHEET_ID: "tu_id_aqui",
  API_KEY:  "tu_api_key_aqui",
  SEASON:   "2025",
};
```

## 📊 Sistema de puntos

| Acción | Puntos |
|--------|--------|
| Gol | 3 pts |
| Asistencia | 1 pt |
| MVP del partido | 5 pts |

## 📅 Flujo semanal

1. Se juega el viernes
2. El admin agrega filas en la hoja `stats` (una por jugador que participó)
3. El admin completa la fila en `partidos` con el resultado y MVP
4. La app se actualiza automáticamente ✅
