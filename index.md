---
title: The CITE Architecture
layout: home
---



## Fundamental concepts


-   [the CITE architecture](about)
-   working with **texts**:
    -   an abstract model: [OHCO2](ohco2)
    -   a notation for citation: [CTS URNs](ctsurn)
    -   services to retrieve canonical citations: the [Canonical Text Service](cts)
-   working with **objects**:
    -   an abstract model:  [CITE2 collections](cite2)
    -   a notation for citation: [CITE2 Object URNs](cite2urn)
    -   services to retrieve canonical citations (including extensions): [CITE Collection Service](citecoll)
-   **aligning** texts and analyses:
    -   in development: ORCA, a service for aligned texts and analyses
-   an overview of [citable **data models**](datamodels)

## Current work

### End-user applications

- `CITE App`.  A single-page app requiring only a web browser to explore texts (in local files or URLs) available in CITE Exchange format.  Download precompiled `.html` binaries from the [project github repository](https://github.com/cite-architecture/CITE-App/tree/master/downloads); full source code: [github](https://github.com/cite-architecture/CITE-App).

### Code libraries

Binary releases on jcenter are cross compiled for JVM and Scala JS, and include pre-packaged api docs.

Released:

- `xcite`:  a cross-platform library for citing scholarly resources with CTS URNs or CITE2 URNs. Binaries: [jcenter](https://bintray.com/neelsmith/maven/xcite); source code: [github](https://github.com/cite-architecture/xcite).
- `ohco2`: a cross-platform library for working with citable texts. Binaries: [jcenter](https://bintray.com/neelsmith/maven/ohco2); source code: [github](https://github.com/cite-architecture/ohco2).
- `orca`: a cross-platform library for working with citable readings of citable texts.  Binaries: [jcenter](https://bintray.com/neelsmith/maven/orca); source code: [github](https://github.com/cite-architecture/orca).
- `scm`: a cross-platform library for managing a library of CITE resources.  Binaries: [jcenter](https://bintray.com/neelsmith/maven/scm) ; source code: [github](https://github.com/cite-architecture/scm).
- `cex`: a cross-platform library for parsing data in CITE Exchange format.  Binaries: [jcenter](https://bintray.com/neelsmith/maven/cex); source code;  [github](https://github.com/cite-architecture/cex).

In development:


- `scs`: microservices for the CITE architecture, implemented with [finch/finagle](https://github.com/finagle/finch).  Source code: [github](https://github.com/cite-architecture/scs)
- `citeobj`: a cross-platform library for working collections of citable data.  Source code: [github](https://github.com/cite-architecture/citeobj).

## Work before 2017

### Code

- See [an overview of github repositories](repos) with work related to the CITE architecture. (Much of this is superseded by the work listed above under "Current work.")
