---
layout: page
title:  The CITE2 model of data collections
---


In the CITE2 model, citable objects are modelled as *unique objects* in *versioned collections*.

Distinct objects may have identical contents, but within in a collection, each object is uniquely identified.

A collection may be referred either in the abstract as a *notional* collection, or concretely as a specific *version* of a notional collection.  Each *version* of a collection defines a set of properties which may or may not be identical across versions, but apply to all objects within a given version.  For this reason, individaul objects may be canonically cited either as part of a notional or concrete collection, but individual properties can only be cited as part of a specific version of a collection.

Collections may or may not be intrinsically ordered.  The relation of citable objects in ordered collection is analogous to the relation of citable passages in a citable text: it is possible to make statements about ordered relations at the notional level, but the ordering of citable units in individual versions are not guaranteed to agree with a notional ordering.  For example, in the same way that lines of a Greek tragedy might appear in a different order in different versions of the text, pages of a manuscript might have different orderings in a version recording the current bound form of a codex and a version reconstructing a different, original page sequence.


## URN notation and code libraries

-   the [CITE2 URN](../cite2urn) encodes the semantics of the CITE2 model
-   [`citeobj`](../citeobj) is a platform-independent code ibrary for working with citable collectionsh
