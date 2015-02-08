---
title: The CITE Architecture
layout: page
---

Christopher Blackwell and Neel Smith originally developed the CITE architecture to meet the needs of [the Homer Multitext project](http://www.homermultitext.org).

## Overview of github repositories ##


Public repositories for our CITE architecture on github include:

### Standards ###


- [CTS URNs](https://github.com/cite-architecture/ctsurn_spec)
- [Canonical Text Services protocol](https://github.com/cite-architecture/cts_spec)

## Code libraries for working with CITE repositories ##

- hocuspocus for working with a text repository
- prestochango for working a repository of structured collections
- nysi for working with an image repository
- abracadabra for working with CITE graphs

## Implementations of the CITE service suite

- citemgr: utilities for working with CITE repositories, including generating RDF representations of repositories
- citeservlet: a servlet providing all four of the CITE services

## Other utilities ##


- cite, a JVM library for working with URNs and TextInventories
- ctsvalidator, a harness for running a suite of tests against a CTS installation
- citedownmgr, a gradle build system for converting texts in citedown notation (markdown extended with URN references) to generic markdown

