# Script for getting anova and tukey test between the sampled AUPRC and AUROC

roc_sampling = read.csv('/Users/daveistanto/Documents/grn_inference_project/dataset/auroc_sampling_scores.csv')
prc_sampling = read.csv('/Users/daveistanto/Documents/grn_inference_project/dataset/auprc_sampling_scores.csv')


# Check for normality, use shapiro wilk test H0: sampling from normally distributed population
shapiro.test(roc_sampling$Lasso)
shapiro.test(roc_sampling$Regforest)
shapiro.test(roc_sampling$SVR)
shapiro.test(roc_sampling$Standardized.Lasso)
shapiro.test(roc_sampling$Standardized.Regforest)
shapiro.test(roc_sampling$Standardized.SVR)
boxplot(roc_sampling)

shapiro.test(prc_sampling$Lasso)
shapiro.test(prc_sampling$Regforest)
shapiro.test(prc_sampling$SVR)
shapiro.test(prc_sampling$Standardized.Lasso)
shapiro.test(prc_sampling$Standardized.Regforest)
shapiro.test(prc_sampling$Standardized.SVR)
boxplot(prc_sampling)

# ANOVA FOR ROC
roc_new_df = data.frame()

# Non standardized
roc_new_df = rbind(roc_new_df, data.frame(roc_sampling$Lasso, rep('Lasso', 100)))
colnames(roc_new_df) = c('AUROC', 'Source')

temp_df = data.frame(roc_sampling$Regforest, rep('Regforest', 100))
colnames(temp_df) = c('AUROC', 'Source')
roc_new_df = rbind(roc_new_df, temp_df)

temp_df = data.frame(roc_sampling$SVR, rep('SVR', 100))
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


roc_aov = aov(AUROC ~ Source, data=roc_new_df)

library(agricolae)
summary(roc_aov)
HSD.test(roc_aov, "Source", group = TRUE, console=TRUE)

####################

# ANOVA FOR PRC
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


prc_aov = aov(AUPRC ~ Source, data=prc_new_df)

summary(roc_aov)
HSD.test(prc_aov, "Source", group = TRUE, console=TRUE)


