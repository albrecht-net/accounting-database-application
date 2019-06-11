# Changelog (accounting database application)
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## v1.2.0 (2019.06.11)
### Added
- In der Tabelle "version" ist die Versionsinformation der Datenbank hinterlegt. Diese werden bei der Ersterstellung oder bei einem Datenbank-Update automatisch eingefügt.
### Removed
- Updateanweisungen (dbTablesApplication.update.sql) wurden bereinigt, da diese noch Versionsnummerierung der Accounting Repository beinhalteten. Das sofortige Entfernen dieser Anweisungen hat keinen Nachteil für den Benutzer!
### Note
- Alle erwähnten Versionsnummern (ausser ausdrücklich erwähnt) beziehen sich auf diese Repository. Die Kompabilität zu Accounting muss mithilfe der Versionsübersicht ([versionOverview.xlsx](https://github.com/albrecht-net/accounting/blob/master/versionOverview.xlsx)) sichergestellt werden.

---

## v1.0.0 (2019.04.10)
### Added
- Datenbank-Vorlagen für die Applikations-Datenbank in eigene Repository verschoben.