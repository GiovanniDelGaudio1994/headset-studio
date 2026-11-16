# Headset Studio — Piano di sviluppo e restyling

## Obiettivo

Evolvere l'applicazione Flutter desktop per cuffie Bluetooth dal prototipo scuro (testato su macOS) al concept Liquid Glass scelto per la versione successiva.

## Stato verificato

| Componente | Stato |
| --- | --- |
| Avvio macOS | Verificato |
| Rilevamento periferica Bluetooth | Testato su Marshall Major III |
| Controllo volume Mac | Testato |
| Batteria hardware | Non ancora verificata: 90% nel mockup solo illustrativo |
| Firmware | Non verificato: 0.0.0 è un placeholder grafico |
| Audio Lab | Pianificato |
| Build Windows | Da testare |

## Asset per il design

- [Concept Liquid Glass originale](https://www.giovannidelgaudio.it/headset-studio-demo/assets/headset-studio-liquid-glass.webp)
- [Video breve della build precedente](https://www.giovannidelgaudio.it/headset-studio-demo/assets/connection-demo.mp4)
- [Video completo della build precedente](https://www.giovannidelgaudio.it/headset-studio-demo/assets/full-demo.mp4)
- [Pagina demo ufficiale](https://www.giovannidelgaudio.it/headset-studio-demo/)

## Roadmap

1. Conservare un branch/tag dell'app Flutter macOS realmente funzionante prima di modificare la UI.
2. Creare nel **repository privato del codice Flutter** un branch `feature/liquid-glass-restyling`.
3. Realizzare dashboard responsive, sidebar, pagina dispositivo e impostazioni.
4. Integrare materiali traslucidi con modalità accessibile e fallback per macOS con trasparenze ridotte.
5. Separare modello dati Bluetooth dai widget; lasciare sconosciuti i valori non acquisibili realmente.
6. Conservare e ritestare il controllo volume e la rilevazione Bluetooth.
7. Implementare Audio Lab solo in seguito, distinguendo i controlli realmente supportati.
8. Verificare macOS prima di estendere a Windows; registrare una nuova demo.
9. Aggiornare documentazione e sito soltanto dopo i test.

## Proprietà e privacy

Questo repository pubblico è una vetrina tecnica. Non pubblicare qui sorgenti Flutter proprietari, certificati di firma, dati personali, profili utente, token o credenziali.

Headset Studio non è un software ufficiale Marshall. Tutti i marchi citati appartengono ai rispettivi titolari.
