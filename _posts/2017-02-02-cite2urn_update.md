---
layout: post
title: "CITE2URNs in xcite"
---

Version 1.3 of the `xcite` library has been released on jcenter.  It adds support for property-level references on CITE2 URNs.

The idea of property-level references is new in the CITE2 URN model.  In CITE2 URNs, the *collection* is the unit of publication;  the (optional) *object* reference identifies an instance in a collection.  The *collection* reference is hierarchical, including a notional collection, and (optionally) concrete collections, or concrete properties in the model of a concrete collection.  A few examples can serve to illustrate  this.

The following URN refers to a (notional) collection of pages of the Venetus A manuscript:

    urn:cite2:hmt:msA:

Canonically identified objects can be identified in this notional collection, e.g., "folio 12 recto" :

    urn:cite2:hmt:msA:12r

No structure is defined or implied for canonically identified objects in a notional collection.  A version identifier can refer to a *concrete* collection, such as "release 1 of the Homer Multitext project of the canonical pages of the Venetus A manuscript":

    urn:cite2:hmt:msA.r1:

All objects in this collection share the same structure, and possess the same properties, so, e..g., the concrete representation of folio twelve recto in this edition has the same set of properties as every other page in this collection.  We can identify this concrete object as

    urn:cite2:hmt:msA.r1:12r

Since a specific version of a collection defines a structure for objects in that version of the collection, we can extend the reference hierarchy to identify a specific property in a specific model of the notional object, e.g., the "recto/verso" property in release 1 of the venetus A manuscript's pages:

    urn:cite2:hmt:msA.r1.rv:

An object identifier on this reference identifies the  value of the specified property in the specified model of the collection for a given object, e.g., "the value for page 12r of the recto/verso property in the release 1 model of the Venetus A pages" would be

    urn:cite2:hmt:msA.r1.rv:12r
