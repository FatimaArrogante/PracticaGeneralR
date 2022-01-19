# Práctica General
# Autora: Fátima Arrogante Funes
# Fecha: Lunes, 17 de enero de 2022

# Instalar librería palmerpenguins
install.packages("palmerpenguins")

# Llamar librerías
library(palmerpenguins)
library(ggplot2)
library(dplyr)

# Datos y visualización
data(penguins, package = 'palmerpenguins')
summary(penguins)

# Apartado 1: (1) Número de individuos totales, masculinos y femeninos por especie. 
# La media, desviación estándar, valor mínimo y máximo de la longitud y profundidad del pico, 
# la longitud de la aleta y el tamaño.

# Eliminar NA
df <-na.omit(penguins)

# (1) - Resolución
penguins |> # pipe para que vuelva sobre penguins
  group_by(species, sex) |>
  count()

# (2) - Resolución
summarise(df,mean_bill_length_mm = mean(bill_length_mm), 
          mean_bill_depth_mm = mean(bill_depth_mm),
          mean_flipper_length_mm = mean(flipper_length_mm),
          mean_body_mass_g = mean(body_mass_g), # mean para averiguar la media
          sd_bill_length_mm = sd(bill_length_mm),
          sd_bill_depth_mm = sd(bill_depth_mm),
          sd_flipper_length_mm = sd(flipper_length_mm),
          sd_body_mass_g = sd(body_mass_g), # sd para averiguar la desviación típica
          max_bill_length_mm = max(bill_length_mm),
          max_bill_depth_mm = max(bill_depth_mm),
          max_flipper_length_mm = max(flipper_length_mm),
          max_body_mass_g = max(body_mass_g), # max para averiguar el máximo
          min_bill_length_mm = min(bill_length_mm),
          min_bill_depth_mm = min(bill_depth_mm),
          min_flipper_length_mm = min(flipper_length_mm),
          min_body_mass_g = min(body_mass_g) # min para averiguar el mínimo
          )
# Apartado 2: (2) Un gráfico de barras que represente el número de individuos muestreados de cada especie en cada isla, 
# representando las especies en diferentes colores (chinstrap - morado, gentoo - azul, adelie - naranja). Contesta a las 
# siguientes preguntas: ¿qué especie se ha muestreado en las tres islas? ¿cuántos individuos se han muestreado de la isla 
# Dream?

colores <- list(Chinstrap= "purple", 
                Gentoo = "blue", 
                Adelie = "orange")

graficoBarras <- ggplot(data = penguins) +
  geom_bar(aes(x = island, fill = species)) + 
             scale_fill_manual(values = colores)
grafico



# Especie muestreada en cada isla: Adelie

# Otra prueba
penguins |>
  select(island) |> 
  group_by(island) |>
  count()

# Se han muestreado 124 individuos en la isla dream

# Apartado 3: (3) Un gráfico multipanel de cajas y bigotes del tamaño de los pingüinos según su sexo, donde aparezca un
# panel para cada especie. Contesta a las siguientes preguntas: ¿qué especie tiene mayor tamaño? ¿en qué especie las hembras
# y los machos tienen un tamaño más similar?

graficoMultipanel <- ggplot(data = df) +
  geom_boxplot(aes(x = sex, y = body_mass_g)) + 
  facet_grid(cols = vars(species))

graficoMultipanel
