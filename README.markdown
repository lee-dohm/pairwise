The `Test::Pairwise` module is a collection of tools and utilities for generating sets of test cases by using the "all pairs" approach to find a smaller set of test cases (rather than an exhaustive set of test cases) from a set of independent equivalence classes.

See http://www.pairwise.org for more details.

My current approach is to:

1. Read the table of dimensions and the associated values.
1. Repeat until all required combinations are covered:
    1. Randomly pick values from the dimensions to create a test case.
    1. If the test case has covered at least one uncovered combination, store 
       it.

This implementation is expected to be slow and will need to be refined over time.
