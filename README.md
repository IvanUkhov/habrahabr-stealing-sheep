# Stop Stealing Sheep

A Chrome extension that prevents websites from
[stealing sheep](https://en.wikipedia.org/wiki/Frederic_Goudy).

## Motivation

Changing the letter spacing of a font is bad. One should probably think of
using a different font family instead.

## What does it do?

Nothing more than

```css
some-selector {
  letter-spacing: normal !important;
}
```

## Where does it work?

The indent is to make narrowly targeted adjustments only on certain websites.
In the future, the user of the extension will be able to add arbitrary websites.
For now, the extension is hard-coded to work only on
[Habrahabr](http://habrahabr.ru/):

![](/promo.png?raw=true)

## Installation

The extension can be installed from
[Chrome Web Store](https://chrome.google.com/webstore/detail/habrahabr-stealing-sheep/lmopgfignagihcbeagefaencbkaclded).
