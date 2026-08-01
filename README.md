# Automated & Containerized RNA-Seq Analysis Pipeline

[![Nextflow](https://img.shields.io/badge/Nextflow-%E2%89%A523.04.0-brightgreen.svg)](https://www.nextflow.io/)
[![Docker](https://img.shields.io/badge/Docker-Ready-blue.svg)](https://www.docker.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A scalable, fully reproducible, and containerized bioinformatics workflow for bulk RNA-Seq processing, quantification, and differential expression analysis. Designed for seamless execution across HPC clusters and cloud infrastructure (AWS/GCP).

---

## 🔬 Workflow Architecture

```text
[Raw FASTQ Reads]
       │
       ├──► FastQC ──► Quality Control Metrics
       │
       ├──► Salmon ──► Transcript Quantification
       │
       └──► DESeq2 (R) ──► Differential Expression ──► [Interactive HTML Report]


       Key Features
100% Reproducible Environment: Fully integrated with Docker, Singularity, and Conda/Mamba.

Modern Architecture: Built using Nextflow DSL2 with modular execution components.

Turnkey Reporting: Automatically outputs interactive quality control reports (MultiQC) and publication-ready statistical figures (results/report.html).

Cloud & HPC Ready: Pre-configured profiles for local workstations, AWS Batch, and SLURM clusters.

🛠️ Tech Stack & Dependencies
Workflow Manager: Nextflow

Containerization: Docker / Singularity

Package Management: Conda / Bioconda

Core Tools: FastQC, MultiQC, Salmon

Statistical Analysis: R (DESeq2, ggplot2, pheatmap)

🚀 Quick Start
Prerequisites
Ensure you have Nextflow and either Docker or Conda installed on your machine.
Clone the repository
Bash
git clone [https://github.com/micatperez10-source/rnaseq-nextflow-pipeline.git](https://github.com/micatperez10-source/rnaseq-nextflow-pipeline.git)
cd rnaseq-nextflow-pipeline
2. Execute Pipeline with Conda Profile
Bash
nextflow run workflow/main.nf -profile conda
3. Execute Pipeline with Docker Profile
Bash
nextflow run workflow/main.nf -profile docker
📊 Sample Output & Deliverables
The pipeline generates an isolated results/ directory containing:

results/fastqc/: Raw data quality reports.

results/multiqc/: Consolidated quality metrics.

results/report.html: Interactive summary report for biological assessment and differential expression visualization.

📩 Contact & Consulting Services
Need custom pipeline engineering, legacy workflow modernization, or large-scale genomic data analysis?

I specialize in building reproducible data infrastructure and clearing bioinformatics backlogs for biotech teams and academic laboratories.

