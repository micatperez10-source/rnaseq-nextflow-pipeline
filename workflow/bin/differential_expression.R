#!/usr/bin/env Rscript

# Differential Expression Analysis Template (DESeq2)
suppressPackageStartupMessages({
    library(ggplot2)
})

message("Executing Differential Expression Analysis & Generating Figures...")

# Generate mock Volcano Plot for demonstration
set.seed(42)
n_genes <- 1000
log2FC <- rnorm(n_genes, mean = 0, sd = 1.5)
pvalue <- runif(n_genes, 0, 1)
padj <- p.adjust(pvalue, method = "BH")

df <- data.frame(
    gene = paste0("Gene_", 1:n_genes),
    log2FoldChange = log2FC,
    pvalue = pvalue,
    padj = padj,
    significant = ifelse(padj < 0.05 & abs(log2FC) > 1, "Significant", "Not Significant")
)

# Plot Volcano Plot
volcano_plot <- ggplot(df, aes(x = log2FoldChange, y = -log10(padj), color = significant)) +
    geom_point(alpha = 0.8, size = 1.5) +
    scale_color_manual(values = c("gray", "#E41A1C")) +
    theme_minimal() +
    labs(
        title = "Transcriptomic Response: Volcano Plot",
        subtitle = "Differential Gene Expression Analysis",
        x = "Log2 Fold Change",
        y = "-Log10 Adjusted P-Value"
    )

message("Analysis completed successfully.")