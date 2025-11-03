;;; init-example.el --- Example configuration for Drew Adams packages
;;; Author: Raoul Comninos
;;; Commentary:
;; This file shows how to configure the Drew Adams packages downloaded
;; by the drew-adams-packages.sh script. Add these to your init.el or
;; create a separate file and load it.

;;; Code:

;; Add the wiki directory to load path
(add-to-list 'load-path "~/.emacs.d/wiki/")

;;; Icicles - Interactive completion framework
;; Icicles provides powerful interactive completion for commands, files, etc.
(require 'icicles)
(icy-mode 1)  ; Enable Icicles mode

;;; Bookmark+ - Enhanced bookmarking
;; Bookmark+ extends Emacs bookmarks with many powerful features
(require 'bookmark+)

;;; Dired+ - Enhanced file manager
;; Dired+ adds many useful features to dired file management
(require 'dired+)

;;; Visual Enhancements
;; Highlight the current column
(require 'col-highlight)
(column-highlight-mode 1)  ; Enable if you want it always on

;; Enhanced line highlighting
(require 'hl-line+)
(global-hl-line-mode 1)  ; Highlight current line globally

;; Crosshairs - Show crosshairs at point
(require 'crosshairs)
;; Toggle with: M-x crosshairs-mode

;; Vertical line highlighting
(require 'vline)

;; General highlighting utilities
(require 'highlight)

;;; Frame Management
;; Auto-fit frames to their buffers
(require 'fit-frame)
(add-hook 'after-make-frame-functions 'fit-frame)

;; Frame commands - moving, resizing, etc.
(require 'frame-cmds)

;; Frame functions
(require 'frame-fns)

;; Zoom frame text size
(require 'zoom-frm)
;; Keybindings for zooming (optional)
;; (global-set-key (kbd "C-x C-+") 'zoom-in/out)
;; (global-set-key (kbd "C-x C--") 'zoom-in/out)
;; (global-set-key (kbd "C-x C-=") 'zoom-in/out)
;; (global-set-key (kbd "C-x C-0") 'zoom-frm-unzoom)

;;; Utilities
;; Enhanced registers
(require 'better-registers)

;; Enhanced grep
(require 'grep+)

;; Hide/show comments
(require 'hide-comnt)

;; Show key bindings
(require 'showkey)

;; Thing commands - operate on things at point
(require 'thing-cmds)

;; Sort utility
(require 'sortie)

;;; Platform-specific
;; Windows browser integration (only load on Windows)
(when (eq system-type 'windows-nt)
  (require 'w32-browser))

;; Festival speech synthesis (requires festival installed)
;; (require 'festival)

;;; Custom keybindings (examples)
;; Uncomment and customize these as needed

;; Icicles keybindings are set automatically when icy-mode is enabled

;; Bookmark+ keybindings
;; (global-set-key (kbd "C-x p") 'bookmark-set)
;; (global-set-key (kbd "C-x j") 'bookmark-jump)

;; Frame management
;; (global-set-key (kbd "C-c f") 'fit-frame)

;; Thing commands
;; (global-set-key (kbd "M-@") 'mark-thing)

(provide 'init-example)
;;; init-example.el ends here
