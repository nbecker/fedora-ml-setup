((python-mode
  . ((python-shell-interpreter . "/home/nbecker/ml-gpu/.pixi/envs/default/bin/python")
     (python-shell-interpreter-args . "-i")
     (eglot-workspace-configuration
      . ((:python
          (:pythonPath . "/home/nbecker/ml-gpu/.pixi/envs/default/bin/python"))))
     (eval . (setenv "PYTHONNOUSERSITE" "1"))
     (eval . (setq-local exec-path
                         (cons (expand-file-name ".pixi/envs/default/bin"
                                                 (locate-dominating-file default-directory ".dir-locals.el"))
                               exec-path))))))
