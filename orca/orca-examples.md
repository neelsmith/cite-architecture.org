# ORCA: OHCO2-Realigned Citeable Analyses

## Abstract 

>  The potential analyses of any text are infinite in number. We describe a framework for attaching analyses to passages of canonically cited texts so that the analyses are citable, aligned with the analyzed text, and thus aligned with all other analyses of that text; the analyses need not align with the citation-hierarchy of the analyzed text.

## Overview

This discussion assumes familiarity with the CTS/CITE Architecture, CTS URN citation, and CITE URN citation.[^cite]

### Problem

~~~

1	μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος
2	οὐλομένην, ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε,
3	πολλὰς δ᾽ ἰφθίμους ψυχὰς Ἄϊδι προΐαψεν
4	ἡρώων, αὐτοὺς δὲ ἑλώρια τεῦχε κύνεσσιν
5	οἰωνοῖσί τε πᾶσι, Διὸς δ᾽ ἐτελείετο βουλή,
6	ἐξ οὗ δὴ τὰ πρῶτα διαστήτην ἐρίσαντε
7	Ἀτρεΐδης τε ἄναξ ἀνδρῶν καὶ δῖος Ἀχιλλεύς.

~~~  *Iliad* 1.1--1.7

A human being, reading this text, will inevitably engage in a number of *simultaneous* acts of analysis. A sophisticated reader, experienced in Greek epic poetry, will, without much conscious thought, analyze the text in the following ways:

- Lexical tokens: each word; its morphology; its complex lexicography.
- Named entities: some words are names: Achilles, Zeus. Some are complex, pointing to more than one person: "Son of Peleus".
- Syntactical units: phrases, clauses, sentences.
- Formulaic unites:  Πηληϊάδεω Ἀχιλῆος,	Ἀτρεΐδης τε ἄναξ ἀνδρῶν, δῖος Ἀχιλλεύς
- Poetic lines: a fundamental structure of this text, and how we cite it.
- Poetic half-lines: a fundamental building-block of dactylic hexameter.
- Metrical feet: dactyls and spondees, themselves made up of…
- Syllables.

We have traditionally worked with this text according to its canonical scheme of citation: poetic book, poetic line. We could point to 1.1 as the first poetic line of the poem, or 1.1--1.7 as containing the first syntactic sentence of the poem. Scholarship depends on these *declarative* identifications of the objects of study, in the form of *citation*. 

Most of the above examples, however, cannot be cited precisely using the canonical scheme of citation. The first half-line---μῆνιν ἄειδε θεὰ---falls *within* 1.1, but is not the same as 1.1. The first syntactical clause---μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην,---includes all of 1.1, and the first word of 1.2. There is a noun-phrase, the direct object of the verb ἄειδε, that includes the first word of 1.1 and the first word of 1.2, but nothing in between---μῆνιν… οὐλομένην.

We could *add to* the canonical citation scheme a further level, making it Book, Line, Word, *tokenizing* the text. Thus our first syntactical clause---μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην,---could be cited as 1.1.1--1.2.1 (Book 1, line 1, word 1, *through* Book 1, line 2, word 1).

But we would quickly find this limiting. The first metrical foot, a dactyl, includes the first word of 1.1 and the first syllable of the second word: μῆνιν ἄ…. 

We could tokenize by character, of course, so "μῆνιν ἄ" would be *Iliad* 1.1.1--1.1.7. 

In all of these examples, we need to *declare* some combination of the citation hierarchy *and* the content. Our metrical-foot example could be expressed as "1.1@μ--1.1@α", or more precisely (since there might be more than one *mu* and more than one *alpha* in a line, "1.1@μῆνιν[1]--1.1@α[1]", that is, "1.1, the first instance of the string μῆνιν, through 1.1, the first instance of the string α."

But in the realm of electronic texts, things are more complex yet. 

~~~

τιμήσ<choice><sic>ῃ</sic><corr>ει</corr><choice>, ὀλέσῃ δὲ πολέας ἐπὶ νηυσὶν Ἀχαιῶν.

~~~ *Iliad* 2.4 (Venetus A)

This line of a transcription of the *Iliad*, 2.4, as it appears on the Venetus A manuscript, is marked up to show that the scribe offered two alternative endings for the verb "he might honor": τιμήσῃ and τιμήσει.

What is the content here? If we want to cite "the two parallel verbs", and we cited "2.4@τιμήσῃ[1]--2.4@ὀλέσῃ[1]", as proposed above, the *textual content of the electronic edition* would give us: τιμήσῃει, ὀλέσῃ. This does not make any sense. 

And how would we cite our noun-phrase---μῆνιν… οὐλομένην? 1.1.1---1.2.1 would include all the words in between the noun μῆνιν and the participle οὐλομένην. "1.1.1 and 1.2.1" is not a citation, but two citations. 

And so on. There is no single scheme of citation that can possibly serve the kinds of analysis *that scholars employ every day.*


## Solution

None of these problems are serious impediments to human readers, because we navigate among different "reading scenarios" all the time. And we can talk about these scenarios: "The verbs τιμήσῃ and τιμήσει in 2.4 are parallel, and for this analysis we consider the contents of the `<sic>` element and disregard the contents of the `<corr>` element." "In 1.1--1.2, read μῆνιν, skip over everything else in the line, read οὐλομένην, and ignore the rest."

We can give instructions for analyzing a given text, specifying for each analysis what counts as 'text', what should be ignored, and what the basic units are: line, word, character, 'glyph' (characters and ligatures like 'æ'), or even less clearly defined and more overlapping concepts like "phrase", "clause", "quotation", or even "theme". 

Our goal is to show how this process that human readers do intuitively and that software can do algorithmically, can be done *declaratively* and *generically*.

The goal is to start with a text, of whatever complexity, and allow an open-ended number of analyses of that text that are explicit, unambiguous, and flexible, admitting analyses of small or large chunks of text, non-contiguous passages, inclusion or exclusion of markup according to specified rules. We want these analysis to be, themselves, citable canonically. We want them to align with the text analyzed, and so with each other in any combination. And of course, the point of all of this is to *say something* about the portion of the text we are analyzing: "this is a noun phrase", "this is a metrical foot, a dactyl", &c.

We call this solution ORCA, for OHCO2-Realigned Citable Analyses. It is based on the CTS-URN standard for citation of text, which captures semantics of a text as an Ordered Hierarchy of Citation Objects (OHCH2) [^ohco2].

## Data

**Analyzed Text** This is a CTS-URN, with or without a substring, which may be range, identifying the passage of text analyzed. If the text in question is an XML text contained mixed content, the 'text' here includes **the concatenation of all text-nodes in a citation unit**.

**Analysis Record** This is the CITE-URN identifying uniquely the pairing of analysis+text.

**Analysis** This is a CITE-URN pointing to the analysis being attached to a text. It *may* be identical to the analysis record, 

- When the *analysis* is unique (*e.g.* "The first clause of the *Iliad* in the "msA" edition."), then the `Analysis Record` (a URN) and the `Analysis` (a URN) will be **identical**.
- When the *analysis* is not unique (*e.g.* "verb", or "dactyl"),  the `Analysis Record` (a URN) and the `Analysis` (a URN) will be **different**.
- The *analysis* URN points to an object to which any desired metata may be attached. 

**Analytical Exemplar URN** This is a CTS-URN used to construct an "analytical exemplar", which is a text *derived from the version identified by the Analyzed Text CTS-URN*, with *one additional level of citation-hierarchy*, each of whose leaf-nodes is an analysis, identified by the **Analysis URN** (above). The Analytical Exemplar, when processed into the OHCO2 data model, will act like any other CTS text. The *text content* of each leaf node is…

**Text-Content** This identifies the *text-content* of the leaf-nodes of the analytical exemplar. 

## Result

- You have the original *edition* of the text, with its canonical scheme of citation. *E.g.* The Homeric *Iliad*, edition of the Venetus A, which begins with 1.1: `urn:cts:greekLit:tlg0012.tlg001.msA:1.1` = `<l n='1'>μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος</l>`
- You have an *analytical exemplar* derived from the *edition*. *E.g.* The Homeric *Iliad*, edition of the Venetus A, exemplar tokenized by word. So, `urn:cts:greekLit:tlg0012.tlg001.wt:1.1.1` has *text content* `μῆνιν`, and is *aligned with* `urn:cite:hmt:iliadLexMSA.1`, which might tells us that this object is a "noun", "feminine", "accustive", "singular", from the lemma "μῆνις", or even that it is the direct object of the sentence.
- We can navigate the *exemplar* as we navigate the *edition*, and we can likewise identify or retrieve its citation-units at any level of granularity by URN reference.
- Since the *exemplar* is aligned to the textual content of the *edition*, and all other *exemplars* derived from this *edition* are as well, we have implicit alignment across any analyses that anyone produces for this edition of the text.

# Examples

## Lexical Tokens

> μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος — *Iliad* 1.1

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.1@μῆνιν[1]` |
| Sequence | `1` |
| Analysis Record |	`urn:cite:hmt:lexTokens.1` |
| Analysis | `urn:cite:hmt:lexTokens.1` |
| Analytical Exemplar URN | `urn:cts:greekLit:tlg0012.tlg001.msA.lexTokens:1.1.1` |
| Text-Content | `μῆνιν` | 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.1@ἄειδε[1]` |
| Sequence | `2` |
| Analysis Record |	`urn:cite:hmt:lexTokens.2` |
| Analysis | `urn:cite:hmt:lexTokens.2` |
| Analytical Exemplar URN | `urn:cts:greekLit:tlg0012.tlg001.msA.lexTokens:1.1.2` |
| Text-Content | `ἄειδε` | 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.1@θεὰ[1]` |
| Sequence | `3` |
| Analysis Record |	`urn:cite:hmt:lexTokens.3` |
| Analysis | `urn:cite:hmt:lexTokens.3` |
| Analytical Exemplar URN | `urn:cts:greekLit:tlg0012.tlg001.msA.lexTokens:1.1.3` |
| Text-Content | `θεὰ` | 

## Markup Problems

> μῆν`<unclear>`ιν ἄει`</unclear>`δε θεὰ Πηληϊάδεω Ἀχιλῆος — *Iliad* 1.1

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msN:1.1@μῆν[1]-1.1@ιν[1]` |
| Sequence | `1` |
| Analysis Record |	`urn:cite:hmt:lexTokens.1` |
| Analysis | `urn:cite:hmt:lexTokens.1` |
| Analytical Exemplar URN | `urn:cts:greekLit:tlg0012.tlg001.msN.lexTokens:1.1.1` |
| Text-Content | `μῆνιν` | 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msN:1.1@ἄει[1]-1.1@δε[1]` |
| Sequence | `2` |
| Analysis Record |	`urn:cite:hmt:lexTokens.2` |
| Analysis | `urn:cite:hmt:lexTokens.2` |
| Analytical Exemplar URN | `urn:cts:greekLit:tlg0012.tlg001.msN.lexTokens:1.1.2` |
| Text-Content | `ἄειδε` | 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msN:1.1@θεὰ[1]` |
| Sequence | `3` |
| Analysis Record |	`urn:cite:hmt:lexTokens.3` |
| Analysis | `urn:cite:hmt:lexTokens.3` |
| Analytical Exemplar URN | `urn:cts:greekLit:tlg0012.tlg001.msN.lexTokens:1.1.3` |
| Text-Content | `θεὰ` | 



## Metrical Feet

> μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος — *Iliad* 1.1

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.1@μῆνιν[1]-1.1@ἄ[1]` |
| Sequence | `1` |
| Analysis Record |	`urn:cite:hmt:metricalAnalysis.1` |
| Analysis | `urn:cite:hmt:meter.dactyl` |
| Analytical Exemplar URN | `urn:cts:greekLit:tlg0012.tlg001.msA.feet:1.1.1` |
| Text-Content | `μῆνιν ἄ` | 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.1@ειδε[1]-1.1@θε[1]` |
| Sequence | `2` |
| Analysis Record |	`urn:cite:hmt:metricalAnalysis.2` |
| Analysis | `urn:cite:hmt:meter.dactyl` |
| Analytical Exemplar URN | `urn:cts:greekLit:tlg0012.tlg001.msA.feet:1.1.2` |
| Text-Content | `ειδε θε` | 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.1@ὰ[1]-1.1@Πη[1]` |
| Sequence | `3` |
| Analysis Record |	`urn:cite:hmt:metricalAnalysis.3` |
| Analysis | `urn:cite:hmt:meter.spondee` |
| Analytical Exemplar URN | `urn:cts:greekLit:tlg0012.tlg001.msA.feet:1.1.3` |
| Text-Content | `ὰ Πη` | 


## Syntax Problem

> ἵν᾽ οὔτε φωνὴν οὔτε του μορφὴν βροτῶν — Aeschylus, *PV* 21

For analyzing syntax, it is common to separate certain words, so for οὔτε, the οὔ is treated as an adverb, and the τε as a coordinator. But we don't really want to do violence to the text of our edition, just to serve one particular analysis!

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0085.tlg003:21@οὔτε[1]` |
| Sequence | `N` |
| Analysis Record |	`urn:cite:fu:pvSyntax.45` |
| Analysis | `urn:cite:fu:pvSyntax.45` |
| Analytical Exemplar URN | `urn:cts:greekLit:tlg0085.tlg003.synTok:21.2` |
| Text-Content | `οὔ` | 


| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0085.tlg003:21@οὔτε[1]`	|
| Sequence | `N+1` |
| Analysis Record |	`urn:cite:fu:pvSyntax.46` |
| Analysis | `urn:cite:fu:pvSyntax.46` |
| Analytical Exemplar URN | `urn:cts:greekLit:tlg0085.tlg003.synTok:21.3` |
| Text-Content | `τε` | 


## Clauses

> μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος

> οὐλομένην, ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε,

> πολλὰς δ᾽ ἰφθίμους ψυχὰς Ἄϊδι προΐαψεν

> ἡρώων, αὐτοὺς δὲ ἑλώρια τεῦχε κύνεσσιν

> οἰωνοῖσί τε πᾶσι, Διὸς δ᾽ ἐτελείετο βουλή,

> ἐξ οὗ δὴ τὰ πρῶτα διαστήτην ἐρίσαντε

> Ἀτρεΐδης τε ἄναξ ἀνδρῶν καὶ δῖος Ἀχιλλεύς.

> — *Iliad* 1.1--1.7

The first grammatical clause of the *Iliad* is "μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην,". This includes all of 1.1, and the first part of 1.2. The second is "ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε,", the rest of 1.2.
 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.1-1.2@οὐλομένην[1]`	|
| Sequence | `1` |
| Analysis Record |	`urn:cite:hmt:clauses.1` |
| Analysis | `urn:cite:hmt:clauses.1` |
| Analytical Exemplar URN | `urn:cts:greekLit:tlg0012.tlg001.msA.clauses:1.1.1` |
| Text-Content | `μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην,` | 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.1-1.2@οὐλομένην[1]`	|
| Sequence | `2` |
| Analysis Record |	`urn:cite:hmt:clauses.1` |
| Analysis | `urn:cite:hmt:clauses.1` |
| Analytical Exemplar URN | `urn:cts:greekLit:tlg0012.tlg001.msA.clauses:1.2.1` |
| Text-Content | `μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην,` | 

| Field | Value |
|-------|-------|
| Analyzed Text | `urn:cts:greekLit:tlg0012.tlg001.msA:1.2@ἣ[1]-1.2@ἔθηκε[1]`	|
| Sequence | `3` |
| Analysis Record |	`urn:cite:hmt:clauses.2` |
| Analysis | `urn:cite:hmt:clauses.2` |
| Analytical Exemplar URN | `urn:cts:greekLit:tlg0012.tlg001.msA.clauses:1.2.2` |
| Text-Content | `ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε,` | 

We can unpack this. There are two clauses, identified by the *analysis URNs* `urn:cite:hmt:clauses.1` and `urn:cite:hmt:clauses.2`.

There are three entries in our ORCA record. The first two both have `urn:cite:hmt:clauses.1` as their *Analysis Record* and their *Analysis* (because in this case, the analysis is unique: the first clause of this edition of the *Iliad*.[^notTheSame] 

The **Analytical Exemplar URNs** are the key for understanding why we have two entries for the first clause. This analytical aligment is creating an **exemplar** that is tokenized and citeable according to clauses. The **analytical exemplar URNs**, and the aligned analyses, say:

- The first citable analysis *of* 1.1 is `clauses.1`.
- The first citable analysis *of* 1.2 is `clauses.1`.
- The second citable analysis *of* 1.2 is `clauses.2`.

If we were to navigate our *exemplar* via a CTS service, the following URNs would return the following text-content:

| Exemplar CTS-URN | Text-Content |
|-----|-----|
| `urn:cts:…msA.clauses:1.1.1` | μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην, |
| `urn:cts:…msA.clauses:1.1` | μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην, |
| `urn:cts:…msA.clauses:1.2.1` | μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην, |
| `urn:cts:…msA.clauses:1.2.2` | ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε, |
| `urn:cts:…msA.clauses:1.2` | μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην, ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε, |
| `urn:cts:…msA.clauses:1.1.1-1.2.1` | μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην, |
| `urn:cts:…msA.clauses:1.1-1.2` | μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος οὐλομένην, ἣ μυρί᾽ Ἀχαιοῖς ἄλγε᾽ ἔθηκε, |

If we were to submit a `getNextUrn` request to the CTS Service, we would get the following results:

| Input URN | Result of `getNextUrn` |
|-----|-----|
| `urn:cts:…msA.clauses:1.1.1` | next = `urn:cts:…msA.clauses:1.2.2` |
| `urn:cts:…msA.clauses:1.2.1` | next = `urn:cts:…msA.clauses:1.2.2` |
| `urn:cts:…msA.clauses:1.1` | next = `urn:cts:…msA.clauses:1.2` |


[^notTheSame]: An example where the *analysis* and the *analysis record* would have different URNs might be an analysis of personal names. We might choose to analyze "Πηληϊάδεω" and "Ἀχιλῆος" individually. Each would have a unique *analysis record*, but each would bye *analyzed* the same CITE-URN, identifying an entity that is "Achilles, son of Peleus, hero of the Trojan War in Homeric Epic."


## Non-contiguous Text

> ὑπὸ δὲ τοῦ Μελίσσου καὶ Περικλέα φησὶν αὐτὸν Ἀριστοτέλης ἡττηθῆναι ναυμαχοῦντα πρότερον --- Plut. *Per.* 26.3

| Field | Value |
|-------|-------|
| Sequence | `N` |
| Analysis Record |	`urn:cite:histfragDipl:arist.577` |
| Analysis | `urn:cite:histfrag:arist.577` |
| Analyzed Text | `urn:cts:greekLit:tlg0007.tlg012.perseus-grc1:26.3@ὑπὸ[1]-26.3@πρότερον[1]`
| Analytical Exemplar URN | `urn:cts:greekLit:tlg0007.tlg012.perseus-grc1.histfrag:26.3.1` |
| Text-Content | `ὑπὸ δὲ τοῦ Μελίσσου καὶ Περικλέα αὐτὸν ἡττηθῆναι ναυμαχοῦντα πρότερον` | 

In this example, we *analyze* a string of text from our Edition, associating it with an Analysis URN that identifies an instance of text-reuse. For the **text-content** of our analytical exemplar, however, we choose to omit the *verbum dicendi* ("φησὶν"), which is not actually part of the quotation. We have not damaged our Edition, but we can present our analysis of quotation *as we choose*, and attach commentary, *vel sim.*, to the object pointed to by the Analysis URN.

While one editor might be content to remove the *verbum dicendi* from the passage, another might want to analyze this text of Plutarch by promoting the quotation to direct speech. The *text content* of the Exemplar is a matter for editorial judgement. That editor's analysis would look like this:

| Field | Value |
|-------|-------|
| Sequence | `N` |
| Analysis Record |	`urn:cite:histfragNormal:arist.577` |
| Analysis | `urn:cite:histfrag:arist.577` |
| Analyzed Text | `urn:cts:greekLit:tlg0007.tlg012.perseus-grc1:26.3@ὑπὸ[1]-26.3@πρότερον[1]`
| Analytical Exemplar URN | `urn:cts:greekLit:tlg0007.tlg012.perseus-grc1.histfragNormal:26.3.1` |
| Text-Content | `ὑπὸ δὲ τοῦ Μελίσσου καὶ Περικλῆς αὐτὸς ἡττήθη ναυμαχῶν πρότερον` | 


### Analysis-Object

The **Analysis URN** may exist only to give a unique identifier to the analysis, or it may point to a CITE object with various fields. A CITE Object record for the example above might look like this:

| URN | `urn:cite:histfrag:arist.577` |
|-----|-----|
| Type |  "Quotation" |
| Genre | "Prose" |
| Source | "Aristotle" |
| Auth |  M. Berti |
| Date |  ??? |
| Notes | "…" |	

## Generating this Data & Processing it into CITE Collections and CTS Texts

**There are no generic analyses.** Every specific analysis of each text is going to be unique. Any project that has undertaken even the simplest kind of tokenization knows how quickly it becomes necessary to make editorial decisions. For the *Homer Multitext* and work on editions of Aeschylus at Furman University, we have scripts that generate specific tokenizations. For the paleographic work on the *Homer Multitext* we rely on human editors to define characters, glyphs, abbreviations, and so forth, on our Homeric manuscripts. Some analyzes can be generated from elements in a TEI-XML text (our personal-names analyses for the *HMT* texts is one example).

Generally, there are ways to automated parts of the process, such as generating analysys-URNs in sequence for a table of analyses. We indend to supplement our CTS utlities along that lines that Bridget Almas has already demonstrated, to make it easier to select passages of "analyzed text" from an Edition.  

Each of the examples above can be represented by a tab- or comma-delimited text file. This can then be processed to generate a CITE collection and the necessary RDF to include the Analytical Exemplar in a CTS library.

We are working on incorporating these scripts to turn ORCA records into fully processed CITE and CTS data. These will be integrated into our CITE Manager utility: [https://github.com/cite-architecture/citemgr](https://github.com/cite-architecture/citemgr).


## Notes, Apothegmata, &c.

> "There are no generic analyses." --- N. Smith

> "Good scholarship abstracts concrete algorithmic description of procedures with definitive declarative statements." --- N. Smith

> "CTS URNs can *identify* a text using the substring annotation "@…", but *retrieval* is by citation alone."

[^cite]: Smith, D. Neel, and Christopher Blackwell. “Four URLs, Limitless Apps: Separation of Concerns in the Homer Multitext Architecture.” The Center for Hellenic Studies, L. Muellner, Ed. *Donum Natalicium Digitaliter Confectum Gregorio Nagy Septuagenario a Discipulis Collegis Familiaribus Oblatum (A Virtual Birthday Gift Presented to Gregory Nagy on Turning Seventy by His Students, Colleagues, and Friends)* Édition, 2012. [[http://folio.furman.edu/projects/cite/four_urls.html](http://folio.furman.edu/projects/cite/four_urls.html). Blackwell, Christopher, and Smith, Neel. *The CTS Protocol Specification* (version 5.0). Center for Hellenic Studies Technical Documentation, 2014. [http://www.homermultitext.org/hmt-docs/specifications/cts/](http://www.homermultitext.org/hmt-docs/specifications/cts/). ———. *The CTS URN Specification* (version 5.0). Center for Hellenic Studies Technical Documentation, 2014. [http://www.homermultitext.org/hmt-docs/specifications/ctsurn/](http://www.homermultitext.org/hmt-docs/specifications/ctsurn/).

[^ohco2]: Smith, D. Neel, and Gabriel Weaver. “Applying Domain Knowledge from Structured Citation Formats to Text and Data Mining: Examples Using the CITE Architecture.” *Text Mining Services*, 2009, 129.
