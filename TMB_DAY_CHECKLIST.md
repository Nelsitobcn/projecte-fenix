# 🦅 Projecte Fènix — Checklist TMB Day

## ✅ Completat

| Element | Estat |
|---------|-------|
| Formulari funcional (3 passos, localStorage, CSV) | ✅ |
| Secció Evidència Científica (4 refs) | ✅ |
| Secció Costos / ROI (15k → 45k, ROI 3:1) | ✅ |
| Imatge panoràmica al hero | ✅ |
| Menú responsive (hamburguesa) | ✅ |
| Entrevista: checkboxes interactius | ✅ |
| Entrevista: signatura editable + date picker | ✅ |
| Graella expandida a 16 participants | ✅ |
| Text actualitzat: 16 conductors | ✅ |

---

## 📋 Abans del TMB Day — Fes tu manualment

### 1. Git commit (des del teu Terminal Mac)
```bash
cd ~/Desktop/proyectos/projecte-fenix
git add index.html entrevista_semiestructurada.html
git commit -m "🚀 Millores per TMB Day: formulari funcional + evidència + costos"
git push
```

### 2. Descarregar PDFs complets
Els arxius `04_Informe_Contexto_Extraido.txt` i `05_Bases_Participacion_Extraido.txt` estan corruptes (truncats). Descarrega'ls de nou des de TMB SharePoint.

### 3. Eliminar fitxer obsolet
```bash
git rm 03_Prototipo_TMBinnova.html
git commit -m "🗑️ Eliminat prototip obsolet"
```

### 4. Verificar visualment
- Obre `index.html` a Chrome al Mac
- Comprova: hero amb imatge, formulari funcional, seccions Evidència i Costos
- Prova el formulari: 3 passos → envia → exporta CSV
- Obre `entrevista_semiestructurada.html` i comprova checkboxes, signatures i graella

---

## 🎯 El Dia del TMB Day

### Preparació
- [ ] Portàtil carregat al 100%
- [ ] Chrome obert amb `index.html` i `entrevista_semiestructurada.html` en pestanyes
- [ ] Impressions de la graella de buidat (secció 📊) per si falla la tecnologia
- [ ] WiFi no necessari (tot funciona offline amb localStorage)

### Flux de presentació (per cada conductor)
1. **Presentar el projecte** — navegar per index.html (hero → problema → zones → KPIs)
2. **Mostrar evidència** — secció Evidència Científica + Costos/ROI
3. **Recollir consentiment** — entrevista_semiestructurada.html (checkboxes + signatura)
4. **Fer l'entrevista** — seguir el guió de l'entrevista semiestructurada
5. **Omplir formulari** — tornar a index.html → secció Formulari → 3 passos → Enviar
6. **Repetir** per als 16 conductors

### Després de les 16 entrevistes
- [ ] Clicar **📥 Exportar dades (CSV)** al formulari per descarregar totes les respostes
- [ ] El fitxer CSV es pot obrir directament amb Excel per analitzar

---

## 📊 Criteris d'Avaluació (recordatori)

| Criteri | Pes | Com ho cobrim |
|---------|-----|---------------|
| **Innovació** | 30% | 3 zones úniques + tecnologia IoT/sensors |
| **Impacte Social** | 25% | Benestar 2.850 conductors + seguretat vial |
| **Viabilitat Tècnica** | 25% | Pilot 15.000€ + ROI 3:1 en 12 mesos |
| **Sostenibilitat** | 20% | Escalable a 8 cotxeres + model replicable |

---

*Última actualització: 25 feb 2026*
