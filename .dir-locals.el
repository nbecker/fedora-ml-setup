((python-mode
  . ((eval . (let* ((pixi-root (locate-dominating-file default-directory ".dir-locals.el"))
                    (python-bin (expand-file-name ".pixi/envs/default/bin/python" pixi-root))
                    (bin-dir    (expand-file-name ".pixi/envs/default/bin" pixi-root)))
               ;; Set python shell
               (setq-local python-shell-interpreter python-bin)
               (setq-local python-shell-interpreter-args "-i")
               ;; Set PATH
               (setq-local exec-path (cons bin-dir exec-path))
               ;; Set Eglot LSP config
               (setq-local eglot-workspace-configuration
                           `(:python (:pythonPath ,python-bin)))
               ;; Set PYTHONNOUSERSITE in the local environment
               (make-local-variable 'process-environment)
               (push "PYTHONNOUSERSITE=1" process-environment)
               (setenv "PYTHONNOUSERSITE" "1"))))))
