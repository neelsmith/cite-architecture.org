---
title: OHCO2-Realigned Collections of Analyses
layout: page
---


## Aligning texts and analyses in the CITE architecture ##


Every systematic analysis of a text breaks up the text in chunks, or tokens.  It is natural to keep these analyses in a CITE Collection ordered by the document order of the analyzed text.  Since the sequential analyses can be aligned with the chunks of text they analyze, it is possible to think of the chunks as a further level of citation hierarchy, parsing the leaf nodes of the citation hierarchy.

A systematic analysis has to apply to a specific version (edition or translation) of a text, and the further level of citation only exists in the specific handling of the text given by this analysis.  We can imagine this specific handling as the digital equivalent of a the specific handling an individual physical instance of a version undergoes, and treat the analysis in the same way we would treat the individual specific copy:  as an exemplar in the work hierarchy of the CITE URN.   The ORCA model interprets an ordered collection of analyses as an exemplar of a version that adds a further level to the version's citation hierarhy.


## The ORCA service ##

The ORCA service is not yet formally specified.  It is a new, experiemental service for working with analytical collections that have been aligned with the OHCO2 model of the text analyzed.  The following summary lists requests recognized by the current service.

In the following summary,  `analysis` and `analysisFilter` represent  CITE URNs, `passage` and `passageFilter` represent CTS URNs.

THe ORCA service defines the following requests.

To find lists of passages or analysis:

- `findPassages(analysis)`, `findPassages(analysis, passageFilter)`
- `findAnalyses(passage)`, `findPassages(passage, analysisFilter)`

To count the size of lists of passages or analysis:

- `countPassages(analysis)`, `countPassages(analysis, passageFilter)`
- `countAnalyses(passage)`, `countAnalyses(passage, analysisFilter)`

To find and count distinct values for analyses:

- `findDistinctAnalyses(analysis)`, `findDistinctAnalyses(analysis, passagFilter)`
- `countDistinctAnalyses(analysis)`, `countDistinctAnalyses(analysis, passagFilter)`



