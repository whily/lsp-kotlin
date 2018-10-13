# lsp-kotlin

Kotlin support for lsp-mode using
[KotlinLanguageServer](https://github.com/fwcd/KotlinLanguageServer).

## Installation

Install [`lsp-mode`](https://github.com/emacs-lsp/lsp-mode) and
[`kotlin-mode`](https://github.com/Emacs-Kotlin-Mode-Maintainers/kotlin-mode) first, and
clone this repository. Add the following to your Emacs `init.el`:

```emacs-lisp
(require 'lsp-kotlin)
(add-hook 'kotlin-mode-hook #'lsp-kotlin-enable)
```
