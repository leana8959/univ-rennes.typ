generate tpkgs:
    #!/usr/bin/env bash
    mkdir -p example-pdf
    for f in examples/*.typ; do
        typst compile --package-path {{ tpkgs }} --root . $f example-pdf/$(basename ${f%.typ}).pdf
    done

    typst compile --package-path {{ tpkgs }} --root . --pages 1 examples/rapport-stage.typ thumbnail.png

    typst compile --package-path {{ tpkgs }} --root . docs/handbook.typ

publish tpkgs:
    #!/usr/bin/env bash
    cp -r LICENSE README.md typst.toml lib.typ assets examples thumbnail.png \
        {{ tpkgs }}

    find {{ tpkgs }} -name "*.pdf" -type f -delete
