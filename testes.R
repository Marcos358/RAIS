library(dplyr)
library(tidyr)

# setwd("D:/User/B39256/Documents/RAIS/github")

# load(file="RJ2015.Rda")
# rj2015 <- RJ2015
# save(rj2015, file="RJ2015.rda")

load(file="RJ2015.Rda")
colunas <- c("Município",
             "Tamanho Estabelecimento",
             "Ind CEI Vinculado",
             "Ind Simples","IBGE Subsetor",
             "CNAE 2.0 Classe",
             "CNAE 95 Classe")

data <- rj2015[,colunas]
save(data, file="rj2015_select.rda")


# Contar empresas por tamanho e Ind Simples
contagem_simples_larga <- data %>%
  group_by(`Tamanho Estabelecimento`, `Ind Simples`) %>%
  summarise(quantidade = n(), .groups = "drop") %>%
  pivot_wider(
    names_from = `Ind Simples`,
    values_from = quantidade,
    names_prefix = "Simples_",
    values_fill = 0  # Preenche com zero onde não houver observações
  ) %>%
  arrange(`Tamanho Estabelecimento`)




