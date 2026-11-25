# Installation

## 1. Vorbereitung
Windows PowerShell 5.1, JTL-Wawi, DHL-API-Zugang und passende Vertragsprodukte. Dateien in einen lokalen Ordner entpacken. config.example.json nach config.json kopieren. Alle benötigten Platzhalter ersetzen. Die Ordner unter C:\JTL-DHL können angepasst werden; Exportvorlagen und Worker müssen denselben Exportpfad verwenden.

## 2. Sandbox
Im DHL Developer Portal Zugang für Parcel DE Shipping Sandbox einrichten. ApiKey, ApiSecret, Username und Password in config.json eintragen. Environment bleibt Sandbox; alle drei Production-Freigaben bleiben false. SandboxBilling und SandboxShipper sind Testwerte aus der Vorlage. Die fiktive JTL-Export-Beispiel.csv in den Exportordner kopieren und Start-Sandbox-Validierung.cmd ausführen. Das Skript validiert einmalig ohne Buchung. Testdateien nicht für Production weiterverwenden.

## 3. JTL-Export
Die XML-Exportvorlage bzw. VLG-Lieferscheinvorlage in der passenden JTL-Vorlagenverwaltung einrichten. Die VLG ist eine Ausgabevorlage, kein eigenständiger Workflow. Einen Lieferschein-Workflow so konfigurieren, dass die CSV-Ausgabe ausgelöst wird. Die genaue Menüführung hängt von der Wawi-Version ab. Kopfzeile und Beispiel liegen bei. Versandartnamen exakt wie in README verwenden. Zunächst Ein-Paket-Lieferscheine testen: die XML-Vorlage referenziert das erste Paket, die VLG verwendet das Gesamtgewicht; Mehrpaketsendungen sind deshalb nicht freigegeben.

## 4. Production
Production-Zugang-Einrichten.cmd unter demselben Windows-Konto und auf demselben Rechner ausführen, auf dem der Worker läuft. API Key und Secret im Portal kopieren, Z oder Enter wählen, nach Aufforderung Enter drücken und mit J bestätigen; alternativ M für verdeckte manuelle Eingabe. Benutzername und Passwort eingeben. Die erzeugte production-credentials.json ist Windows-DPAPI-geschützt und bleibt lokal. Zwischenablage anschließend leeren.

ProductionBilling, ShipperRef (DHL-Absenderreferenz), Profile und bei Bedarf OTTO-Retourendaten passend zum Vertrag eintragen. JtlSqlServer und JtlDatabase auf die eigene Instanz setzen. Das Windows-Konto benötigt lesenden SQL-Zugriff auf die verwendeten JTL-Tabellen. SQL-Schreibrechte sind nicht erforderlich.

Environment auf Production setzen, ProductionValidationEnabled auf true, die beiden übrigen Freigaben auf false lassen. Start-Production-Validierung.cmd ausführen. Beide Validierungs-CMDs verwenden die Umgebung aus config.json; Dateiname allein wählt keine Umgebung. Vor jedem Start kontrollieren. Nach erfolgreicher Validierung und Prüfung der Exportdateien kann ProductionEnabled bewusst aktiviert werden. Für den automatischen Betrieb zusätzlich AutoProductionEnabled auf true setzen und Start-Production-Automatik_withouthidden.cmd starten (Strg+C beendet). Die andere CMD startet mit verborgenem PowerShell-Fenster. Nur eine Instanz betreiben.

## 5. Versanddatenimport
Der Worker schreibt pro Sendung eine CSV in ImportPath\JTL-Versandimport. In JTL unter Versanddaten importieren eine Vorlage „DHL Worker“ mit Semikolon, ohne Kopfzeile, UTF-8 (BOM) und folgender Reihenfolge konfigurieren: ID-Nummer (Lieferscheinnummer); Tracking-Nr; Datum (dd.MM.yyyy); Versandinfos (Versandart). Beispiel: 1234-001;TESTTRACKING;25.11.2026;DHL Kleinpaket. Das Beispiel nicht produktiv importieren. Mit einem echten Testlieferschein Zuordnung und Versandstatus prüfen; anschließend Marktplatz-Tracking kontrollieren. State und Backup aufbewahren. Bei Fehlern nach DHL-Buchung zuerst im DHL-Portal prüfen, nicht blind erneut buchen.

## 6. PrintAgent (optional)
Originalversion aus dem Repository verwenden. PDF24 Creator installieren, print-config.example.json nach print-config.json kopieren, LabelPath passend zum Worker setzen (auch UNC möglich), Druckername exakt eintragen und PDF24-Pfad prüfen. Testdruck vor Dauerbetrieb. Start über vorhandene CMD oder Windows-Aufgabenplanung bei Benutzeranmeldung. Retourenlabels aus dem automatischen Druck ausschließen. Keine persönlichen Konfigurationen veröffentlichen.

## Sicherheit
Keine echten Zugangsdaten, Kunden-CSV, Labels, Logs oder State-Dateien in Git einchecken. .gitignore schützt nur nicht bereits versionierte Dateien. Vor Echtbetrieb Backup und Tests durchführen. Keine Mehrpaket- oder OTTO-Automatisierung ohne gesonderte Prüfung. Die aufbereiteten Dateien wurden statisch geprüft, nicht unter PowerShell 5.1 ausgeführt.