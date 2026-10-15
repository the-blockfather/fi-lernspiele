# 04 – Fachquellen, Normen & Faktencheck (Prüfungswissen)

**Stand:** 15.10.2026 · **Kontext:** fi-lernspiele (Inhaltliche Validierung, IHK-Prüfungskatalog & Lehrplanbezug)  
**Zielgruppe:** Entwickler, Dozenten und KI-Agenten zur Gewährleistung absoluter fachlicher Korrektheit.

---

## 1. Kurzfazit & Relevanz für die AP1

1. **Prüfungsmaßstab:** Für die gestreckte Abschlussprüfung Teil 1 (**AP1 – „Einrichten eines IT-gestützten Arbeitsplatzes“**) sind die gemeinsamen **Lernfelder 1 bis 5** nach der Ausbildungsverordnung von 2020 (FIAusbV 2020) und dem KMK-Rahmenlehrplan maßgeblich (Gewichtung: **20 % der Gesamtnote**).
2. **Normen-Treue:** Aufgaben in IHK-Prüfungen stützen sich auf DIN/EN/ISO-Normen und RFCs. Typische Fehler entstehen durch veraltete Begriffe (z. B. noch von "Hubs" auszugehen, alte TCP-RFCs zu zitieren oder SI- und IEC-Präfixe zu vermischen).
3. **Schutzbedarf nach BSI:** In LF04 ist die dreistufige Definition nach **BSI-Standard 200-2** (Normal, Hoch, Sehr Hoch) Standard; Vierstufensysteme oder freie Skalen führen in Prüfungen zu Punktabzug.

---

## 2. Normen- und Standard-Referenz

### 2.1 Relevante Internet RFCs (IETF)

| RFC | Titel / Thema | Kerninhalt & Prüfungsrelevanz | Verlässlichkeit | AP1-Relevanz |
|---|---|---|---|---|
| **RFC 791** | Internet Protocol (IPv4) | Header-Aufbau (20–60 Byte), TTL, Fragmentierung, Checksumme | ★★★★★ | ★★★★★ |
| **RFC 8200** | Internet Protocol, Version 6 (IPv6) | Ersetzt RFC 2460 als Full Standard (2017). Fester 40-Byte-Header, Next Header, Hop Limit. | ★★★★★ | ★★★★★ |
| **RFC 4291** | IPv6 Addressing Architecture | Adresspräfixe (`fe80::/10` Link-Local, `2000::/3` Global Unicast, `::1/128` Loopback, `ff00::/8` Multicast). | ★★★★★ | ★★★★★ |
| **RFC 5952** | A Recommendation for IPv6 Text Representation | **Verbindliche Kürzungsregeln**: Führende Nullen weg, längste Nullfolge mit `::`, Kleinbuchstaben! | ★★★★★ | ★★★★★ |
| **RFC 1918** | Address Allocation for Private Internets | Private IP-Bereiche: `10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`. Nicht im Internet geroutet! | ★★★★★ | ★★★★★ |
| **RFC 3021** | Using 31-Bit Prefixes on IPv4 Point-to-Point Links | Erlaubt `/31` für P2P-Verbindungen (2 Adressen, keine dedizierte Netz-/Broadcast-Adresse nötig). | ★★★★★ | ★★★☆☆ |
| **RFC 9293** | Transmission Control Protocol (TCP) | **Ersetzt seit 2022 das legendäre RFC 793!** 3-Way-Handshake (SYN, SYN-ACK, ACK), Flow-Control, Flags. | ★★★★★ | ★★★★★ |
| **RFC 768** | User Datagram Protocol (UDP) | Verbindungslos, unzuverlässig, schlanker 8-Byte-Header (Source Port, Dest Port, Length, Checksum). | ★★★★★ | ★★★★★ |
| **RFC 826** | An Ethernet Address Resolution Protocol (ARP) | IP-zu-MAC-Auflösung in Broadcast-Domänen (Layer 2/3 Bindeglied). | ★★★★★ | ★★★★★ |
| **RFC 2131** | Dynamic Host Configuration Protocol (DHCP) | DORA-Verfahren (Discover, Offer, Request, Acknowledge), Lease-Time. | ★★★★★ | ★★★★★ |
| **RFC 1035** | Domain Name System (DNS) | Hierarchischer Namensraum (Root, TLD, SLD, Subdomain), Resource Records (A, AAAA, CNAME, MX, PTR). | ★★★★★ | ★★★★★ |

---

### 2.2 IEEE- & Verkabelungsnormen

- **IEEE 802.3 (Ethernet):**
  - Minimaler Ethernet-Frame: **64 Byte** (inkl. 14B Header + 4B FCS, min. 46B Payload).
  - Maximaler Standard-Frame: **1518 Byte** (MTU 1500 Byte Payload).
  - Mit 802.1Q VLAN-Tag: **1522 Byte** (4 Byte zusätzlicher Tag).
- **IEEE 802.1Q (VLAN Tagging):**
  - **4 Byte Tag:** 2 Byte TPID (`0x8100`), 3 Bit Priority (PCP / QoS), 1 Bit DEI (Drop Eligible), **12 Bit VLAN-ID** ($2^{12} = 4096$ IDs; `0` und `4095` reserviert $\implies$ **1 bis 4094** nutzbar).
- **IEEE 802.11 (WLAN-Generationen):**
  - Wi-Fi 4 (802.11n): 2,4 GHz & 5 GHz, MIMO.
  - Wi-Fi 5 (802.11ac): Nur 5 GHz, bis 6,9 Gbit/s.
  - Wi-Fi 6 / 6E (802.11ax): 2,4 GHz, 5 GHz und 6 GHz, OFDMA, MU-MIMO.
  - Wi-Fi 7 (802.11be): Bis 320 MHz Kanalbandbreite, 4096-QAM, Multi-Link Operation (MLO).
- **DIN EN 50173-1 / ISO/IEC 11801 (Strukturierte Verkabelung):**
  - **Topologie:** Sternförmig hierarchisch (Primärbereich / Campus, Sekundärbereich / Steigbereich, Tertiärbereich / Etage).
  - **Längenbegrenzung im Tertiärbereich (Twisted Pair):**  
    $\text{Permanent Link} \le 90\text{ m}$ (Festverlegung) $+$ $10\text{ m}$ (Patchkabel gesamt) $=$ **max. 100 m Channel**.
  - **Kategorien & Frequenzen:**
    - Cat 5e: bis 100 MHz (1 Gbit/s)
    - Cat 6: bis 250 MHz (1 Gbit/s, 10 Gbit/s bis 55m)
    - Cat 6A: bis 500 MHz (10 Gbit/s über 100m)
    - Cat 7 / 7A: bis 600 / 1000 MHz (GG45 / TERA)
    - Cat 8.1 / 8.2: bis 2000 MHz (25/40 Gbit/s über 30m im RZ)

---

### 2.3 BSI IT-Grundschutz & BSI-Standard 200-2

In der **Schutzbedarfsanalyse** werden die drei Grundwerte der Informationssicherheit bewertet:
1. **Vertraulichkeit (Confidentiality):** Schutz vor unberechtigter Offenlegung.
2. **Integrität (Integrity):** Schutz vor unbemerkter Veränderung / Echtheit und Korrektheit.
3. **Verfügbarkeit (Availability):** Schutz vor unberechtigter Vorenthaltung / System muss funktionieren.

#### Die drei definierten Schutzbedarfskategorien (BSI-Standard 200-2):
- **Normal:** Die Schadensauswirkungen einer Beeinträchtigung sind begrenzt und überschaubar.
- **Hoch:** Die Schadensauswirkungen können beträchtlich sein (z. B. empfindlicher finanzieller Schaden, erhebliche Rechtsverstöße, Beeinträchtigung der Geschäftstätigkeit).
- **Sehr Hoch:** Die Schadensauswirkungen können ein existentiell bedrohliches, katastrophales Ausmaß erreichen (z. B. Gefahr für Leib und Leben, Unternehmensinsolvenz, Gefährdung der öffentlichen Ordnung).

---

### 2.4 DSGVO (Datenschutz-Grundverordnung) Kernartikel

- **Art. 5 DSGVO (Grundsätze für die Verarbeitung):**
  - Rechtmäßigkeit, Verarbeitung nach Treu und Glauben, Transparenz
  - Zweckbindung (nur für den festgelegten Zweck)
  - **Datenminimierung** ("so wenig wie möglich")
  - Richtigkeit
  - Speicherbegrenzung (Löschkonzepte!)
  - Integrität und Vertraulichkeit (Sicherheit durch technische & organisatorische Maßnahmen)
  - Rechenschaftspflicht des Verantwortlichen
- **Art. 32 DSGVO (Sicherheit der Verarbeitung / TOMs):**
  - Pseudonymisierung und Verschlüsselung
  - Belastbarkeit der Systeme (Vertraulichkeit, Integrität, Verfügbarkeit)
  - Rasche Wiederherstellbarkeit (Backup)
  - Regelmäßige Überprüfung und Evaluierung

---

## 3. Faktencheck: 15 verbreitete Mythen & Falschaussagen

| # | Verbreiteter Irrglaube / Mythe | Korrekte Richtigstellung (Fakt) | Quelle / Begründung |
|---|---|---|---|
| 1 | *„Ein Hub arbeitet auf Schicht 2 des OSI-Modells.“* | **Falsch.** Ein Hub (Repeater-Hub) arbeitet rein auf **Schicht 1 (Physical Layer)**. Er regeneriert nur elektrische Bits und leitet sie unbesehen an alle Ports weiter (eine einzige Kollisionsdomäne). Erst der **Switch** arbeitet auf Schicht 2 (Data Link). | IEEE 802.3, OSI-Referenzmodell ISO/IEC 7498-1 |
| 2 | *„MAC-Adressen sind weltweit unveränderlich in der Hardware eingebrannt.“* | **Falsch.** Die BIA (Burned-In-Address) kann im Betriebssystem oder Treiber problemlos temporär überschrieben werden (**MAC-Spoofing**). Zudem nutzen moderne Mobilgeräte (iOS/Android) standardmäßig **zufällige private MAC-Adressen** zum Tracking-Schutz. | IEEE 802c, RFC 7844 |
| 3 | *„RAID (z. B. RAID 5 oder 1) ersetzt das Backup.“* | **Falsch.** RAID schützt **ausschließlich vor physischen Laufwerksausfällen** (erhöht die Verfügbarkeit). Es schützt nicht vor Ransomware, Benutzerfehlern (versehentliches Löschen), Brand, Wasserschaden oder logischen Fehlern. | BSI IT-Grundschutz Baustein OPS.1.1.5 |
| 4 | *„1 GBit/s Übertragungsrate entspricht 1024 MBit/s.“* | **Falsch.** In der Netzwerk- und Übertragungstechnik gelten strikt die **SI-Dezimalpräfixe** ($1\text{ GBit/s} = 1000\text{ MBit/s} = 1.000.000\text{ kBit/s} = 10^9\text{ Bit/s}$). Die Basis 1024 gilt nur für IEC-Binärpräfixe (GiB, MiB). | DIN EN 80000-13 / IEC 80000-13 |
| 5 | *„RFC 793 ist der aktuelle RFC für das TCP-Protokoll.“* | **Veraltet.** RFC 793 wurde im August 2022 offiziell durch **RFC 9293** (TCP Specification) abgelöst, welcher 40 Jahre TCP-Ergänzungen konsolidiert. | IETF RFC 9293 |
| 6 | *„VLAN 1 und VLAN 4095 können beliebig als normale Daten-VLANs verwendet werden.“* | **Falsch.** VLAN-IDs 0 und 4095 sind nach IEEE 802.1Q reserviert. **VLAN 1** ist auf den meisten Switches das herstellerspezifische Default-/Management-VLAN und sollte aus Sicherheitsgründen nicht für Endgeräte-Nutzlast verwendet werden. | IEEE 802.1Q-2018 |
| 7 | *„IPv6-Adressen können beliebig oft mit `::` gekürzt werden.“* | **Falsch.** Nach **RFC 5952** darf `::` **exakt höchstens einmal** in einer Adresse vorkommen, da sonst die Anzahl der ausgelassenen Nullblöcke mathematisch nicht mehr eindeutig rekonstruierbar wäre. | RFC 5952 Abs. 4.2.2 |
| 8 | *„Bei einer USV sind 1000 VA genau 1000 Watt.“* | **Falsch.** VA ist die **Scheinleistung** ($S$), Watt ist die **Wirkleistung** ($P$). Wegen Phasenverschiebung und induktiven/kapazitiven Lasten gilt $P = S \times \cos \varphi$. Bei typischem Power Factor 0,8 leistet eine 1000-VA-USV nur 800 Watt Wirkleistung. | IEC 62040-3, DIN VDE 0100 |
| 9 | *„Ping verwendet TCP oder UDP.“* | **Falsch.** `ping` nutzt das **ICMP-Protokoll (Internet Control Message Protocol)** (Typ 8: Echo Request, Typ 0: Echo Reply). ICMP arbeitet direkt auf Schicht 3 (Network Layer) neben IP und hat weder TCP- noch UDP-Ports. | RFC 792 (IPv4) / RFC 4443 (IPv6) |
| 10 | *„Eine Schutzbedarfsanalyse nach BSI unterscheidet vier Klassen: Niedrig, Normal, Hoch, Sehr Hoch.“* | **Falsch.** Nach BSI-Standard 200-2 gibt es exakt **drei Schutzbedarfskategorien**: **Normal**, **Hoch** und **Sehr Hoch**. Die Kategorie "Niedrig" existiert im offiziellen IT-Grundschutz nicht (was nicht schutzbedürftig ist, fällt unter "Normal" oder wird nicht erfasst). | BSI-Standard 200-2 Kapitel 7.2 |
| 11 | *„`SELECT * FROM t WHERE col = NULL;` liefert alle Zeilen mit NULL-Werten.“* | **Falsch.** In SQL führt jeder Vergleich mit `NULL` über `=` zu `UNKNOWN` (dreiwertige Logik). Eine Zeile wird nur ausgegeben, wenn die WHERE-Bedingung `TRUE` ist. Korrekt ist ausschließlich: `WHERE col IS NULL`. | ANSI/ISO SQL:1999 / ISO/IEC 9075 |
| 12 | *„Ein Router trennt Kollisionsdomänen, aber keine Broadcast-Domänen.“* | **Falsch.** Genau umgekehrt: Ein **Switch** trennt Kollisionsdomänen, leitet Broadcasts aber weiter. Ein **Router** trennt **sowohl Kollisionsdomänen als auch Broadcast-Domänen** (Layer-2-Broadcasts enden an der Router-Schnittstelle). | CCNA / RFC 1812 |
| 13 | *„Patchkabel dürfen beliebig lang sein, solange der Channel unter 100m bleibt.“* | **Falsch.** Nach DIN EN 50173 ist die Summe aller flexiblen Patch- und Anschlusskabel im Channel auf **maximal 10 m** begrenzt (wegen höherer Dämpfung von flexiblen Litzenleitern gegenüber massiven Installationskabeln). Die Festverlegung (Permanent Link) darf max. 90 m betragen. | DIN EN 50173-1 / ISO/IEC 11801 |
| 14 | *„HTTPS verschlüsselt auch den Domainnamen, den der Browser aufruft.“* | **Traditionell Falsch (SNI).** Bei klassischem HTTPS wird der Hostname im TLS ClientHello via **SNI (Server Name Indication)** im Klartext übertragen. Erst mit modernen Standards wie **ECH (Encrypted Client Hello)** und DoH (DNS over HTTPS) wird dies abgedichtet. | RFC 8446 (TLS 1.3), RFC 9460 |
| 15 | *„Ein /30-Subnetz ist immer das kleinstmögliche IPv4-Subnetz für Punkt-zu-Punkt-Links.“* | **Veraltet.** Nach **RFC 3021** (aus dem Jahr 2000!) werden Punkt-zu-Punkt-Verbindungen mit einem **/31-Präfix** betrieben (2 Adressen, Host-Bits 0 und 1 sind beides legale Hosts). Dies spart 50 % Adressraum auf WAN-Links. | RFC 3021 |
