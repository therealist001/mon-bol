const json = (payload, status = 200) =>
  new Response(JSON.stringify(payload), {
    status,
    headers: { "content-type": "application/json; charset=utf-8", "cache-control": "no-store" }
  });

export async function onRequestGet({ env }) {
  if (!env.DB) return json({ error: "D1 binding DB is missing" }, 503);
  try {
    const row = await env.DB.prepare(
      "SELECT data_json, updated_at FROM app_state WHERE id = ?"
    ).bind("main").first();
    if (!row) return json({ data: null, updatedAt: null });
    return json({ data: JSON.parse(row.data_json), updatedAt: row.updated_at });
  } catch (error) {
    return json({ error: "Unable to read MON BOL state", detail: String(error) }, 500);
  }
}

export async function onRequestPut({ request, env }) {
  if (!env.DB) return json({ error: "D1 binding DB is missing" }, 503);
  try {
    const body = await request.json();
    if (!body || typeof body.data !== "object" || body.data === null || Array.isArray(body.data)) {
      return json({ error: "Expected a data object" }, 400);
    }
    const serialized = JSON.stringify(body.data);
    if (serialized.length > 900000) return json({ error: "MON BOL state is too large" }, 413);
    await env.DB.prepare(
      "INSERT INTO app_state (id, data_json, updated_at) VALUES ('main', ?, datetime('now')) " +
      "ON CONFLICT(id) DO UPDATE SET data_json = excluded.data_json, updated_at = datetime('now')"
    ).bind(serialized).run();
    return json({ ok: true });
  } catch (error) {
    return json({ error: "Unable to save MON BOL state", detail: String(error) }, 500);
  }
}
