((python-mode
  . ((eval . (let* ((pixi-root default-directory)
                    (python-bin  (expand-file-name ".pixi/envs/default/bin/python" pixi-root))
                    (pixi-bin    (expand-file-name ".pixi/envs/default/bin" pixi-root))
                    (libdevice   (expand-file-name
                                  ".pixi/envs/default/lib/python3.10/site-packages/nvidia/cuda_nvcc/nvvm/libdevice/libdevice.10.bc"
                                  pixi-root)))
               ;; use the Pixi python
               (setq-local python-shell-interpreter     python-bin)
               (setq-local python-shell-interpreter-args "-i")
               ;; make lint/format find the right tools
               (setq-local exec-path (cons pixi-bin exec-path))
               ;; tell Eglot / LSP which python to use
               (setq-local eglot-workspace-configuration
                           `(:python (:pythonPath ,python-bin)))
               ;; hide ~/.local site-packages
               (make-local-variable 'process-environment)
               (push "PYTHONNOUSERSITE=1" process-environment)
               (setenv "PYTHONNOUSERSITE" "1")
               ;; make Dr.Jit find libdevice
               (push (concat "DRJIT_LIBDEVICE_PATH=" libdevice)
                     process-environment)
               (setenv "DRJIT_LIBDEVICE_PATH" libdevice))))))
