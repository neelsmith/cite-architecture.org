---
layout: page
title: About the CITE architecture
---

## Background

The CITE architecture defines a framework for scholarly reference to the unique cultural phenomena that humanists study.   Christopher Blackwell and Neel Smith originally developed the CITE architecture to meet the needs of the [Homer Multitext project](http://homermultitext.github.io).   Together with the co-editors of the project, Casey Dué and Mary Ebbott, we recognized the need for an architecture that would outlive specific, rapidly changing technologies, while at the same time thoroughly capturing the semantics of our work in a machine-actionable format.  

We were surprised to find that, despite the centuries-long tradition in disciplines like classical studies of citing texts by canonical reference, this experience had not been generalized in the digital humanities community.  Even the most forward-looking digital projects a decade ago were relying on textual references that failed to represent the semantics implicit in conventional canonical citation, and were expressed in notations such as URLs that, while machine-actionable today,  were closely tied to specific ephemeral technologies.  We began work on the [Canonical Text Service protocol](http://cite-architecture.github.io/cts/) (CTS), and eventually devised the [CTS URN notation](ctsurn) for citing texts.   We subsequently applied this scheme -- URN notation for citation, a RESTful  service for retrieval of material identified by URN, and client software that talks to the service -- to *all* the material in the HMT project: texts, physical artifacts like manuscripts, documentary objects like photographs, and analytical objects such as morphological analyses of texts.


[cts_urn_spec]: http://cite-architecture.github.io/ctsurn_spec/


## Components of the CITE architecture ##


The CITE architecture comprises:


1. standards for citing scholarly resources with a technology-independent but machine actionable URN notation
2. APIs for services to retrieve scholarly resources identified with the CITE architecture's URN notation
3. some code libraries for working with URN notation, and the CITE services



## Why? ##


- [Why should “digital humanities” start from citation](whycitation)?
- [Why URNs](whyurns)?

