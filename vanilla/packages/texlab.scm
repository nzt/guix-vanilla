(define-module (vanilla packages texlab)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system copy)
  #:use-module (guix licenses))

(define-public texlab
    (package
    (name "texlab")
    (version "2.1.0")
    (source (origin
            (method url-fetch)
            (uri (string-append "https://github.com/latex-lsp/texlab/releases/download/v" version "/texlab-x86_64-linux.tar.gz"))
            (sha256
            (base32 "1hpx1li2r4vfyj0v3gamlj2gmj8d6f5l71sdcqy0y1mq9zykmap0"))))
    (build-system copy-build-system)
    (arguments
    `(#:install-plan '(("texlab" "bin/texlab"))
        #:phases
        (modify-phases
        %standard-phases
        (delete 'validate-runpath)
        (replace 'unpack (lambda _ (invoke "tar" "zxf" (assoc-ref %build-inputs "source")))))))
    (synopsis "An implementation of the Language Server Protocol for LaTeX")
    (description "A cross-platform implementation of the Language Server Protocol for LaTeX.")
    (home-page "https://texlab.netlify.app/")
    (license gpl3+)))
