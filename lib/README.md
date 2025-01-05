# univ-rennes.typ
Since University of Rennes doesn't have an official template.
This is an opinionated, non-official attempt of a it.
It is made to be minimal and highly customizable.

## Example
You can use it for a simple report with this configuration:
```typ
#show: conf.with(
  "A simple project",
  "John Doe",
  with-toc: false,
  with-coverpage: false,
)
```
Or else, you could use it for an internship handout:
```typ
#show: conf.with(
  "A simple project",
  "John Doe",
  coverpage-extra: [
    Internship supervised by
    #set list(marker: none)
    - Tool
    - Avril Lavigne
    - Kurt Cobain
  ],
  with-toc: true,
  with-coverpage: true,
)
```
Check lib/lib.typ too see all parameters available.

Feel free to open a PR if this template doesn't cover your use case, or you would like to add a
feature :)
