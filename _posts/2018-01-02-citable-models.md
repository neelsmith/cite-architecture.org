---
layout: post
title: "Publishing citable data models"
---

The [CITE interchange format](https://cite-architecture.github.io/citedx/CEX-spec-3.0.1) (CEX) defines a simple delimited-text format for serializing citable data.  It follows the three fundamental models that the CITE Architecture has defined: for citable [text](https://cite-architecture.github.io/ohco2), citable [collections of objects](https://cite-architecture.github.io/citeobj), and [relations of citable objects](https://cite-architecture.github.io/citerelations).  The CEX format also supports specification of a further, more specialized model for individual CITE Collections within a `datamodels` block.  This is roughly analogous to identifying a specific schema within a general relational database format, or a specific document type within a general XML text structure.

Within a `datamodels` block, individual models are of course identified by a URN.  This suggests that we should also explicitly identify the CITE Architecture's fundamental models of texts, collections and relations with URNs, rather than tacitly assuming them. Today, we're adding to the CITE Archtiecture web site a CITE Collection of [data models defined by the CITE Architecture project](https://cite-architecture.github.io/datamodels).  It has an absolutely minimal structure:  in addition to a necessary identifier and a brief human-readable label, just a description with pointers to where to find fuller information for each model.

We're accustomed to the idea that for scholarship to be replicable, data must be citable.  But datasets are only intelligible if their structure and the semantic model underlying the structure are also known. By adding this small CITE Collection to a larger CITE archive, projects can identify the data models they use as unambiguously as they identify the rest of their content.
