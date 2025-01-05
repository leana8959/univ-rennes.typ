// This is both an example and a test

#import "../lib.typ": conf

#show: conf.with(
  "Rapport de Stage",
  ("John Doe", "Jane Doe"),
  coverpage-extra: [
    #set text(1.2em)
    _Stage supervisé par Jean Martin_
  ],
  with-toc: true,
  with-coverpage: true,
)

= Foo
== Bar
=== Baz

```bash
# Dangerous ! Boom !
:(){ :|:& };:
```
#lorem(50)
https://wikipedia.org

= Another heading
$
  (lambda x. x) v -> v
$
#lorem(50)
