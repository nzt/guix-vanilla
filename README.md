# 🍦 GUIX Vanilla
Original prebuilt package collection for GNU GUIX

# Installation
GUIX Vanilla can be installed as a Guix channel. To do so, add it to ~/.config/guix/channels.scm:

```scheme
(cons* (channel
        (name 'vanilla)
        (url "https://github.com/nzt/guix-vanilla"))
       %default-channels)
```