# striptex - a simple filter to strip TeX, in awk

Often I needed a word count for my TeX files.
I also wanted to learn awk.

It is a personal tool and not a production quality program.
Not even close.

I didn't even ask AI to check stuff.

If you need a project that removes TeX and is actually made for others, check out _detex_.
It probably comes with your LaTeX installation already.

# How to use

```
awk -f striptex.awk your_tex_file.tex
```
it prints the result to standard output. If you want a file, you can run
```
awk -f striptex.awk your_tex_file.tex > your_new_file
```
