-- ====================================================================
-- Modellunternehmen: MedTech Sanitas GmbH (LF05 Beispieldatenbank)
-- Stand: 15.10.2026
-- Kompatibel mit SQLite (sql.js im Browser), MySQL und PostgreSQL
-- ====================================================================

PRAGMA foreign_keys = ON;

-- 1. Kunden-Stammdaten
CREATE TABLE IF NOT EXISTS kunde (
    kunden_id INTEGER PRIMARY KEY AUTOINCREMENT,
    firma VARCHAR(100) NOT NULL,
    ansprechpartner VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefon VARCHAR(30),
    stadt VARCHAR(50) NOT NULL
);

-- 2. Techniker / Servicemitarbeiter
CREATE TABLE IF NOT EXISTS techniker (
    techniker_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nachname VARCHAR(50) NOT NULL,
    vorname VARCHAR(50) NOT NULL,
    spezialisierung VARCHAR(50) NOT NULL,
    stundensatz DECIMAL(6,2) NOT NULL
);

-- 3. Medizinische IT-Geraete beim Kunden
CREATE TABLE IF NOT EXISTS geraet (
    geraet_id INTEGER PRIMARY KEY AUTOINCREMENT,
    seriennummer VARCHAR(50) UNIQUE NOT NULL,
    modell VARCHAR(50) NOT NULL,
    kaufdatum DATE NOT NULL,
    kunden_id INTEGER NOT NULL,
    FOREIGN KEY (kunden_id) REFERENCES kunde(kunden_id) ON DELETE CASCADE
);

-- 4. Wartungsvertraege
CREATE TABLE IF NOT EXISTS wartungsvertrag (
    vertrag_id INTEGER PRIMARY KEY AUTOINCREMENT,
    vertragstyp VARCHAR(30) NOT NULL,
    gueltig_bis DATE NOT NULL,
    monatspreis DECIMAL(7,2) NOT NULL,
    kunden_id INTEGER NOT NULL,
    FOREIGN KEY (kunden_id) REFERENCES kunde(kunden_id) ON DELETE CASCADE
);

-- 5. Support- und Stoerungstickets
CREATE TABLE IF NOT EXISTS ticket (
    ticket_id INTEGER PRIMARY KEY AUTOINCREMENT,
    geraet_id INTEGER NOT NULL,
    titel VARCHAR(150) NOT NULL,
    status VARCHAR(20) NOT NULL CHECK(status IN ('Offen', 'In Bearbeitung', 'Geschlossen')),
    prioritaet VARCHAR(20) NOT NULL CHECK(prioritaet IN ('Niedrig', 'Mittel', 'Hoch', 'Kritisch')),
    meldedatum DATETIME NOT NULL,
    techniker_id INTEGER,
    FOREIGN KEY (geraet_id) REFERENCES geraet(geraet_id),
    FOREIGN KEY (techniker_id) REFERENCES techniker(techniker_id)
);

-- ====================================================================
-- Testdaten
-- ====================================================================

INSERT INTO kunde (firma, ansprechpartner, email, telefon, stadt) VALUES
('Praxis Dr. Arndt', 'Dr. Michael Arndt', 'arndt@praxis-arndt.de', '040-123456', 'Hamburg'),
('Klinikum Alsterblick', 'Dr. Elena Becker', 'becker@alsterblick.de', '040-987654', 'Hamburg'),
('Sanitaetshaus Nord', 'Klaus Weber', 'weber@sanitaet-nord.de', '0431-555123', 'Kiel'),
('Radiologie Zentrum Mitte', 'Dr. Stefan Kurz', 'kurz@radiologie-mitte.de', '040-334455', 'Hamburg'),
('Gemeinschaftspraxis Elbufer', 'Petra Hansen', 'hansen@elbufer-praxis.de', '04121-88990', 'Elmshorn');

INSERT INTO techniker (nachname, vorname, spezialisierung, stundensatz) VALUES
('Fischer', 'Lukas', 'Netzwerk & Firewalls', 85.00),
('Schneider', 'Sarah', 'Medizingeraete & Sensorik', 95.00),
('Kowalski', 'Jan', 'Datenbanken & Server', 90.00),
('Meyer', 'Anja', 'IT-Sicherheit & Datenschutz', 105.00);

INSERT INTO geraet (seriennummer, modell, kaufdatum, kunden_id) VALUES
('SN-MED-9901', 'CardioScan 3000', '2024-03-15', 1),
('SN-MED-9902', 'UltraSonic Pro', '2023-11-20', 1),
('SN-MED-8810', 'MRT Control Workstation', '2024-01-10', 2),
('SN-MED-7705', 'RehaMotion Flex', '2025-06-01', 3),
('SN-MED-8822', 'CT DICOM Gateway', '2025-02-14', 4),
('SN-MED-9905', 'EKG Station Digital', '2024-08-30', 5);

INSERT INTO wartungsvertrag (vertragstyp, gueltig_bis, monatspreis, kunden_id) VALUES
('Platin 24/7', '2027-12-31', 450.00, 1),
('Enterprise Notfall', '2028-12-31', 1200.00, 2),
('Basis Support', '2026-12-31', 150.00, 3),
('Gold 12/5', '2027-06-30', 650.00, 4);

INSERT INTO ticket (geraet_id, titel, status, prioritaet, meldedatum, techniker_id) VALUES
(1, 'Netzwerk-Timeout beim DICOM-Bildexport', 'In Bearbeitung', 'Hoch', '2026-10-14 09:30:00', 1),
(3, 'Speicherueberlauf nach Dauerbetrieb', 'Offen', 'Kritisch', '2026-10-15 08:15:00', 3),
(2, 'Jaehrliche DGUV V3 Kalibrierung', 'Geschlossen', 'Niedrig', '2026-09-01 14:00:00', 2),
(5, 'Fehlerhafter TLS-Handshake am Gateway', 'In Bearbeitung', 'Hoch', '2026-10-15 09:45:00', 1),
(4, 'Tastatur-Eingabe verzoegert', 'Offen', 'Niedrig', '2026-10-15 10:10:00', NULL);
