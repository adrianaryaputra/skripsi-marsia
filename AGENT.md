# Repo Brief

This repository is a LaTeX thesis project, not an application codebase.

- Thesis title: `Strategi Pemasaran Rumah Makan Nasi Gerilya pada Platform GrabFood untuk Meningkatkan Penjualan Berdasarkan Analisis SWOT`
- Author: `Marsia Br Pelawi`
- Program: `S1 Manajemen, Universitas Sumatera Utara`
- Main writing language: `Bahasa Indonesia`
- Main research object: `Rumah Makan Nasi Gerilya` in Medan, with focus on `GrabFood` as a marketing and sales channel.

# Primary Entry Points

- Full thesis build: `main.tex`
- Proposal build: `proposal.tex`
- Bibliography source: `referensi.bib`
- Metadata and title setup: `metadata/skripsi.tex`

`main.tex` includes:

- frontmatter
- Chapters I-V
- bibliography
- 5 active appendices: `01`, `02`, `03`, `11`, `12`

`proposal.tex` is a reduced build that only includes Chapters I-III plus early appendices.

# Fastest Way To Understand The Thesis

Read these files in this order:

1. `metadata/skripsi.tex`
2. `metadata/abstrak-id.tex`
3. `main.tex`
4. `chapters/01-pendahuluan.tex`
5. `chapters/02-tinjauan-pustaka.tex`
6. `chapters/03-metodologi-penelitian.tex`
7. `chapters/04-hasil-dan-pembahasan.tex`
8. `chapters/05-penutup.tex`
9. `appendices/02-wawancara-awal-pemilik-nasi-gerilya.tex`
10. `appendices/03-dokumentasi-indeks-kinerja-nasi-gerilya-dan-kompetitor-grabfood.tex`
11. `appendices/01-observasi-grabfood-nasi-gerilya-dan-kompetitor.tex`

Important shortcut:

- `frontmatter/abstrak-id.tex` and `frontmatter/abstract-en.tex` are only wrappers.
- The actual abstract content lives in `metadata/abstrak-id.tex` and `metadata/abstract-en.tex`.

# Thesis In One Page

## Core topic

The thesis studies how `Nasi Gerilya` should improve its marketing strategy on `GrabFood` to support sales growth, using `SWOT` as the main analytical framework.

## Main problem

The thesis is driven by several linked issues:

- sales on GrabFood are not stable
- repeat orders have declined
- there are customer complaints
- competition from similar Padang food merchants on GrabFood is strong

The practical issue is not only visibility. The bigger issue is that digital traffic and promo activity do not automatically produce stable conversion, repeat purchase, and service consistency.

## Research goals

The thesis aims to:

1. identify internal factors: strengths and weaknesses
2. identify external factors: opportunities and threats
3. formulate marketing strategies through SWOT

## Method

- approach: `descriptive qualitative`
- main analysis: internal/external factor identification, `IFAS`, `EFAS`, then `SWOT`
- sources used in Bab IV:
  - employee interviews
  - intern business consultant interview
  - competitor interviews
  - customer questionnaire responses
  - GrabFood observation
  - performance documentation
  - pra-survey data as supporting context

## Theory and analysis stack

The thesis uses:

- marketing strategy concepts
- `STP`
- service marketing mix `7P`
- digital marketing / online food delivery context
- internal and external environment analysis
- `SWOT`
- `IFAS` and `EFAS`

## Main direction of findings

The thesis argues that `Nasi Gerilya` already has strong points in:

- product taste
- large portions
- digital reputation on GrabFood
- promo usage
- willingness to improve through internal digital systems

Its main weaknesses are concentrated in `process`, especially:

- packing accuracy during peak hours
- multi-channel queue handling
- stock updates
- separated items or add-ons being missed
- price perception when no promo is active

Main opportunities:

- workers, students, and nearby practical-meal segments
- vouchers and promo mechanics
- better digital menu presentation
- loyalty via stamp digital / customer database

Main threats:

- strong competitors
- customer sensitivity to price, fees, and promo comparison
- platform costs and raw material increases
- negative reviews caused by service errors

The thesis conclusion is that service-process improvement should come before expanding promotion.

## Final strategic direction already written in the thesis

Priority recommendations in Bab IV-V are:

1. strengthen cross-channel queue flow, packing checklist, and peak-hour SOP
2. create segmented hero packages around leading menu items
3. improve GrabFood storefront clarity and digital menu presentation
4. align promo with stock, kitchen capacity, HPP, and margin
5. activate stamp digital / direct customer database for repeat order

# Evidence Map

## Main writing files

- `chapters/01-pendahuluan.tex`: problem, objectives, scope
- `chapters/02-tinjauan-pustaka.tex`: theory, prior studies, conceptual frame
- `chapters/03-metodologi-penelitian.tex`: method and analysis flow
- `chapters/04-hasil-dan-pembahasan.tex`: main findings, coding summaries, SWOT, IFAS/EFAS, strategy priorities
- `chapters/05-penutup.tex`: conclusions, suggestions, limitations

## Key appendices used in the active thesis build

- `appendices/01-observasi-grabfood-nasi-gerilya-dan-kompetitor.tex`
- `appendices/02-wawancara-awal-pemilik-nasi-gerilya.tex`
- `appendices/03-dokumentasi-indeks-kinerja-nasi-gerilya-dan-kompetitor-grabfood.tex`
- `appendices/11-evidence-observasi-grabfood-20260613.tex`
- `appendices/12-evidence-observasi-grabfood-kompetitor-20260619.tex`

## Resource folders that matter most

- `resource/00-index/README.md`: structure and naming conventions for evidence files
- `resource/05-fieldwork/README.md`: map of primary fieldwork data
- `resource/06-analysis/README.md`: map of post-fieldwork analysis outputs
- `resource/05-fieldwork/07-rekap-koding/W-INT-20260704-koding-temuan-lapangan-lengkap.md`: main coded findings source
- `resource/06-analysis/RESOURCE-20260705-status-kelengkapan-analisis.md`: evidence completeness and gap summary
- `resource/06-analysis/THESIS-20260705-resource-to-skripsi-integration-audit.md`: what resource has already been integrated into the thesis

## Supporting but non-core workspace

- `scratch/` is for temporary/admin/guidance/draft material
- do not treat `scratch/` as primary research evidence unless a file has clearly been promoted into `resource/`

# Claim Guardrails

When editing thesis content, preserve the current evidence limits.

Do not overclaim these points:

- do not say the strategy has already proven a quantified sales increase
- do not generalize limited customer responses as representing all customers
- do not imply competitor interviews cover the whole market
- do not present older pra-survey evidence as if it were the newest primary fieldwork

Preferred wording for uncertain or limited claims:

- `berdasarkan data yang tersedia`
- `mengindikasikan`
- `berpotensi`
- `perlu divalidasi dengan data lanjutan`

Known evidence gaps called out by the repo itself:

- no latest main owner interview in the final fieldwork set
- no newest sales dataset proving post-strategy impact
- customer respondent count is limited
- competitor interviews are not comprehensive

# Build Notes

Known build facts from repo documentation:

- `latexmk -pdf` was reported as successful in the audit dated `2026-07-05`
- the audit says `main.pdf` compiled successfully with no broken LaTeX references at that time
- direct build in the repo root can fail when output files are locked or stale build artifacts are present

If you need to build:

1. prefer `./build.ps1 -Target all` after thesis edits
2. use `./build.ps1 -Target main` for the full thesis only
3. use `./build.ps1 -Target proposal` for the proposal version only
4. use direct `latexmk -pdf` in the repo root only if there is a specific reason and the output files are not locked

`build.ps1` works by copying the repo to an isolated temporary workspace, compiling there, then copying back the generated `PDF` and `BBL` files when possible. This avoids common failures from locked files such as `main.run.xml` or `proposal.pdf`.

# User Preferences

- Main interaction language should follow the thesis context: prefer `Bahasa Indonesia` in explanations to the user unless the user asks otherwise.
- When revising thesis content, keep the writing style consistent with the existing thesis prose.
- After every substantive edit to the thesis source, compile the relevant PDF before reporting completion.
- If compilation in the repo root fails because of file locks, use `build.ps1` and report the resulting PDF path if the file cannot be copied back.

# Working Guidance For Future Agents

- Start from `metadata/abstrak-id.tex` and `chapters/05-penutup.tex` if you need a 2-minute summary.
- Start from `chapters/04-hasil-dan-pembahasan.tex` if the task is about substance, evidence, SWOT, or conclusions.
- Start from `resource/06-analysis/*.md` if the task is about traceability, evidence readiness, or claim boundaries.
- Start from `main.tex` if the task is about document structure, included chapters, or active appendices.
- If asked to revise academic content, keep the current qualitative tone and the explicit limitation that recommendations are strategic proposals, not causal proof of increased sales.
- If a change affects thesis text, verify both content and build outcome before closing the task.
