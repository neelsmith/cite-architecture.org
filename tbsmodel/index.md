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


    #!citecollections
    URN#Description#Labelling property#Ordering property#License
    urn:cite2:hmt:msA.v1:#Pages of the Venetus A manuscriptscript#urn:cite2:hmt:msA.v1.label:#urn:cite2:hmt:msA.v1.sequence:#CC-attribution-share-alike

    #!citeproperties
    Property#Label#Type#Authority list
    urn:cite2:hmt:msA.v1.sequence:#Page sequence#Number#
    urn:cite2:hmt:msA.v1.urn:#URN#Cite2Urn#
    urn:cite2:hmt:msA.v1.rv:#Recto or Verso#String#recto,verso
    urn:cite2:hmt:msA.v1.label:#Label#String#




    #!citeproperties
    Property#Label#Type#Authority list
    urn:cite2:hmt:dse.2017a.urn:#DSE record#Cite2Urn#
    urn:cite2:hmt:dse.2017a.label:#Label#String#
    urn:cite2:hmt:dse.2017a.passage:#Text passage#CtsUrn#
    urn:cite2:hmt:dse.2017a.imageroi:#Image region of interest#Cite2Urn#
    urn:cite2:hmt:dse.2017a.surface:#Artifact surface#Cite2Urn#

    #!datamodels
    Collection#Model#Label#Description
    urn:cite2:hmt:dse.2017a:#urn:cite2:dse:datamodel.v1:#DSE model#Diplomatic Scholarly Edition (DSE) model.  See documentation at <https://github.com/cite-architecture/dse>.
