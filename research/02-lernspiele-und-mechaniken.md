# Vergleichbare Lernspiele & übertragbare Spielmechaniken

**Stand:** 15.10.2026 · **Kontext:** fi-lernspiele (statische Single-Page, Vanilla-JS, Zielgruppe FI-Azubis Grundstufe, LF03/LF04/LF05)

**So habe ich geprüft (Legende)**
- ✔︎ **verifiziert** = URL am 15.10.2026 per HTTP abgerufen (Status 200) bzw. Lizenz/Aktivität über die GitHub-/GitLab-API oder die Lizenzdatei im Repo ausgelesen.
- ◐ **teilweise** = Existenz geprüft, Lizenz/Details aber nur aus Websuche/Sekundärquelle.
- ✱ **Annahme** = Einschätzung aus Fachwissen, nicht gegen eine Primärquelle geprüft – **vor Nachnutzung prüfen**.
- „Aktiv“ = letzter Push/Aktivität laut API innerhalb der letzten ~12 Monate.

> Achtung: Dieses Dokument ist **keine Rechtsberatung**. Wenn kein Lizenztext da ist, gilt „alle Rechte vorbehalten“. Dann übernehmen wir nur die **Idee bzw. Mechanik** (die ist nicht urheberrechtlich geschützt), aber keinen Code, keine Texte und keine Grafiken.

---

## 1. Kurzfazit

1. **Für statisches Browser-JS sind drei Mechaniken am besten übertragbar:**
   (a) **„Froggy-Prinzip“**: kurze Level, eine Eingabe pro Level, sofortiges visuelles Feedback (Flexbox Froggy, CSS Diner, SQLBolt).
   (b) **„Detektiv-Fall“**: Story-Rätsel, das man nur mit Fachhandeln lösen kann (SQL Murder Mystery, SQL Island, Bandit).
   (c) **„Schritt-für-Schritt-Simulation“**: Pakete, Tabellen oder Zustände sichtbar machen (Learn Git Branching, Filius, NetSim-Projekte).
2. **Code ohne Bedenken nachnutzbar** (permissive Lizenz, verifiziert): SQL Murder Mystery (MIT), Flexbox Froggy/Grid Garden (MIT), Learn Git Branching (MIT), Elevator Saga (MIT), Blockly/Blockly Games (Apache-2.0), CyberChef (Apache-2.0), RelaX (MIT), ts-fsrs (MIT), Select Star SQL (Code/Daten CC0, Texte CC BY-SA 4.0). Mit Copyleft: Filius (GPLv2/v3), PackeTTrino (GPL-3.0), Quizfreely (AGPL-3.0), CSS Diner/ClassQuiz (MPL-2.0).
3. **Für SQL (LF05) bringt es am meisten:** **sql.js** (SQLite als WebAssembly) plus ein **deutscher SQL-Krimi** nach dem Vorbild von SQL Murder Mystery bzw. SQL Island. Das ist der größte Lerngewinn pro Aufwand und läuft vollständig statisch.
4. **LF04 (Schutzbedarf):** Ich habe **kein offenes Spiel speziell zur BSI-Schutzbedarfsfeststellung gefunden**. Hier gibt es eine echte Lücke, die unser Projekt füllen kann. Zur Phishing-Erkennung gibt es gute Vorbilder (Jigsaw Phishing Quiz, Interland), deren Mechanik wir übernehmen können, aber keinen Inhalt.
5. **Was die Lernwissenschaft sagt:** Den stärksten Hebel haben nicht Punkte oder Badges, sondern **Abrufüben (Retrieval Practice)**, **verteiltes Wiederholen (Spacing)** und **sofortiges, erklärendes Feedback**. Gamification wirkt laut Studien insgesamt positiv, aber in kleinem bis mittlerem Umfang (Sailer & Homner 2020: g = 0,49 kognitiv). Spielmechanik soll deshalb **Wiederholung und Abruf** tragen und nicht nur dekorieren.

---

## 2. Bewertungstabelle

Bewertung jeweils 1–5 ★.
- **Übertr.** = Wie gut lässt sich die Mechanik auf statisches Browser-JS übertragen?
- **Lernwert** = Lernwert für die FI-Grundstufe (LF03–05)
- **Aufwand** = 5 heißt geringer Umsetzungsaufwand
- **Lizenz** = Wie gut lassen sich Code bzw. Inhalte nachnutzen?

| # | Projekt | Thema | Status | Lizenz Code / Inhalt | Übertr. | Lernwert | Aufwand | Lizenz | Empf. |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Cisco Packet Tracer | Netzwerk-Sim | ✔︎ online (netacad) | proprietär | 2 | 5 | 1 | 1 | ⚠️ nur Idee |
| 2 | Filius | Netzwerk-Sim (DE) | ✔︎ aktiv (GitLab 03/2026) | GPLv2/v3 (✔︎ Lizenzdateien) | 3 | 5 | 2 | 3 | ⚠️ Idee (Java, kein Web) |
| 3 | PackeTTrino | Web-Netzwerk-Sim | ✔︎ aktiv (07/2026) | GPL-3.0 | 4 | 4 | 3 | 3 | ⚠️ Idee/Referenz |
| 4 | michael-borck/netsim | Web-Netzwerk-Labs | ✔︎ aktiv (08/2026) | MIT | 4 | 4 | 3 | 5 | ✅ adaptieren (Ideen/Teile) |
| 5 | NetSim (errorinn) | Paket-Hacking-Puzzle | ✔︎ Repo, inaktiv (2020) | MIT | 4 | 4 | 3 | 5 | ✅ Mechanik adaptieren |
| 6 | SQL Murder Mystery | SQL-Krimi | ✔︎ online, Repo 04/2025 | MIT | 5 | 5 | 3 | 5 | ✅ adaptieren |
| 7 | SQL Island (Uni Kaiserslautern) | SQL-Story (DE) | ✔︎ online | keine Lizenz gefunden ✱ | 5 | 5 | 3 | 1 | ⚠️ nur Idee |
| 8 | SQLBolt | SQL-Lektionen | ✔︎ online | proprietär ✱ (kein Repo) | 5 | 4 | 4 | 1 | ⚠️ nur Idee |
| 9 | Select Star SQL | SQL-Buch interaktiv | ✔︎ aktiv (10/2026) | Code/Daten CC0, Text CC BY-SA 4.0 (✔︎ README) | 4 | 4 | 3 | 4 | ✅ Mechanik + Daten |
| 10 | Schemaverse | SQL-Weltraumstrategie | ✔︎ online, Repo aktiv | PostgreSQL-Lizenz | 1 | 2 | 1 | 4 | ❌ (Server nötig, zu komplex) |
| 11 | RelaX | Relationenalgebra-Rechner | ✔︎ aktiv (04/2026) | MIT | 3 | 3 | 3 | 5 | ⚠️ optional (eher Werkzeug) |
| 12 | Flexbox Froggy / Grid Garden | CSS-Level-Spiel | ✔︎ aktiv (01/2026) | MIT | 5 | 2* | 5 | 5 | ✅ Mechanik-Vorbild |
| 13 | CSS Diner | CSS-Selektoren | ✔︎ online, Repo 2023 | MPL-2.0 | 5 | 2* | 5 | 4 | ✅ Mechanik-Vorbild |
| 14 | Learn Git Branching | Git-Visualisierung | ✔︎ sehr aktiv (10/2026) | MIT | 4 | 3 | 3 | 5 | ✅ Mechanik (Zustands-Visualisierung) |
| 15 | Oh My Git! | Git-Kartenspiel | ✔︎ online, Repo 12/2025 | Blue Oak 1.0 (✔︎ LICENSE.md) | 2 (Godot) | 3 | 2 | 4 | ⚠️ Idee (Karten-UI) |
| 16 | OverTheWire Bandit | Linux-Wargame | ✔︎ online | keine offene Lizenz ✱ | 3 | 4 | 3 | 1 | ⚠️ Idee (Fake-Terminal) |
| 17 | picoCTF → CyLab Security Academy | CTF | ✔︎ picoctf.org leitet zur CyLab Security Academy um; Plattform-Repo archiviert (MIT) | MIT (alte Plattform) | 3 | 3 | 3 | 3 | ⚠️ Idee (Flag-Mechanik) |
| 18 | Google Interland | Online-Sicherheit Kinder | ✔︎ online | proprietär | 4 | 2 | 3 | 1 | ⚠️ nur Idee |
| 19 | Jigsaw Phishing Quiz | Phishing erkennen | ✔︎ online | proprietär ✱ | 5 | 4 | 4 | 1 | ⚠️ Idee (Mechanik top) |
| 20 | CyberStart | Security-Challenges | ✔︎ online | proprietär | 3 | 3 | 2 | 1 | ⚠️ nur Idee |
| 21 | OWASP Juice Shop | Unsichere Web-App | ✔︎ sehr aktiv | MIT | 1 | 3 (eher LF04+/Fortgeschr.) | 1 | 5 | ❌ für Grundstufe (Server) |
| 22 | CyberChef | Kodierung/Krypto-Werkzeug | ✔︎ sehr aktiv | Apache-2.0 | 4 | 4 | 3 | 5 | ✅ Rezept-Mechanik adaptieren |
| 23 | Subnetting-Trainer (subnettingpractice.com, subnetipv4.com) | Subnetting-Drill | ✔︎ beide online | proprietär ✱ | 5 | 5 | 5 | 1 | ⚠️ Idee (haben wir quasi) |
| 24 | ipv4-subnetting-browser-game (chriv) | Subnetting-JS-Spiel | ✔︎ 03/2026 | Unlicense (gemeinfrei) | 5 | 4 | 5 | 5 | ✅ (kleines Referenzprojekt) |
| 25 | Hacknet | Hacker-Sim | ✔︎ Steam | proprietär | 3 | 2 | 2 | 1 | ⚠️ Idee (Terminal-Story) |
| 26 | TIS-100 / Human Resource Machine | Assembler-Puzzle | ✔︎ online | proprietär | 4 | 4 (LF05) | 2 | 1 | ⚠️ Idee |
| 27 | Lightbot | Programmier-Puzzle | ✔︎ online | proprietär | 5 | 3 | 3 | 1 | ⚠️ Idee |
| 28 | Blockly Games | Block-Programmierung | ✔︎ online, Repo 07/2024 | Apache-2.0 | 4 | 3 | 3 | 5 | ✅ (Blockly-Bibliothek) |
| 29 | Untrusted | JS-Code-Puzzle | ✔︎ online | **keine Lizenzdatei** (✔︎ geprüft) | 4 | 2 | 3 | 1 | ⚠️ nur Idee |
| 30 | Elevator Saga | JS-Algorithmus-Spiel | ✔︎ Repo (2022) | MIT | 4 | 2 | 3 | 5 | ⚠️ Idee |
| 31 | CodeCombat | Coding-RPG | ✔︎ sehr aktiv | MIT (Code); Inhalte teils separat ✱ | 2 | 3 | 1 | 3 | ⚠️ Idee |
| 32 | ClassQuiz | Kahoot-Alternative | ✔︎ aktiv (10/2026) | MPL-2.0 | 2 (Server) | 3 | 2 | 4 | ⚠️ Live-Quiz extern nutzen |
| 33 | Quizfreely | Karteikarten/Quiz | ✔︎ aktiv (10/2026) | AGPL-3.0 | 2 (Server) | 3 | 2 | 3 | ⚠️ Idee |
| 34 | ts-fsrs | Spaced-Repetition-Algorithmus | ✔︎ aktiv (10/2026) | MIT | 5 | 5 | 4 | 5 | ✅ adaptieren |
| 35 | inf-schule.de | Informatik-Unterricht (DE) | ✔︎ online | CC BY-SA 4.0 (✔︎ Footer) | 3 | 4 | 4 | 4 | ✅ Inhalte (mit SA-Pflicht) |
| 36 | Informatik-Biber (BWINF) | Wettbewerbsaufgaben (DE) | ✔︎ online | ◐ CC BY-SA bzw. BY-NC-SA, je nach Jahrgang | 4 | 3 | 4 | 3 | ✅ Aufgabenformat (Lizenz je Heft prüfen) |
| 37 | Data Center Simulator | Rechenzentrum-Tycoon | ◐ nur Websuche (Steam) | proprietär | 2 | 3 | 1 | 1 | ⚠️ Idee (USV/Rack/Kühlung) |
| 38 | Packet Wars | Cyber-Wettkampf | ◐ nur Websuche (packetwars.com) | proprietär | 1 | 2 | 1 | 1 | ❌ |

\* Bei Froggy und CSS Diner bewerte ich den Lernwert für **unsere** Inhalte. Die Mechanik selbst ist hervorragend.

---

## 3. Projekt-Steckbriefe

### 3.1 Netzwerke (LF03)

**Cisco Packet Tracer** – ✔︎ https://www.netacad.com/cisco-packet-tracer (die Cisco-Produktseite lieferte HTTP 403)
- Mechanik: Topologie per Drag-and-drop bauen, Geräte über eine IOS-Kommandozeile konfigurieren, im *Simulation Mode* Pakete (PDUs) Schritt für Schritt verfolgen, *Activity Wizard* mit automatischer Bewertung.
- Lizenz: proprietär, kostenlos nach NetAcad-Login. Nur das Konzept übernehmen.
- Übernehmen: **„Simulation Mode“** (Paket als Umschlag mit OSI-Layer-Inspektor) und **automatisch prüfbare Zielzustände**. Unsere Paketverfolgungs-Animation geht bereits in diese Richtung.

**Filius** – ✔︎ https://www.lernsoftware-filius.de/ · ✔︎ https://gitlab.com/filius1/filius
- Deutsche Lernsoftware zur Simulation von Rechnernetzen, ursprünglich von der Universität Siegen (◐ laut Websuche). Java-Desktop-Anwendung.
- Lizenz: im Repo liegen `GPLv2.txt` und `GPLv3.txt` (✔︎). Letzte Aktivität: 10.03.2026 (✔︎ GitLab-API).
- Mechanik: Aufbau- und Simulationsmodus, virtuelle Rechner mit „Software“ (Webserver, DNS, E-Mail), ein **Datenaustausch-Fenster** pro Rechner (Mini-Wireshark).
- Übernehmen: Das Fenster „Datenaustausch“ als Lerninstrument (Paketliste mit Schichten). Die Beispielnetze (`beispiele/`) sind GPL – bei Übernahme muss auch unser Werk GPL werden. Deshalb besser **nur die Idee**. Filius ist an deutschen Schulen weit verbreitet, Azubis kennen es eventuell schon.

**PackeTTrino** – ✔︎ https://github.com/EvilPrime98/PackeTTrino · GPL-3.0 · aktiv (07/2026)
- Netzwerksimulator im Browser in reinem JavaScript. Ein gutes Beispiel dafür, dass so etwas statisch machbar ist. Wegen GPL nur als Referenz für die Architektur.

**michael-borck/netsim** – ✔︎ https://github.com/michael-borck/netsim · MIT · aktiv (08/2026)
- Netzwerksimulator für den Unterricht im Browser: echte Linux-Syntax (iproute2, nftables, dig, curl), geführte Labs, keine Installation (laut Repo-Beschreibung). Wegen MIT darf man ihn studieren oder Teile übernehmen. Für die FI-Grundstufe evtl. zu linuxlastig ✱.

**NetSim (errorinn)** – ✔︎ https://github.com/errorinn/netsim · MIT · zuletzt 2020
- Puzzlespiel: Man baut Pakete von Hand (Felder für Quelle, Ziel, Protokoll) und „hackt“ Netze, z. B. per Spoofing oder Flooding. ✱ Die Mechanik kenne ich aus Fachwissen, die Live-Seite habe ich nicht geprüft.
- Übernehmen: **„Paket selbst zusammenbauen“** als Levelaufgabe. Passt ideal zu Ethernet-Frame, IP-Header und Ports.

**Subnetting-Trainer** – ✔︎ https://subnettingpractice.com/ · ✔︎ https://subnetipv4.com/ · ✔︎ https://github.com/chriv/ipv4-subnetting-browser-game (Unlicense)
- Mechanik: Zufallsgenerator (Netz-ID, Broadcast, Hostanzahl), Timer, Streak. Lizenz der Webseiten: ✱ proprietär. Das Projekt von chriv ist gemeinfrei.
- Unsere Generatoren decken das schon ab. Was fehlt, sind **Spacing** (schwache Aufgabentypen häufiger stellen) und eine **Lösungsweg-Erklärung**.

### 3.2 Datenbanken / SQL (LF05)

**SQL Murder Mystery (Northwestern Knight Lab)** – ✔︎ https://mystery.knightlab.com/ · ✔︎ https://github.com/NUKnightLab/sql-mysteries
- Lizenz: **MIT** (✔︎ LICENSE, „Copyright (c) 2018 NUKnightLab“). Das Repo enthält `sql-murder-mystery.db` (SQLite), PDFs für Einsteiger und Fortgeschrittene sowie ein Walkthrough.
- Mechanik: Man bekommt einen Kriminalfall und eine Datenbank. Die Lernenden bauen schrittweise immer bessere Abfragen (WHERE, LIKE, JOIN, GROUP BY), bis der Täter feststeht. Die Lösung wird per SQL-INSERT geprüft.
- Übernehmen: **Struktur und Prüfmechanik** komplett. Eine **deutsche, eigene Story** passend zur FI-Welt (z. B. „Wer hat den Serverraum-Schlüssel benutzt?“) mit sql.js. MIT erlaubt es auch, die DB zu übersetzen, dabei den Copyright-Hinweis behalten.

**SQL Island** – ✔︎ https://sql-island.informatik.uni-kl.de/
- Deutsches SQL-Abenteuer (Uni Kaiserslautern): Man strandet auf einer Insel, die Story wird über SELECT/UPDATE/INSERT vorangetrieben. Auf der Startseite habe ich keine offene Lizenz gefunden (✱). Deshalb **nur die Idee** übernehmen. Unbedingt als **externen Link** empfehlen, denn es passt genau zur Zielgruppe.

**SQLBolt** – ✔︎ https://sqlbolt.com/
- Kurze Lektion, darunter direkt eine Übung mit Live-Tabelle, die Aufgaben haken sich bei Erfolg ab. Kein öffentliches Repo gefunden (✱ proprietär). **Mechanik-Vorbild für „SQL-Froggy“.**

**Select Star SQL** – ✔︎ https://selectstarsql.com/ · ✔︎ https://github.com/zichongkao/selectstarsql
- Lizenz (✔︎ README): **Text CC BY-SA 4.0, Code und Datensätze CC0**. Aktiv (Push 10/2026).
- Mechanik: interaktives Buch, SQL-Editor direkt im Fließtext, echter Datensatz (Hinrichtungen in Texas). Das Thema ist für Azubis ungeeignet, die **Technik** (Inline-Editor mit sql.js) aber sehr gut.

**Schemaverse** – ✔︎ https://schemaverse.com/ · PostgreSQL-Lizenz
- Weltraum-Strategiespiel, das komplett in SQL gespielt wird, auf einem PostgreSQL-Server. Für eine statische Seite und die Grundstufe ungeeignet. ❌

**RelaX** – ✔︎ https://dbis-uibk.github.io/relax/ · MIT
- Rechner für Relationenalgebra (Uni Innsbruck), läuft im Browser. Nur relevant, wenn Relationenalgebra im Rahmenlehrplan vorkommt ✱. Sonst als Werkzeug verlinken.

**sql.js** (Infrastruktur) – ✔︎ https://github.com/sql-js/sql.js (13,6k ★, sehr aktiv). Die GitHub-API zeigt die Lizenz als „NOASSERTION“. ✱ Nach meinem Kenntnisstand MIT, **vor Einbindung die LICENSE-Datei prüfen**. Damit läuft SQLite als WebAssembly vollständig statisch. Das ist die Voraussetzung für alle SQL-Spiele.

### 3.3 IT-Sicherheit (LF04)

**OverTheWire Bandit** – ✔︎ https://overthewire.org/wargames/bandit/
- Wargame über SSH: Jedes Level verrät das Passwort fürs nächste, man lernt dabei Linux-Befehle. Kein öffentliches Website-Repo gefunden. Für uns: **Fake-Terminal** im Browser mit simulierten Ausgaben (`ipconfig`, `ping`, `tracert`, `nslookup`) und einem „Flag“ pro Level.

**picoCTF → CyLab Security Academy** – ✔︎ https://picoctf.org/ (Hinweis auf der Seite: „picoCTF.org is now CyLab Security Academy“, Link zu https://cylabacademy.org). Das alte Plattform-Repo `picoCTF/picoCTF` ist **archiviert** (MIT). Mechanik: Jeopardy-CTF, also Kategorien × Punktwerte, Flag eingeben.

**Google Interland (Be Internet Awesome)** – ✔︎ https://beinternetawesome.withgoogle.com/en_us/interland
- Vier Mini-Welten (Phishing, Passwörter, Teilen, Freundlichkeit) mit Arcade-Mechanik. Zielgruppe Kinder, proprietär. Idee: **pro Schutzziel eine Mini-Welt**.

**Jigsaw Phishing Quiz** – ✔︎ https://phishingquiz.withgoogle.com/
- Realistische Mails: Man entscheidet „Phishing / legitim“, danach werden die verdächtigen Stellen markiert und erklärt. Proprietär ✱. **Diese Mechanik (entscheiden → Hotspots aufdecken) übernehmen wir 1:1 als Idee** mit eigenen deutschen Mails.

**CyberStart** – ✔︎ https://cyberstart.com/ – kommerzielle Plattform mit gamifizierten Challenges (Missionsbasis, Level-Karte). Nur Idee.

**OWASP Juice Shop** – ✔︎ https://owasp-juice.shop/ · MIT · sehr aktiv. Absichtlich unsichere Web-App mit Scoreboard. Braucht Node-Server und ist zu fortgeschritten. ❌ für die Grundstufe (ggf. später für Klasse 12/13).

**CyberChef (GCHQ)** – ✔︎ https://gchq.github.io/CyberChef/ · Apache-2.0
- Werkzeug, kein Spiel. Die **„Rezept“-Mechanik** (Operationen verketten: From Base64 → XOR → To Hex) lässt sich aber hervorragend in ein Dekodier-Escape-Spiel übertragen.

### 3.4 Programmier-/Puzzle-Mechaniken (LF05 & allgemein)

**Flexbox Froggy / Grid Garden** – ✔︎ https://flexboxfroggy.com/ · MIT · aktiv
- Je Level eine Codezeile, das Ergebnis ist sofort sichtbar (Frosch auf Seerose). Mehrsprachig, inkl. Deutsch ✱. Ein Vorbild für **Mikrolevel mit Sofort-Feedback**.

**CSS Diner** – ✔︎ https://flukeout.github.io/ · MPL-2.0
- Selektor eintippen, die passenden „Teller“ wackeln. Mechanik: **die Auswahlmenge sichtbar machen**. Übertragbar auf SQL-WHERE: „Welche Zeilen trifft meine Bedingung?“

**Learn Git Branching** – ✔︎ https://learngitbranching.js.org/ · MIT · 34k ★ · sehr aktiv
- Befehle eintippen, der Commit-Graph wird animiert, das Ziel wird als „Geisterbild“ daneben gezeigt. Mechanik: **Ist- vs. Soll-Zustand visualisieren**. Übertragbar auf Routing- oder MAC-Tabellen.

**Oh My Git!** – ✔︎ https://ohmygit.org/ · Blue Oak Model License 1.0 (✔︎) · Godot-Engine
- Git-Befehle als **Spielkarten**, die man ausspielt. Für uns interessant: **Kartenmechanik**, z. B. Maßnahmen-Karten gegen Bedrohungen (LF04).

**TIS-100 / Human Resource Machine** – ✔︎ zachtronics.com, tomorrowcorporation.com · proprietär
- Programmieren mit wenigen Befehlen, um Eingaben in Ausgaben zu verwandeln, mit Optimierungs-Highscore (Schritte/Größe). Idee für **Pseudocode/Struktogramm-Puzzles**.

**Lightbot** – ✔︎ https://lightbot.com/ · proprietär. Befehlskacheln, Prozeduren, begrenzte Slots. Ein Klassiker für Kontrollstrukturen.

**Blockly Games** – ✔︎ https://blockly.games/ · Apache-2.0 (Repo heute unter `blockly-games/blockly-games`) · Blockly selbst: Apache-2.0, inzwischen unter `RaspberryPiFoundation/blockly` (✔︎ API-Redirect).
- Kann man **direkt nachnutzen**: Blockly für Struktogramm/Pseudocode-Level. Größere Bibliothek, aber per CDN/Datei statisch nutzbar.

**Untrusted** – ✔︎ Repo `AlexNisnevich/untrusted` · **keine LICENSE-Datei** (✔︎ Dateiliste geprüft), also nur Idee. Mechanik: Man bekommt fast gesperrten Code und darf nur bestimmte Zeilen ändern.

**Elevator Saga** (MIT), **CodeCombat** (MIT, Server-lastig) – Ideen für „Code steuert Simulation“, für die Grundstufe zu aufwendig.

**Hacknet** – ✔︎ Steam · proprietär. Story wird über ein Terminal erzählt, Ports öffnen, Logs löschen. Idee für den Erzählrahmen des Fake-Terminals.

**Data Center Simulator / Packet Wars** – ◐ nur über Websuche bestätigt (Steam- bzw. packetwars.com-Treffer), nicht selbst abgerufen. Interessante Idee aus Data Center Simulator: Rack, USV, Kühlung und Verfügbarkeit als Management-Spiel. Das passt zu unseren Handouts *USV-Typen* und *Verfügbarkeit*.

### 3.5 Quiz-/Wiederholungs-Infrastruktur

**ClassQuiz** – ✔︎ https://classquiz.de/ · MPL-2.0 · aktiv. Selbst hostbare Kahoot-Alternative (Live-Quiz im Klassenraum). Braucht einen Server und passt deshalb nicht in die statische Seite. Möglich wäre ein **Export unserer Fragen** ins ClassQuiz-Format ✱ (Format noch nicht geprüft).

**Quizfreely** – ✔︎ https://quizfreely.org/ · AGPL-3.0 · aktiv, klein (23 ★). Karteikarten-Tool. Nur als Idee.

**ts-fsrs** – ✔︎ https://github.com/open-spaced-repetition/ts-fsrs · MIT · aktiv
- TypeScript-Implementierung des FSRS-Algorithmus (Spaced Repetition, wie im modernen Anki). Lässt sich gebündelt im Browser nutzen, den Fortschritt speichern wir in `localStorage`. **Empfehlung:** ein „Wiederholen“-Modus über alle Quizfragen. Ein einfaches Leitner-System (5 Boxen) wäre die S-Variante ohne Abhängigkeit.

### 3.6 Deutsche Bildungsquellen

**inf-schule.de** – ✔︎ https://www.inf-schule.de/ · Footer: **CC BY-SA 4.0** (✔︎). Umfangreiches Material zu Datenbanken (✔︎ /datenbanksysteme), Netzen und Programmierung. Gut nutzbar als **Quelle für Aufgabenideen und Texte**, aber mit Namensnennung und SA-Pflicht für abgeleitete Inhalte.

**Informatik-Biber (BWINF)** – ✔︎ https://bwinf.de/biber/ · Lizenz ◐: Aufgabenhefte je nach Jahrgang/Land unter CC BY-SA oder CC BY-NC-SA (laut Websuche, **pro Heft prüfen**). Das **Format** (kurze, kontextreiche Denkaufgaben ohne Vorwissen) ist ideal für „Rätsel der Woche“.

---

## 4. Lernwissenschaftliche Grundlagen

| Befund | Kernaussage | Quelle | Prüfstatus |
|---|---|---|---|
| **Gamification** | Positive Effekte: kognitiv g = 0,49, motivational g = 0,36, verhaltensbezogen g = 0,25. Spielfiktion (Story) und soziale Interaktion (Kombination aus Wettbewerb und Kooperation) sind wichtige Moderatoren. | Sailer, M. & Homner, L. (2020). *The Gamification of Learning: A Meta-Analysis.* Educational Psychology Review, 32, 77–112. doi:10.1007/s10648-019-09498-w | ◐ Werte über Websuche (Uni Augsburg) bestätigt |
| **Serious Games** | Lernen d = 0,29, Behalten d = 0,36 gegenüber konventionellem Unterricht. Motivation war **nicht** signifikant überlegen. Spiele wirken besser in mehreren Sitzungen und zusammen mit anderem Unterricht. | Wouters, P., van Nimwegen, C., van Oostendorp, H. & van der Spek, E. D. (2013). Journal of Educational Psychology, 105(2), 249–265. doi:10.1037/a0031311 | ◐ Effektgrößen über Websuche. Die Aussage zur Motivation stammt aus Fachwissen ✱ |
| **Digitale Spiele** | g = 0,33 gegenüber Nicht-Spiel-Bedingungen. Erweiterte Spieldesigns und mehrere Sitzungen wirken stärker. | Clark, D. B., Tanner-Smith, E. E. & Killingsworth, S. S. (2016). *Digital Games, Design, and Learning.* Review of Educational Research, 86(1), 79–122. doi:10.3102/0034654315582065 | ◐ |
| **Retrieval Practice (Testing-Effekt)** | Abrufüben schlägt erneutes Lesen. Gesamteffekt g ≈ 0,61 (≈ 0,51 gegenüber Restudy). Mit Feedback und Formatpassung wirkt es stärker. | Adesope, O. O., Trevisan, D. A. & Sundararajan, N. (2017). *Rethinking the Use of Tests.* Review of Educational Research, 87(3), 659–701. doi:10.3102/0034654316689306 | ◐ |
| Testing-Effekt (Grundlagenstudie) | Getestete Gruppe behält nach 1 Woche deutlich mehr als die Gruppe, die nur gelesen hat. | Roediger, H. L. & Karpicke, J. D. (2006). Psychological Science, 17(3), 249–255. doi:10.1111/j.1467-9280.2006.01693.x | ✱ aus Fachwissen |
| **Spacing (verteiltes Üben)** | Verteiltes Üben schlägt massiertes Üben (317 Experimente). Der optimale Abstand wächst mit dem gewünschten Behaltenszeitraum. | Cepeda, N. J., Pashler, H., Vul, E., Wixted, J. T. & Rohrer, D. (2006). Psychological Bulletin, 132(3), 354–380. doi:10.1037/0033-2909.132.3.354 | ◐ |
| Lernstrategien im Vergleich | Practice Testing und Distributed Practice haben „high utility“, Markieren und Wiederlesen „low utility“. | Dunlosky, J. et al. (2013). Psychological Science in the Public Interest, 14(1), 4–58. doi:10.1177/1529100612453266 | ✱ aus Fachwissen |
| **Feedback** | Feedback gehört zu den stärksten Einflussgrößen. Wirksam ist es, wenn es aufgaben- und prozessbezogen ist (Wo stehe ich? Was ist der nächste Schritt?), nicht wenn es nur lobt. | Hattie, J. & Timperley, H. (2007). *The Power of Feedback.* Review of Educational Research, 77(1), 81–112. doi:10.3102/003465430298487 | ✱ aus Fachwissen |
| **Interleaving** | Vermischte Aufgabentypen verbessern die spätere Leistung gegenüber geblockten (Mathematik). | Rohrer, D. & Taylor, K. (2007). Instructional Science, 35, 481–498. doi:10.1007/s11251-007-9015-8 | ✱ aus Fachwissen |

**Was daraus für das Design folgt:**
1. **Jedes Minispiel ist ein Abruf-Anlass.** Die Antwort soll aktiv erzeugt werden (Freitext, Paket bauen, SQL schreiben), nicht nur wiedererkannt.
2. **Erklärendes Feedback sofort** zeigen: *warum* falsch, mit Hinweis auf das passende Handout. Wir haben ~40 Handouts, die man direkt verlinken kann.
3. **Spacing einbauen:** Leitner/FSRS-Wiederholmodus. Falsch beantwortete Aufgabentypen kommen bald wieder, richtige später.
4. **Interleaving:** Ein „Prüfungsmix“-Modus mischt Subnetting, Übertragungsraten und OSI.
5. **Story (Spielfiktion) und Kooperation** zahlen laut Sailer & Homner messbar ein, deshalb Detektivfälle und eine Team-Variante (Klassen-Challenge). Punkte und Badges allein sind schwach belegt, also nur sparsam einsetzen.
6. **Mehrere kurze Sitzungen** (Wouters, Clark) sind besser als ein Marathon: Tages-Challenge bzw. „Rätsel der Woche“.

---

## 5. Abgeleitete Minispiel-Ideen (12)

Aufwand: **S** ≈ 0,5–1 Tag · **M** ≈ 2–4 Tage · **L** ≈ 1–2 Wochen (✱ Schätzung, Vanilla-JS, ohne Grafikproduktion).

| # | Name | LF | Mechanik (Vorbild) | Lernziel | Datenquelle | Aufwand |
|---|---|---|---|---|---|---|
| 1 | **Switch-Lehrling** | LF03 | Frames treffen am Switch ein, der Spieler entscheidet: *Flooding / Forwarding / Filtern* und füllt die MAC-Adresstabelle. Ist/Soll-Visualisierung (Learn Git Branching), Schritt-Simulation (Packet Tracer, Filius) | Arbeitsweise des Switches, MAC-Lernen, Broadcast | Eigene Generator-Daten (zufällige MACs/Ports); Handout *netzwerkgeraete-switch-router-netzwerkkarte* | M |
| 2 | **Frame-Werkstatt** | LF03 | Ein Ethernet-Frame oder IP-Paket wird aus Feld-Bausteinen zusammengesetzt (Präambel, Ziel-MAC, VLAN-Tag, EtherType, FCS …), das Paket muss zugestellt werden (NetSim/errorinn) | Aufbau Ethernet-Frame/IP-Header, VLAN-Tag, Ports | Handouts *das-ethernet-frame…*, *vlan-tag…*, *ports…* | M |
| 3 | **Router-Rätsel** | LF03 | Routingtabelle ergänzen, danach läuft ein Paket animiert durchs Netz. TTL sinkt pro Hop, Fehlrouten enden im Loop oder Drop. Lightbot-artig: erst planen, dann ausführen | Routing, Default-Gateway, TTL, Netz-ID | Eigene Levels (JSON), Wiederverwendung der bestehenden Paket-Animation | M |
| 4 | **Subnetz-Sprint mit Gedächtnis** | LF03 | Bestehender Generator plus Leitner/FSRS-Wiederholung, Streak und „Lösungsweg anzeigen“ (Subnetting-Trainer + ts-fsrs) | Subnetting, CIDR, Hostanzahl | Vorhandene Generatoren; ts-fsrs (MIT) optional | S |
| 5 | **Ping-Detektiv** | LF03/04 | Fake-Terminal mit simulierten Befehlen (`ipconfig`, `ping`, `tracert`, `nslookup`, `arp -a`), Störungsfall lösen und Ursache als „Flag“ eingeben (Bandit, Hacknet) | Systematische Fehlersuche, Befehle, Schichtenmodell | Eigene Fallskripte (JSON-Zustandsautomat) | M |
| 6 | **Patchfeld-Puzzle** | LF03 | Kabel per Drag-and-drop zwischen Patchfeld, Switch und Dosen ziehen, Ziel ist eine Rangierliste (Froggy-Prinzip: ein Ziel pro Level) | Strukturierte Verkabelung, Rangieren, Kat./Klassen | Handouts *patchfeld-rangieren…*, *strukturierte-verkabelung…* | M |
| 7 | **Phish oder echt?** | LF04 | Deutsche Fake-Mails/SMS: entscheiden, danach Hotspots (Absender-Domain, Link-Ziel, Druck) aufdecken und erklären lassen (Jigsaw Phishing Quiz, Mechanik nur als Idee) | Social Engineering erkennen, Schutzziele | Eigene Mail-Vorlagen (fiktive Firmen/Domains, z. B. `example.com`) | S |
| 8 | **Schutzbedarfs-Detektiv** | LF04 | Szenario-Firma: Anwendungen, IT-Systeme und Räume als Karten. Schutzbedarf (normal/hoch/sehr hoch) für C/I/A zuordnen, danach Maximum-, Kumulations- und Verteilungseffekt anwenden. Karten-Mechanik (Oh My Git!) + Abhängigkeitsgraph | Schutzbedarfsfeststellung nach BSI-Standard 200-2 | BSI-Standard 200-2 (nur als fachliche Grundlage zitieren, eigene Szenarien schreiben) | M–L |
| 9 | **Passwort-Labor** | LF04 | Schieberegler für Länge und Zeichenraum, live berechnete Entropie und Brute-Force-Zeit. Danach Quiz „welches Passwort hält länger?“ | Zeichenraum^Länge, Entropie, Passwortrichtlinien | Formeln, eigene Annahmen zur Rate (Hashes/s) transparent ausweisen | S |
| 10 | **Dekodier-Escape** | LF04 | Escape-Room: Hinweise sind Base64-, Hex-, Caesar- oder ROT13-kodiert. Der Spieler baut ein „Rezept“ aus Operationen (CyberChef-Mechanik) und unterscheidet Kodierung, Verschlüsselung und Hash | Kodierung ≠ Verschlüsselung ≠ Hash, Zahlensysteme | Eigene Rätsel; Implementierung mit Bordmitteln (`atob`, `crypto.subtle`) | M |
| 11 | **Firewall-Regelwerk** | LF04 | Erweiterung von *Packet Defender*: Regeln vorab sortieren (First Match), dann rollt eine Paketwelle an. Falsche Reihenfolge lässt Angreifer durch bzw. blockiert legitimen Verkehr | Paketfilter, Regelreihenfolge, Default-Deny, Ports | Bestehendes Packet Defender + Port-Handout | S–M |
| 12 | **SQL-Krimi: Der Fall Serverraum** | LF05 | Deutscher SQL-Detektivfall mit sql.js (Vorbild SQL Murder Mystery, MIT). Ergänzend Mikrolevel „SQL-Froggy“, die die von WHERE getroffenen Zeilen hervorheben (CSS Diner, SQLBolt) | SELECT, WHERE, LIKE, ORDER BY, JOIN, GROUP BY | Eigene SQLite-DB (Zutrittslog, Mitarbeiter, Tickets); sql.js (Lizenz vorab prüfen) | L |

**Optional / später:** *Struktogramm-Roboter* (LF05, Blockly, Apache-2.0, Lightbot-Idee, L) · *ER-Baukasten* (Kardinalitäten 1:n/n:m zuordnen, M) · *Rechenzentrum-Manager* (USV, RAID, Verfügbarkeit als Tycoon-Lite, L) · *Rätsel der Woche* im Biber-Format (S je Rätsel).

**Empfohlene Reihenfolge** (Lerngewinn pro Aufwand): 4 → 7 → 11 → 9 → 1 → 12 → 8 → 5 → 3 → 2 → 10 → 6.

---

## 6. Offene Punkte / vor Umsetzung prüfen

- [ ] LICENSE-Datei von **sql.js** prüfen (API meldet NOASSERTION).
- [ ] Lizenz konkreter **Informatik-Biber**-Hefte vor jeder Übernahme prüfen.
- [ ] Schauen, ob **Flexbox Froggy** eine deutsche Übersetzung hat (✱). Für uns zählt aber nur die Mechanik.
- [ ] Falls Filius-Beispielnetze genutzt werden sollen, ist das GPL-Copyleft zu beachten. Empfehlung: nicht übernehmen.
- [ ] Packet Wars / Data Center Simulator wurden nur per Websuche bestätigt. Sie sind für die Umsetzung aber nicht relevant.
- [ ] Eigene Szenarien (Phishing-Mails, Firmen, Domains) immer fiktiv halten (`example.com`/`.test`) – keine echten Marken.
