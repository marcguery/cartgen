# Cartgen
A CART binary tree generator to use in R.

# Installation
1. Download the git repository.

2. Install locally the package.

  ```R
  install.packages("path_to_git_repo/package", repos = NULL, type="source")
  ```

# Informations

CART trees can be useful when modelling a decision function in machine learning. 
In particular, one can encode data from target attributes by separating elements into two distinct values and check how well each target attribute can predict the class, among two different classes, of individuals of the database.

This R package will generate CART binary trees given a well-formatted matrix. The binary tree is built step by step $-$ node by node $-$ and the result is given to the user thanks to a text output. Each node, representing a target attribute, has two branches terminated by a leaf, another node or an undetermined state. An improvement through a visualization is considered.

The tree segmentation depends on the Gini-based gain of each potential node. The node maximizing the gain is chosen. The segmentation stops when no further classification can be reached, i. e. the last node has two leaves or is in an undetermined state. An undetermined state occurs when no decision can be taken (the two classes are not separated by the last leaf).

For further informations, see function descriptions provided with the package.

# Miscellaneous

Does not work properly with `Rscript` command line.

# Reference

http://www.academia.edu/7032069/An_example_of_calculating_gini_gain_in_CART

# Contact

Marc-Antoine Guery

marcantoine.guery@gmail.com