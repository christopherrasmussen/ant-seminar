# ANT Seminar website — maintenance notes

- Live site: [`https://christopherrasmussen.github.io/ant-seminar/`](https://christopherrasmussen.github.io/ant-seminar/)
- Repo: (public) `christopherrasmussen/ant-seminar`
- GitHub Pages setting: branch `main`, folder `/docs`

## What lives where

| Path                     | What it is                                                     | Published?                 |
|--------------------------|----------------------------------------------------------------|----------------------------|
| `org/`                   | Org sources. Every `.org` file here becomes `docs/<name>.html` | (source)                   |
| `docs/`                  | Exactly what GitHub Pages serves                               | yes                        |
| `docs/ant-seminar.css`   | The site stylesheet (lives only here)                          | yes                        |
| `build.el`               | ox-publish export script                                       | no                         |
| this file, `README.md`   | Notes                                                          | no (but visible on GitHub) |

## Routine update

1. Sync first, in case you last pushed from another machine:

       cd ~/github/ant-seminar && git pull

   Alternatively, from `magit`: `C-x g F u`

2. Edit `org/index.org`.

3. Build, from the top of the repo:

       emacs --batch -l build.el

   The last line of output should be `Build of ANT seminar site complete!`

   From inside Emacs, use `M-x compile` with the command
   `cd ~/github/ant-seminar && emacs --batch -l build.el`.
   (`build.el` uses relative paths, so the bare command fails if the
   current buffer is in `org/`.)

4. Open `docs/index.html` in a browser. One way: open the same file in 
   an Emacs buffer, then `M-x browse-url-of-file`. Click each new title
   in the schedule and check that it jumps to its abstract.

5. Commit **both** sources and output, then push:

       git add org docs
       git commit -m "..."
       git push

6. The live site updates a minute or two later; the Actions tab shows a
   "pages build and deployment" run. Hard-reload the page if the browser
   shows the old version.

## Adding a talk

1. Fill in the speaker and title cells of that date's row:

       | Oct 9  | [[https://speaker-site][Speaker Name]], Institution | [[#2026-10-09][Talk title]] |

   `TAB` (or `C-c C-c`) inside the table realigns the columns.

2. Under `*** Abstracts`, copy an existing `*****` abstract block and
   change the title, the `:CUSTOM_ID:`, the speaker line, and the text.
   The `:CUSTOM_ID:` must match the `#...` in the table link exactly;
   the convention is the talk date, `YYYY-MM-DD`.

3. Inline math as `\( ... \)` works; MathJax is included automatically.

## Other changes

- **Styling:** edit `docs/ant-seminar.css` directly. No rebuild needed;
  commit and push.
- **New page:** create `org/<name>.org`; the build produces
  `docs/<name>.html`. Link to it from another page with
  `[[file:<name>.org][link text]]` — export rewrites the link to `.html`.
- Never edit `docs/*.html` by hand; every build overwrites it.
- Don't keep notes or scratch `.org` files in `org/`: everything there
  gets published.

## Credits

- Cobbled together by Christopher Rasmussen
- Assistance from Felipe Ramírez
- Assistance from Claude

