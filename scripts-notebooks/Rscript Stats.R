# Script for getting anova and tukey test between the sampled AUPRC and AUROC

roc_sampling = read.csv('/Users/daveistanto/Documents/grn_inference_project/dataset/auroc_sampling_scores.csv')
prc_sampling = read.csv('/Users/daveistanto/Documents/grn_inference_project/dataset/auprc_sampling_scores.csv')

# Non standardized
roc_new_df = data.frame()

roc_new_df = rbind(roc_new_df, data.frame(roc_sampling$Lasso, rep('Lasso', 100)))
colnames(roc_new_df) = c('AUROC', 'Source')

temp_df = data.frame(roc_sampling$Regforest, rep('Regforest', 100))
colnames(temp_df) = c('AUROC', 'Source')
roc_new_df = rbind(roc_new_df, temp_df)

temp_df = data.frame(roc_sampling$SVR, rep('SVR', 100))
colnames(temp_df) = c('AUROC', 'Source')
roc_new_df = rbind(roc_new_df, temp_df)

temp_df = data.frame(roc_sampling$Regforest.10k, rep('Regforest 10k', 100))
colnames(temp_df) = c('AUROC', 'Source')
roc_new_df = rbind(roc_new_df, temp_df)

# Standardized
temp_df = data.frame(roc_sampling$Standardized.Lasso, rep('Standardized.Lasso', 100))
colnames(temp_df) = c('AUROC', 'Source')
roc_new_df = rbind(roc_new_df, temp_df)

temp_df = data.frame(roc_sampling$Standardized.Regforest, rep('Standardized.Regforest', 100))
colnames(temp_df) = c('AUROC', 'Source')
roc_new_df = rbind(roc_new_df, temp_df)

temp_df = data.frame(roc_sampling$Standardized.SVR, rep('Standardized.SVR', 100))
colnames(temp_df) = c('AUROC', 'Source')
roc_new_df = rbind(roc_new_df, temp_df)

temp_df = data.frame(roc_sampling$Standardized.Regforest.10k, rep('Standardized.Regforest.10k', 100))
colnames(temp_df) = c('AUROC', 'Source')
roc_new_df = rbind(roc_new_df, temp_df)

# Kruskal wallis and dunn test
library(FSA)
library(rcompanion)

## For raw
kruskal.test(AUROC ~ Source, data = roc_new_df[1:400,])
DT = dunnTest(AUROC ~ Source, data = roc_new_df[1:400,], method='bh')
cldList(P.adj ~ Comparison, data = DT$res, threshold = 0.05)

## For standardized
kruskal.test(AUROC ~ Source, data = roc_new_df[401:800,])
DT = dunnTest(AUROC ~ Source, data = roc_new_df[401:800,], method='bh')
cldList(P.adj ~ Comparison, data = DT$res, threshold = 0.05)

####################

# Kruskal Wallis for PRC
prc_new_df = data.frame()

# Non standardized
prc_new_df = rbind(prc_new_df, data.frame(prc_sampling$Lasso, rep('Lasso', 100)))
colnames(prc_new_df) = c('AUPRC', 'Source')

temp_df = data.frame(prc_sampling$Regforest, rep('Regforest', 100))
colnames(temp_df) = c('AUPRC', 'Source')
prc_new_df = rbind(prc_new_df, temp_df)

temp_df = data.frame(prc_sampling$SVR, rep('SVR', 100))
colnames(temp_df) = c('AUPRC', 'Source')
prc_new_df = rbind(prc_new_df, temp_df)

temp_df = data.frame(prc_sampling$Regforest.10k, rep('Regforest.10k', 100))
colnames(temp_df) = c('AUPRC', 'Source')
prc_new_df = rbind(prc_new_df, temp_df)

# Standardized
temp_df = data.frame(prc_sampling$Standardized.Lasso, rep('Standardized.Lasso', 100))
colnames(temp_df) = c('AUPRC', 'Source')
prc_new_df = rbind(prc_new_df, temp_df)

temp_df = data.frame(prc_sampling$Standardized.Regforest, rep('Standardized.Regforest', 100))
colnames(temp_df) = c('AUPRC', 'Source')
prc_new_df = rbind(prc_new_df, temp_df)

temp_df = data.frame(prc_sampling$Standardized.SVR, rep('Standardized.SVR', 100))
colnames(temp_df) = c('AUPRC', 'Source')
prc_new_df = rbind(prc_new_df, temp_df)

temp_df = data.frame(prc_sampling$Standardized.Regforest.10k, rep('Standardized.Regforest.10k', 100))
colnames(temp_df) = c('AUPRC', 'Source')
prc_new_df = rbind(prc_new_df, temp_df)

# Kruskal wallis and dunn test
## For raw
kruskal.test(AUPRC ~ Source, data = prc_new_df[1:400,])
DT = dunnTest(AUPRC ~ Source, data = prc_new_df[1:400,], method='bh')
cldList(P.adj ~ Comparison, data = DT$res, threshold = 0.05)

## For standardized
kruskal.test(AUPRC ~ Source, data = prc_new_df[401:800,])
DT = dunnTest(AUPRC ~ Source, data = prc_new_df[401:800,], method='bh')
cldList(P.adj ~ Comparison, data = DT$res, threshold = 0.05)
