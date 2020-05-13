(define-module (vanilla packages gopass)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system copy)
  #:use-module (guix licenses))

(define-public gopass
    (package
    (name "gopass")
    (version "1.9.1")
    (source (origin
            (method url-fetch)
            (uri (string-append "https://github.com/gopasspw/gopass/releases/download/v" version "/gopass-" version "-linux-amd64.tar.gz"))
            (sha256
            (base32 "1ysr90ay2jriq2nf505mvs3shqgw7jvc916s5hdpn9j3qzfzv3aa"))))
    (build-system copy-build-system)
    (arguments
    `(#:install-plan '(("gopass" "bin/gopass")
                        ("zsh.completion" "share/zsh/site-functions/_gopass")
                        ("fish.completion" "share/fish/vendo_completions.d/gopass.fish")
                        ("bash.completion" "etc/bash_completion.d/gopass"))
        #:phases
        (modify-phases
        %standard-phases
        (delete 'validate-runpath)
        (replace 'unpack (lambda _ (invoke "tar" "zxf" (assoc-ref %build-inputs "source")))))))
    (synopsis "The slightly more awesome standard unix password manager for teams")
    (description "gopass is a rewrite of the pass password manager in Go with the aim of making it cross-platform and adding additional features. Our target audience are professional developers and sysadmins (and especially teams of those) who are well versed with a command line interface. One explicit goal for this project is to make it more approachable to non-technical users. We go by the UNIX philosophy and try to do one thing and do it well, providing a stellar user experience and a sane, simple interface.")
    (home-page "https://texlab.netlify.app/")
    (license x11)))
