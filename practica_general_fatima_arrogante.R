# Pr�ctica General
# Autora: F�tima Arrogante Funes
# Fecha: Lunes, 17 de enero de 2022

# Instalar librer�a palmerpenguins
install.packages("palmerpenguins")

# Llamar librer�as
library(palmerpenguins)
library(ggplot2)
library(dplyr)

# Datos y visualizaci�n
data(penguins, package = 'palmerpenguins')
summary(penguins)

# Apartado 1: (1) N�mero de individuos totales, masculinos y femeninos por especie. 
# La media, desviaci�n est�ndar, valor m�nimo y m�ximo de la longitud y profundidad del pico, 
# la longitud de la aleta y el tama�o.

# Eliminar NA
df <-na.omit(penguins)

# (1) - Resoluci�n
penguins |> # pipe para que vuelva sobre penguins
  group_by(species, sex) |>
  count()

# (2) - Resoluci�n
summarise(df,mean_bill_length_mm = mean(bill_length_mm), 
          mean_bill_depth_mm = mean(bill_depth_mm),
          mean_flipper_length_mm = mean(flipper_length_mm),
          mean_body_mass_g = mean(body_mass_g), # mean para averiguar la media
          sd_bill_length_mm = sd(bill_length_mm),
          sd_bill_depth_mm = sd(bill_depth_mm),
          sd_flipper_length_mm = sd(flipper_length_mm),
          sd_body_mass_g = sd(body_mass_g), # sd para averiguar la desviaci�n t�pica
          max_bill_length_mm = max(bill_length_mm),
          max_bill_depth_mm = max(bill_depth_mm),
          max_flipper_length_mm = max(flipper_length_mm),
          max_body_mass_g = max(body_mass_g), # max para averiguar el m�ximo
          min_bill_length_mm = min(bill_length_mm),
          min_bill_depth_mm = min(bill_depth_mm),
          min_flipper_length_mm = min(flipper_length_mm),
          min_body_mass_g = min(body_mass_g) # min para averiguar el m�nimo
          )
# Apartado 2: (2) Un gr�fico de barras que represente el n�mero de individuos muestreados de cada especie en cada isla, 
# representando las especies en diferentes colores (chinstrap - morado, gentoo - azul, adelie - naranja). Contesta a las 
# siguientes preguntas: �qu� especie se ha muestreado en las tres islas? �cu�ntos individuos se han muestreado de la isla 
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

# Apartado 3: (3) Un gr�fico multipanel de cajas y bigotes del tama�o de los ping�inos seg�n su sexo, donde aparezca un
# panel para cada especie. Contesta a las siguientes preguntas: �qu� especie tiene mayor tama�o? �en qu� especie las hembras
# y los machos tienen un tama�o m�s similar?

graficoMultipanel <- ggplot(data = df) +
  geom_boxplot(aes(x = sex, y = body_mass_g)) + 
  facet_grid(cols = vars(species))

graficoMultipanel
