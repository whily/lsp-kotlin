;;; lsp-kotlin.el --- Kotlin support for lsp-mode using KotlinLanguageServer. -*- lexical-binding: t; -*-

;; Copyright (C) 2018 Yujian Zhang

;; Author: Yujian Zhang <yujian.zhang@gmail.com>
;; Maintainer: Yujian Zhang <yujian.zhang@gmail.com>
;; Created: 14 Oct 2018
;; Modified: 14 Oct 2018
;; Version: 0.1
;; Package-Requires: ((lsp-mode "4.2"))
;; Keywords: emacs kotlin lsp
;; URL: https://github.com/whily/lsp-kotlin

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; Please Check README.md from the repository for detailed documentation.

;;; Code:

;;;###autoload
(defcustom lsp-kotlin-server
  "kotlin-language-server" ;"~/pkg/KotlinLanguageServer/build/install/kotlin-language-server/bin/kotlin-language-server"
  "The kotlin executable to use.
Leave as just the executable name to use the default behavior of
finding the executable with `exec-path'.
   TODO: now we use full path to allow the find of JAR files in ../lib"
  :group 'lsp-kotlin
  :risky t
  :type 'file)

;;;###autoload
(defcustom lsp-kotlin-server-args
  '()
  "Extra arguments for the kotlinstdio language server."
  :group 'lsp-kotlin
  :risky t
  :type '(repeat string))

(defconst lsp-kotlin--get-root
  (lsp-make-traverser #'(lambda (dir)
			  (directory-files dir nil "build.gradle"))))

(defun lsp-kotlin--ls-command ()
  "Generate the language server startup command."
  `(,lsp-kotlin-server
    ,@lsp-kotlin-server-args))

(lsp-define-stdio-client
 lsp-kotlin "kotlin"
 lsp-kotlin--get-root
 nil
 :command-fn 'lsp-kotlin--ls-command)

(provide 'lsp-kotlin)

;;; lsp-kotlin.el ends here
