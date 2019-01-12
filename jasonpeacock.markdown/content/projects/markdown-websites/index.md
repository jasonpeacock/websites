---
title: Markdown Websites
subtitle: K.I.S.S.
date: 'January 11, 2019'
toc-title: Table Of Contents
---

## Introduction

[This is will be lengthy]{.newthought}, but comprehensive. It pulls together everything I've learned to build my websites with a workflow that doesn't suck and provides the level of control and output style that I want.

I have had many aborted attempts in the past to build and maintain my websites, trying everything from [Ruby on Rails](https://rubyonrails.org/) to [Wordpress](https://wordpress.com/) to raw `HTML` files.

Being a software developer, I want to build my websites the same way that I build software -- from the commandline, using version control, with a text editor :)

My goals are:

* Compose from the commandline. I don't need online/remote editing capabilities.
* Focus on content. Minimize effort spent on formatting, style, and layout.
* Static website. No dependencies on webservers, databases, CGI scripts, VMs, etc.
* Long-term support. I don't want to convert my website to a different framework in a few years.

### Style

I've long admired [Edward Tufte](https://en.wikipedia.org/wiki/Edward_Tufte)'s[^edward_tufte] series of [books abut data visualization](https://smile.amazon.com/Edward-R.-Tufte/e/B000APET3Y).

[^edward_tufte]:
{-} [www.edwardtufte.com](https://www.edwardtufte.com)

I want my websites to have a similar style, and I was not the first person to have that thought. [Tufte CSS](https://edwardtufte.github.io/tufte-css/) adapts Tufte's style to the web using CSS.

### Static-site generators

I looked at many existing static-site generators ([Jekyll](https://jekyllrb.com/), [Hyde](http://hyde.github.io/), [Pelican](https://blog.getpelican.com/), [Hugo](https://gohugo.io/), and even [Gitbook](https://www.gitbook.com)). While they each had their strengths, they also had various drawbacks:

* Proprietary layouts/formatting hooks.
* Difficult to extend to support Tufte CSS's features[^tufte_pandoc_jekyll] (e.g. margin notes).
* Written in a language I don't know (in case I have to extend its functionality).
* They were all relatively new -- will they still be around in 5yrs?
* Required too many dependencies to install.

[^tufte_pandoc_jekyll]:
There is now a [Tufte Jekyll](https://github.com/jez/tufte-pandoc-jekyll) theme available.

Most of these are minor or irrelevant issues for most people, but I'm doing this for myself so I get to make the rules :)

I'll be assembling a set of tools to do my own static-site generation[^story].

[^story]:
That's what the rest of the page describes.

## Workflow

[My ideal workflow]{.newthought} is very straightforward:

1. Write content in `markdown`.
1. Build a local version of the website.
    * It should look/act the same as the online version.
1. Review the local website.
1. Publish the website.

It doesn't get much simpler[^simpler]. Below is the actual workflow, the rest of this page explains how all the parts come together to support this workflow.

[^simpler]:
I could extend the wrapper to include the webserver and monitoring commands, and automatically publish using a git hook...

```{.zsh}
# Go to my local websites `git` repo.
cd ~/workplace/websites

# Launch a local webserver in the background, then
# open http://localhost:8000 in my browser.
python3 -m http.server -d jasonpeacock.com &

# Monitor the markdown content for changes and
# automatically rebuild the website.
rg -l . jasonpeacock.markdown | entr ./website-generate jasonpeacock.com

# Edit content, save changes, and review the results when I
# reload the browser tab.
vim jasonpeacock.markdown/content/index.md

# Publish to my webhost.
./website-publish jasonpeacock.com

# Commit and push the website changes.
git add -A && git commmit -m "updated website" && git push
```

## Editing

[As a software developer]{.newthought}, I spend a lot of time typing at the commandline, that's where I'm the most comfortable. My fingers are well-trained with shell shortcuts and Vim[^neovim] commands; my terminals are solarized[^solarized] and multiplexed[^multiplexed].

[^neovim]:
It's actually [Neovim](https://neovim.io/).

[^solarized]:
[Solarized](https://ethanschoonover.com/solarized/) terminal & editor colors.

[^multiplexed]:
[tmux](https://github.com/tmux/tmux/wiki) terminal multiplexer.

Thus it follows that when I'm writing and editing website content, I am using a text editor within a terminal, and my workflow is optimized for that use case.

### Version Control and Backup

<div class="epigraph">
> Everything should be backed up and versioned.
>
> <footer>
> A lesson from 20yrs of software development.
> </footer>
</div>

The same lesson applies to websites and their content. I'm using [Git](https://git-scm.com/) for versioning my websites and content, and [Github](https://github.com/) for backup.

Github is free for personal/public use, and as the website is public it's OK for the source to also be public. I learned a lot from digging into others' website repositories, I don't want to prevent others from learning from my own website repositories.

### Managing Large Files

Website have more content than just text, there are images, videos, PDFs, `zip` and `tar` downloads, and other large files. `git` does not handle large files efficiently so we cannot include those files directly in the repository.

I use [`git-lfs`](https://git-lfs.github.com/) to push the large files to separate storage[^git_lfs_where] outside of my `git` repository, and then a reference to that file's storage location is included in the repository instead.

[^git_lfs_where]:
[Where are git-lfs files stored?](https://stackoverflow.com/questions/34181356/where-are-git-lfs-files-stored)

`git-lfs` is a bit of black magic, files are stored by default in the Github *Large File Storage*, wherever that may be -- it's not explained very well. There are some projects that provide alternative locations for large file storage, such as [AWS S3](https://aws.amazon.com/s3/):

* [node-git-lfs](https://github.com/kzwang/node-git-lfs) ([how-to](https://www.imakewebsites.ca/posts/2017/02/08/host-your-own-git-lfs-with-node-lfs-s3/))
* [git-lfs-s3](https://github.com/meltingice/git-lfs-s3) (No longer maintained)

There are also alternatives to using `git-lfs` for managing large files:

* [git-media](https://github.com/alebedev/git-media)
* [git-annex](http://git-annex.branchable.com/)
* [git-fat](https://github.com/jedbrown/git-fat)
* [git-bigstore](https://github.com/lionheart/git-bigstore)

For now, I'm using `git-lfs` with the default Github storage, later I will examine the alternatives and migrate to using S3 for my large file storage.

### Markdown

I use [Markdown](https://en.wikipedia.org/wiki/Markdown) to write the content. It's simple, widely supported[^markdown_mess], extensible when needed (insert `HTML` as required), and limited in functionality.

[^markdown_mess]:
There are some [valid concerns](https://www.ericholscher.com/blog/2016/mar/15/dont-use-markdown-for-technical-docs/) about using Markdown, maybe another markup language should be used?

Why is limited functionality good? Because it keeps you focused on writing content and not layout. But strict markdown can be too limited -- what about ~~strikeout~~? Or ^super^ and ~sub~ script?

Avoiding distraction from formatting is admirable, but to communicate effectively you need to apply formatting appropriately. There are many markdown flavors[^markdown_flavors] available that extend the original syntax.

[^markdown_flavors]:
At least [34](https://github.com/commonmark/commonmark/wiki/markdown-flavors).

I am using the [Pandoc Markdown](http://pandoc.org/MANUAL.html#pandocs-markdown) flavor, as I am using [Pandoc](http://pandoc.org/) to build my websites. This supports generating other, non-`HTML` output formats as Pandoc will better understand the original content.

### Videos

`MP4` is a widely-supported video format for the web, but the native `MP4` videos from your cellphone are way too large to use -- 140Mb for ~15 seconds -- they need to be optimized for the web. There a number of technical concerns[^technical_concerns] involved with web-optimizing videos, I use [Handbrake](https://handbrake.fr/) to do everything in one pass.

[^technical_concerns]:
[Optimizing MP4 Video for Fast Streaming](https://rigor.com/blog/2016/01/optimizing-mp4-video-for-fast-streaming).

Within `Handbrake`, just select the `Vimeo Youtube 720p30` preset and you're done[^handbrake_optimize]. That 140Mb file will now be <5Mb and optimized for web streaming. There are additional options to resize, reduce quality, and remove audio if you need a smaller file.

[^handbrake_optimize]:
The preset [includes](https://handbrake.fr/docs/en/latest/advanced/web-optimised.html) web optimization.

## Building

[Somehow]{.newthought}, the markdown content needs to be converted into a stylish, functional website. This is what static-site generators do, and what I need to replicate.

Instead of a *site generator*, I chose to use a *document converter* instead. The difference is that each page of content is converted into an `HTML` document independently; my websites are really a collection of `HTML` documents.

The drawback is that I need to manually maintain index pages and any links between pages. Using an actual static-site generator would understand the relationship between pages and provide extended syntax to generate links, index pages, lists of "recently updated", and other blog-like features. I feel the reduction in complexity and framework is worth this overhead as I don't use those missing features.

One advantage of this approach is that because each page of content is independent it can be easily converted to *any* document format -- `HTML`, `PDF`, `LaTeX`, etc[^any_format].

[^any_format]:
I haven't actually tried converting my content to PDF yet. But theoretically, I could.

### Directory Structure

The website content is organized into separate directory trees for each website. Each directory includes the `markdown` content pages as well as a `resources/` directory with the typical web resources (CSS, JS, etc) and a `pandocomatic/` directory that configures how the website is built.

```
jasonpeacock.markdown/
    content/
        index.md
        projects/
            index.md
            markdown-websites/
                index.md
            another-project/
                index.md
                images/
                    my_image.jpg
    pandocomatic/
        pandocomatic.yaml
        tufte.html5
        postprocessors/
            tidy.sh
    resources/
        .htaccess
        favicon.ico
        css/
            pandoc.css
            pandoc-solarized.css
            tufte.css
            tufte-extra.css
            et-book/
                ...
        js/
            ...
```

The content is converted into `HTML` documents and copied into a new directory tree, with non-content files copied as-is. The contents of the `resources/` directory are copied into the root of the directory tree, while the `pandocomatic/` directory is excluded.

```
jasonpeacock.com/
    .htaccess
    favicon.ico
    index.html
    projects/
        index.html
        markdown-websites/
            index.html
        another-project/
            index.html
            images/
                my_image.jpg
    css/
        pandoc.css
        pandoc-solarized.css
        tufte.css
        tufte-extra.css
        et-book/
            ...
    js/
        ...
```


### Pandoc

I use [Pandoc](http://pandoc.org/) to do the document conversion from `markdown` to `HTML` format[^pandoc_formats]. I don't want to use anything written in a programming language that I don't know[^pandoc_haskell], but `pandoc` is a tool and not a framework -- I'll be using it *within* a framework.

[^pandoc_formats]:
Pandoc supports [a lot](http://pandoc.org/MANUAL.html#options) of input & output formats.

[^pandoc_haskell]:
Pandoc is written in Haskell.

When converting from `markdown` to `HTML`, a template can be provided. For `HTML`, this is essential as it provides the boilerplate that a webpage needs but is not included in the content page, or would be redundant to include in every content page[^footer_example].

[^footer_example]:
E.g. the copyright notice footer.

For my websites, that template is [`tufte.html5`](https://github.com/jasonpeacock/websites/blob/master/jasonpeacock.markdown/pandocomatic/tufte.html5), adapted from [tufte-pandoc-css](https://github.com/jez/tufte-pandoc-css).

The template is too large to reproduce here; it uses the Pandoc template language to pull metadata from the content pages and generate `HTML` with all the proper tags, including `<header>` links for CSS and scripts. Then it injects the converted content and outputs the completed `HTML` document.

### Pandocomatic

<div class="epigraph">
> Pandocomatic is a tool to automate the use of pandoc. With pandocomatic
> you can express common patterns of using pandoc for generating your
> documents. Applied to a directory, pandocomatic can act as a static site
> generator.
>
> <footer>
> Introduction to [Pandocomatic](https://heerdebeer.org/Software/markdown/pandocomatic/#introduction)
> </footer>
</div>

I use Pandocomatic[^pandocomatic_ruby] to recursively traverse my website content directory tree and invoke `pandoc` to convert all the content pages from `markdown` to `HTML`.

[^pandocomatic_ruby]:
Pandocomatic is written in Ruby, which I am familiar with.

Pandocomatic is quite flexible through the use of `YAML` templates, it's worth reading the [docs](https://heerdebeer.org/Software/markdown/pandocomatic/) to understand everything that is possible.

For my websites, that Pandocomatic `YAML` configuration is [pandocomatic.yaml](https://github.com/jasonpeacock/websites/blob/master/jasonpeacock.markdown/pandocomatic/pandocomatic.yaml). An example is below.

```{.yaml}
settings:
    recursive: true
    follow-links: false
    skip: ['.*', 'pandocomatic.yaml']
templates:
    blog:
        glob: ['*.md']
        setup: []
        preprocessors: []
        pandoc:
            css:
                - /css/pandoc-solarized.css
                - /css/pandoc.css
                - /css/tufte-extra.css
                - /css/tufte.css
            filter: pandoc-sidenote
            from: markdown+implicit_header_references
            section-divs: true
            template: tufte.html5
            to: html5+smart
            toc: true
        postprocessors:
            - postprocessors/tidy.sh
        cleanup: []
```

In brief, the configuration above recursively scans for all `*.md` files and invokes `pandoc` with the given `css` files, template, filter, etc, and converts to `html5+smart` format. After conversion, the `tidy.sh` post-processor is run to cleanup the `HTML` document formatting.

To run `pandocomatic`, you need to provide the content, configuration, and output directories.

```{.zsh}
pandocomatic \
    --quiet \
    --data-dir "./jasonpeacock.markdown/pandocomatic" \
    --input "./jasonpeacock.markdown/content" \
    --output "./jasonpeacock.com"
```

To simplify this, I've written a wrapper script [`website-generate`](https://github.com/jasonpeacock/websites/blob/master/website-generate). It takes the name of the website (`jasonpeacock.com`) as a parameter, then will look for a matching `jasonpeacock.markdown` directory to convert the content from.

```{.zsh}
./website-generate jasonpeacock.com
```

It also copies the contents of `jasonpeacock.markdown/resources/` into the root of the new website `jasonpeacock.com/` directory, resulting in a complete, static website at `jasonpeacock.com/`.

To automatically rebuild the website after every edit, the [`entr`](http://eradman.com/entrproject/) tool is used to watch all files in the website directory.

[^ripgrep]
```{.zsh}
rg -l . jasonpeacock.markdown | entr ./website-generate jasonpeacock.com
```

[^ripgrep]:
{-}`rg` is [ripgrep](https://github.com/BurntSushi/ripgrep), a super-powered `grep` replacement.

## Reviewing

[After the website is built]{.newthought} it needs to be reviewed. Unfortunately, merely viewing the `index.html` file in your browser is not enough to load the CSS and other required resources.

The simplest approach is to use one of the built-in webservers from Python, Ruby, etc. and load the page at: [http://localhost:8000/](http://localhost:8000/)

```{.zsh}
# Python 3
python3 -m http.server -d jasonpeacock.com &
```

The website should display correctly with the Tufte CSS style and all images, videos, links, etc working.

## Publishing

[Rsync everything]{.newthought} to the webhost. It's good practice to only have one source of authority for anything, that includes website content.

After the website has been built from the content and reviewed it should be pushed directly to the webhost and overwrite anything that's already there, because you know that your local[^not_distributed] content is the single source of authority.

[^not_distributed]:
Obviously this is not true when working in a distributed environment with other authors, but my websites don't have to worry about that because I am the only author.

The `rysnc` command is configured to be efficient, only pushing files and attributes that have changed, and removing remote files that are no longer relevant. The webhost is already configured for passwordless-ssh.

An example `rsync` configuration is below.

```{.zsh}
rsync \
    --checksum \
    --compress \
    --delay-updates \
    --delete \
    --delete-after \
    --force \
    --human-readable \
    --links \
    --perms \
    --progress \
    --recursive \
    --safe-links \
    --stats \
    "jasonpeacock.com" \
    "my_user@jasonpeacock.com:/home/my_user"
```

To simplify this, I've written a wrapper script [`website-publish`](https://github.com/jasonpeacock/websites/blob/master/website-publish). It takes the name of the website (`jasonpeacock.com`) as a parameter and `rysnc`'s the website directory to the webhost.

```{.zsh}
./website-publish jasonpeacock.com
```

## Known Issues

[I'll be filing issues and PRs]{.newthought} for these issues that I've discovered. There were originally more known issues, but with some investigation I found that they were already known (and working "as designed"), or were due to mistakes by myself :) It's possible these remaining issues are also due to my own mistakes.

### Definition Lists are unsupported

I had to add support to Tufte CSS for `<dl>`, `<di>`, and `<dd>`.

### Code in sidenotes is too large

When using inline-literals ("code", via backticks) in sidenotes the font size is too large.

### Figcaptions are not displaying properly

I had to fix the Tufte CSS for `<figcaption>` to display properly as a sidenote.

They are still slightly broken and require at least 1 sidenote to exist in the page to display properly.

## Improvements

[There's always more]{.newthought} to do and room for improvement. Right now, everything is functional and very usable, I am happy with it.

### Containerize the tools

There are a few tools and dependencies to install, as hard as I tried to minimize them. It would be awesome to have everything captured in a `Dockerfile` and runnable in a Docker container.

### Host on S3/Cloudfront

Save money by hosting on S3 and only pay for the actual bandwidth used. Currently I use a webhost, whom I have no complaints about, but it's excessive to have a whole VM that just serves static files.

Also look into using Cloudfront to cache the static pages for even faster pageloads and lower bandwidth.

### Store `git-lfs` files on S3

It's unsettling to use `git-lfs` and have files stored in an vaguely-documented "github server". While I'm using Github it makes sense to also use Github for large file storage.

It would be trivial to copy the repo to an S3 bucket, but then I need find a way to redirect `git-lfs` to also use the same S3 bucket.

### Use a `git-hook` to automatically publish

Publishing the website and pushing to Git are separate operations, which can lead to various out-of-sync states.

A `git-hook` would not only automate this process to ensure everything is always in sync, it would also enforce VCS best practices, such as not committing half-completed changes to `master` - a branch should be used instead. And don't publish from branches.

## Reference

[Where possible]{.newthought}, it is best to avoid `HTML` and use native Pandoc Markdown to support as many output formats as possible. Some features of Tufte CSS do require `HTML`, like wrapping tables and videos in `<figure>` tags.

Full documentation is available from the [Pandoc Markdown](http://pandoc.org/MANUAL.html#pandocs-markdown) manual, the examples below are included for convenience or to capture notes about non-obvious behavior.

### Code Blocks

Syntax-highlighted code.

```{.python}
def funtion(self, *, arg):
    self.arg = arg
    return True
```

&nbsp;

```{.markdown}
    ```{.python}
    def funtion(self, *, arg):
      self.arg = arg
      return True
    ```
```

Syntax-highlighted code with line numbers.

```{.python .numberLines}
def funtion(self, *, arg):
    self.arg = arg
    return True
```

&nbsp;

```{.markdown}
    ```{.python .numberLines}
    def funtion(self, *, arg):
      self.arg = arg
      return True
    ```
```

### Epigraphs/blockquotes

Epigraphs/blockquotes require a wrapping `<div class="epigraph">` tag.

*Note: The blank `>` line between quote and footer is required. Otherwise
the blockquote won't be wrapped in `<p>` tags and it will not constrain itself
to the column width.*

```{.markdown}
<div class="epigraph">
> Something insightful.
>
> <footer>
> Who said it.
> </footer>
</div>
```

### Newthought

[A newthought]{.newthought} starting a new section.

```{.markdown}
[A newthought]{.newthought} starting a new section.
```

### Sections

Any content that appears before the first header needs to be manually wrapped in a `<section>` tag.

```
<section>
First content in a page before a header.
</section>
```

### Streaming Video

[VideoJS](https://videojs.com/) is used to create an inline, streaming video player[^video_js].

[^video_js]:
I found VideoJS after a quick search, there may be better players but VideoJS was quick to integrate and easy to use.

Add a `header-includes` attribute to the content `YAML` header to load the video CSS.

```{.yaml}
header-includes: |
    ```{=html}
    <link href="https://vjs.zencdn.net/7.4.1/video-js.css" rel="stylesheet">
    ```
```

Add the video player to the content where you want the video to appear.

```{.html}
<figure>
<video-js id="final_result" class="vjs-16-9" controls preload="auto" data-setup='{}'>
<source src="images/final_result_web.mp4" type='video/mp4'>
</video-js>
</figure>
```

Load the video player script at the end of the content.

```{.html}
<!-- Load JS last after page load for best UX -->
<script src="https://vjs.zencdn.net/7.4.1/video.js"></script>
```

### Tables

Tables should always be wrapped with `<figure>` tags to ensure they are sized and re-flow correctly.

A full-width table with headers.

<figure class="fullwidth">
|Col 1 |Col 2|
|-|-|
|some content|more content|
</figure>

```{.markdown}
<figure class="fullwidth">
|Col 1 |Col 2|
|-|-|
|some content|more content|
</figure>
```

A full-width table without headers.

<figure class="fullwidth">
|||
|-|-|
|some content|more content|
</figure>

```{.markdown}
<figure class="fullwidth">
|||
|-|-|
|some content|more content|
</figure>
```

### Table of Contents

Include a `toc-title` attribute in the `YAML` header to automatically generate a table of contents at the top of the page.

```{.yaml}
toc-title: Table Of Contents
```

## Appendix

[entr](http://eradman.com/entrproject/)
: Run arbitrary commands when files change.

[Handbrake](https://handbrake.fr/)
: HandBrake is a tool for converting video from nearly any format to a selection of modern, widely supported codecs.

[Pandoc](https://pandoc.org)
: If you need to convert files from one markup format into another, `pandoc` is your swiss-army knife.

[Pandoc Markdown](https://pandoc.org/MANUAL.html#pandocs-markdown)
: Pandoc understands an extended and slightly revised version of John Gruber’s Markdown syntax.

[pandoc-sidenote](https://github.com/jez/pandoc-sidenote)
: Convert Pandoc Markdown-style footnotes into sidenotes.

[Pandocomatic](https://heerdebeer.org/Software/markdown/pandocomatic/)
: Automating the use of pandoc.

[rsync](https://rsync.samba.org/)
: `rsync` is an open source utility that provides fast incremental file transfer.

[Tufte CSS](https://edwardtufte.github.io/tufte-css/)
: Tufte CSS provides tools to style web articles using the ideas demonstrated by Edward Tufte’s books and handouts.

[Tufte Pandoc CSS](https://github.com/jez/tufte-pandoc-css)
: Starter files for using Pandoc Markdown with Tufte CSS.

[VideoJS](https://videojs.com/)
: Video.js is an open source library for working with video on the web, also known as an HTML video player.
