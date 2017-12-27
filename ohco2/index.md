---
title:  The OHCO2 model of text
layout: page
---

The semantics of the CTS URN is based on a model of citable text as an "Ordered Hierarchy of Citation Objects."



In the OHCO2 model,  citable text is a set of citable nodes, each with four properties:

- each node belongs to a citation hierarchy
- each node belongs to a work hierarchy
- nodes are ordered within a single text
- nodes may have richly structured textual content





## Implementing the OHCO2 model


The OHCO2 model can be  implemented as:

-   relational or tabular structure
-   a tree
-   a general directed graph
-   an ordered list


Each model has advantages for different applications, and in the libraries we have developed, we use all three models.

For manually editing texts, the tree model of an XML document is useful;  for many kinds of analysis, a tabular structure is simpler to navigate and manipulate; for integrating with other kinds of information, it is possible to use directed graphs expressed in RDF;  for application development, an ordered list can be both simple and efficient.  We can demonstrate the equivalence under OHCO2 of all these representations by showing that each node preserves the four properties listed above across all representations.

The generality of the model is well illustrated in the fact that at present, there are implementations of the CTS protocol for retrieving texts identified by CTS URNs in the OHCO2 model using:

-   an eXistDB backend (tree model)
-   a mySQL backend (relational model)
-   a SPARQL endpoint (directed graph)
-   an in-memory vector of objects (ordered list model)


## History

The name OHCO2 echoes the 1990 paper by DeRose et al.[^derose1990] proposing that the true structure of text was an Ordered Hierarchy of Content Objects (OHCO).  When the majority of the co-authors returned to the subject in 1993,[^renear1993] they reached a kind of Socratic *aporia*:  since a text can be analyzed in an unlimited number of ways, and any analysis can impose its own, overlapping hierarchy on the content of the text, there can be no single, true OHCO.

Smith and Weaver asked how we are able to discuss the same text from multiple perspectives, and argued that canonical citation serves as a kind of "interchange format" for identifying content within differing analytical hierarchies.[^ohco2]  Hence, their model is called OHCO2, for Ordered Hierarchy of *Citation* Objects.


[^ohco2]:   Originally proposed by Smith and Weaver  (2009), "[Applying Domain Knowledge from Structured Citation Formats to Text and Data Mining: Examples Using the CITE Architecture](http://katahdin.cs.dartmouth.edu/reports/TR2009-649.pdf)", *Dartmouth Computer Science Technical Report TR2009-649*.


[^derose1990]: DeRose, Steven J., David G. Durand, Elli Mylonas and Allen H. Renear, "What is text, really?" *Journal of Computing in Higher Education* 1:2 (1990) 3-26 ([full text](http://doi.acm.org/10.1145/264842.264843)).

[^renear1993]: Renear, Allen, Elli Mylonas, and David Durand, "Refining Our Notion of What Text Really Is: The Problem of Overlapping Hierarchies" ([full text of final version of 1993](http://www.stg.brown.edu/resources/stg/monographs/ohco.html)).
