# Gene Regulatory Network (GRN) Inference Project

In this project, we attempt to infer gene regulatory networks from expression data. We obtained the expression data from the [MERLIN+P project](https://github.com/Roy-lab/merlin-p_inferred_networks) (Citation needed). 
<br>

# Pipeline Execution (Main Notebook)
This file is a file to run the whole pipeline according to discussion on Dec. 12
<br>
Procedure:
1. Pre-process data: Only use TF that are in gold standard, as discussed in class, prepare scores df
2. For each model, predict GRN edges (with scores), using optimum hyperparameter, then standardize weights, compile each score to a 'score' table, with columns sources of score (including uniform scores from random clf) and index the edges
3. Visualize PRC and ROC for each method for full nv dataframe
4. Statistically examine each method by randomly selecting target edges, getting the mean auprc, auroc and stdev, conduct statistical tests.



