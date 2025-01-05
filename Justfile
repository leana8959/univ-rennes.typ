generate:
    #!/usr/bin/env bash
    mkdir -p example-pdf
    for f in examples/*.typ; do
        typst compile --root . $f example-pdf/$(basename ${f%.typ}).pdf
    done

    typst compile --root . --pages 1 examples/rapport-stage.typ thumbnail.png

    typst compile --root . docs/handbook.typ

publish tpkgs:
    #!/usr/bin/env bash
    cp LICENSE README.md typst.toml lib.typ \
        {{ tpkgs }}
