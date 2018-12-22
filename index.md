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
-   an overview of [citable **data models**](datamodels)

## A simple publication format

-   [CITE Exchange format](citedx/CEX-spec-3.0.1) (CEX): a plain-text, line-oriented data format for serializing citable content following the models of the CITE Architecture






## Code



### Code libraries

Source code is hosted on github.  Binary releases on bintray are also published to jcenter.  Binary releases are cross compiled for the JVM (and should be usable from other JVM languages like Java, Kotlin, Groovy or Clojure) and for Scala JS, and include pre-packaged api docs.

See automatically generated listings:

-  [sorted by function](libs/citelibs) (most fundamental functions listed first)
-  [sorted by most recent release date](libs/itebydate) (most recent listed first)

### Network services

- `CITE Services` (an Akka microservice).  URN-aware microservices for retrieving and querying citable content.  Clone the [project github repository](https://github.com/cite-architecture/scs-akka.git), build a `.jar`, and run it with `java -jar scs.jar`.


### End-user applications


- `CITE App`.  A single-page app requiring only a web browser to explore texts (in local files or URLs) available in CITE Exchange format.  Download precompiled `.html` binaries from the [project github repository](https://github.com/cite-architecture/CITE-App/tree/master/downloads); full source code: [github](https://github.com/cite-architecture/CITE-App).
