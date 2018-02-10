---
layout: page
title: Model of citable images
---


The CITE Architecture defines a model for [diplomatic scholarly editions](../dse/), in which text, artifact and documentary image data are explicitly related.  Before an edition can be completed, however, it is normally necessary to work separately with documented citable images.

As a minimal model of citable images, we require that beyond an identifying URN and a human-readable caption, each image be accompanied with an individual permissions statement.


The URN for this model is `urn:cite2:cite:datamodels.v1:imagemodel`


## Serialization in CEX format


Example:


    #!citeproperties
    Property#Label#Type#Authority list
    urn:cite2:hmt:vaimg.2017a.urn:#URN#Cite2Urn#
    urn:cite2:hmt:vaimg.2017a.caption:#Caption#String#
    urn:cite2:hmt:vaimg.2017a.rights:#Rights#String#


    #!datamodels
    Collection#Model#Label#Description
    urn:cite2:hmt:vaimg.2017a:#urn:cite2:cite:datamodels.v1:imagemodel#Citable image model#CITE model of a citable image
