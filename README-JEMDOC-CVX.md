# jemdoc-cvx website

This folder has been converted from legacy Jemdoc to the `cvxgrp/jemdoc-cvx` workflow.
The original site content, course PDFs, image, and URL structure are preserved.

## Windows: first use

1. Install Python 3.11 or newer if needed.
2. Double-click `build.bat`, or open Command Prompt in this folder and run:

   `build`

On the first run, `build.bat` downloads the official `jemdoc` generator from
`cvxgrp/jemdoc-cvx`. Later builds reuse that local file.

## Normal update workflow

Edit any `.jemdoc` file and then run:

`build`

This rebuilds the main pages, Slides, and all four course pages.

To rebuild one page only, run from the website root, for example:

`python jemdoc -c jemdoc-cvx.conf publications.jemdoc`

or

`python jemdoc -c jemdoc-cvx.conf courses\ee312\ee312.jemdoc`

## Course navigation

All course pages now load the root `MENU` with a `../../` prefix, so the same
left sidebar appears on EE312, ENGR308, ENGR504, and ENGR507. The active course
is highlighted automatically.

## Notes

- Generated `.html` files are intentionally kept in the repository for GitHub Pages.
- `site.css` is a lightweight local theme using system fonts; it requires no
  bundled font files.
- The existing Google Analytics 4 tag is preserved through `jemdoc-cvx.conf`.

## Site appearance

The active `site.css` intentionally keeps the classic Jemdoc academic
palette (white background, blue headings/links, light-gray sidebar) while
retaining modern responsive spacing. The previous warmer converted theme is
kept as `jemdoc-cvx-modern.css` in case you want to switch back or compare.
