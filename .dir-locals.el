((python-mode
  . ((eval . (setenv "PYTHONNOUSERSITE" "1"))
     (eval . (let* ((root (locate-dominating-file default-directory ".dir-locals.el"))
                    (pixi-python (expand-file-name ".pixi/envs/default/bin/python" root))
                    (pixi-bin (expand-file-name ".pixi/envs/default/bin" root)))
               (setq-local python-shell-interpreter pixi-python)
               (setq-local python-shell-interpreter-args "-i")
               (setq-local exec-path (cons pixi-bin exec-path))
               (setq-local eglot-workspace-configuration
                           `(:python (:pythonPath ,pixi-python)))
               (add-hook 'hack-local-variables-hook
                         (lambda ()
                           (unless (get-buffer-process (current-buffer))
                             (run-python (python-shell-parse-command) nil t)))
                         nil t))))))
