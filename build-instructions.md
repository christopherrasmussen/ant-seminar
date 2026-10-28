# ANT Seminar website

Live site: https://christopherrasmussen.github.io/ant-seminar/

## Updating

1. Edit the source in `org/` (e.g. `org/index.org`).
2. Build, from the top of the repo:

       emacs --batch -l build.el

   Output should end with `Build complete!`
   (In Emacs: `M-x compile`, then `M-x recompile` to repeat.)
3. Check locally: open `docs/index.html` in a browser.
4. Commit **both** `org/` and `docs/`, then push.
   The live site updates a minute or two later (watch the Actions tab).

## Notes

- Never edit `docs/*.html` by hand; every build overwrites them.
- CSS lives in `docs/ant-seminar.css`. CSS changes need no rebuild.
- Pages settings: branch `main`, folder `/docs`.
