# SOMA Agent UI — Design System

**Version:** 1.0 | **2026-06-05**

Design system generico per micro-frontend di agenti AI multi-agente. Estratto dalla suite
Atoka Intelligence ma indipendente da essa — riusabile in qualsiasi progetto SOMA o simile.

---

## Struttura della cartella

```
design-system/
├── README.md          ← questo file (come usarlo)
├── tokens.css         ← solo le variabili CSS (importabile isolato)
├── ds.css             ← sistema completo (token + reset + tutti i componenti)
└── components.md      ← reference dei componenti con esempi HTML
```

---

## Come usare in un nuovo agente

### Opzione A — File CSS completo (raccomandato per iframe / standalone)

Copia `ds.css` nella cartella pubblica del tuo agente, poi:

```html
<link rel="stylesheet" href="path/to/ds.css">
```

Tutte le classi hanno il prefisso `ds-` — non c'è rischio di conflitti con CSS esistente.

### Opzione B — Solo i token

Se hai già i tuoi componenti e vuoi solo la palette/font:

```html
<link rel="stylesheet" href="path/to/tokens.css">
```

Poi usa le variabili `--bg-0`, `--accent`, `--t-1`, ecc. nel tuo CSS.

### Opzione C — Copia inline nei progetti che non servono file statici

Copia il blocco `:root { … }` di `tokens.css` direttamente nel `<style>` della tua pagina,
seguito dai componenti di cui hai bisogno da `ds.css`.

---

## Portare il design system in un altro progetto

1. Copia l'intera cartella `design-system/` nella root del nuovo progetto.
2. Segui `components.md` per il template HTML boilerplate.
3. Non modificare `ds.css` per personalizzazioni di progetto — sovrascrivile in un file separato
   dopo l'import, così le versioni future del DS rimangono applicabili senza merge conflicts.

```html
<link rel="stylesheet" href="design-system/ds.css">
<link rel="stylesheet" href="my-agent.css">   <!-- override specifici qui -->
```

---

## Principi

- **Dark-first.** Tutto pensato per tema scuro; nessun supporto light nel DS core.
- **Token, non colori.** Usa sempre `var(--accent)`, mai `#4A6AE5` nel markup degli agenti.
- **SVG inline.** Niente icon font. SVG con `stroke="currentColor"`, dimensioni 11–20 px.
- **Rem per i font.** Mai px fissi per il testo.
- **Transizioni brevi.** Max 200ms sugli elementi interattivi; usa `var(--ease)`.
- **Prefisso `ds-`.** Tutte le classi del design system usano questo prefisso per evitare collisioni.

---

## Palette rapida

| Token | Hex | Uso tipico |
|---|---|---|
| `--bg-0` | `#06080D` | Body, sidebar |
| `--bg-1` | `#0B0E16` | Topbar, pannelli secondari |
| `--bg-2` | `#12161F` | Card, input, sezioni |
| `--bg-3` | `#1A1F2E` | Hover, elementi elevati |
| `--accent` | `#4A6AE5` | CTA, active state, link |
| `--green` | `#3DBE8C` | Successo, live |
| `--amber` | `#F59E0B` | Warning |
| `--red` | `#EF4444` | Errore, critical |
| `--teal` | `#14B8A6` | Log output, phase done |
| `--t-1` | `#E8ECF4` | Testo primario |
| `--t-3` | `#8494AC` | Label, placeholder |
---

## Attivazione automatica con Claude Code

Questo design system si attiva automaticamente in qualsiasi progetto grazie a due file globali.

### Come funziona

```
Apri qualsiasi progetto in Claude Code
        │
        ▼
Claude legge ~/.claude/CLAUDE.md          ← sempre, in ogni progetto
        │
        │  "Ogni volta che crei un frontend,
        │   leggi ~/.claude/skills/ui-design-system.md"
        │
        ▼
Claude legge ~/.claude/skills/ui-design-system.md
        │
        │  "Se non esiste design-system/ nella root,
        │   copiala da C:/DEV/Atoka_Demo_Agent/design-system/"
        │
        ▼
Claude copia questa cartella nel nuovo progetto
e usa ds.css + components.md da quel momento
```

### I tre livelli

| File | Dove vive | Quando viene letto |
|---|---|---|
|  | globale utente | sempre, ogni progetto |
|  | globale utente | quando si crea/modifica un frontend |
|  | copia locale nel progetto | sorgente canonica in  |
### Setup su una macchina nuova (da fare una volta sola)

1. Crea `~/.claude/CLAUDE.md` con questa regola:

```markdown
## UI Frontend — Design System

Ogni volta che crei o modifichi un frontend HTML/CSS/JS per un agente:
1. Leggi `~/.claude/skills/ui-design-system.md`
2. Se non esiste `design-system/` nella root del progetto,
   copiala da `C:/DEV/Atoka_Demo_Agent/design-system/`
3. Non scrivere CSS da zero — usa i componenti ds- e i token del design system
```

2. Copia la skill globale:

```bash
cp C:/DEV/Atoka_Demo_Agent/skills/ui-design-system.md ~/.claude/skills/
```

Da quel momento ogni nuovo progetto eredita il design system automaticamente.

### Cosa fa Claude in un progetto nuovo

1. Legge `~/.claude/CLAUDE.md` -> riceve l'istruzione sul DS
2. Legge `~/.claude/skills/ui-design-system.md` -> carica le istruzioni operative
3. Copia `design-system/` nella root del nuovo progetto
4. Usa `components.md` come riferimento per il boilerplate e i componenti

Il progetto ha quindi la sua **copia locale** del design system: indipendente,
versionabile con git, non dipende da Atoka_Demo_Agent per girare.
