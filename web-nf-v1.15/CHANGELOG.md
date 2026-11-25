# Änderungen v1.15 – Web-NF
- CSV-Rückimport statt direkter SQL-Schreibzugriffe; lesende Sicherheitsprüfung bleibt.
- Warenpost International mit und ohne Premium, Empfängerunterschrift.
- Production-Einrichtung mit Zwischenablage für API Key und Secret unverändert übernommen.
- Öffentliche Konfiguration anonymisiert, Production standardmäßig gesperrt.
- Exportpfad der XML-Vorlage an Beispielkonfiguration angeglichen.
- Platzhalter für Abrechnungsnummern werden im Worker abgewiesen; Validierungslog ohne feste Nummern.
- PrintAgent nicht Bestandteil dieses Updates.