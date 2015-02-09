---
title: The CITE Architecture
layout: page
---

Christopher Blackwell and Neel Smith originally developed the CITE architecture to meet the needs of [the Homer Multitext project](http://www.homermultitext.org).

## Overview of github repositories ##


Public repositories for our CITE architecture on github include:

### Standards ###


- **CTS URN** identifier ([repository](https://github.com/cite-architecture/ctsurn_spec))
- **Canonical Text Services** protocol ([repository](https://github.com/cite-architecture/cts_spec))


### Code libraries for working with CITE repositories ###



- `hocuspocus` for working with a text repository ([source repository](https://github.com/cite-architecture/hocuspocus);  [web site](http://cite-architecture.github.io/hocuspocus/) including [live specifications](http://cite-architecture.github.io/hocuspocus//specs/hocuspocus/Hocuspocus.html)).
- `prestochango` for working a repository of structured collections ([source repository](https://github.com/cite-architecture/prestochango))
- `nysi` for working with an image repository  ([source repository](https://github.com/cite-architecture/nysi))
- `abracadabra` for working with CITE graphs ([source repository](https://github.com/cite-architecture/abracadabra))

### Implementations of the CITE service suite

- `citemgr`: utilities for working with CITE repositories, including generating RDF representations of repositories ([source repository](https://github.com/cite-architecture/citemgr))
- `citeservlet`: a servlet providing all four of the CITE services ([source repository](https://github.com/cite-architecture/citeservlet))

### Other utilities ###




- `cite`, a JVM library for working with URNs and TextInventories ([source repository](https://github.com/cite-architecture/cite))
- `ctsvalidator`, a harness for running a suite of tests against a CTS installation ([source repository](https://github.com/cite-architecture/ctsvalidator))
- `citedownmgr`, a gradle build system for converting texts in citedown notation (markdown extended with URN references) to generic markdown ([source repository](https://github.com/cite-architecture/citedownmgr)

