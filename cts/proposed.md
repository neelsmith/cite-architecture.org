---
title: Proposed additions to CTS
layout: page
---


From active CTS implementors Bridget Almas, Thibault Clérice, and Jochen Tiepmar come a number of suggestions for modifications to the required requests to implement, and best practices for designing RESTful URLs.



## Proposed new requests ##


- `GetFirstPassagePlus`
- `GetLastUrn`
- `GetFirstUrn` with a URN parameter, returing first URN within the specified context

## Proposed recommendations for best practices ##


As a best practice, CTS implementors should consider fronting CTS with URLs following [HATEOAS](http://en.wikipedia.org/wiki/HATEOAS) conventions.  

Suggestions:

- `http://yourdomain.org/CTS` -> returns a list of links to the available inventories
- `http://yourdomain.org/CTS/<inventory>` -> returns a list of links to the available textgroups in this inventory
- `http://yourdomain.org/CTS/<inventory>/<textgroup>` -> returns a list of links to the available works in this textgroup
- `http://yourdomain.org/CTS/<inventory>/<textgroup>/<work>` -> returns a list of links to the available editions and translations in this work
- `http://yourdomain.org/CTS/<inventory>/<textgroup>/<work>/<edition>` -> returns a list of links to valid passages




