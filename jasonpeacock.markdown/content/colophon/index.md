---
title: Colophon
subtitle: How I made this website
date: 'January 11, 2019'
---

## Motivation

[My first goal]{.newthought} is readability. I want this website to be pleasant to read on all devices. I also want it to be quick to load -- many websites are bloated bandwidth monsters.

Content should be king, not ads nor back-end JS frameworks.

### Not a Blog

This is not yet-another-blog. It is a journal, or portfolio, of things I have done, built, or learned. As such, it has no *comments* section.

Eliminating the comments section removes a lot of headache associated with managing comments, but I do welcome your feedback! Feel free to email me at <a href="mailto:jason@jasonpeacock.com">jason@jasonpeacock.com</a> with any comments, questions, or corrections.

### Use the Back Button

Site navigation is a bit of an experiment. I have omitted any breadcrumbs, "Home" links, and other traditional navigation tools in support using the browser's own back button. The expectation is that users will click the back button when they want to go back to the previous page.

This does present a challenge for users landing directly on a sub-page from external links, as their back button will not take them the website's homepage. For now, users can edit the location bar, though that is difficult on tablet & mobile browsers.

## Tools

[The design]{.newthought} uses [Tufte CSS](https://edwardtufte.github.io/tufte-css/) and [Tufte Pandoc CSS](https://github.com/jez/tufte-pandoc-css).

All files are version-controlled in [`git`](https://git-scm.com), and backed-up to my [GitHub repository](https://github.com/jasonpeacock/websites).

Content is authored in [`markdown`](https://pandoc.org/MANUAL.html#pandocs-markdown) format and then converted to `HTML` documents using [Pandoc](https://pandoc.org/), [pandoc-sidenote](https://github.com/jez/pandoc-sidenote), and [Pandocomatic](https://heerdebeer.org/Software/markdown/pandocomatic/).

Videos use the [VideoJS](https://videojs.com/) video player, and are optimized for web using [Handbrake](https://handbrake.fr/).

Everything is written with the [Neovim](https://neovim.io/) text editor.

I wrote extensively about how the website is edited, built, and published in the [Markdown Websites](../projects/markdown-websites) project.

