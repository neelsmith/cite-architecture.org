---
title: The Canonical Text Service (CTS)
layout: page
---

The Canonical Text Service protocol defines communication between a client application and a server.

Its purpose is to retrieve texts cited by [CTS URN](ctsurn).   Our aim is to define a minimal protocol to fulfill this goal.  Our hope is that  with the current version 5, we are, after a decade of work, approaching a point where the protocol can be stable.  We take heart in the history of the TCP/IP protocol, which in eight years (1972-1980) went from version 1 to the version 4 still used today.



## Specifications and version

The current version is **version 5**:   see the current [formal specification](http://cite-architecture.github.io/cts_spec/). (Github source for the specication is in markdwon in [this repository](https://github.com/cite-architecture/cts_spec).)

See some [proposed modifications](proposed).

## Implementations and code tools ##

Behind the abstract OHCO2 model of the CTS URN, implementations of the CTS protocol use a variety of backend data models.

### Tree model ###


- [Alpheios](http://alpheios.net/content/alpheios-cts-api ) uses eXist and XQuery (from java?)
- [Capitains-Nemo](https://github.com/PerseusDL/Capitains-Nemo) (sic), an angularJs app for browsing CTS APIs
- [Capitains-Sparrow](https://github.com/PerseusDL/Capitains-Sparrow), a CTS abstraction in JS with jQuery plugins
- [Capitains-Toolkit](https://github.com/PerseusDL/Capitains-Toolkit) toolkit and implementation using eXistDB for its data source




### Directed graph ###



- a library for working with fundamenal [notation of the CITE architecture](http://cite-architecture.github.io/cite/), including CTS URNs
- [hocuspocus](http://cite-architecture.github.io/hocuspocus/), a system for managing a corpus of citable texts (also incorporated in [citemgr](http://cite-architecture.github.io/citemgr/), a system managing a suite of CITE repositories)
- [sparqlcts](https://github.com/cite-architecture/sparqlcts), an implementation using a SPARQL endpoint as its data source


### Relational model 

- The Billion Words project has implemented [CTS with a MySQL backend](http://www.urncts.de/)



