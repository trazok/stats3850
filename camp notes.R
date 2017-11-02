# Print the first rows of the data
comics

# Check levels of align
levels(comics$align)

# Check the levels of gender
levels(comics$gender)

# Create a 2-way contingency table
table(comics$align, comics$gender)



-------------------------------------------
  # Load ggplot2
  library(ggplot2)

# Create side-by-side barchart of gender by alignment
ggplot(comics, aes(x = align, fill = gender)) + 
  geom_bar(position = "dodge")

# Create side-by-side barchart of alignment by gender
ggplot(comics, aes(x = gender, fill = align)) + 
  geom_bar(position ="dodge") +
  theme(axis.text.x = element_text(angle = 90))
--------------------------------------------------------
  # Plot of gender by align
  ggplot(comics, aes(x = align, fill = gender)) +
  geom_bar()

# Plot proportion of gender, conditional on align
ggplot(comics, aes(x = align, fill = gender)) + 
  geom_bar(position = "fill")
-----------------------------------------------------------
  # Change the order of the levels in align
  comics$align <- factor(comics$align, 
                         levels = c("Bad", "Neutral", "Good"))

# Create plot of align
ggplot(comics, aes(x = align)) + 
  geom_bar()
--------------------------------------------------------
  # Plot of alignment broken down by gender
  ggplot(comics, aes(x = align)) + 
  geom_bar() +
  facet_wrap(~ gender)
---------------------------------------------------------------
  # Put levels of flavor in decending order
  lev <- c("apple", "key lime", "boston creme", "blueberry", "cherry", "pumpkin", "strawberry")
pies$flavor <- factor(pies$flavor, levels = lev)

# Create barchart of flavor
ggplot(pies, aes(x = flavor)) + 
  geom_bar(fill = "chartreuse") + 
  theme(axis.text.x = element_text(angle = 90))
-------------------------------------------------------------
  
  # Create faceted histogram
  ggplot(cars, aes(x = city_mpg)) +
  geom_histogram() +
  facet_wrap(~ suv)
---------------------------------------------------------
  # Filter cars with 4, 6, 8 cylinders
  common_cyl <- filter(cars, ncyl %in% c(4, 6, 8))

# Create box plots of city mpg by ncyl
ggplot(common_cyl, aes(x = as.factor(ncyl), y = city_mpg)) +
  geom_boxplot()

# Create overlaid density plots for same data
ggplot(common_cyl, aes(x = city_mpg, fill = as.factor(ncyl))) +
  geom_density(alpha = .3)
------------------------------------------------------------
  # Create hist of horsepwr with binwidth of 3
  cars %>%
  ggplot(aes(horsepwr)) +
  geom_histogram(binwidth = 3) +
  ggtitle("binwidth = 3")

# Create hist of horsepwr with binwidth of 30
cars %>% 
  ggplot(aes(horsepwr)) +
  geom_histogram(binwidth = 30) +
  ggtitle("binwidth = 30")

# Create hist of horsepwr with binwidth of 60
cars %>%
  ggplot(aes(horsepwr)) +
  geom_histogram(binwidth = 60) +
  ggtitle("binwidth = 60")
------------------------------------------------------------
  # Facet hists using hwy mileage and ncyl
  common_cyl %>% 
  ggplot(aes(x = hwy_mpg)) +
  geom_histogram() +
  facet_grid(ncyl ~ suv) +
  ggtitle("Mileage by suv and ncyl")
--------------------------------------------------
  # Create dataset of 2007 data
  gap2007 <- filter(gapminder, year == 2007)

# Compute groupwise mean and median lifeExp
gap2007 %>%
  group_by(continent) %>%
  summarize(mean(lifeExp),
            median(lifeExp))

# Generate box plots of lifeExp for each continent
gap2007 %>%
  ggplot(aes(x = continent, y = lifeExp)) +
  geom_boxplot()