# install.packages("gravity")
library("gravity")
setwd("C:/Users/spran/Downloads")
data <- read.csv("final_data.csv")
data2 <- data[complete.cases(data),]

fit_ppml = ppml(
  dependent_variable = "tradeflow",
  distance = "distance",
  additional_regressors = c("log_gdp_exporter", "log_gdp_importer", "tariff", "non_tariff_barriers_exporter", "non_tariff_barriers_importer", "adjacent", "language", "trade_creation_cptpp",  "trade_creation_rcep", "trade_diversion_rcep", "trade_diversion_cptpp", "exporter_dummy_1", "importer_dummy_1", "exporter_dummy_2", "importer_dummy_2", "exporter_dummy_3", "importer_dummy_3", "exporter_dummy_4", "importer_dummy_4", "exporter_dummy_5", "importer_dummy_5", "exporter_dummy_6", "importer_dummy_6", "exporter_dummy_7", "importer_dummy_7", "exporter_dummy_8", "importer_dummy_8", "exporter_dummy_9", "importer_dummy_9", "exporter_dummy_10", "importer_dummy_10", "exporter_dummy_11", "importer_dummy_11", "exporter_dummy_12", "importer_dummy_12", "exporter_dummy_13", "importer_dummy_13", "exporter_dummy_14", "importer_dummy_14", "exporter_dummy_15", "importer_dummy_15", "exporter_dummy_16", "importer_dummy_16"),
  robust = TRUE,
  data = data2
)
summary(fit_ppml)

fit_nls <- nls(
  dependent_variable = "log_tradeflow",
  distance = "distance",
  additional_regressors = c("log_gdp_exporter", "log_gdp_importer", "log_tariff", "log_non_tariff_barriers_exporter", "log_non_tariff_barriers_importer", "adjacent", "language", "trade_creation_cptpp", "trade_creation_rcep", "trade_diversion_rcep", "trade_diversion_cptpp", "exporter_dummy_1", "importer_dummy_1", "exporter_dummy_2", "importer_dummy_2", "exporter_dummy_3", "importer_dummy_3", "exporter_dummy_4", "importer_dummy_4", "exporter_dummy_5", "importer_dummy_5", "exporter_dummy_6", "importer_dummy_6", "exporter_dummy_7", "importer_dummy_7", "exporter_dummy_8", "importer_dummy_8", "exporter_dummy_9", "importer_dummy_9", "exporter_dummy_10", "importer_dummy_10", "exporter_dummy_11", "importer_dummy_11", "exporter_dummy_12", "importer_dummy_12", "exporter_dummy_13", "importer_dummy_13", "exporter_dummy_14", "importer_dummy_14", "exporter_dummy_15", "importer_dummy_15", "exporter_dummy_16", "importer_dummy_16"),
  data = data2
)
summary(fit_nls)