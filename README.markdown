# Pairwise

The `Test::Pairwise` module is a collection of tools and utilities for generating sets of test cases by using the "all pairs" method.  Pairwise (a.k.a. all-pairs) testing is an effective test case generation technique that is based on the observation that most faults are caused by interactions of at most two factors. Pairwise-generated test suites cover all combinations of two and therefore are much smaller than exhaustive ones yet still very effective in finding defects.

See [http://www.pairwise.org][pairwise] for more details.

The pairwise module is a wrapper around the [Jenny public-domain utility][jenny] to make it more usable and accessible.  It supports the following features:

* Accepting test dimensions in the form of a comma-delimited text file
* Generating output in comma-delimited text form

# Input File Format

The input is one or more lines of comma-delimited text.  Each line consists of a description and one or more values.  For example:

```text
English,one,two,three
German,eins,zwei,drei
Japanese,ichi,ni,san
Spanish,uno,dos,tres
```

[jenny]: http://burtleburtle.net/bob/math/jenny.html
[pairwise]: http://www.pairwise.org
