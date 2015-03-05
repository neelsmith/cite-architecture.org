---
layout: page
title: About the CITE architecture
---

## Background

Christopher Blackwell and Neel Smith originally developed the CITE architecture to meet the needs of the [Homer Multitext project](http://homermultitext.github.io).   Together with the co-editors of the project, Casey Dué and Mary Ebbott, we recognized the need for an architecture that would outlive specific, rapidly changing technologies, while at the same time thoroughly capturing the semantics of our work in a machine-actionable format.  

We were surprised to find that, despite the centuries-long tradition in disciplines like classical studies of citing texts by canonical reference, this experience had not been generalized in the digital humanities community.  Even the most forward-looking digital projects a decade ago were relying on textual references that failed to represent the semantics implicit in conventional canonical citation, and were expressed in such as URLs that, while machine-actionable today,  were closely tied to specific ephemeral technologies.  We began work on the [Canonical Text Service](http://cite-architecture.github.io/cts/) (CTS), and eventually devised the[ CTS URN notation][ctsurn] for citing texts.   We subsequently applied this scheme -- URN notation for citation, a RESTful  service for retrieval of material identified by URN, and client software that talks to the service -- to *all* the material in the HMT project: texts, physical artifacts like manuscripts, documentary objects like photographs, and analytical objects such as morphological analyses of texts.


[cts_urn_spec]: http://cite-architecture.github.io/ctsurn_spec/


## Components of the CITE architecture ##


The CITE architecture comprises:


1. standards for citing scholarly resources with a technology-independent but machine actionable URN notation
2. APIs for services to retrieve scholarly resources identified with the CITE architecture's URN notation
3. some code libraries for working with URN notation, and the CITE services



## Why should "digital humanities" start from citation? ##


The very articulate Astronomer Royal Martin Reese has described the goal of science in this way:

> The aim of science is to unify disparate ideas, so we don't need to remember them all. I mean we don't need to record the fall of every apple, because Newton told us they all fall the same way.

(From an interview with the arresting title "Cosmic Origami and What We Don't Know;"  full transcription online [here][origami].)

This remark captures a quintessential difference between the natural sciences and the humanities.  Humanists, too, unify disparate ideas, but we *must* record each unique phenomenon that we study.  If we develop a unified view of oral poetry, for example, we will never conclude that "Because I'm familiar with the *Iliad*, I don't have to remember the *Odyssey*," or "I've studied Greek poetry so I don't need to know about the Serbo-Croatian oral poetry that Parry and Lord studied."  We don't study apples.  Recording and remembering are basic to scholarship in the humanities.


## Why URNs? ##

The Uniform Resource Name (URN) system was defined by the Internet Engineering Taskforce to address precisely our fundamental scholarly problem .    To quote from [RFC 2141](http://tools.ietf.org/html/rfc2141):

> Uniform Resource Names (URNs) are intended to serve as persistent, location-independent, resource identifiers.

By defining URN schemes for scholarly citation of texts, images and other objects, we address the fundamental requirement of identifiers that are:

- semantically complete
- technology independent 
- machine actionable







[origami]: http://www.onbeing.org/program/cosmic-origami-and-what-we-dont-know/transcript/6056



