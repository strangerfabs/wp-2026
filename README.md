# wp-2026

Statische Einzelseite. Digitale Geschenkkarte zum 20. Geburtstag — Sticker-Collage
mit Scroll-Story und Countdown auf den 04.12.2026.

**Live:** https://strangerfabs.github.io/wp-2026/

## Dateien

| Datei | Zweck |
| --- | --- |
| `card.src.html` | Quelle. Nur Inhalt, ohne `<html>`/`<head>` — diese Fassung wird als Artifact veröffentlicht. |
| `index.html` | Generiert aus `card.src.html`. Vollständiges Dokument mit Viewport- und `noindex`-Meta. Das ist die Seite, die GitHub Pages ausliefert. |
| `print.html` | A4-Blatt zum Ausdrucken mit QR-Code auf die Karte. Eigenständig, wird **nicht** von `build.sh` erzeugt. |
| `robots.txt` | Sperrt Suchmaschinen aus. |

## QR-Code

Der QR-Code in `print.html` ist als reines Inline-SVG eingebacken — kein Skript, kein
externer Dienst, nichts wird beim Drucken nachgeladen. Er kodiert
`https://strangerfabs.github.io/wp-2026/`, Version 4, Fehlerkorrektur Q (25 %).

**Ändert sich die URL, muss er neu erzeugt werden.** Er steht sonst still auf der alten
Adresse. Erzeugt wurde er mit [segno](https://pypi.org/project/segno/):

```python
import segno
qr = segno.make("https://strangerfabs.github.io/wp-2026/", error='q')
# jedes dunkle Modul wird zu "M{x} {y}h1v1h-1z", plus 4 Module Ruhezone ringsum
```

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
