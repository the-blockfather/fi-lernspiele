# 03 – Generator-Spezifikationen & Rechenregeln

**Stand:** 15.10.2026 · **Kontext:** fi-lernspiele (Generatoren für dynamische Aufgaben mit automatischer Lösungsprüfung)  
**Zielgruppe:** Entwickler und KI-Modelle zur Implementierung von TypeScript-/JavaScript-Generatoren im Quiz.

---

## 1. Kurzfazit & Übersicht der Generatoren

Generatoren ermöglichen unendliche Übungsaufgaben, ohne dass Fragen händisch verfasst werden müssen.  
Für die IHK-Abschlussprüfung Teil 1 (AP1) und Teil 2 sind Rechenaufgaben hochrelevant.

| Generator-Typ | Lernfeld | Kernkompetenz nach KMK / IHK | Typische Azubi-Falle | Priorität |
|---|---|---|---|---|
| **1. IPv4-Subnetting** | LF03 | Netz-/BC-Adresse, Hostbereich, CIDR, VLSM | Netz-/BC-Adresse als Host vergeben; Schrittweite falsch berechnet | ★★★★★ (Prio 1) |
| **2. IPv6-Kompression & EUI-64** | LF03 | RFC 5952 Kürzungsregeln, Interface-ID | Mehrfaches `::`, 7. Bit invertieren vergessen (U/L-Bit) | ★★★★☆ |
| **3. Datenübertragungszeit** | LF03 | Bit vs. Byte, SI (1000) vs. IEC (1024), Latenz | $1\text{ MBit/s} = 1024\text{ kBit/s}$ angenommen (SI-Fehler) | ★★★★★ (Prio 1) |
| **4. Unkomprimierte Mediengrößen** | LF03/LF05 | Audio (PCM), Bitmap, Video-Rohdaten | Kanäle vergessen (Stereo $\times 2$), Farbtiefe (Byte vs. Bit) | ★★★★☆ |
| **5. Verfügbarkeit & Ausfallzeit** | LF03/LF04 | Reihen- vs. Parallelschaltung, 99,x% zu min/Jahr | Formel für Parallelschaltung falsch; Schaltjahr-Tage | ★★★★★ (Prio 1) |
| **6. RAID-Nettokapazität & Toleranz** | LF03/LF04 | RAID 0, 1, 5, 6, 10 | RAID 10 mit RAID 01 verwechselt; RAID 5 mit $N-2$ | ★★★★★ (Prio 1) |
| **7. USV-Dimensionierung** | LF03/LF04 | Wirkleistung $P$ [W] vs. Scheinleistung $S$ [VA] | Watt und VA gleichgesetzt ($\cos \varphi$ ignoriert) | ★★★★☆ |
| **8. Ethernet-Frame & Overhead** | LF03 | MTU (1500), Frame (1518), VLAN (1522), Draht | Präambel (8B) und Inter-Packet-Gap (12B) vergessen | ★★★☆☆ |
| **9. Zahlensysteme & 2er-Komplement** | LF05 | Dual, Hex, Dezimal, Vorzeichenbehaftet 8-Bit | Vorzeichenbit vergessen, $+1$ beim Komplement vergessen | ★★★★★ (Prio 1) |
| **10. SQL-Prädikate & NULL-Logik** | LF05 | Dreiwertige Logik (`NULL`), JOIN-Ergebnisse | `col = NULL` statt `col IS NULL`; Inner vs. Left Join | ★★★★☆ |

---

## 2. Detaillierte Spezifikationen mit Rechenregeln

### Generator 1: IPv4-Subnetting & Host-Berechnung

#### Mathematische Grundlagen & RFCs
- **RFC 791 (IPv4), RFC 4632 (CIDR), RFC 3021 (/31-Subnetze auf P2P-Links)**
- Subnetzmaske aus Präfixlänge $p$ ($1 \le p \le 30$):
  - Anzahl der Host-Bits: $h = 32 - p$
  - Adressblockgröße im relevanten Oktett: $B = 2^{(8 - (p \bmod 8))}$ (wenn $p \bmod 8 \neq 0$, sonst $256$ bzw. $1$)
  - Gesamtzahl der IP-Adressen: $N_{ges} = 2^h$
  - Nutzbare Hostadressen: $N_{nutz} = 2^h - 2$ *(Sonderfall RFC 3021: bei $p=31$ sind beide Adressen nutzbar, $N_{nutz} = 2$)*
- Netzadresse: Bitweises UND ($\text{IP} \mathbin{\&} \text{Maske}$)
- Broadcastadresse: Netzadresse OR $(\sim\text{Maske})$
- Erster Host: $\text{Netzadresse} + 1$
- Letzter Host: $\text{Broadcastadresse} - 1$

#### Wertebereich für Aufgaben-Generator
- Zufallsnetzwerk aus RFC 1918: `192.168.0.0/16`, `172.16.0.0/12`, `10.0.0.0/8`
- Sinnvolle Präfixe für Prüfungsaufgaben: `/24` bis `/30` (häufigste: `/26`, `/27`, `/28`, `/29`).

#### Distraktoren für Multiple-Choice (Typische Azubi-Fehler)
1. **Fehler A (Broadcast als letzter Host):** Letzter Host = Broadcastadresse (vergessen, 1 abzuziehen).
2. **Fehler B (Off-by-one bei Hostanzahl):** $2^h$ statt $2^h - 2$ (Netz- und Broadcastadresse nicht abgezogen).
3. **Fehler C (Schrittweiten-Fehler):** Netzadresse auf vorheriges falsches Vielfaches gerundet.

#### Durchgerechnetes Referenzbeispiel
- **Gegeben:** IP `192.168.10.138/27`
- **Rechnung:**
  - $p = 27 \implies h = 32 - 27 = 5$ Bits für Hosts.
  - Subnetzmaske: 27 Einsen $\implies$ `255.255.255.224`
  - Schrittweite im 4. Oktett: $2^5 = 32$
  - Vielfache von 32: 0, 32, 64, 96, 128, 160.
  - Da $128 \le 138 < 160$:
    - **Netzadresse:** `192.168.10.128`
    - **Broadcastadresse:** $128 + 32 - 1 =$ `192.168.10.159`
    - **Erster nutzbarer Host:** `192.168.10.129`
    - **Letzter nutzbarer Host:** `192.168.10.158`
    - **Nutzbare Hostadressen:** $2^5 - 2 = 30$

---

### Generator 2: IPv6 RFC 5952 Kürzungsregeln & EUI-64

#### Kürzungsregeln nach RFC 5952 (Standard!)
1. Führende Nullen innerhalb eines 16-Bit-Blocks **müssen** weggelassen werden (z. B. `002a` $\to$ `2a`, `0000` $\to$ `0`).
2. Die längste aufeinanderfolgende Reihe von zwei oder mehr `:0:`-Blöcken **muss** durch `::` ersetzt werden.
3. Bei gleich langen Reihen von Nullblöcken **muss** die **erste** Reihe gekürzt werden.
4. `::` darf **höchstens einmal** in einer Adresse vorkommen.
5. Hexadezimalzeichen sind als **Kleinbuchstaben** (`a-f`) darzustellen.

#### EUI-64 Adressbildung (Interface Identifier aus MAC)
- Gegeben MAC (48 Bit): `c0:25:e9:12:34:56`
- Schritt 1: In der Mitte trennen: `c0:25:e9` und `12:34:56`
- Schritt 2: `ff:fe` einfügen: `c025:e9ff:fe12:3456`
- Schritt 3: **7. Bit des ersten Bytes invertieren (Universal/Local Bit nach IEEE):**
  - Erstes Byte `0xc0` = `1100 0000_2`
  - 7. Bit (von links gezählt, Bit-Index 1 bei 0-basierter Zählung `b7..b0`): invertieren $\to$ `1100 0010_2` = `0xc2`
  - Resultierende Interface-ID: `021a:...` bzw. hier `c225:e9ff:fe12:3456`

#### Durchgerechnetes Referenzbeispiel (aus Verifikationsskript)
- **MAC:** `00:1A:2B:3C:4D:5E`
- Erstes Byte `0x00` $\to$ Invertierung Bit 7: `0x02`
- Mitte trennen und `ff:fe` einfügen: `021a:2bff:fe3c:4d5e`
- Link-Local Adresse: `fe80::021a:2bff:fe3c:4d5e` (mit RFC 5952 gekürzt: `fe80::21a:2bff:fe3c:4d5e`).

---

### Generator 3: Datenübertragungszeit & Präfixe (SI vs. IEC)

#### Wichtige Norm: DIN EN 80000-13 / IEC 80000-13
- **Übertragungsraten (Netzwerk / Telekommunikation):** Verwenden immer **SI-Präfixe (Dezimal, Basis 10)**:
  - $1\text{ kbit/s} = 10^3\text{ bit/s} = 1.000\text{ bit/s}$
  - $1\text{ Mbit/s} = 10^6\text{ bit/s} = 1.000.000\text{ bit/s}$
  - $1\text{ Gbit/s} = 10^9\text{ bit/s} = 1.000.000.000\text{ bit/s}$
- **Dateigrößen / Hauptspeicher:** Verwenden traditionell **IEC-Präfixe (Binär, Basis 2)**:
  - $1\text{ KiB} = 2^{10}\text{ Byte} = 1.024\text{ Byte}$
  - $1\text{ MiB} = 2^{20}\text{ Byte} = 1.048.576\text{ Byte}$
  - $1\text{ GiB} = 2^{30}\text{ Byte} = 1.073.741.824\text{ Byte}$

#### Formel für Übertragungszeit
$$t = \frac{\text{Dateigröße in Bit}}{\text{Nettobandbreite in bit/s}} = \frac{\text{Dateigröße in Byte} \times 8}{\text{Bandbreite in bit/s} \times \eta}$$
*($\eta$ = Wirkungsgrad/Nutzlastanteil, z. B. $0{,}95$ bei Berücksichtigung von TCP/IP-Overhead; in einfachen IHK-Aufgaben oft $\eta = 1{,}0$ oder fix $10\%$ Protokolloverhead).*

#### Durchgerechnetes Referenzbeispiel
- **Aufgabe:** Eine Backupdatei von $750\text{ MiB}$ soll über eine $100\text{ Mbit/s}$-Leitung übertragen werden (ideal ohne Overhead).
- **Berechnung:**
  - Dateigröße in Byte: $750 \times 1.048.576\text{ Byte} = 786.432.000\text{ Byte}$
  - Dateigröße in Bit: $786.432.000 \times 8 = 6.291.456.000\text{ Bit}$
  - Übertragungsrate: $100\text{ Mbit/s} = 100.000.000\text{ bit/s}$
  - Dauer $t = \frac{6.291.456.000}{100.000.000} = 62{,}91456\text{ Sekunden} \approx 62{,}9\text{ s}$ ($1\text{ min } 2{,}9\text{ s}$).
- **Typischer Azubi-Fehler (Distraktor):**
  - Annahme $100\text{ Mbit/s} = 100 \times 1.048.576\text{ bit/s} \implies t = \frac{750 \times 8}{100} = 60{,}0\text{ s}$!

---

### Generator 4: Verfügbarkeit & Ausfallzeit

#### Formeln
- **Reihenschaltung (alle Komponenten müssen funktionieren):**
  $$A_{ges} = A_1 \times A_2 \times \dots \times A_n$$
- **Parallelschaltung / Redundanz (mindestens eine Komponente muss funktionieren):**
  $$A_{ges} = 1 - \prod_{i=1}^n (1 - A_i) = 1 - (1 - A_1)(1 - A_2)\dots$$
- **Jahresausfallzeit:**
  - Jahr = $365\text{ Tage} \times 24\text{ h} = 8.760\text{ Stunden} = 525.600\text{ Minuten}$ (bzw. mit Schaltjahr $365{,}25 \times 24 \times 60 = 525.960\text{ min}$).
  - Ausfallzeit $T_{down} = (1 - A_{ges}) \times 525.600\text{ Minuten}$.

#### Referenztabelle der "Neunen" (Prüfungswissen)
| Verfügbarkeit | Ausfallzeit pro Jahr | Typische Einstufung |
|---|---|---|
| 99,0 % ("Zwei Neunen") | 3 Tage, 15 Stunden, 36 Min | Normaler Standard |
| 99,9 % ("Drei Neunen") | 8 Stunden, 45 Minuten | Professioneller IT-Betrieb |
| 99,99 % ("Vier Neunen") | 52 Minuten, 34 Sekunden | Hochverfügbare Rechenzentren |
| 99,999 % ("Fünf Neunen") | 5 Minuten, 15 Sekunden | Carrier-Grade / Kernnetze |

#### Durchgerechnetes Referenzbeispiel
- Zwei redundante Firewalls mit jeweils $A_1 = A_2 = 99{,}5\%$ ($0{,}995$):
  $$A_{ges} = 1 - (1 - 0{,}995)^2 = 1 - (0{,}005)^2 = 1 - 0{,}000025 = 0{,}999975 = 99{,}9975\%$$
  Ausfallzeit pro Jahr: $(1 - 0{,}999975) \times 525.600\text{ min} = 13{,}14\text{ Minuten}$.

---

### Generator 5: RAID-Nettokapazität & Ausfalltoleranz

#### Formeln bei $N$ Festplatten der Einzelkapazität $S$
| RAID-Level | Mindest-Festplatten $N$ | Nettokapazität | Ausfalltoleranz (Platten) | Besonderheit / IHK-Falle |
|---|---|---|---|---|
| **RAID 0** | 2 | $N \times S$ | 0 | Keine Redundanz! Datenverlust bei 1 defekten Platte. |
| **RAID 1** | 2 (meist 2) | $1 \times S$ (bei Mirror) | $N - 1$ | 50% Kapazitätsverlust bei 2 Platten. |
| **RAID 5** | 3 | $(N - 1) \times S$ | 1 | Verteilte Parität. Rebuild-Belastung hoch! |
| **RAID 6** | 4 | $(N - 2) \times S$ | 2 | Zweifache verteilte Parität. |
| **RAID 10** (1+0) | 4 (gerade Anzahl) | $(N / 2) \times S$ | Mind. 1, max. $N/2$ | Striping über Mirror-Paare. Geringere Rebuild-Last als RAID 5. |

#### Durchgerechnetes Referenzbeispiel
- Ein Server erhält 5 Festplatten zu je $4\text{ TB}$.
  - RAID 5: $(5 - 1) \times 4\text{ TB} = 16\text{ TB}$ nutzbar. Toleranz: 1 Platte.
  - RAID 6: $(5 - 2) \times 4\text{ TB} = 12\text{ TB}$ nutzbar. Toleranz: 2 Platten.

---

### Generator 6: USV-Dimensionierung & Wirkungsgrad

#### Grundlagen (DIN EN 62040-3)
- Scheinleistung $S$ in **Voltampere [VA]**: $S = U \times I$
- Wirkleistung $P$ in **Watt [W]**: $P = S \times \cos \varphi$ (wobei $\cos \varphi$ der Leistungsfaktor / Power Factor $PF$ ist, typisch $0{,}7$ bis $0{,}9$ bei Servernetzteilen).
- Erforderliche Scheinleistung der USV bei gegebenen Verbrauchern:
  $$S_{USV} \ge \frac{\sum P_{Verbraucher}}{\cos \varphi} \times 1{,}20\quad \text{(inkl. 20\% Sicherheitsreserve)}$$

#### Durchgerechnetes Beispiel
- 3 Server mit je $400\text{ W}$ und 1 Switch mit $80\text{ W} \implies P_{ges} = 1.280\text{ W}$.
- Leistungsfaktor $\cos \varphi = 0{,}8$.
- Benötigte Scheinleistung ohne Reserve: $\frac{1280\text{ W}}{0{,}8} = 1.600\text{ VA}$.
- Mit 20 % Puffer: $1.600 \times 1{,}2 = 1.920\text{ VA} \implies$ Mindestens eine 2000-VA-USV wählen.

---

### Generator 7: Zweierkomplement & Ganzzahldarstellung (LF05)

#### 8-Bit Zweierkomplement
- Wertebereich: $-2^7$ bis $+2^7 - 1 \implies -128$ bis $+127$.
- Höchstwertiges Bit (MSB, Bit 7): Vorzeichenbit ($0 = {+}$, $1 = {-}$).
- Bildung einer negativen Zahl $-X$ aus $+X$:
  1. Binärdarstellung von $+X$ aufschreiben (8 Bit).
  2. Alle Bits invertieren (Einerkomplement, NOT).
  3. $1$ addieren ($+1$).

#### Referenzbeispiel: Darstellung von $-42$
1. $+42$ in 8 Bit: `0010 1010`
2. Invertieren: `1101 0101`
3. $+1$ addieren: `1101 0110`
4. Rückrechnung zur Probe:
   $-128 \times 1 + 64 \times 1 + 32 \times 0 + 16 \times 1 + 8 \times 0 + 4 \times 1 + 2 \times 1 + 1 \times 0 = -128 + 64 + 16 + 4 + 2 = -42$. Korrekt!
