(define-module (vanilla packages deno)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system copy)
  #:use-module (guix licenses))

(define-public deno
    (package
    (name "deno")
    (version "1.0.0")
    (source (origin
            (method url-fetch)
            (uri (string-append "https://github.com/denoland/deno/releases/download/v" version "/deno-x86_64-unknown-linux-gnu.zip"))
            (sha256
            (base32 "0aknxy9z5cvw091yaw5yf2zynwzxs39ax3jkqdg10xw344jsyn31"))))
    (build-system copy-build-system)
    (arguments
    `(#:install-plan '(("deno" "bin/deno"))
        #:phases
        (modify-phases
        %standard-phases
        (delete 'validate-runpath)
        (replace 'unpack (lambda _ (invoke "unzip" (assoc-ref %build-inputs "source")))))))
    (synopsis "A secure JavaScript and TypeScript runtime")
    (description "Deno aims to provide a productive and secure scripting environment for the modern programmer. It is built on top of V8, Rust, and TypeScript.")
    (home-page "https://deno.land/")
    (license x11)))
