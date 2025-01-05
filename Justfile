generate:
    #!/usr/bin/env bash
    mkdir -p example-pdf
    for f in examples/*.typ; do
        typst compile --root . $f example-pdf/$(basename ${f%.typ}).pdf
    done
