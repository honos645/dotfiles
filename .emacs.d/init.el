; My init.el.

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

(leaf leaf-convert
  :config
  ;;文字コードの設定
  (set-language-environment "Japanese")
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-buffer-file-coding-system 'utf-8))

(leaf leaf-convert
  :when (eq system-type 'windows-nt)
  :config
  (set-coding-system-priority 'utf-8 'euc-jp 'iso-2022-jp 'cp932)
  (cond
   ((eq system-type 'windows-nt)
    (leaf leaf-convert
      :custom ((default-input-method . "W32-IME")))
    (tr-ime-standard-install)
    (w32-ime-initialize))
   ((eq system-type 'gnu/linux)
    (leaf mozc
      :ensure t
      :require t
      :custom ((default-input-method . "japanese-mozc"))))))

 ;;テーマ設定
(leaf material-theme
  :ensure t
  :require t
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
  (setq read-process-output-max (* 1024 1024)) ;;わからん
  :custom
  (make-backup-files . nil) ;;バックアップファイルを作らない
  (ring-bell-function quote ignore) ;;エラー音をならなくする
  (show-paren-style quote mixed) ;;括弧の対応関係をハイライト表示
  (delete-auto-save-files . t) ;; 終了時にオートセーブファイルを削除する
  (inhibit-startup-screen . t) ;;スタートアップ画面を表示しないようにする
  (initial-scratch-message . "")  ;; scratchの初期メッセージ消去
  (mouse-wheel-scroll-amount quote (1 ((shift) . 5))) ;;スクロールは1行ごとに
  (backup-directry-alist quote (("." . "~.emacs.d/backup"))) ;;backup作成場所
  (completion-ignore-case . t) ;;わからん
  (use-short-answers . t) ;;わからん
  (recentf-amx-saved-items . 200) ;;わからん
  )

(leaf which-key
  :ensure t
  :require t
  :config (which-key-mode t))
(provide 'init)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; init.el ends here
