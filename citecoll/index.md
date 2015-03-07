---
title: CITE Collection Services
layout: page
---


The CITE Collection Service protocol defines communication between a client application and a server.

Its purpose is to retrieve structured information about objects cited by CITE Object URN. 

We are currently revising the formal specification of the protocol.  We plan to make the revision upward-compatible with prior versions, but with a formal specification of two optional forms of annotation:

1. Extensions for particular types of collections.  Extensions define either or both of:
    -  type-specific requests (such as retrieval of special types of binary data)
    -  extended citation, defining a type-specifice subreference (such as identification of a region on a spatial object)
2. For collections that systematically analyze a text, how the collection aligns with the analyzed text. (See "[aligning texts and analyses in the CITE architecture](../orca)".)

## Extensions ##

- the [CITE Image Extension](extensions/image)