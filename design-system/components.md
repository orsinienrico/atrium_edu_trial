# SOMA Agent UI — Component Reference
**Versione:** 1.0 | **2026-06-05**

Esempi HTML pronti da copiare per ogni componente del design system.
Richiede `ds.css` caricato e i font Inter + JetBrains Mono da Google Fonts.

---

## Font (obbligatorio nell'`<head>`)

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="design-system/ds.css">
```

---

## Template boilerplate — agente standalone

Il punto di partenza per qualsiasi nuovo agente con pannello sinistro (form) + destro (output).

```html
<!DOCTYPE html>
<html lang="it" data-theme="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="Cache-Control" content="no-store">
  <title>{{Nome Agente}}</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="design-system/ds.css">
  <style>
    /* ── stili specifici di questo agente ── */

    /* Shell layout */
    .agent-shell {
      display: flex;
      height: calc(100vh - 56px); /* sottrarre altezza topbar */
      overflow: hidden;
    }
    .panel-left {
      width: 320px;
      flex-shrink: 0;
      background: var(--bg-0);
      border-right: 1px solid var(--br);
      display: flex;
      flex-direction: column;
      overflow: hidden;
      padding: 16px;
    }
    .panel-right {
      flex: 1;
      overflow-y: auto;
      background: var(--bg-2);
      display: flex;
      flex-direction: column;
    }
  </style>
</head>
<body>

  <!-- TOPBAR -->
  <div class="ds-topbar">
    <div class="ds-topbar-left">
      <span class="ds-agent-badge">{{CODE}}</span>
      <span style="font-size:.9rem;font-weight:600;color:var(--t-1)">{{Nome Agente}}</span>
    </div>
    <span class="ds-version-chip">v1.0</span>
  </div>

  <!-- SHELL -->
  <div class="agent-shell">

    <!-- LEFT: form input -->
    <div class="panel-left">
      <div class="ds-field">
        <label>Campo input</label>
        <input type="text" placeholder="inserisci valore…">
      </div>
      <button class="ds-run-btn">
        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5"><polygon points="5 3 19 12 5 21 5 3"/></svg>
        Avvia
      </button>
    </div>

    <!-- RIGHT: output -->
    <div class="panel-right">
      <!-- empty state iniziale -->
      <div class="ds-empty" id="emptyState">
        <div class="ds-empty-icon">
          <svg viewBox="0 0 24 24" width="28" height="28" fill="none" stroke="currentColor" stroke-width="1.5"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/></svg>
        </div>
        <div class="ds-empty-title">Nessun risultato</div>
        <div class="ds-empty-sub">Compila il form e premi Avvia per eseguire l'agente.</div>
      </div>
    </div>

  </div>

  <script>
    // logica agente
  </script>
</body>
</html>
```

---

## Componenti

### Topbar

```html
<div class="ds-topbar">
  <div class="ds-topbar-left">
    <span class="ds-agent-badge">MI</span>
    <span style="font-size:.9rem;font-weight:600;color:var(--t-1)">Market Intelligence</span>
    <span class="ds-version-chip">v2.1</span>
  </div>
  <div class="ds-topbar-right">
    <button class="ds-icon-btn" title="Impostazioni">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83-2.83l.06-.06A1.65 1.65 0 0 0 4.68 15a1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 2.83-2.83l.06.06A1.65 1.65 0 0 0 9 4.68a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 2.83l-.06.06A1.65 1.65 0 0 0 19.4 9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1z"/></svg>
    </button>
  </div>
</div>
```

---

### Bottoni

```html
<!-- Ghost (default) -->
<button class="ds-btn">Esporta</button>

<!-- Primary -->
<button class="ds-btn ds-btn--primary">Salva</button>

<!-- Danger hover -->
<button class="ds-btn ds-btn--danger">Elimina</button>

<!-- Small -->
<button class="ds-btn ds-btn--sm">Dettagli</button>

<!-- Con icona -->
<button class="ds-btn ds-btn--primary">
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
  Scarica
</button>

<!-- Run CTA (piena larghezza) -->
<button class="ds-run-btn">
  <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5"><polygon points="5 3 19 12 5 21 5 3"/></svg>
  Avvia analisi
</button>

<!-- Disabilitato -->
<button class="ds-btn ds-btn--primary" disabled>In corso…</button>
```

---

### Form

```html
<!-- Campo obbligatorio -->
<div class="ds-field">
  <label>Nome azienda</label>
  <input type="text" placeholder="es. Acme S.p.A.">
  <div class="ds-field-hint">Inserisci la ragione sociale completa.</div>
</div>

<!-- Select -->
<div class="ds-field">
  <label>Settore</label>
  <select>
    <option>Finanza</option>
    <option>Tech</option>
    <option>Retail</option>
  </select>
</div>

<!-- Textarea -->
<div class="ds-field">
  <label>Note</label>
  <textarea placeholder="Note aggiuntive…"></textarea>
</div>

<!-- Campo opzionale -->
<div class="ds-field ds-field--optional">
  <label>
    API Key
    <span class="ds-opt-badge">opzionale</span>
  </label>
  <input type="text" placeholder="sk-…">
</div>
```

---

### Cards

```html
<!-- Card base -->
<div class="ds-card">
  Contenuto libero
</div>

<!-- KPI card -->
<div class="ds-kpi-card">
  <div class="ds-kpi-label">Utenti attivi</div>
  <div class="ds-kpi-value">1,247</div>
  <div class="ds-kpi-sub">↑ 12% rispetto al mese scorso</div>
</div>

<!-- KV card -->
<div class="ds-kv-card">
  <div class="ds-kv-label">Settore</div>
  <div class="ds-kv-value">Servizi finanziari</div>
</div>

<!-- Griglia 3 colonne con KPI -->
<div class="ds-grid-3">
  <div class="ds-kpi-card">…</div>
  <div class="ds-kpi-card">…</div>
  <div class="ds-kpi-card">…</div>
</div>
```

---

### Section collassabile

```html
<div class="ds-section">
  <div class="ds-section-hdr" onclick="this.nextElementSibling.classList.toggle('open')">
    <div class="ds-section-hdr-icon" style="background:rgba(74,106,229,.12);color:var(--accent)">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
    </div>
    <span class="ds-section-hdr-title">Dettagli report</span>
    <span class="ds-status ds-status--done">OK</span>
  </div>
  <div class="ds-section-body open">
    <!-- contenuto -->
  </div>
</div>
```

---

### Badges e tag

```html
<!-- Tag colori -->
<span class="ds-tag">default</span>
<span class="ds-tag ds-tag--green">attivo</span>
<span class="ds-tag ds-tag--amber">warning</span>
<span class="ds-tag ds-tag--red">errore</span>
<span class="ds-tag ds-tag--grey">N/D</span>

<!-- Contenitore tag -->
<div class="ds-tags">
  <span class="ds-tag ds-tag--green">SaaS</span>
  <span class="ds-tag">Fintech</span>
  <span class="ds-tag ds-tag--amber">Early stage</span>
</div>

<!-- Status badge (job/task) -->
<span class="ds-status ds-status--done">completato</span>
<span class="ds-status ds-status--running">in corso</span>
<span class="ds-status ds-status--error">errore</span>
<span class="ds-status ds-status--warn">attenzione</span>
```

---

### Log panel

```html
<div class="ds-log-wrap">
  <div class="ds-log-inner ds-scroll" id="logInner">
    <!-- le righe vengono inserite con JS, colonna-reverse le mette in cima -->
  </div>
</div>

<script>
function appendLog(text, type = '') {
  const inner = document.getElementById('logInner');
  const row = document.createElement('div');
  row.className = 'ds-rlog' + (type ? ' ds-rlog--' + type : '');
  row.textContent = text;
  inner.prepend(row);
}

// Esempi:
appendLog('[10:42:01] Avvio analisi…');
appendLog('[10:42:03] Dati caricati.', 'ok');
appendLog('[10:42:05] Token in scadenza.', 'warn');
appendLog('[10:42:08] Connessione fallita.', 'error');
appendLog('── FASE 2: Elaborazione ──', 'phase');
appendLog('Note interne.', 'info');
</script>
```

---

### Pipeline / phase bar

```html
<!-- Markup statico (aggiorna via JS le classi --done / --active / --error) -->
<div class="ds-phase-bar">
  <div class="ds-phase-step ds-phase-step--done"  id="step1"></div>
  <div class="ds-phase-step ds-phase-step--active" id="step2"></div>
  <div class="ds-phase-step"                       id="step3"></div>
  <div class="ds-phase-step"                       id="step4"></div>
</div>
<div class="ds-phase-labels">
  <span class="ds-phase-label ds-phase-label--done">Fetch</span>
  <span class="ds-phase-label ds-phase-label--active">Analisi</span>
  <span class="ds-phase-label">Sintesi</span>
  <span class="ds-phase-label">Export</span>
</div>
```

---

### Spinners

```html
<!-- Inline (accanto a testo) -->
<span class="ds-spinner-sm"></span>

<!-- Progress panel -->
<span class="ds-spinner-md"></span>

<!-- Caricamento centrato -->
<span class="ds-spinner-lg"></span>
```

---

### Live dot

```html
<!-- Statico -->
<span class="ds-live-dot"></span>

<!-- Pulsante -->
<span class="ds-live-dot ds-live-dot--pulse"></span>

<!-- Con label -->
<div style="display:flex;align-items:center;gap:6px;font-size:.65rem;color:var(--green)">
  <span class="ds-live-dot ds-live-dot--pulse"></span>
  LIVE
</div>
```

---

### Empty state

```html
<div class="ds-empty">
  <div class="ds-empty-icon">
    <svg viewBox="0 0 24 24" width="28" height="28" fill="none" stroke="currentColor" stroke-width="1.5">
      <circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/>
    </svg>
  </div>
  <div class="ds-empty-title">Nessun risultato</div>
  <div class="ds-empty-sub">Compila il form e premi Avvia per eseguire l'analisi.</div>
</div>
```

---

## Convenzioni naming (per mantenere coerenza tra agenti)

| Elemento | Pattern | Esempio |
|---|---|---|
| Shell container | `.{codice}-shell` | `.cp-shell`, `.mi-shell` |
| Tab/nav button | `#tabBtn{CODICE}` | `#tabBtnCP`, `#tabBtnMI` |
| Iframe | `#{codice}Frame` | `#cpFrame`, `#piabFrame` |
| API proxy route | `/{codice}-api/` | `/cp-api/`, `/avp-api/` |
| Job result div | `#{codice}Result` | `#cpResult` |

## z-index scale

| Layer | Valore |
|---|---|
| Card, content base | `0` (default) |
| Report header sticky | `10` |
| Topbar | `100` |
| Sidebar collapse btn | `200` |
| Modal / lightbox | `9999` |

## Dos & Don'ts

| ✅ Fai | ❌ Non fare |
|---|---|
| Usa `var(--accent)` per i colori | Hardcodare `#4A6AE5` nel markup |
| SVG inline con `stroke="currentColor"` | Icon font (Font Awesome, ecc.) |
| Font-size in `rem` | `px` fissi per il testo |
| Transizioni `all .15s var(--ease)` | Transizioni >300ms su elementi interattivi |
| `--f-mono` per log, timestamp, numeri | Inter per output tecnico |
| `flex-direction:column-reverse` nel log | Scroll manuale nel log |
| Empty state sempre visibile all'inizio | Pannello destro vuoto senza indicazione |
| Classi `ds-` per componenti condivisi | Ri-implementare componenti da zero |
