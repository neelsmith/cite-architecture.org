---
layout:  page
title:  The CITE2 URN
---


CITE2 URNs provide permanent canonical references to discrete objects. CITE2 URNs are a kind of Uniform Resource Name (URN). To quote from RFC 2141:

>Uniform Resource Names (URNs) are intended to serve as persistent, location-independent, resource identifiers.


CITE2 URNs implement the [CITE2 model](../cite2) of data collections.


## Overview of the CITE2 URN notation

### Semantics of a CITE2 URN

CITE2 URNs refer to a notional collection, a specific version of a collection, or a specific property within a specific version of a collection.  The CITE2 URN may include an object selector that uniquely identifies an individual object withint the collection.  Specific object types may also define extended citation formats that identify portions of an object, such as a region of interest on an object selector identifying a unique image within a collection of images.

### Syntax of a CITE2 URN


URNs always begin with the string `urn:` followed by a protocol identifier. We use the identifier `cite2` for our protocol.

Colons separate the top-level elements of a CITE2 URN: use of a semicolon as a data value is prohibited. The top-level elements are:


1.  urn name space (required: always `cite2`)
2.  cite2 namespace (required: a value that can be resolved to a unique URI)
3.  collection component (required: a value registered in the designated registry)
4.  object selector (optional)

Optional subreference expressions are separated from the object selector by the `@` sign.

The general structure of a CITE2 URN is therefore

    urn:cite2:CITE2NAMESPACE:COLLECTION:OBJECT@SUBREFERENCE

Periods separate second-level hierarchical components of the collection component.  The collection component must always include a unique collection identifier defined with the named cite2 namespace;  it may optionally include version and property identifiers.

## Examples

A notional collection identifying pages of a manuscript.  Since there is no object selector, this refers to an entire collection:

    urn:cite2:hmt:msApages:

A specific object within that notional collection.  The unique object selector refers to a single object:

    urn:cite2:hmt:msApages:1r


The same object in a specific version.   This reference implies that the object has the same structure as every other object in version `v1` of the `msApages` collection.

    urn:cite2:hmt:msApages.v1:1r

A specific property within a concrete version of a collection.  This refers to a set of values (one for each object in the collection) for a single property.


    urn:cite2:hmt:msApages.v1.side:

A specific value for the same property.  The unique object selector refers to a single value of the specified property:

    urn:cite2:hmt:msApages.v1.side:1r
