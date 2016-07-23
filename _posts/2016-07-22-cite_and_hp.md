---
layout: post
title: "Updates to cite and hocuspocus libraries"
---

Version 2.0 of the `hocuspocus` library and version 3.0 of the `cite` were simultaneously released today.

Configuration of text repositories managed with `hocuspocus` is simpler, with a clean division between a textinventory cataloging how works are identified and cited, and a local configuration file identifying formats and local file names for documents.

 `hocuspocus` now supports managing citable repositories of texts in a much wider range of formats.  It was previously possible to use any well-formed XML, including namespaced XML validating against a schema as well as non-namespaced XML.  With release 2.0, `hocuspocus` adds support for three lightweight, markup-free formats as well.

1. Markdown (specifically, "[bland markdown](https://mcneill.io/bland-markdown/)") documents can be included in the repository, and a citation scheme is inferred from the structure of the document.  Header elements define hierarchical divisions; other block elements define succesive citable nodes.
2. Files in [OHCO2 eXchange Format](http://neelsmith.github.io/2016/07/13/82xf_v2/) (82XF) can be included.  Since full citation values are included for each leaf node, no configuration of citation scheme is required.
3. Delimited text files with ordered pairings of URNs and text contents can be used.  Like 82XF files, these include a URN for each text node and therefore require no configuration of citation scheme.

I hope to make documented examples applying the updated libraries available soon.  In the meantime, here is an example of the minimal configuration required to publish a citable version of a markdown document.

A text inventory defines one or more CTS namespaces:

    <ctsnamespace
     abbr="citedocs"
     ns="http://cite-architecture.github.io/docs">
     <description
      xml:lang="eng">CITE architecture documentation.</description>
    </ctsnamespace>


The inventory uses identifiers in that namespace to catalog a text in the CTS hierarchy:

    <textgroup
     urn="urn:cts:cite:citedocs:">
     <groupname
      xml:lang="eng">Documentation of code libraries</groupname>
      <work
       urn="urn:cts:cite:citedocs.hocuspocus:"
       xml:lang="eng">
       <title
        xml:lang="eng">Hocuspocus</title>
       <edition
        urn="urn:cts:cite:citedocs.hocuspocus.v3:">
        <label
          xml:lang="eng">Version 3</label>
        <description
          xml:lang="eng">Documentation of version 3 of the hocuspocus library</description>
        <online/>
      </edition>
     </work>
    </textgroup>

In the accompanying document configuration file, a single line suffices to specify how to find and cite the document:

        <online urn="urn:cts:cite:citedocs.hocuspocus.v3:" type="markdown" docname="hp.md"/>

From this information, `hocuspocus` can generate multiple OHCO2-equivalent representations of the text, including RDF that can be directly imported into a SPARQL endpoint, and used by cite servlet 2 (`cs2`) to serve Canonical Text Service requests.

Conveniently mixing XML, Markdown, and delimited-text formats in a single repository  illustrates the power of the OHCO2 abstraction of citable texts.
