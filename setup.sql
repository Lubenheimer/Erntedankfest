-- ════════════════════════════════════════════════════════════════
--  Erntedankfest – Supabase Setup SQL
--  Dieses Skript im Supabase SQL-Editor ausführen (einmalig)
-- ════════════════════════════════════════════════════════════════

-- 1. Kuchenliste
CREATE TABLE kuchenliste (
    id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name       TEXT NOT NULL,
    kuchenart  TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 2. Aufgaben (Admin trägt To-Dos ein)
CREATE TABLE aufgaben (
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    titel        TEXT NOT NULL,
    beschreibung TEXT,
    max_helfer   INT NOT NULL DEFAULT 3,
    created_at   TIMESTAMPTZ DEFAULT now()
);

-- 3. Helfer (Eltern tragen sich zu einer Aufgabe ein)
CREATE TABLE helfer (
    id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    aufgabe_id UUID NOT NULL REFERENCES aufgaben(id) ON DELETE CASCADE,
    name       TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 4. Änderungsprotokoll
CREATE TABLE change_log (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tabelle       TEXT NOT NULL,
    zeile_id      UUID,
    aktion        TEXT NOT NULL CHECK (aktion IN ('eintrag', 'loeschung')),
    alter_wert    JSONB,
    neuer_wert    JSONB,
    geaendert_von TEXT,
    zeitstempel   TIMESTAMPTZ DEFAULT now()
);

-- ────────────────────────────────────────────────────────────────
--  Row Level Security – alle Tabellen öffentlich lese- und schreibbar
--  (kein Login erforderlich für Eltern)
-- ────────────────────────────────────────────────────────────────

ALTER TABLE kuchenliste ENABLE ROW LEVEL SECURITY;
ALTER TABLE aufgaben    ENABLE ROW LEVEL SECURITY;
ALTER TABLE helfer      ENABLE ROW LEVEL SECURITY;
ALTER TABLE change_log  ENABLE ROW LEVEL SECURITY;

-- Lesen: alle dürfen alles lesen
CREATE POLICY "public read kuchenliste" ON kuchenliste FOR SELECT USING (true);
CREATE POLICY "public read aufgaben"    ON aufgaben    FOR SELECT USING (true);
CREATE POLICY "public read helfer"      ON helfer      FOR SELECT USING (true);
CREATE POLICY "public read change_log"  ON change_log  FOR SELECT USING (true);

-- Schreiben: alle dürfen Einträge hinzufügen
CREATE POLICY "public insert kuchenliste" ON kuchenliste FOR INSERT WITH CHECK (true);
CREATE POLICY "public insert aufgaben"    ON aufgaben    FOR INSERT WITH CHECK (true);
CREATE POLICY "public insert helfer"      ON helfer      FOR INSERT WITH CHECK (true);
CREATE POLICY "public insert change_log"  ON change_log  FOR INSERT WITH CHECK (true);

-- Löschen: alle dürfen löschen (Schutz erfolgt durch Admin-Passwort im Frontend)
CREATE POLICY "public delete kuchenliste" ON kuchenliste FOR DELETE USING (true);
CREATE POLICY "public delete aufgaben"    ON aufgaben    FOR DELETE USING (true);
CREATE POLICY "public delete helfer"      ON helfer      FOR DELETE USING (true);

-- ────────────────────────────────────────────────────────────────
--  Vorbelegte Aufgaben (Dienste)
-- ────────────────────────────────────────────────────────────────
INSERT INTO aufgaben (titel, max_helfer) VALUES
    ('Aufbau', 3),
    ('Abbau', 3),
    ('Kuchenverkauf', 2);
