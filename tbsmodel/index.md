---
layout: page
title: Model of text-bearing surfaces
---


The CITE Architecture defines a model for [diplomatic scholarly editions](../dse/), in which text, artifact and documentary image data are explicitly related.  Before an edition can be completed, however, it is normally necessary to work separately with artifacts preserving the text.

Texts can be preserved in one or more physical areas of an artifact:  a page of a codex, a column of a papyrus scroll, a particular face or zone of a stone inscription, for example.  We refer to these areas as "text-bearing surfaces."  Because texts have a linear direction, text-bearing surfaces can are ordered by the sequence of textual units they preserve.  Note that this may or may not correspond to a sequential spatial position.

Because we are particularly preserved with reproducible scholarship, we require each text-bearing surface to be documented by a default citable image.


The URN for this model is `urn:cite2:hmt:datamodels.v1:tbsmodel`.

## Serialization in CEX format

Example:


    #!citeproperties
    Property#Label#Type#Authority list
    urn:cite2:hmt:msA.v1.sequence:#Page sequence#Number#
    urn:cite2:hmt:msA.v1.urn:#URN#Cite2Urn#
    urn:cite2:hmt:msA.v1.rv:#Recto or Verso#String#recto,verso
    urn:cite2:hmt:msA.v1.label:#Label#String#
    urn:cite2:hmt:msA.v1.defaultimg:#Default image#Cite2Urn#


    #!datamodels
    Collection#Model#Label#Description
    urn:cite2:hmt:msA.v1:#urn:cite2:hmt:datamodels.v1:tbsmodel#CITE model of text-bearing surfaces
