watch program file:
    #!/usr/bin/env bash
    if [ ! -f {{ file }} ]; then
        typst compile --root . {{ file }}
    fi
    {{ program }} {{ without_extension(file) }}.pdf & disown
    typst watch --root . {{ file }}
