#!/bin/bash
# Projecte Fènix - Generador de narración con voz española
# Ejecutar en Mac: bash generar_narracion.sh

cd ~/Desktop/proyectos/projecte-fenix
mkdir -p audio_clips

echo "🎙️ Generando narración en español..."

# Slide 0 - Intro (5s)
say -v "Monica" -r 160 -o audio_clips/00_intro.aiff \
  "Proyecto Fénix. La Pausa de Bienestar. Ganadores del reto número 38 de T.M.B. innova 2025."

# Slide 1 - El Problema (6s)
say -v "Monica" -r 155 -o audio_clips/01_problema.aiff \
  "El problema. Quinientos veinticinco conductores comparten comedores ruidosos sin espacios de calma. Las zonas fantasma acumulan polvo y máquinas viejas sin uso."

# Slide 2 - 3 Zonas overview (5s)
say -v "Monica" -r 155 -o audio_clips/02_zonas.aiff \
  "Nuestra solución: Las tres velocidades del descanso. Tres espacios diferenciados para socializar, descansar y recuperarse."

# Slide 3 - Zona Activa (5s)
say -v "Monica" -r 155 -o audio_clips/03_activa.aiff \
  "Zona Activa. El comedor renovado con doble microondas, vending saludable y enchufes U.S.B. Capacidad para cuarenta personas."

# Slide 4 - Zona Calma (5s)
say -v "Monica" -r 155 -o audio_clips/04_calma.aiff \
  "Zona de Calma. Silencio absoluto con butacas reclinables para micro siestas. Iluminación regulable y plantas relajantes."

# Slide 5 - Zona Recuperació (5s)
say -v "Monica" -r 155 -o audio_clips/05_recuperacio.aiff \
  "Zona de Recuperación Activa. Espalderas de madera y esterillas para estiramientos de cinco minutos entre servicios."

# Slide 6 - Food Trucks (5s)
say -v "Monica" -r 155 -o audio_clips/06_trucks.aiff \
  "Escalabilidad. Food trucks de bienestar móviles para llegar a las tres cocheras de Barcelona por solo cuatro mil ochocientos euros cada uno."

# Slide 7 - KPIs (6s)
say -v "Monica" -r 150 -o audio_clips/07_kpis.aiff \
  "Impacto esperado. Treinta por ciento menos fatiga, ochenta y cinco por ciento de satisfacción y quince por ciento menos absentismo. Respaldado por evidencia de la O.M.S. y Transport for London."

# Slide 8 - Tools (6s)
say -v "Monica" -r 155 -o audio_clips/08_tools.aiff \
  "Herramientas de validación. Formulario móvil con código Q.R., entrevista con grabación de audio, y dashboard de resultados en tiempo real para el T.M.B. Day."

# Slide 9 - Closing (6s)
say -v "Monica" -r 150 -o audio_clips/09_cierre.aiff \
  "Proyecto Fénix. Porque descansar bien no es un lujo, es una necesidad para conducir seguro. Visita projecte fénix t.m.b. punto web punto app. Gracias."

echo "✅ Clips generados en audio_clips/"

# Convertir AIFF a WAV y concatenar con duraciones correctas
echo "🔧 Combinando clips con silencios..."

# Duración de cada slide en segundos
durations=(5 6 5 5 5 5 5 6 6 6)
files=("00_intro" "01_problema" "02_zonas" "03_activa" "04_calma" "05_recuperacio" "06_trucks" "07_kpis" "08_tools" "09_cierre")

# Convertir cada clip a WAV
for f in "${files[@]}"; do
    ffmpeg -y -i "audio_clips/${f}.aiff" "audio_clips/${f}.wav" 2>/dev/null
done

# Crear archivos de silencio para padding y concatenar
concat_list=""
for i in "${!files[@]}"; do
    dur=${durations[$i]}
    f=${files[$i]}
    # Pad each clip to exact duration
    ffmpeg -y -i "audio_clips/${f}.wav" -af "apad=whole_dur=${dur}" -ac 1 -ar 44100 "audio_clips/${f}_padded.wav" 2>/dev/null
    concat_list="${concat_list}file '${f}_padded.wav'\n"
done

# Write concat list
echo -e "$concat_list" > audio_clips/concat.txt

# Concatenate all
cd audio_clips
ffmpeg -y -f concat -safe 0 -i concat.txt -c:a pcm_s16le narracion_completa.wav 2>/dev/null
cd ..

# Combinar con el video
echo "🎬 Combinando video + narración..."
ffmpeg -y \
    -i projecte_fenix_v2.mp4 \
    -i audio_clips/narracion_completa.wav \
    -filter_complex "[1:a]volume=1.5[narr];[0:a]volume=0.3[music];[narr][music]amix=inputs=2:duration=shortest[out]" \
    -map 0:v -map "[out]" \
    -c:v copy -c:a aac -b:a 192k \
    -shortest \
    projecte_fenix_FINAL.mp4 2>/dev/null

if [ -f projecte_fenix_FINAL.mp4 ]; then
    echo ""
    echo "🎉 ¡VIDEO FINAL CREADO!"
    echo "📁 Archivo: projecte_fenix_FINAL.mp4"
    echo "📏 Tamaño: $(du -h projecte_fenix_FINAL.mp4 | cut -f1)"
    echo ""
    echo "🔗 Ábrelo con: open projecte_fenix_FINAL.mp4"
else
    echo "❌ Error al combinar. Verifica que ffmpeg está instalado (brew install ffmpeg)"
fi
