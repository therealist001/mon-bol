-- MON BOL · schéma D1 alpha
PRAGMA foreign_keys = ON;

-- Snapshot utilisé par l'alpha pour synchroniser l'espace personnel.
CREATE TABLE IF NOT EXISTS app_state (
  id TEXT PRIMARY KEY NOT NULL CHECK (id = 'main'),
  data_json TEXT NOT NULL,
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

-- Modèle relationnel cible : fiches autonomes et réutilisables.
CREATE TABLE IF NOT EXISTS entries (
  id TEXT PRIMARY KEY,
  entry_type TEXT NOT NULL CHECK (entry_type IN ('recipe','preparation','ingredient','technique')),
  name TEXT NOT NULL,
  category TEXT,
  origin TEXT,
  description TEXT,
  yield_text TEXT,
  duration_text TEXT,
  difficulty TEXT,
  status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft','tested','validated')),
  image_url TEXT,
  notes TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS ingredients (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT,
  notes TEXT
);

CREATE TABLE IF NOT EXISTS entry_ingredients (
  entry_id TEXT NOT NULL REFERENCES entries(id) ON DELETE CASCADE,
  ingredient_id TEXT NOT NULL REFERENCES ingredients(id),
  quantity REAL,
  unit TEXT,
  preparation_note TEXT,
  position INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (entry_id, ingredient_id, position)
);

CREATE TABLE IF NOT EXISTS entry_steps (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  entry_id TEXT NOT NULL REFERENCES entries(id) ON DELETE CASCADE,
  position INTEGER NOT NULL,
  instruction TEXT NOT NULL,
  duration_seconds INTEGER,
  temperature_c REAL
);

CREATE TABLE IF NOT EXISTS entry_relations (
  source_entry_id TEXT NOT NULL REFERENCES entries(id) ON DELETE CASCADE,
  target_entry_id TEXT NOT NULL REFERENCES entries(id) ON DELETE CASCADE,
  relation_type TEXT NOT NULL,
  note TEXT,
  PRIMARY KEY (source_entry_id, target_entry_id, relation_type)
);

CREATE TABLE IF NOT EXISTS tags (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS entry_tags (
  entry_id TEXT NOT NULL REFERENCES entries(id) ON DELETE CASCADE,
  tag_id TEXT NOT NULL REFERENCES tags(id) ON DELETE CASCADE,
  PRIMARY KEY (entry_id, tag_id)
);

CREATE INDEX IF NOT EXISTS idx_entries_type ON entries(entry_type);
CREATE INDEX IF NOT EXISTS idx_entries_name ON entries(name COLLATE NOCASE);
CREATE INDEX IF NOT EXISTS idx_steps_entry_position ON entry_steps(entry_id, position);
