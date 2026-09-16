# Erntedankfest – Setup-Anleitung

## Schritt 1 – Supabase-Account anlegen

1. Gehe zu **https://supabase.com** → „Start your project" → kostenlos registrieren
2. „New Project" → Name: `erntedankfest` → Passwort vergeben → Region: **Europe (Frankfurt)** → „Create new project"
3. Warte ca. 1 Minute bis das Projekt bereit ist

---

## Schritt 2 – Datenbanktabellen anlegen

1. Im Supabase-Dashboard links auf **„SQL Editor"** klicken
2. Den gesamten Inhalt der Datei **`setup.sql`** kopieren
3. In das Textfeld einfügen → **„Run"** klicken
4. Grüne Meldung „Success" = fertig ✅

---

## Schritt 3 – URL und Key aus dem Dashboard kopieren

1. Links auf **„Project Settings"** (Zahnrad) → **„API"**
2. Zwei Werte notieren:
   - **Project URL** → sieht aus wie `https://abcxyzABC.supabase.co`
   - **anon public** Key → langer String (unter „Project API keys")

---

## Schritt 4 – Werte in index.html eintragen

Öffne `index.html` und ersetze ganz oben im `<script>`-Block:

```js
const SUPABASE_URL   = 'DEINE_SUPABASE_URL';   // ← Project URL eintragen
const SUPABASE_KEY   = 'DEIN_ANON_KEY';         // ← anon Key eintragen
const ADMIN_PASSWORD = 'Erntedank2026!';        // ← Passwort nach Wunsch ändern
const KUCHEN_ZIEL    = 20;                      // ← Zielanzahl für den Kuchen-Countdown anpassen
```

Passe außerdem im `<header>` das Datum an (steht als Platzhalter `[Datum einfügen]` in `index.html`).

Datei speichern.

---

## Schritt 5 – Auf GitHub Pages veröffentlichen

1. Gehe zu **https://github.com** → neues Repository anlegen (z.B. `erntedankfest`)
2. Repository auf **Public** setzen
3. `index.html` in das Repository hochladen (Drag & Drop im Browser möglich)
4. Im Repository → **„Settings"** → **„Pages"**
5. Source: **„Deploy from a branch"** → Branch: `main` → Ordner: `/ (root)` → **„Save"**
6. Nach ca. 1 Minute erscheint die URL: `https://DEIN-NAME.github.io/erntedankfest/`

Diese URL an die Eltern verschicken – fertig! 🎉

---

## Hinweise

| Thema | Info |
|---|---|
| **Admin-Passwort** | Standard: `Erntedank2026!` – bitte in Schritt 4 ändern |
| **Supabase Pause** | Nach 7 Tagen ohne Zugriff pausiert das Projekt. Einfach einloggen → „Restore project" klicken |
| **Supabase Kosten** | Kostenloser Tier reicht für diese Zwecke dauerhaft aus |
| **Daten löschen** | Im Supabase Dashboard → „Table Editor" → Tabelle auswählen → Einträge manuell löschen |

---

## Dateiübersicht

```
index.html   ← die komplette Website (nur diese Datei auf GitHub Pages hochladen)
setup.sql    ← SQL-Skript für Supabase (einmalig ausführen, danach nicht mehr nötig)
SETUP.md     ← diese Anleitung
```

## Was wurde gegenüber der Waldwoche-Vorlage geändert?

- Aus der mehrtägigen Waldwoche (Essen/Feuerholz/Fahrten/Kuchen pro Tag) wurde ein
  eintägiges Fest: nur noch **Helfer** (Aufgabenliste mit Anmeldung) und **Kuchen**
  (freie Liste ohne feste Tages-Slots), analog zum „Waldfest"-Tab der Vorlage.
- Keine festen Termine/Zahlen hinterlegt – Datum im Header und `KUCHEN_ZIEL` bitte
  noch anpassen, sobald die Details feststehen.
- Farbschema auf Herbst/Erntedank umgestellt (Bernstein/Gold statt Waldgrün).
- Eigenes, leeres Supabase-Projekt nötig (siehe Schritt 1–4) – die Waldwoche-Zugangsdaten
  dürfen nicht wiederverwendet werden.
