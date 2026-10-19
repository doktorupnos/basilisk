<div align="center">

  # [![Basilisk](https://github.com/doktorupnos/basilisk/blob/master/basilisk.png)](https://github.com/doktorupnos/basilisk)

  *There is none more curious or more deadly than the Basilisk, known also as the King of Serpents.*

  <br />
  
  [![typst](https://img.shields.io/badge/typst-0.15.1%2B-blue?style=for-the-badge&logo=typst&logoColor=white&label=typst&labelColor=blue&color=gray)](https://typst.app/docs/)
  [![MIT License](https://img.shields.io/badge/license-mit-blue?style=for-the-badge&labelColor=blue&color=gray)](https://github.com/doktorupnos/basilisk-beta/blob/master/LICENSE)

</div>

<br />

## \ INTRODUCTION

I was in need of a library that perfectly organizes technical -and non-technical- texts in a way that resembles the layout and design of various academic textbooks used at universities. The closest thing to this, of course, was LaTeX. The biggest problem is that LaTeX's documentation and syntax are trash. On the other hand, you have Typst. A doc-writing tool with great flexibility that improves with each single update it receives, that is more programming-oriented. For this reason, and because it shares many syntactic similarities with JavaScript, I decided to create a unified library that fully meets my needs for writing technical documents and books. Thus, the Basilisk was born.

The library includes a variety of style rules that enhance/change the structure on a set of basic elements, such as the main body text, headings of all levels, the table of contents, page layouts, and more. It also includes a series of pre-made page templates, such as stylised divider, headers with stylised numbering, etc., along with a few elements. The pre-made page templates are documented in the following sections.

It also aims to be as flexible as possible so that anyone can adapt it to their own needs. Over time, more stylistic options or settings for the various elements may be added. Due to the number of options and the way they are organized, the package is intended for local installation and use, either in the local package's directory provided by Τypst, or by adding the package to the project's directory.

```typst
#import "@local/basilisk:0.1.0": *
#show: basilisk
...
```

## \ PAGE TEMPLATES & ELEMENTS

### COVER PAGE

It creates a simple title page that includes the document's title, followed by the author's name. Both the title of the document and the name of the author can be changed from the options file in the `document` fields.

Example:

```typst
#show: page-cover
```

### NUMBERED PAGE

On the pages that follow this template, there is a header that includes the number of each page. It also includes the following optional elements: A title for the even-numbered pages (usually the document's title or the author's name) and a subtitle for the odd-numbered pages (usually the current chapter's title). Both can be specified using the `title` and `subtitle` fields when using this template.

Examples:

```typst
#show: page-numbered
```

```typst
#show: page-numbered.with(
  title: [DOCUMENT TITLE],
  subtitle: [CHAPTER 1 - THE FIRST CHAPTER]
)
```

```typst
#show: page-numbered.with(
  title: [AUTHOR'S FIRST AND LAST NAME]
  subtitle: [DOCUMENT TITLE]
)
```

### DIVIDER PAGE

Creates a separator page that includes an optional title for the section (or sections) that follow, an optional label indicating what it separates (e.g., Part, Chapter, etc.), as well as a required numbering indicator for the separator page. The indicator can be represented in any of the ways supported by typst (decimal numbers, roman numerals, etc.). This is determined by the value of `pattern` found in the options file.

Examples:

```typst
#show: page-divider
```

```typst
#show: page-divider.with(
  title: [EXAMPLE \ DIVIDER]
)
```

### BLANK PAGE

This exists as an option for those who either want to omit page numbering entirely or insert their own custom page templates that they have created. It contains a simple set page rule that creates a single page break and contains nor header nor footer.

Example:

```typst
#show: page-blank
```

### COVER PAGE

This template is intended for cases where a specific cover has not been designed—or is not needed—for the document or book. Thus, this page contains a simple display of the book’s title and the author’s name, which have been specified in the `title` and `author` fields under the `document` category in the library options.

Example:

```typst
#show: page-cover
```

### DROPCAP ELEMENT

Adds a drop cap at the beginning of the paragraph that spans 2 lines in height. It utilises the [droplet](https://typst.app/universe/package/droplet/) package library.

Example:

```typst
#dropcap[
  First paragraph.
]

Second paragraph.
```

### SECTION ELEMENT

Creates a horizontal block divider that contains a custom title inside it.

Example:

```typst
#section[EXAMPLE]
```

## \ OPTIONS

Below are all the available configurable library options found in `options.typ`. The file is located in the `util/` directory.

### DOCUMENT OPTIONS

| **OPTIONS** | **INFO** |
| :---: | --- |
| **`title`** | The title given to the document or book. |
| **`author`** | The name of the document's author. |

### TEXT OPTIONS

| **OPTION** | **INFO** |
| :---: | --- |
| **`font`** | The text font, which must be installed on the operating system and recognized by Typst. Default: [`GFS Neohellenic`](https://fonts.google.com/specimen/GFS+Neohellenic). |
| **`size`** | The size of the text font. Default `12pt`. |
| **`lang`** | The primary language in which the text is written. It is necessary to specify this, as it ensures that words are hyphenated correctly if any of them do not fit entirely on a single line. Default: `el` (Greek). |
| **`math`** | The text font used in math equations. Default: [`GFS Neohellenic Math`](https://www.greekfontsociety-gfs.gr/typefaces/Math). |

### HEADING OPTIONS

| **OPTION** | **INFO** |
| :---: | --- |
| **`size`** | The text size of each heading level. The values show how many times bigger each heading is relative to the determined font size. Defaults: `(1.6, 1.3, 1.0)`. |
| **`pattern`** | Specifies the pattern for the automatic numbering prefix on heading titles. If you want to disable the automated numbering for a specific level of headings, leave an empty string instead of a pattern on the corresponding field. Defaults: `("1", "1.1.", "1.1.1.")`. |
| **`label`** | If a pattern is specified for first-level headings, this field adds an optional prefix label that appears before the numbering of each first-level heading. It only works if there is a specified pattern for first-level headings. Leave an empty string if you don't want it to be shown, or ignore it if you've removed the pattern of the previous field. Default: `"CHAPTER"`. |
| **`academic`** | An academic style variation for formatting first-level headings, similar to the ones found in various academic textbooks. Default: `true`. |
| **`align`** | Sets the alignment position of first-level headings. Default: `right`. |

### OUTLINE OPTIONS

| **OPTION** | **INFO** |
| :---: | --- |
| **`title`** | The title given to the Table of Contents section. Default: `"CONTENTS"`. |
| **`align`** | Sets the alignment position of the Table of Contents' title. Default: `center`. |

### LIST OPTIONS

| **OPTION** | **INFO** |
| :---: | --- |
| **`tight`** | If enabled, lists become more compact, taking up less space on the page. Default: `false`. |
| **`body-indent`** | Specifies the distance between the index of an item in a list and its content. Default: `1em`. |
| **`spacing`** | The distance between the items in a list. Default: `1em`. |

### DIDIVER PAGE OPTIONS

| **OPTION** | **INFO** |
| :---: | --- |
| **`pattern`** | Specifies the pattern for the automatic numbering found on the optional divider pages. The divider pages use seperate counters from the ones used on headings. Default: `1`. |
| **`label`** | Optional title that shows on top of the divide page counter. Leave blank if you only want the index of the divider page to be displayed. Default: `""`. |
