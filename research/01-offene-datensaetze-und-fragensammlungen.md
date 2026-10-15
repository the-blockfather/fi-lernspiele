# 01 – Offene Datensätze, Fragensammlungen & OER-Quellen

**Stand:** 15.10.2026 · **Kontext:** fi-lernspiele (Browser-Quiz für Fachinformatiker-Grundstufe, LF03/LF04/LF05)  
**Zielgruppe:** Entwickler, Didaktiker und KI-Agenten in weiteren Chats zur direkten Extraktion und Spielintegration.

---

## 1. Kurzfazit & Top-5-Empfehlungen

1. **IANA Service Name & Port Number Registry (CSV)**: Sofort nutzbar für Port-Generatoren und Zuordnungsspiele (LF03). Offizieller Weltstandard, lizenzfrei nachnutzbar, maschinenlesbar.
2. **BSI IT-Grundschutz (Elementare Gefährdungen & Bausteine)**: Lizenz `dl-de/by-2-0`. Perfektes Fundament für LF04 (Schutzbedarfsanalyse, Risikobewertung, Bedrohungsszenarien wie G 0.14 Ausfall der Stromversorgung oder G 0.23 Schadprogramme).
3. **Chinook Database (SQLite/SQL-Dump)**: MIT-Lizenz. Das sauberste relationale Schema für LF05 (Kunden, Rechnungen, Tracks). Läuft mit `sql.js` (WebAssembly) komplett ohne Server im Browser.
4. **OWASP Top 10**: CC BY-SA 4.0. Pflichtstoff für Websicherheit und sichere Softwareentwicklung (LF04/LF05). Vor allem Injection (SQLi), Broken Access Control und Security Misconfiguration.
5. **inf-schule.de (OER-Material)**: CC BY-SA 4.0. Fachlich hochqualitatives Lehrmaterial aus Rheinland-Pfalz für Netzwerke (Routing, Schichten), SQL und Datenmodellierung mit fertigen didaktischen Aufgaben.

---

## 2. Bewertungstabelle im Überblick

| # | Datensatz / Quelle | Thema / LF | Format | Lizenz | Lizenz-Sicherheit | Fachqualität | Passung AP1 | Integr.-Aufwand | Empfehlung |
|---|---|---|---|---|---|---|---|---|---|
| 1 | **IANA Port Registry** | Ports, Protokolle (LF03) | CSV / XML | Open / Public Domain | ★★★★★ | ★★★★★ | ★★★★★ | ★★★★★ (5) | ✅ Direkt nutzen |
| 2 | **IEEE OUI Registry** | MAC-Adressen, Vendor (LF03) | CSV / TXT | Open Data (IEEE) | ★★★★★ | ★★★★★ | ★★★★☆ | ★★★★☆ (4) | ✅ Filtern & nutzen |
| 3 | **BSI IT-Grundschutz** | Gefährdungen, Maßnahmen (LF04) | HTML / PDF / XML | dl-de/by-2-0 | ★★★★★ | ★★★★★ | ★★★★★ | ★★★★☆ (4) | ✅ Direkt nutzen |
| 4 | **OWASP Top 10** | App-Sicherheit, Angriffe (LF04/05) | MD / HTML / PDF | CC BY-SA 4.0 | ★★★★★ | ★★★★★ | ★★★★★ | ★★★★★ (5) | ✅ Direkt nutzen |
| 5 | **Chinook Database** | SQL, Relationen (LF05) | SQL / SQLite | MIT | ★★★★★ | ★★★★★ | ★★★★★ | ★★★★★ (5) | ✅ Direkt nutzen |
| 6 | **Sakila Sample DB** | SQL, Relationen (LF05) | SQL / SQLite | BSD | ★★★★★ | ★★★★★ | ★★★★☆ | ★★★★☆ (4) | ✅ Als Alternative |
| 7 | **inf-schule.de** | Netzwerke, SQL, Logik (LF03–05) | HTML / OER | CC BY-SA 4.0 | ★★★★★ | ★★★★★ | ★★★★★ | ★★★★☆ (4) | ✅ Didaktik-Vorbild |
| 8 | **ZUM-Unterrichten** | Informatik-Aufgaben (LF01–05) | Wiki / HTML | CC BY-SA 4.0 | ★★★★★ | ★★★★☆ | ★★★★☆ | ★★★☆☆ (3) | ⚠️ Prüfen & kuratieren |
| 9 | **Open Trivia DB** | IT-Allgemeinwissen | JSON API | CC BY-SA 4.0 | ★★★★★ | ★★☆☆☆ | ★★☆☆☆ | ★★★★★ (5) | ⚠️ Nur Popkultur-Quiz |
| 10 | **Anki Shared Decks** | IT-Kaufleute / Fachinformatiker | APKG | Meist CC / Unklar | ★★☆☆☆ | ★★★☆☆ | ★★★★☆ | ★★☆☆☆ (2) | ⚠️ Nur als Fragenspeicher |

*(Aufwand: 5 = sehr geringer Integrationsaufwand, 1 = extrem aufwändig)*

---

## 3. Detailanalysen & Validierung

### 3.1 IANA Service Name and Transport Protocol Port Number Registry
- **URL:** `https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.csv`
- **Relevanz:** Lernfeld 3 (Netzwerkprotokolle, Transportprotokolle TCP/UDP, Well-Known Ports).
- **Lizenz:** IANA / ICANN Open Specification Data (Public Domain / offene Weiternutzung).
- **Format:** CSV (Spalten: `Service Name`, `Port Number`, `Transport Protocol`, `Description`, `Assignee`, `Contact`, `Registration Date`, etc.).
- **Stichproben-Validierung:**
  - Port 20/21: `ftp-data` / `ftp` (TCP) – korrekt.
  - Port 22: `ssh` (TCP/UDP) – korrekt.
  - Port 53: `domain` (DNS, TCP/UDP) – korrekt.
  - Port 80: `http` (TCP) – korrekt.
  - Port 443: `https` (TCP) – korrekt.
- **Didaktische Reduktion für das Quiz:**
  - IANA listet über 10.000 Ports. Für Fachinformatiker-Grundstufe sind **ca. 30 Kern-Ports** prüfungsrelevant:
    - 20/21 (FTP), 22 (SSH), 23 (Telnet), 25 (SMTP), 53 (DNS), 67/68 (DHCP), 69 (TFTP), 80 (HTTP), 110 (POP3), 123 (NTP), 143 (IMAP), 161/162 (SNMP), 389 (LDAP), 443 (HTTPS), 445 (SMB), 465 (SMTPS), 587 (SMTP Submission), 636 (LDAPS), 993 (IMAPS), 995 (POP3S), 3306 (MySQL), 3389 (RDP), 5432 (PostgreSQL).
- **Konkrete Spielidee:**
  - *Port-Matcher:* Port-Nummer fliegt ins Bild, Spieler muss Protokoll und Einsatzzweck zuordnen.
  - *Firewall-Regel-Builder:* "Blockiere unverschlüsselten Mailversand" -> Spieler wählt TCP Port 25.

---

### 3.2 IEEE OUI (Organizationally Unique Identifier) Registry
- **URL:** `http://standards-oui.ieee.org/oui/oui.csv`
- **Relevanz:** Lernfeld 3 (Layer 2, Ethernet-Frame, MAC-Adressaufbau: 24 Bit OUI + 24 Bit NIC-spezifisch, I/G-Bit, U/L-Bit).
- **Lizenz:** IEEE Standards Association Public Directory (frei für Verifikation und Software-Nutzung).
- **Format:** CSV (`Registry`, `Assignment`, `Organization Name`, `Organization Address`).
- **Stichproben-Validierung:**
  - `00-0C-29` / `00-50-56` -> VMware, Inc.
  - `00-1A-2B` / `00-00-0C` -> Cisco Systems, Inc.
  - `B8-27-EB` / `DC-A6-32` / `E4-5F-01` -> Raspberry Pi Trading Ltd.
  - `F0-18-98` -> Apple, Inc.
- **Didaktische Spielidee:**
  - *Detektiv im ARP-Cache:* Der Spieler sieht eine ARP-Tabelle (`arp -a`) und muss anhand der ersten 3 Byte der MAC-Adresse fremde Geräte (z. B. nicht autorisierter Raspberry Pi im Server-VLAN) aufspüren.

---

### 3.3 BSI IT-Grundschutz-Kompendium & Elementare Gefährdungen
- **URL:** `https://www.bsi.bund.de/DE/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/IT-Grundschutz/it-grundschutz_node.html`
- **Relevanz:** Lernfeld 4 (Schutzbedarfsanalyse, Grundwerte Vertraulichkeit/Integrität/Verfügbarkeit, Gefährdungslage, bauliche/organisatorische/technische Maßnahmen).
- **Lizenz:** Datenlizenz Deutschland – Namensnennung – Version 2.0 (`dl-de/by-2-0`).
- **Verifizierte Inhalte:**
  - **47 Elementare Gefährdungen (G 0.1 bis G 0.47):**
    - G 0.1: Feuer
    - G 0.2: Ungünstige klimatische Bedingungen
    - G 0.14: Ausfall der Stromversorgung
    - G 0.15: Abhören / Spionage
    - G 0.19: Offenlegung schutzbedürftiger Informationen
    - G 0.22: Manipulation von Hard- oder Software
    - G 0.23: Schadprogramme
    - G 0.28: Software-Schwachstellen oder -Fehler
    - G 0.43: Einspielen unautorisierter Software
  - **Bausteine des IT-Grundschutzes (Edition 2023/2026):**
    - `INF.1`: Allgemeines Gebäude
    - `INF.2`: Rechenzentrum sowie Serverraum
    - `NET.1.1`: Netzarchitektur und -design
    - `NET.1.2`: Netz- und Systemmanagement
    - `SYS.1.1`: Allgemeiner Server
    - `OPS.1.1.4`: Wiederanlaufplanung
    - `CON.2`: Datenschutz
- **Konkrete Spielidee:**
  - *Schutzbedarfs-Klassifikator:* Azubi bekommt Assets vorgelegt (z. B. Patientendaten, Firmenwebsite, Zeiterfassungssystem) und muss Schutzbedarf (Normal / Hoch / Sehr Hoch) für C, I und A begründet einstufen.
  - *Maßnahmen-Deck:* Zu einer Gefährdung (z. B. G 0.14 Stromausfall) müssen passende Schutzmaßnahmen (USV Klasse VFI, Notstromaggregat, redundante Netzteile) gewählt werden.

---

### 3.4 OWASP Top 10
- **URL:** `https://owasp.org/Top10/` (GitHub: `https://github.com/OWASP/Top10`)
- **Relevanz:** Lernfeld 4 & Lernfeld 5 (Sichere Software, Eingabevalidierung, Webapplikationen).
- **Lizenz:** Creative Commons Attribution-ShareAlike 4.0 International (`CC BY-SA 4.0`).
- **Verifizierte Kategorien:**
  - A01:2021 – Broken Access Control (Fehlende Zugriffskontrolle)
  - A02:2021 – Cryptographic Failures (Kryptografiefehler, z. B. MD5/SHA1 für Passwörter)
  - A03:2021 – Injection (insbes. SQL Injection, Cross-Site Scripting)
  - A04:2021 – Insecure Design
  - A05:2021 – Security Misconfiguration (Standard-Passwörter, offene Ports)
  - A06:2021 – Vulnerable and Outdated Components (z. B. Log4Shell)
  - A07:2021 – Identification and Authentication Failures (schwache Passwörter, fehlende 2FA)
- **Konkrete Spielidee:**
  - *Code-Audit-Minigame (LF05):* Dem Spieler wird ein 5-Zeilen-Codeabschnitt gezeigt (`"SELECT * FROM users WHERE user = '" + input + "'"`). Frage: Welche OWASP-Kategorie liegt vor? Wie sieht das Prepared Statement aus?

---

### 3.5 Chinook Database & Beispieldatenbanken (LF05)
- **URL:** `https://github.com/lerocha/chinook-database`
- **Relevanz:** Lernfeld 5 (Relationale Datenmodelle, SQL-Abfragen: SELECT, WHERE, JOIN, GROUP BY, HAVING).
- **Lizenz:** MIT License.
- **Aufbau & Tabellen:**
  - `Artist` (ArtistId, Name)
  - `Album` (AlbumId, Title, ArtistId)
  - `Track` (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
  - `Genre` (GenreId, Name)
  - `MediaType` (MediaTypeId, Name)
  - `Invoice` (InvoiceId, CustomerId, InvoiceDate, BillingAddress, Total)
  - `InvoiceLine` (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity)
  - `Customer` (CustomerId, FirstName, LastName, Company, Email, SupportRepId)
  - `Employee` (EmployeeId, LastName, FirstName, Title, ReportsTo, BirthDate, HireDate)
- **Warum Chinook perfekt ist:**
  - Enthält Rekursion / Self-Join (`Employee.ReportsTo -> Employee.EmployeeId`).
  - Enthält m:n Beziehungen gelöst über Zwischentabellen (`InvoiceLine` verbindet `Invoice` und `Track`).
  - Lauffähig als Single-File SQLite (`chinook.db`, ca. 1 MB). Kann direkt via `sql.js` in den Browser geladen werden.

---

### 3.6 inf-schule.de (Informatik-Portal)
- **URL:** `https://www.inf-schule.de/`
- **Lizenz:** Creative Commons Namensnennung - Weitergabe unter gleichen Bedingungen 4.0 International (`CC BY-SA 4.0`).
- **Inhalte für IT-Berufe:**
  - *Rechnernetze:* Kommunikation in Netzen, Schichtenmodelle, Routing, Client-Server-Prinzip.
  - *Datenbanken:* Relationales Modell, Normalisierung (1NF bis 3NF), SQL-Abfragen, Integritätsbedingungen.
  - *Formale Sprachen & Automaten:* Endliche Automaten (gut für Protokollzustände wie TCP 3-Way-Handshake!).
- **Stichprobe:** Didaktisch exzellent strukturiert, Schülerorientiert, fehlerfreie Begriffswelt nach deutschen Lehrplänen.

---

## 4. Lizenz-Hinweise für die Nachnutzung im Quiz

1. **CC BY 4.0 & dl-de/by-2-0 (z. B. BSI, offene Dokumente):**
   - Weiternutzung, Kürzung, Umformulierung für Quizfragen erlaubt.
   - **Pflicht:** Im Impressum oder Info-Dialog des Lernspiels muss ein Quellenverweis stehen:  
     *„Enthält Daten des Bundesamtes für Sicherheit in der Informationstechnik (BSI), lizenziert unter dl-de/by-2-0.“*
2. **CC BY-SA 4.0 (z. B. OWASP, inf-schule.de, Wikipedia):**
   - Enthält die **Share-Alike-Klausel**: Wenn bearbeitete Texte/Fragen übernommen werden, müssen die betroffenen Fragensammlungen ebenfalls unter CC BY-SA 4.0 veröffentlicht werden.
   - Da das GitHub-Repo `the-blockfather/fi-lernspiele` ohnehin ein offenes Bildungsprojekt ist, harmoniert dies ideal.
3. **MIT / BSD (z. B. Chinook, sql.js):**
   - Code und Datenbank-Schemas können ohne Copyleft-Einschränkung direkt in das Web-Projekt kopiert werden. Lizenztext im Quelltextordner beilegen.
4. **Keine Nutzung:**
   - Echte IHK-Prüfungsfragen der Aufgabenstelle für kaufmännische Abschluss- und Zwischenprüfungen (AkA / ZPA). Diese unterliegen dem Urheberrecht der IHK/U-Form-Verlag und dürfen **nicht kopiert werden**. Nur die thematischen Strukturen und Kompetenzziele dürfen didaktisch frei nachempfunden werden!

---

## 5. Bereitstellung für andere Chats

Um die Daten in anderen Chats zu verwenden, können folgende Pfade und Quellen referenziert werden:
- **Port-Daten:** `research/01-offene-datensaetze-und-fragensammlungen.md#31-iana-service-name-and-transport-protocol-port-number-registry`
- **BSI-Gefährdungen:** `research/01-offene-datensaetze-und-fragensammlungen.md#33-bsi-it-grundschutz-kompendium--elementare-gefaehrdungen`
- **SQL-Datensatz:** `https://github.com/lerocha/chinook-database` (Datei `Chinook_Sqlite.sql`)
