;; My init.el

;;; Code:

;; this enables this running method
;;   emacs -q -l ~/.debug.emacs.d/{{pkg}}/init.el
(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory (or load-file-name byte-compile-current-file))))))

  (eval-and-compile
    (customize-set-variable
     'package-archives '(("org"   . "https://orgmode.org/elpa/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")))
    (package-initialize)
    (unless (package-installed-p 'leaf)
      (package-refresh-contents)
      (package-install 'leaf))
    (leaf leaf-keywords
          :ensure t
          :init
          ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
          (leaf hydra :ensure t)
          (leaf el-get :ensure t)
          (leaf blackout :ensure t)
          :config
          ;; initialize leaf-keywords.el
          (leaf-keywords-init)))

  (leaf cus-edit
        :doc "tools for customizing Emacs and Lisp packages"
        :tag "builtin" "faces" "help"
        :custom `((custom-file . ,(locate-user-emacs-file "custom.el"))))

  ;; ここにいっぱい設定を書く
  (leaf leaf
        :config
        (leaf leaf-convert :ensure t)
        (leaf leaf-tree
              :ensure t
              :custom ((imenu-list-size . 30)
                       (imenu-list-position . 'left))))

  (leaf macrostep
        :ensure t
        :bind (("C-c e" . macrostep-expand)))

  ;;文字コードの設定
  (leaf leaf-convert
        :config
        (set-language-environment "Japanese")
        (set-default-coding-systems 'utf-8)
        (set-terminal-coding-system 'utf-8)
        (set-keyboard-coding-system 'utf-8)
        (set-buffer-file-coding-system 'utf-8))

  ;;日本語入力設定
  (leaf windows
        :when (eq system-type 'windows-nt)
        :config
        (leaf tr-ime
              :doc "Emulator of IME patch for Windows"
              :req "emacs-27.1" "w32-ime-0.0.1"
              :tag "emacs>=27.1"
              :url "https://github.com/trueroad/tr-emacs-ime-module"
              :added "2022-11-14"
              :emacs>= 27.1
              :ensure t
              :after w32-ime
              :defun (tr-ime-standard-install) (w32-ime-initialize)
              :config
              (tr-ime-standard-install)
              (w32-ime-initialize)
              :custom
              (default-input-method . "W32-IME")))
  (leaf linux
        :when (eq system-type 'gnu/linux)
        :config
        (leaf mozc
              :doc "minor mode to input Japanese with Mozc"
              :tag "input method" "multilingual" "mule"
              :added "2022-11-14"
              :ensure t
              :custom
              (default-input-method . "japanese-mozc")))

  ;;テーマ設定
  (leaf material-theme
        :doc "A Theme based on the colors of the Google Material Design"
        :req "emacs-24.1"
        :tag "themes" "emacs>=24.1"
        :url "http://github.com/cpaulik/emacs-material-theme"
        :added "2022-11-14"
        :emacs>= 24.1
        :ensure t
        :config (load-theme 'material-light t))
  
  (leaf leaf-convert
        :config
        (global-hl-line-mode t) ;;現在行を強調
        (savehist-mode t) ;;コマンド履歴を保存
        (save-place-mode t) ;;最後のカーソル位置を記録
        (recentf-mode t) ;;ファイルの閲覧履歴を保存
        (show-paren-mode t)  ;;対応括弧を強調表示（Emacs28から標準でON）
        (global-auto-revert-mode t) ;;他プロセスの変更を常に反映する
        (global-display-line-numbers-mode t) ;;左側に行番号を表示する
        (which-function-mode t) ;;モードラインにカーソル上の関数名等を表示する
        (electric-pair-mode t) ;;括弧を補完する
        (menu-bar-mode t) ;;メニューバーを無効
        (tool-bar-mode -1) ;;ツールバーを無効
        (scroll-bar-mode -1) ;;スクロールバーを無効
        (global-whitespace-mode t) ;;スペース、タブなどを可視化する
        ;;(setq read-process-output-max (* 1024 1024)) ;;わからん
        :custom
        (ring-bell-function quote ignore) ;;エラー音をならなくする
        (show-paren-style quote mixed) ;;括弧の対応関係をハイライト表示
        (inhibit-startup-screen . t) ;;スタートアップ画面を表示しないようにする
        (initial-scratch-message . "")  ;; scratchの初期メッセージ消去
        (mouse-wheel-scroll-amount quote (1 ((shift) . 5))) ;;スクロールは1行ごとに
        (backup-directory-alist quote ((".*" . "~/.emacs.d/backup/"))) ;;backup作成場所
        (version-control . t) ;;backupを複数残す
        (kept-new-versions . 5) ;;backupを残す最大数
        (kept-old-versions . 1) ;;backupをとりはじめ
        (delete-old-versoins . t) ;;超過したbackupを削除
        (completion-ignore-case . t) ;;わからん
        (use-short-answers . t) ;;わからん
        (recentf-amx-saved-items . 200) ;;わからん
        )

  ;;キーボード設定
  (define-key global-map (kbd "M-F") (kbd "C-SPC C-SPC C-x h TAB C-u C-SPC C-u C-SPC"))

  ;;キーバインディングを表示
  (leaf which-key
        :doc "Display available keybindings in popup"
        :req "emacs-24.4"
        :tag "emacs>=24.4"
        :url "https://github.com/justbur/emacs-which-key"
        :added "2022-11-14"
        :emacs>= 24.4
        :ensure t)

  ;;バッファでの補完
  (leaf ivy
        :doc "Incremental Vertical completYon"
        :req "emacs-24.5"
        :tag "matching" "emacs>=24.5"
        :url "https://github.com/abo-abo/swiper"
        :emacs>= 24.5
        :ensure t
        :blackout t
        :leaf-defer nil
        :custom ((ivy-initial-inputs-alist . nil)
                 (ivy-use-selectable-prompt . t))
        :global-minor-mode t
        :config
        (leaf swiper
              :doc "Isearch with an overview. Oh, man!"
              :req "emacs-24.5" "ivy-0.13.0"
              :tag "matching" "emacs>=24.5"
              :url "https://github.com/abo-abo/swiper"
              :emacs>= 24.5
              :ensure t
              ;;:bind (("C-s" . swiper)))
              )

        (leaf counsel
              :doc "Various completion functions using Ivy"
              :req "emacs-24.5" "swiper-0.13.0"
              :tag "tools" "matching" "convenience" "emacs>=24.5"
              :url "https://github.com/abo-abo/swiper"
              :emacs>= 24.5
              :ensure t
              :blackout t
              :bind (("C-S-s" . counsel-imenu)
                     ("C-x C-r" . counsel-recentf))
              :custom `((counsel-yank-pop-separator . "\n----------\n")
                        (counsel-find-file-ignore-regexp . ,(rx-to-string '(or "./" "../") 'no-group)))
              :global-minor-mode t))

  (leaf prescient
        :doc "Better sorting and filtering"
        :req "emacs-25.1"
        :tag "extensions" "emacs>=25.1"
        :url "https://github.com/raxod502/prescient.el"
        :emacs>= 25.1
        :ensure t
        :custom ((prescient-aggressive-file-save . t))
        :global-minor-mode prescient-persist-mode)

  (leaf ivy-prescient
        :doc "prescient.el + Ivy"
        :req "emacs-25.1" "prescient-4.0" "ivy-0.11.0"
        :tag "extensions" "emacs>=25.1"
        :url "https://github.com/raxod502/prescient.el"
        :emacs>= 25.1
        :ensure t
        :after prescient ivy
        :custom ((ivy-prescient-retain-classic-highlighting . t))
        :global-minor-mode t)

  ;;エラーチェック
  (leaf flycheck
        :doc "On-the-fly syntax checking"
        :req "dash-2.12.1" "pkg-info-0.4" "let-alist-1.0.4" "seq-1.11" "emacs-24.3"
        :tag "minor-mode" "tools" "languages" "convenience" "emacs>=24.3"
        :url "http://www.flycheck.org"
        :emacs>= 24.3
        :ensure t
        :bind (("M-n" . flycheck-next-error)
               ("M-p" . flycheck-previous-error))
        :global-minor-mode global-flycheck-mode)

  ;;補完
  (leaf company
        :doc "Modular text completion framework"
        :req "emacs-24.3"
        :tag "matching" "convenience" "abbrev" "emacs>=24.3"
        :url "http://company-mode.github.io/"
        :emacs>= 24.3
        :ensure t
        :blackout t
        :leaf-defer nil
        :bind ((company-active-map
                ("M-n" . nil)
                ("M-p" . nil)
                ("C-s" . company-filter-candidates)
                ("C-n" . company-select-next)
                ("C-p" . company-select-previous)
                ("<tab>" . company-complete-selection))
               (company-search-map
                ("C-n" . company-select-next)
                ("C-p" . company-select-previous)))
        :custom ((company-idle-delay . 0)
                 (company-minimum-prefix-length . 1)
                 (company-transformers . '(company-sort-by-occurrence)))
        :global-minor-mode global-company-mode)

  (leaf company-c-headers
        :doc "Company mode backend for C/C++ header files"
        :req "emacs-24.1" "company-0.8"
        :tag "company" "development" "emacs>=24.1"
        :added "2020-03-25"
        :emacs>= 24.1
        :ensure t
        :after company
        :defvar company-backends
        :config
        (add-to-list 'company-backends 'company-c-headers))

  ;;検索補完が何番目の一致が表示
  (leaf anzu
        :doc "Show number of matches in mode-line while searching"
        :req "emacs-25.1"
        :tag "emacs>=25.1"
        :url "https://github.com/emacsorphanage/anzu"
        :added "2022-11-14"
        :emacs>= 25.1
        :ensure t
        :defun (global-anzu-mode)
        :config (global-anzu-mode))

  (leaf undo-tree
        :doc "Treat undo history as a tree"
        :req "queue-0.2" "emacs-24.3"
        :tag "tree" "history" "redo" "undo" "files" "convenience" "emacs>=24.3"
        :url "https://www.dr-qubit.org/undo-tree.html"
        :added "2022-11-14"
        :emacs>= 24.3
        :ensure t
        :after queue
        :defun (global-undo-tree-mode)
        :bind ("M-/" . undo-tree-redo)
        :config (global-undo-tree-mode t)
        :custom (undo-tree-auto-save-history))

  (leaf volatile-highlights
        :doc "Minor mode for visual feedback on some operations."
        :tag "wp" "convenience" "emulations"
        :url "http://www.emacswiki.org/emacs/download/volatile-highlights.el"
        :added "2022-11-14"
        :ensure t
        :defun (volatile-highlights-mode)
        :config (volatile-highlights-mode t))

  (provide 'init)


  ;; Local Variables:
  ;; indent-tabs-mode: nil
  ;; End:

;;; init.el ends here
