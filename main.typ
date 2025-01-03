// This is both an example and a test

#import "lib/lib.typ": conf

#show: conf.with(
  "Un projet " + sym.lambda,
  "John Doe",
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

https://wikipedia.org $<-$ that is a link

= Another heading
$
  (lambda x. x) v -> v
$
#lorem(100)



