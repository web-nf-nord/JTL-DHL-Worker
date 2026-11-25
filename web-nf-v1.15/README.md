# JTL DHL Community Worker v1.15 – Web-NF Edition

Weiterentwicklung von [Nikutrax/JTL-DHL-Worker](https://github.com/Nikutrax/JTL-DHL-Worker) durch [Web-NF](https://github.com/web-nf-nord/JTL-DHL-Worker). Kein offizielles Produkt von DHL oder JTL. Lizenz: GPL-3.0-only.

## Funktionen
CSV-Export aus JTL, DHL-Validierung und Labelerstellung, CSV-Rückimport statt SQL-Schreibzugriff. Lesende SQL-Prüfung vor Buchungen bleibt erhalten. PrintAgent aus dem Originalprojekt bleibt unverändert und ist nicht Teil dieses Update-Pakets.

## Einrichtung
Siehe [INSTALLATION.md](INSTALLATION.md). Diese Version ist ein Veröffentlichungskandidat; die aufbereiteten Dateien wurden nicht unter Windows oder gegen die DHL-API getestet.

## Versandarten (exakte Namen in JTL)
| Name | Produkt |
|---|---|
| Versicherter Versand DHL | V01PAK |
| DHL Paket Empfängerunterschrift | V01PAK, signedForByRecipient |
| DHL Kleinpaket | V62KP |
| Versicherter Versand DHL EU | V53WPAK |
| Warenpost International | V66WPI ohne Premium |
| Warenpost International Premium | V66WPI mit Premium |
| DHL Warenpost International | V66WPI mit Premium |
| DHL Otto | V01PAK mit Retoure |

Internationale Sendungen sind auf EU-Ziele beschränkt. OTTO-Retourentracking wird im State gespeichert, nicht in der vierfeldrigen Importdatei übertragen. Vor Nutzung separat prüfen.