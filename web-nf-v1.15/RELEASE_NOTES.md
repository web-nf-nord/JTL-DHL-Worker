# JTL DHL Community Worker v1.15 – Web-NF Edition

**Vorabversion (Pre-release)** – 25. November 2026  
**Tag:** `v1.15-web-nf`

Weiterentwicklung des ursprünglichen [JTL-DHL-Workers von Nikutrax](https://github.com/Nikutrax/JTL-DHL-Worker) durch Web-NF. Kein offizielles Produkt von JTL oder DHL.

## Wesentliche Änderungen

- Versandstatus und Tracking werden über eine CSV für die Funktion **„Versanddaten importieren“** in JTL-Wawi zurückgeführt; direkte SQL-Schreibzugriffe sind nicht erforderlich.
- **Lesende SQL-Abfragen** zur Sicherheitsprüfung auf bereits verarbeitete Sendungen bleiben erhalten.
- Erweiterungen für **Warenpost International ohne Premium**, Warenpost International Premium und **DHL Paket Empfängerunterschrift**.
- DHL-Sandbox und Production mit getrennten Freigaben und kontrollierter Validierung.
- Einrichtung der produktiven DHL-API-Zugangsdaten mit **Copy-and-Paste** für API-Key und API-Secret sowie lokal DPAPI-verschlüsselter Speicherung.
- Allgemeine Konfigurationsvorlage mit erklärenden Platzhaltern für individuelle Abrechnungsnummern und Serverdaten.
- JTL-Exportbeispiele, Installationsanleitung und Changelog.

## Dateien und Installation

Das vollständige Paket steht als [ZIP-Download](https://github.com/web-nf-nord/JTL-DHL-Worker/releases/download/v1.15-web-nf/JTL-DHL-Worker-v1.15-Web-NF.zip) bereit.

Die Text-Quelldateien sind außerdem im [Ordner `web-nf-v1.15`](https://github.com/web-nf-nord/JTL-DHL-Worker/tree/main/web-nf-v1.15) einsehbar; die binäre JTL-Vorlagendatei `.vlg` bleibt über die ZIP verfügbar. Die Originalversion des PrintAgents wird nicht ersetzt.

**Hinweise:** Die Vorabversion wurde hier nicht vollständig unter Windows PowerShell 5.1 mit produktiver JTL-Wawi und DHL-API getestet. Zunächst Sandbox und eigene Testlieferscheine verwenden. Mehrpaketsendungen und OTTO-Retouren gesondert prüfen. Produktive Zugangsdaten niemals hochladen.

**Lizenz:** GPL-3.0-only, ursprüngliche Urheberhinweise bleiben bestehen.
