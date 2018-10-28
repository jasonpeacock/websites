# Markdown Generated HTML Website

# Generate the HTML

```
pandocomatic \
    --debug \
    --modified-only \
    --data-dir jasonpeacock.com/pandocomatic \
    --input jasonpeacock.com/markdown \
    --output jasonpeacock.com/html
```

## Tools

To regenerate the website:

`./website-generate jasonpeacock.com`

To publish the website:

`./website-publish jasonpeacock.com`

To automatically regenerate the website when any files change:

`rg -l . jasonpeacock.markdown | entr ./website-generate jasonpeacock.com`

# Resources

- [Pandoc Markdown](http://pandoc.org/MANUAL.html#pandocs-markdown)
- [Pandocomatic](https://heerdebeer.org/Software/markdown/pandocomatic/)
- [Tufte Pandoc CSS](https://jez.io/tufte-pandoc-css/)
- [pandoc-sidenote](https://github.com/jez/pandoc-sidenote)

## Examples

- http://ayekat.ch/blog/tufte-css
