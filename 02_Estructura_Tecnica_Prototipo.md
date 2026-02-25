# PROTOTIPO MVP TMBINNOVA - ESTRUCTURA

## 🎯 OBJETIVO
Crear web interactiva con 3 zonas para el reto de innovación urbana.

## 📁 ESTRUCTURA DE ARCHIVOS
```
tmbinnova_prototype/
├── index.html              # Página principal
├── styles.css              # Estilos generales
├── script.js               # JavaScript interactivo
├── data/                   # Datos del reto
│   ├── informe_contexto.pdf
│   └── bases_participacion.pdf
├── zones/                  # Las 3 zonas interactivas
│   ├── zone1_analysis.html
│   ├── zone2_survey.html
│   └── zone3_dashboard.html
└── assets/                 # Imágenes, iconos, etc.
```

## 🗺️ LAS 3 ZONAS INTERACTIVAS

### ZONA 1: ANÁLISIS DEL CONTEXTO
- **Objetivo**: Presentar el problema urbano
- **Contenido**:
  - Resumen ejecutivo del informe
  - Datos clave del contexto
  - Mapa interactivo de la zona
  - Timeline del proyecto

### ZONA 2: ENCUESTA/PARTICIPACIÓN
- **Objetivo**: Recoger feedback ciudadano
- **Contenido**:
  - Formulario Typeform embebido
  - Preguntas clave sobre soluciones
  - Sistema de votación de ideas
  - Subida de propuestas

### ZONA 3: DASHBOARD DE DATOS
- **Objetivo**: Mostrar análisis y métricas
- **Contenido**:
  - Gráficos de participación
  - Análisis de propuestas
  - Impacto estimado
  - Comparativas

## 🚀 PRÓXIMOS PASOS

1. **Analizar PDFs** con Kimi para extraer contenido clave
2. **Crear HTML base** con las 3 zonas
3. **Diseñar UI/UX** moderna y responsive
4. **Implementar interactividad** con JavaScript
5. **Integrar Typeform** real
6. **Crear dashboard** con gráficos

## 📊 DATOS A EXTRAER DE LOS PDFs

### Del Informe Contexto:
- Problema urbano específico
- Datos demográficos
- Mapas y zonas afectadas
- Objetivos del reto
- Cronograma

### De las Bases de Participación:
- Criterios de evaluación
- Formatos de propuesta
- Plazos y fechas
- Premios/incentivos
- Requisitos técnicos

## 🎨 DISEÑO VISUAL
- **Paleta de colores**: Urbana/moderna (azules, grises, verdes)
- **Tipografía**: Sans-serif moderna
- **Layout**: 3 columnas en desktop, vertical en mobile
- **Animaciones**: Suaves transiciones entre zonas

## ⚡ TECNOLOGÍAS
- HTML5, CSS3, JavaScript vanilla
- Chart.js para gráficos
- Typeform API para encuestas
- PDF.js para visualización de documentos
- Responsive design