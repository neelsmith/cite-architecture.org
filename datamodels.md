---
title:  Citable data models
layout: page
---

Data models are citable objects.  The CITE Architecture defines three generic models:


-   [citable texts](../ohco2) (OHCO2)
-   [collections of citable objects](../cite2)
-   [citable relations](../citerelations)


Invidual CITE Collections may further specify a more specialized model.  Because the CITE Architecture has frequently been applied to editions of texts preserved on specific physical artifacts, we have defined three kinds of CITE Collections related to that problem:

-   [citable images](../imagemodel)
-   [illustrated text-bearing surfaces](../tbsmodel)
-   [diplomatic scholarly editions](../dse)


## A CITE Collection of data models



    #!citecollections
    URN#Description#Labelling property#Ordering property#License
    urn:cite2:cite:datamodels.v1:#Data models of citable material#urn:cite2:cite:datamodels.v1.label:##Public domain

    #!citeproperties
    Property#Label#Type#Authority list
    urn:cite2:cite:datamodels.v1.urn:#Data model#Cite2Urn#
    urn:cite2:cite:datamodels.v1.label:#Label#String#
    urn:cite2:cite:datamodels.v1.description:#Description#String#

    #!citedata
    urn#label#description
    urn:cite2:cite:datamodels.v1:ocho2#OHCO2 text model#Citable passages of text modelled as an ordered hierarchy of citable objects.  See <https://cite-architecture.github.io/ohco2/>
    urn:cite2:cite:datamodels.v1:citeobj#Citable collection model#Citable versioned collections of objects.  See <https://cite-architecture.github.io/citeobj/>
    urn:cite2:cite:datamodels.v1:relations#Citable relations#Citable objects related in a S-V-O statement.  See <https://cite-architecture.github.io/citerelations/>
    urn:cite2:hmt:datamodels.v1:imagemodel#Citable images#Citable images with individually documented rights statements.  See <http://cite-architecture.github.io/imagemodel/>.
    urn:cite2:hmt:datamodels.v1:tbsmodel#Illustrated text-bearing surfaces#An ordered collection of citable surfaces illustrated by a default citable image.  See <http://cite-architecture.github.io/tbsmodel/>.
    urn:cite2:hmt:datamodels.v1:dse#Diplomatic scholarly edition#An ordered collection of citable surfaces illustrated by a default citable image.  See <http://cite-architecture.github.io/dse/>.
