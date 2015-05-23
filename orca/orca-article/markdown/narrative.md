# Use Cases \emph{\&} Infrastructure: Analytical Editions

Christopher Blackwell, Neel Smith. May, 2015.

## Summary

This document describes ongoing work on textual analysis for the Homer Multitext, and on text-reuse, textual history, and syntax that is a collaboration between Furman University and the Leipzig Open Greek and Latin project.

Our experience has shown that the model of "text" as and **ordered hierarchy of citation objects** (\textsc{ohco2}) allows us to express the semantics of a text in many different data formats.[@smith_applying_2009] We use \textsc{tei-xml} mainly as an archival format and for working with a text as it is being edited, using a very constrained subset of its elements---only those necessary for documenting the citation scheme, the editorial status of specific spans of text (unclear, added, corrected, &c.), and disamguating non-lexical content in the text (*e.g.* Greek letters used as numbers, fragments of words, personal names). 

For subsequent processing, we express the texts' semantics as tabular data in plain-text files; our implementation of the \textsc{cts} service uses an \textsc{rdf} triplestore as its back-end.


\begin{figure}[h!]
\centering
\includegraphics[width=1\linewidth]{images/schematic.pdf}
\caption{The \textsc{cite/cts} Architecture as currently implemented for the Homer Multitext, \emph{\&}c.}
\end{figure}


The technological infrastructure that would most benefit this work would be an **extremely robust triplestore with a public-facing \textsc{Sparql} endpoint.** 

What follows is a description of the approach to **analysis** that we have been able to develop to meet our need for multiple, mutually incompatible analyses of complex texts, and our desire that those analyses align to one another. The digital editions and exemplars derived from them can be entirely expressed as \textsc{rdf} statments, but these will inevitably number in the hundreds of millions.

Some of these analyses will be the products of human editors. The Furman students working in Leipzig with Monica Berti are generating analyses of text-reuse in Athenaeus by hand, entering data in `.csv` files in GitHub. Others will be programmatically generated, such as lexical or metrical analyses across our corpus of Homeric epic. 


## Background: Analysis

In our work on the tradition of Greek Epic poetry for the Homer Multitext, and on text-reuse for the Leipzig Open Greek and Latin project, we confront the need for many kinds of *analysis* of texts and images.

By *analysis* we mean: the systematic association of metadata (commentary, cross-references, categories or labels in a controlled vocabulary) to objects of study *or parts of those objects*.

Some examples of analysis:

- Associating textual citations with regions-of-interest on an image. 
- Attaching morphological identifications to lexical tokens in a text.
- Identifying syllables in a a poetic text and assingment them a metrical value.
- Documenting the syntax of a sentence.
- Identifying instances of text-reuse and assinging them citations.

\noindent There are many ways to perform these analyses. The challenge is to move these acts of analyses from the **procedural** to the **declarative**, in some manner independent of technology. 

### The Easy Part

In many ways, analysis of images is the least difficult:

- There is an image with a unique identifier.
- It is accepted that the image may be scaled, turned from a `.tif` to a `.jpg`, without losing its identity.
- We can define regions-of-interest on the image, through various schemes of citation, and link those citations to other data.
- The \textsc{roi}s can overlap.
- So, a single image of a manuscript folio might have \textsc{roi}s defined that treat large regions---the main text-block, commentary text-blocks, illustrations---and very small regions---graphemes, punctuation. One \textsc{roi} can overlap another, or many, as when a region defines a "poetic line" on the manuscript, while other regions identify individual words, and another identifies a large stain.

\noindent Similarly, annotation of geo-spatial data is infinitely flexible and granular, from the centimeter-scale mapping of a botanical garden to analysis that groups discrete finds scattered across an archaeological field-survey.

### Citation-Objects

Working with analyses of texts is more difficult.


> | 1	μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος
| 2	οὐλομένην, ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε,
| 3	πολλὰς δ᾽ ἰφθίμους ψυχὰς Ἄϊδι προΐαψεν
| 5	οἰωνοῖσί τε πᾶσι, Διὸς δ᾽ ἐτελείετο βουλή,
| 6	ἐξ οὗ δὴ τὰ πρῶτα διαστήτην ἐρίσαντε
| 7	Ἀτρεΐδης τε ἄναξ ἀνδρῶν καὶ δῖος Ἀχιλλεύς.
| 

\noindent This is a passage of an ancient Greek text, which we can identify precisely and *declaratively* with a citation: *Iliad* 1.1–1.7. We can use a \textsc{cts-urn}[@blackwell_four_2012], which is both canonical and machine actionable to identify it: 

> `urn:cts:greekLit:tlg0012.tlg001.persGrk:1.1-1.7`

> $\underbrace{\underbrace{urn:cts:greekLit}_\text{namespaces}:\underbrace{tlg0012}_\text{Homeric Poetry}.\underbrace{tlg001}_\text{Iliad}.\underbrace{persGrk}_\text{edition}:\underbrace{1.1-1.7}_\text{citation}}_\text{cts-urn}$ 

\noindent A citation resolves to a text, which may contain *mixed content*, markup describing the text. Here is the markup for line 4 of Book 2, from a transription of a particular manuscript of the *Iliad*.

> `urn:cts:greekLit:tlg0012.tlg001.msA:2.4`

> `<l n="4">τιμήσ<choice><sic>ῃ</sic><corr>ει</corr><choice>, ὀλέσῃ δὲ πολέας ἐπὶ νηυσὶν Ἀχαιῶν.</l>`

\noindent The citation is precise and explicit. The markup of the text is appropriate, too, in that it *documents* the Greek text. That is, it (a) captures the citation scheme, and (b) asserts the editorial status of the Greek text. In this case, the manuscript presents two different endings for the verb, "he might honor": -ῃ and -ει.

### Analysis

A human being, reading texts, will inevitably engage in a number of *simultaneous* acts of analysis. A sophisticated reader, experienced in Greek epic poetry, will, without much conscious thought, analyze the text in the following ways:

- Lexical tokens: each word; its morphology; its complex lexicography.
- Named entities: some words are names: Achilles, Zeus. Some are complex, pointing to more than one person: "Son-of-Peleus".
- Syntactical units: phrases, clauses, sentences.
- Formulaic units:  "Son-of-Peleus-Achilles", "Son-of-Atreus-Lord-of-Men", "Godlike-Achilles".
- Poetic lines: a fundamental structure of this text, and how we cite it.
- Poetic half-lines: a fundamental building-block of dactylic hexameter.
- Metrical feet: dactyls and spondees, themselves made up of…
- Syllables.

\noindent *Iliad* 1.1–1.7 includes seven citable units, according to the canonical scheme of citation for this text. The seven constitute a single sentence. But beyond that, things get complicated:

- First noun-phrase:  μῆνιν… οὐλομένην ("destructive wrath")
- First clause: μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην, ("Sing, goddess, of the destructive wrath of Achilles, son of Peleus")
- Named Entity: Πηληϊάδεω Ἀχιλῆος ("Son-of-Peleus Achilles")
- Named Entity?: Πηληϊάδεω (implies someone named "Peleus"?)
- First metrical foot: μῆνιν ἄ…
- Second metrical foot: …ειδε θε…
- First grapheme in *Iliad* 1.1: μ (a single character)
- First grapheme in *Iliad* 1.7 on the Venetus A manuscript: ἐξ (a ligature of two characters, and a diacritical mark)

\begin{figure}[h!]
\centering
\includegraphics[width=.4\linewidth]{images/ex-ligature.jpg}
\caption{The word ἐξ, at \emph{Iliad} (\textsc{ms} A 12-\emph{recto}) 1.7: one, two, or three tokens, depending on the analysis.}
\end{figure}

\noindent Most of the above examples, however, cannot be cited precisely using the canonical scheme of citation. The first half-line---μῆνιν ἄειδε θεὰ---falls *within* 1.1, but is not the same as 1.1. The first syntactical clause---μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην,---includes all of 1.1, and the first word of 1.2. There is a noun-phrase, the direct object of the verb ἄειδε, that includes the first word of 1.1 and the first word of 1.2, but nothing in between.

If we are to realize the potential of digital libraries, we need to be able to work with analyses like these *declaratively*. Possible analyses are limitless and complementary; some will cross citation-boundaries; some will be analyses of non-contiguous text. It is impractical to expect the *documentary markup* of a digital edition (e.g. \textsc{tei-xml}) to serve for analysis as well.

 
### Tokenization(s)

We could *add to* the canonical citation scheme a further level, making it Book, Line, Word, tokenizing the text. Thus our first syntactical clause---μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην,---could be cited as 1.1.1--1.2.1 (Book 1, line 1, word 1, **through** Book 1, line 2, word 1).

But we would quickly find this limiting. The first metrical foot, a dactyl, includes the first word of 1.1 and the first syllable of the second word: μῆνιν ἄ…. 

We could tokenize by character, of course, so "μῆνιν ἄ" would be *Iliad* 1.1.1–1.1.7. 

In all of these examples, we need to *declare* some combination of the citation hierarchy and the content. The \textsc{cts-urn} specification allows us to add *subreferences*, by which our metrical-foot example could be expressed as "1.1@μ–1.1@α", or more precisely (since there might be more than one *mu* and more than one *alpha* in a line, "1.1@μῆνιν[1]–1.1@α[1]", that is, "1.1, the first instance of the string μῆνιν, through 1.1, the first instance of the string α."[@blackwell_cts_2014-1] 

\textsc{Cts-urn}s with subreferences are an important start, but they are not sufficient.


> `τιμήσ<choice><sic>ῃ</sic><corr>ει</corr><choice>, ὀλέσῃ δὲ πολέας ἐπὶ νηυσὶν Ἀχαιῶν.`
> ---*Iliad* 2.4 (Venetus A)


This line of a transcription of the *Iliad*, 2.4, as it appears on the Venetus A manuscript, is marked up to show that the scribe offered two alternative endings for the verb "he might honor": τιμήσ\textcolor{maroon}{ῃ} and τιμήσ\textcolor{maroon}{ει}.

What is the *content* here? If we want to cite "the two parallel verbs", and we cite "…2.4@τιμήσῃ[1]-2.4@ὀλέσῃ[1]", as proposed above, the textual content of the electronic edition (the concatenation of the text-nodes in an \textsc{xml} document) would give us: τιμήσ\textcolor{maroon}{ῃει}, ὀλέσῃ. This does not make any sense. 

And how would we cite our noun-phrase---μῆνιν … οὐλομένην? 1.1.1–1.2.1 would include all the words in between the noun μῆνιν and the participle οὐλομένην. "1.1.1 and 1.2.1" is not a citation, but two citations. 

And so on. There is no single scheme of citation that can possibly serve the kinds of analysis that scholars employ every day.

## Analytical Exemplars

Our approach is to create a new text, derived from an Edition (or Translation) that expresses a particular analysis. We call these "Analytical Exemplars". They are specifically dependent on the Edition from which they derive. The Exemplar inherits the citation-structure of the Edition. The Exemplar may *extend* the Edition's citation hierarchy to an additional level of depth.  

While all of our Editions and Translations begin life as \textsc{tei-xml}, our Analytical Exemplars are created as tabular data. There is no reason these Exemplars could not be re-expressed as \textsc{tei-xml}, but we have as yet see no reason to do so. Like our Editions and Translations, the Exemplars are further processed into \textsc{rdf} statements for serving via the \textsc{Sparql} endpoint that feeds our \textsc{cts} service. 

### Data Defining an Analytical Exemplar

We create an Analytical Exemplar, derived from a specific version (Edition or Translation), by capturing the following data, initially in a plain-text table, and (after processing) as \textsc{rdf} statements:

- **Analyzed Text** This is a \textsc{cts-urn}, with or without a substring, which may be range, identifying the passage of text analyzed in the Edition. If the text in question is an XML text contained mixed content, the 'text' here includes **the concatenation of all text-nodes in a citation unit**.

- **Analysis Record** This is a \textsc{\textsc{cite}}-\textsc{urn} identifying **uniquely** the pairing of analysis+text.

- **Analysis** This is a \textsc{\textsc{cite}}-\textsc{urn} pointing to the analysis being attached to a text. It *may* be identical to the analysis record, 

	- When the *analysis* is unique (*e.g.* "The first clause of the *Iliad* in the 'msA' edition."), then the `Analysis Record` (a \textsc{urn}) and the `Analysis` (a \textsc{urn}) may be **identical**.
	- When the *analysis* is not unique (*e.g.* "verb", or "dactyl"),  the `Analysis Record` (a \textsc{urn}) and the `Analysis` (a \textsc{urn}) must be **different**.
	- The *analysis* \textsc{urn} points to an object to which any desired metadata may be attached. 

- **Analytical Exemplar \textsc{urn}** This is a \textsc{cts-urn} used to construct an "analytical exemplar", which is a text *derived from the version identified by the Analyzed Text \textsc{cts-urn}*, with *one additional level of citation-hierarchy*, each of whose leaf-nodes is an analysis, identified by the **Analysis \textsc{urn}** (above). The Analytical Exemplar, when processed into the \textsc{Ohco}2 data model, will act like any other \textsc{cts} text. The *text content* of each leaf node is…

- **Text-Content** This identifies the *text-content* of the leaf-nodes of the analytical exemplar. 

### The Result

We have the original *edition* of the text, with its canonical scheme of citation. *E.g.* The Homeric *Iliad*, edition of the Venetus A, which begins with 1.1: 

> `urn:cts:greekLit:tlg0012.tlg001.msA:1.1` 
> = `<l n='1'>μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος</l>`

\noindent We have an *analytical exemplar* derived from the *edition*. *E.g.* The Homeric *Iliad*, edition of the Venetus A, exemplar tokenized by word. 

> $\underbrace{\underbrace{urn:cts:greekLit}_\text{namespaces}:\underbrace{tlg0012}_\text{Homeric Poetry}.\underbrace{tlg001}_\text{Iliad}.\underbrace{persGrk}_\text{edition}.\underbrace{wt}_\text{exemplar}:\underbrace{1.1.1}_\text{“μῆνιν”}}_\text{cts-urn}$ 

\noindent So, `urn:cts:greekLit:tlg0012.tlg001.msA.wt:1.1.1` has *text content* `μῆνιν`, and is *aligned with* `urn:cite:hmt:iliadLexMSA.1`, which might tells us that this object is a "noun", "feminine", "accustive", "singular", from the lemma "μῆνις", or even that it is the direct object of the sentence.


We can navigate the *exemplar* as we navigate the *edition*, and we can likewise identify or retrieve its citation-units at any level of granularity by \textsc{urn} reference.

Since the *exemplar* is aligned to the textual content of the *edition*, and all other *exemplars* derived from this *edition* are as well, we have implicit alignment across any analyses that anyone produces for this edition of the text.

## Examples

### Lexical Tokens

The easiest case would be a traditional tokenization by lexical entities.

> μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος — *Iliad* 1.1

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.1@μῆνιν[1]` |
| Sequence | `1` |
| Analysis Record |	`urn:cite:hmt:lexTokens.1` |
| Analysis | `urn:cite:hmt:lexTokens.1` |
| Analytical Exemplar \textsc{urn} | `urn:cts:greekLit:tlg0012.tlg001.msA.lexTokens:1.1.1` |
| Text-Content | `μῆνιν` | 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.1@ἄειδε[1]` |
| Sequence | `2` |
| Analysis Record |	`urn:cite:hmt:lexTokens.2` |
| Analysis | `urn:cite:hmt:lexTokens.2` |
| Analytical Exemplar \textsc{urn} | `urn:cts:greekLit:tlg0012.tlg001.msA.lexTokens:1.1.2` |
| Text-Content | `ἄειδε` | 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.1@θεὰ[1]` |
| Sequence | `3` |
| Analysis Record |	`urn:cite:hmt:lexTokens.3` |
| Analysis | `urn:cite:hmt:lexTokens.3` |
| Analytical Exemplar \textsc{urn} | `urn:cts:greekLit:tlg0012.tlg001.msA.lexTokens:1.1.3` |
| Text-Content | `θεὰ` | 

### Markup Problems

A "lexical-token-exemplar" might choose to ignore editorial markup; its tokens would be aligned to the Edition, and so the editorial status of any given token---unclear, supplied, *vel sim.*---could be determined. But for this analysis the text-content would simply be strings of Greek. The description of the analytical exemplar expresses the principles for its construction.

> μῆν`<unclear>`ιν ἄει`</unclear>`δε θεὰ Πηληϊάδεω Ἀχιλῆος — *Iliad* 1.1

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msN:1.1@μῆν[1]-1.1@ιν[1]` |
| Sequence | `1` |
| Analysis Record |	`urn:cite:hmt:lexTokens.1` |
| Analysis | `urn:cite:hmt:lexTokens.1` |
| Analytical Exemplar \textsc{urn} | `urn:cts:greekLit:tlg0012.tlg001.msN.lexTokens:1.1.1` |
| Text-Content | `μῆνιν` | 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msN:1.1@ἄει[1]-1.1@δε[1]` |
| Sequence | `2` |
| Analysis Record |	`urn:cite:hmt:lexTokens.2` |
| Analysis | `urn:cite:hmt:lexTokens.2` |
| Analytical Exemplar \textsc{urn} | `urn:cts:greekLit:tlg0012.tlg001.msN.lexTokens:1.1.2` |
| Text-Content | `ἄειδε` | 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msN:1.1@θεὰ[1]` |
| Sequence | `3` |
| Analysis Record |	`urn:cite:hmt:lexTokens.3` |
| Analysis | `urn:cite:hmt:lexTokens.3` |
| Analytical Exemplar \textsc{urn} | `urn:cts:greekLit:tlg0012.tlg001.msN.lexTokens:1.1.3` |
| Text-Content | `θεὰ` | 


### Metrical Feet

A different tokenization, and a different analytical exemplar. This one captures metrical feet, which cross word-boundaries. The "Analysis" would be a \textsc{urn} identifying the kind of foot (dactyl or spondee, in this case).

> μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος — *Iliad* 1.1

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.1@μῆνιν[1]-1.1@ἄ[1]` |
| Sequence | `1` |
| Analysis Record |	`urn:cite:hmt:metricalAnalysis.1` |
| Analysis | `urn:cite:hmt:meter.dactyl` |
| Analytical Exemplar \textsc{urn} | `urn:cts:greekLit:tlg0012.tlg001.msA.feet:1.1.1` |
| Text-Content | `μῆνιν ἄ` | 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.1@ειδε[1]-1.1@θε[1]` |
| Sequence | `2` |
| Analysis Record |	`urn:cite:hmt:metricalAnalysis.2` |
| Analysis | `urn:cite:hmt:meter.dactyl` |
| Analytical Exemplar \textsc{urn} | `urn:cts:greekLit:tlg0012.tlg001.msA.feet:1.1.2` |
| Text-Content | `ειδε θε` | 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.1@ὰ[1]-1.1@Πη[1]` |
| Sequence | `3` |
| Analysis Record |	`urn:cite:hmt:metricalAnalysis.3` |
| Analysis | `urn:cite:hmt:meter.spondee` |
| Analytical Exemplar \textsc{urn} | `urn:cts:greekLit:tlg0012.tlg001.msA.feet:1.1.3` |
| Text-Content | `ὰ Πη` | 

### Syntax Problem

For analyzing syntax, it is common to separate certain words, so for οὔτε, the οὔ is treated as an adverb, and the τε as a coordinator. But we do not really want to do violence to the text of our edition, just to serve one particular analysis!

> ἵν᾽ οὔτε φωνὴν οὔτε του μορφὴν βροτῶν — Aeschylus, *PV* 21

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0085.tlg003:21@οὔτε[1]` |
| Sequence | `N` |
| Analysis Record |	`urn:cite:fu:pvSyntax.45` |
| Analysis | `urn:cite:fu:pvSyntax.45` |
| Analytical Exemplar \textsc{urn} | `urn:cts:greekLit:tlg0085.tlg003.synTok:21.2` |
| Text-Content | `οὔ` | 


| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0085.tlg003:21@οὔτε[1]`	|
| Sequence | `N+1` |
| Analysis Record |	`urn:cite:fu:pvSyntax.46` |
| Analysis | `urn:cite:fu:pvSyntax.46` |
| Analytical Exemplar \textsc{urn} | `urn:cts:greekLit:tlg0085.tlg003.synTok:21.3` |
| Text-Content | `τε` | 

### Clauses

> | 1	μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος
| 2	οὐλομένην, ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε,
| 3	πολλὰς δ᾽ ἰφθίμους ψυχὰς Ἄϊδι προΐαψεν
| …

> — *Iliad* 1.1--1.3

\noindent The first grammatical clause of the *Iliad* is "μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην,". This includes all of 1.1, and the first part of 1.2. The second is "ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε,", the rest of 1.2.

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.1-1.2@οὐλομένην[1]`	|
| Sequence | `1` |
| Analysis Record |	`urn:cite:hmt:clauses.1` |
| Analysis | `urn:cite:hmt:clauses.1` |
| Analytical Exemplar \textsc{urn} | `urn:cts:greekLit:tlg0012.tlg001.msA.clauses:1.1.1` |
| Text-Content | `μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην,` | 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.1-1.2@οὐλομένην[1]`	|
| Sequence | `2` |
| Analysis Record |	`urn:cite:hmt:clauses.1` |
| Analysis | `urn:cite:hmt:clauses.1` |
| Analytical Exemplar \textsc{urn} | `urn:cts:greekLit:tlg0012.tlg001.msA.clauses:1.2.1` |
| Text-Content | `μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην,` | 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.2@ἣ[1]-1.2@ἔθηκε[1]`	|
| Sequence | `3` |
| Analysis Record |	`urn:cite:hmt:clauses.2` |
| Analysis | `urn:cite:hmt:clauses.2` |
| Analytical Exemplar \textsc{urn} | `urn:cts:greekLit:tlg0012.tlg001.msA.clauses:1.2.2` |
| Text-Content | `ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε,` | 

\noindent We can unpack this. There are two clauses, identified by the *analysis \textsc{urn}s* `urn:cite:hmt:clauses.1` and `urn:cite:hmt:clauses.2`.

There are three entries in our record of these two clauses. The first two both have `urn:cite:hmt:clauses.1` as their *Analysis Record* and their *Analysis* (because in this case, the analysis is unique: the first clause of this edition of the *Iliad*.[^notTheSame] 

The **Analytical Exemplar \textsc{urn}s** are the key for understanding why we have two entries for the first clause. This analytical aligment is creating an **exemplar** that is tokenized and citeable according to clauses. The **analytical exemplar \textsc{urn}s**, and the aligned analyses, say:

- The first citable analysis *of* 1.1 is `clauses.1`.
- The first citable analysis *of* 1.2 is `clauses.1`.
- The second citable analysis *of* 1.2 is `clauses.2`.

\noindent If we were to navigate our Edition and the derived Exemplar via a \textsc{cts} service, the following \textsc{urn}s would return the following text-content:

| Edition-level \textsc{cts-urn} | Text-Content |
|-----|-----|
| `urn:cts:…msA:1.1` | μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος |
| `urn:cts:…msA:1.2` | οὐλομένην, ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε, |

| Exemplar-level \textsc{cts-urn} | Text-Content |
|-----|-----|
| `urn:cts:…msA.clauses:1.1.1` | μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην, |
| `urn:cts:…msA.clauses:1.1` | μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην, |
| `urn:cts:…msA.clauses:1.2.1` | μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην, |
| `urn:cts:…msA.clauses:1.2.2` | ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε, |
| `urn:cts:…msA.clauses:1.2` | μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην, ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε, |
| `urn:cts:…msA.clauses:1.1.1-1.2.1` | μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην, |
| `urn:cts:…msA.clauses:1.1-1.2` | μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην, ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε, |

\noindent If we were to submit a `getNextUrn` request to the \textsc{cts} Service, we would get the following results:

| Input \textsc{urn} | Result of `getNextUrn` |
|-----|-----|
| `urn:cts:…msA.clauses:1.1.1` | next = `urn:cts:…msA.clauses:1.2.2` |
| `urn:cts:…msA.clauses:1.2.1` | next = `urn:cts:…msA.clauses:1.2.2` |
| `urn:cts:…msA.clauses:1.1` | next = `urn:cts:…msA.clauses:1.2` |


[^notTheSame]: An example where the *analysis* and the *analysis record* would have different \textsc{urn}s might be an analysis of personal names. We might choose to analyze "Πηληϊάδεω" and "Ἀχιλῆος" individually. Each would have a unique *analysis record*, but each would bye *analyzed* the same \textsc{\textsc{cite}}-\textsc{urn}, identifying an entity that is "Achilles, son of Peleus, hero of the Trojan War in Homeric Epic."


## Non-contiguous Text

> \textcolor{maroon}{ὑπὸ} δὲ \textcolor{maroon}{τοῦ Μελίσσου καὶ Περικλέα} φησὶν \textcolor{maroon}{αὐτὸν} Ἀριστοτέλης \textcolor{maroon}{ἡττηθῆναι ναυμαχοῦντα πρότερον} --- Plut. *Per.* 26.3

> But Aristotle says that \textcolor{maroon}{Pericles, too, fighting in a previous naval battle, was defeated by Melissos.}" 

\noindent \textcolor{maroon}{Colored text} indicates "text reuse".

| Field | Value |
|-------|-------|
| Sequence | `N` |
| Analysis Record |	`urn:cite:histfragDipl:arist.577` |
| Analysis | `urn:cite:histfrag:arist.577` |
| Analyzed Text | `urn:cts:greekLit:tlg0007.tlg012.perseus-grc1:26.3@ὑπὸ[1]-26.3@πρότερον[1]`
| Analytical Exemplar \textsc{urn} | `urn:cts:greekLit:tlg0007.tlg012.perseus-grc1.histfrag:26.3.1` |
| Text-Content | `ὑπὸ τοῦ Μελίσσου καὶ Περικλέα αὐτὸν ἡττηθῆναι ναυμαχοῦντα πρότερον` | 

\noindent In this example, we *analyze* a string of text from our Edition, associating it with an Analysis \textsc{urn} that identifies an instance of text-reuse. For the **text-content** of our analytical exemplar, however, we choose to omit the *verbum dicendi* and speaker-attribution (*i.e.* "φησὶν… Ἀριστοτέλης"), and the sentence-adverbial ("δὲ"), which are not actually part of the quotation. We have not damaged our Edition, but we can present our analysis of quotation *as we choose*, and attach commentary, *vel sim.*, to the object pointed to by the Analysis \textsc{urn}.

While one editor might be content merely on the attributed paraphrase, another might want to analyze this text of Plutarch by promoting the quotation to direct speech. The *text content* of the Exemplar is a matter for editorial judgement. That editor's analysis would look like this:

| Field | Value |
|-------|-------|
| Sequence | `N` |
| Analysis Record |	`urn:cite:histfragNormal:arist.577` |
| Analysis | `urn:cite:histfrag:arist.577` |
| Analyzed Text | `urn:cts:greekLit:tlg0007.tlg012.perseus-grc1:26.3@ὑπὸ[1]-26.3@πρότερον[1]`
| Analytical Exemplar \textsc{urn} | `urn:cts:greekLit:tlg0007.tlg012.perseus-grc1.histfragNormal:26.3.1` |
| Text-Content | `ὑπὸ τοῦ Μελίσσου καὶ Περικλῆς αὐτὸς ἡττήθη ναυμαχῶν πρότερον` | 


### The "Analysis-Object"

The **Analysis \textsc{urn}** may exist only to give a unique identifier to the analysis, or it may point to a \textsc{\textsc{cite}} object with various fields. A \textsc{\textsc{cite}} Object record for the example above might look like this:

| \textsc{urn} | `urn:cite:histfrag:arist.577` |
|-----|-----|
| Type |  "Quotation" |
| Genre | "Prose" |
| Source | "Aristotle" |
| Auth |  M. Berti |
| Date |  ??? |
| Notes | "…" |	

## Generating this Data & Processing it into \textsc{\textsc{cite}} Collections and \textsc{cts} Texts

**There are no generic analyses.** Every specific analysis of each text is going to be unique. Any project that has undertaken even the simplest kind of tokenization knows how quickly it becomes necessary to make editorial decisions. For the *Homer Multitext* and work on editions of Aeschylus at Furman University, we have scripts that generate specific tokenizations. For the paleographic work on the *Homer Multitext* we rely on human editors to define characters, glyphs, abbreviations, and so forth, on our Homeric manuscripts. Some analyzes can be generated from elements in a \textsc{tei-xml} text (our personal-names analyses for the *\textsc{hmt}* texts is one example).

Generally, there are ways to automated parts of the process, such as generating analysys-\textsc{urn}s in sequence for a table of analyses. We indend to supplement our \textsc{cts} utlities along that lines that Bridget Almas has already demonstrated extremely effectively in \textsc{sosol}, to make it easier to select passages of "analyzed text" from an Edition.  

Each of the examples above can be represented by a tab- or comma-delimited text file. This can then be processed to generate a \textsc{\textsc{cite}} collection and the necessary RDF to include the Analytical Exemplar in a \textsc{cts} library.

We are working on incorporating these scripts to turn \textsc{orca} records into fully processed \textsc{\textsc{cite}} and \textsc{cts} data. These will be integrated into our \textsc{\textsc{cite}} Manager utility: [https://github.com/cite-architecture/citemgr](https://github.com/cite-architecture/citemgr).

