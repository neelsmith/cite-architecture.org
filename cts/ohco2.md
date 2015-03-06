---
title:  The OHCO2 model of text
layout: page
---

The semantics of the CTS URN is based on the OHCO2 model of text.  OHCO2 views text as a set of citable nodes, each with four properties:

- each node belongs to a citation hierarchy
- each node belongs to a work hierarchy
- nodes are ordered within a single text
- nodes may have richly structured textual content


## Implementing the OHCO2 ##


The OHCO2 model can be  implemented as:

- relational or tabular structure
-  a tree
- a general directed graph


Each model has advantages for different applications, and in the libraries we have developed, we use all three models.

For manually editing texts, the tree model of an XML document is useful;  for many kinds of analysis, a tabular structure is simpler to navigate and manipulate; while for integrating with other kinds of information, a we use directed graphs expressed in RDF.  We can demonstrate the equivalence under OHCO2 of all these representations by showing that they preserve the four properties listed above.

The generality of the model is well illustrated in the fact that at present, there are implementations of the CTS protocol for retrieving texts identified by CTS URNs in the OHCO2 model using:

- an eXistDB backend (tree model)
- a mySQL backend (relational model)
- a SPARQL endpoint (directed graph)

