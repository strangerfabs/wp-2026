# wp-2026

Statische Einzelseite. Digitale Geschenkkarte zum 20. Geburtstag — Sticker-Collage
mit Scroll-Story und Countdown auf den 04.12.2026.

**Live:** https://strangerfabs.github.io/wp-2026/

## Dateien

| Datei | Zweck |
| --- | --- |
| `card.src.html` | Quelle. Nur Inhalt, ohne `<html>`/`<head>` — diese Fassung wird als Artifact veröffentlicht. |
| `index.html` | Generiert aus `card.src.html`. Vollständiges Dokument mit Viewport- und `noindex`-Meta. Das ist die Seite, die GitHub Pages ausliefert. |
| `robots.txt` | Sperrt Suchmaschinen aus. |

`index.html` wird aus `card.src.html` erzeugt — Änderungen also **immer in `card.src.html`**
machen und danach `./build.sh` laufen lassen, sonst laufen Artifact und Pages auseinander.

```bash
./build.sh
```

## Technisch

Eine Datei, kein Build-Tooling, keine externen Abhängigkeiten. Alle Sticker sind
handgezeichnetes Inline-SVG, alle Schriften sind System-Schriften (iOS/macOS) — es wird
nichts nachgeladen, die Seite funktioniert offline.

Mobil zuerst: `svh` statt `vh` gegen die springende Safari-Leiste, alle Größen über
`clamp()` an der Viewportbreite, unter 360px Breite werden fünf Sticker ausgeblendet.
`prefers-reduced-motion` schaltet die Scroll-Animationen ab.

## Sichtbarkeit

Das Repo ist öffentlich, weil GitHub Pages im Gratis-Tarif nur aus öffentlichen Repos
ausliefert. `noindex` und `robots.txt` halten Suchmaschinen fern; erreichbar ist die
Seite damit praktisch nur über den direkten Link.
