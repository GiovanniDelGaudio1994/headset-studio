<div align="center">

# 🎧 Headset Studio

### Un progetto personale nato da un'esigenza quotidiana

**Flutter · Dart · macOS · Bluetooth · Desktop UI**

[🌐 Demo, video e concept](https://www.giovannidelgaudio.it/headset-studio-demo/) · [💼 Portfolio](https://www.giovannidelgaudio.it/) · [📋 Roadmap](docs/RESTYLING.md)

<img src="https://raw.githubusercontent.com/GiovanniDelGaudio1994/giovanni-portfolio/main/portfolio/assets/projects/headset-studio-liquid-glass.webp" width="780" alt="Concept grafico Liquid Glass di Headset Studio" />

<sub>Immagine illustrativa del design: non dimostra che ogni funzionalità raffigurata sia già implementata.</sub>

</div>

---

## 💡 Perché nasce

Uso delle **Marshall Major III Bluetooth**, un modello non supportato dall'app ufficiale Marshall Bluetooth. Da qui è nata l'idea di sviluppare **Headset Studio**, un'applicazione desktop indipendente per visualizzare le informazioni rese disponibili da macOS sulle cuffie collegate e gestire alcune funzioni audio del computer.

L'obiettivo non è sostituire software o firmware ufficiali, ma imparare a integrare una UI Flutter con le funzionalità del sistema operativo e costruire, per gradi, un companion Bluetooth utilizzabile.

## ✅ Funzionalità: cosa è stato verificato e cosa no

| Funzionalità | Stato | Note |
| --- | --- | --- |
| Avvio dell'app Flutter su macOS | ✅ Testato | Prototipo eseguito su Mac |
| Rilevamento delle Major III connesse | ✅ Testato | Test iniziali su un dispositivo reale |
| Stato della connessione | ✅ Testato | Informazioni disponibili tramite macOS |
| Controllo volume del Mac | ✅ Testato | Controllo del volume **di sistema**, non del firmware delle cuffie |
| Dashboard Liquid Glass | 🚧 In evoluzione | Il design e la build reale possono differire |
| Livello batteria e dati del dispositivo | 🔎 Da verificare per ogni modello | Non considerare i valori dei mockup come telemetria reale |
| Audio Lab ed equalizzazione software | 🗓️ In roadmap | Fattibilità e limiti tecnici da testare |
| Gestione ingresso/uscita audio | 🗓️ In roadmap | Dipende dalle API e dai permessi di macOS |
| Modello cuffie 3D interattivo | 🗓️ In roadmap | Funzionalità visiva, non controllo hardware |
| Compatibilità estesa e Windows | 🗓️ In valutazione | Nessuna compatibilità promessa finché non viene testata |

**Nota sulla versione:** la foto del prototipo e i video disponibili documentano momenti diversi dello sviluppo. La tabella non certifica l'ultima build: aggiornare i risultati solo dopo nuovi test.

## 🎧 Dispositivi supportati e compatibilità futura

**Attualmente testato:** Marshall Major III Bluetooth su macOS. Le funzionalità disponibili dipendono dalle informazioni e dai controlli che il sistema operativo espone per il dispositivo collegato.

L'obiettivo futuro è estendere Headset Studio ad **altri modelli e produttori di cuffie Bluetooth**, offrendo una gestione di base dove tecnicamente possibile (stato di connessione, volume di sistema e batteria quando disponibile). Ogni nuovo modello sarà aggiunto all'elenco dei dispositivi verificati solo dopo test reali: **la compatibilità con altri headset non è ancora garantita**.

## 🎬 Video reali e presentazione

- [Video di connessione](https://www.giovannidelgaudio.it/headset-studio-demo/assets/connection-demo.mp4)
- [Video di navigazione e volume](https://www.giovannidelgaudio.it/headset-studio-demo/assets/full-demo.mp4)
- [Pagina pubblica con demo e concept](https://www.giovannidelgaudio.it/headset-studio-demo/)

I video pubblicati nel sito mostrano una **versione precedente dell'interfaccia**. La grafica Liquid Glass è un'evoluzione in corso: evitare di confondere un rendering, un prototipo web e una registrazione dell'applicazione nativa.

## 🧭 Roadmap

### Fase 1 — Base tecnica
- [x] Prototipo macOS avviabile
- [x] Test di rilevamento delle cuffie connesse
- [x] Test di controllo del volume di macOS
- [ ] Verifica ripetibile di stabilità, errori e disconnessioni

### Fase 2 — Esperienza desktop
- [ ] Consolidare il restyling Liquid Glass
- [ ] Migliorare feedback di connessione e stati di errore
- [ ] Verificare il comportamento su diverse risoluzioni e versioni macOS

### Fase 3 — Audio Lab
- [ ] Studiare l'integrazione con le API audio native
- [ ] Valutare equalizzazione software e profili personalizzati
- [ ] Documentare chiaramente ciò che macOS consente e ciò che richiederebbe protocolli proprietari

### Fase 4 — Espansione
- [ ] Testare altri modelli di cuffie
- [ ] Valutare una versione Windows
- [ ] Preparare packaging e distribuzione soltanto dopo test e revisione di permessi e licenze

## 💻 Codice Flutter consultabile

Per permettere a recruiter e sviluppatori di valutare codice concreto, è disponibile un **[prototipo UI Flutter indipendente](examples/early-ui/README.md)**: include una dashboard Material 3, stato immutabile, gestione di connessione simulata, controllo volume dimostrativo e layout adattabile.

📁 **[Esplora i sorgenti Dart](examples/early-ui/lib/main.dart)**

**Chiarezza sulla provenienza:** si tratta di una ricostruzione didattica di un'interfaccia iniziale, non dell'archivio di una vecchia release. Lo stato delle cuffie e il volume sono simulati; il sample non legge dati Bluetooth né modifica il volume di macOS. Le funzioni native testate nei prototipi privati non sono incluse in questo codice.

## 🔒 Disponibilità del codice e proprietà intellettuale

Questo repository è una **vetrina pubblica**: raccoglie descrizione, risorse dimostrative, documentazione e un **esempio Flutter autonomo** consultabile. **Il codice completo dell'applicazione Flutter non viene distribuito qui** e rimane separato.

Una demo nel browser può esporre HTML, CSS, JavaScript e altri asset inviati al client: non pubblicare in una demo web algoritmi o segreti che si intendono proteggere. Prima di ogni pubblicazione controllare anche cronologia Git, file `.env`, token, dati personali, log, percorsi locali e asset con licenze di terzi.

La presenza pubblica di questo README **non concede automaticamente una licenza d'uso sul codice non pubblicato**. Valutare separatamente la licenza dei materiali pubblici e rispettare le licenze delle dipendenze e dei contenuti di terzi.

## ⚖️ Marchi e indipendenza

**Headset Studio è un progetto personale indipendente, non ufficiale e non affiliato, approvato o sponsorizzato da Marshall Group.** Marshall e Major III sono citati esclusivamente per identificare il dispositivo impiegato nei test. I marchi appartengono ai rispettivi titolari.

---

<div align="center"><sub>© 2026 Giovanni Del Gaudio · Headset Studio · Progetto personale in sviluppo</sub></div>