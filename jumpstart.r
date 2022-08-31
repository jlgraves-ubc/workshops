print("You did it!  Way to go!")

invisible(library(tidyverse))
invisible(library(haven)) 

clean_up_data <- function(pwt_data) {
 
# declare factors
pwt_data <- as_factor(pwt_data)

pwt_data <- pwt_data %>%
    mutate(countrycode = as.factor(countrycode)) %>%
    mutate(country = as.factor(country)) %>%
    mutate(currency_unit = as.factor(currency_unit))

}



do_it <- function() {
# Second, input data frame for the graphic (this case NA_data) and specify the set of plot aesthetics (which variables will be included) using the command ggplot
plot <- ggplot(data = NA_data,  # this declares the data for the chart; all variable names are in this data
                aes(# this is a list of the aesthetic features of the chart
                    x = year,   # for example, the x-axis will be "year" (a continuous variable)
                    y = rgdpe/pop, # the y-axis will be expenditure-based real GDP per capita
                    fill = country, # the colour fill will be country
                    color = country # so will the outline
                ),
                )

# Third, input the labels to the aesthetic features added above
plot <- plot + labs( # add human-readable, aesthetic labels
                    x = "Year",  # label for the x aesthetic (x-axis title)
                    y = "Real GDP per capita (expenditure-based)", #y-axis title
                    color = "Country", # the meaning of color
                    fill = "Country", # ...etc.
                    title = "North American Real GDP per Capita over Time") # and title of plot

# Because the variable "country" is expressed by colours, we are able to change the colours used in the chart using the commands below. Try playing with different palettes. To display other palettes use the command display.brewer.all()
plot <- plot + scale_fill_brewer(palette="Accent") #set the colour palette for fills
plot <- plot + scale_color_brewer(palette="Accent") #set the colour palette for outlines
options(repr.plot.width = 15, repr.plot.height = 9) #adjusts plot size: try playing around with the dimensions, and then return the values to width = 15 and height = 9

#Finally, input the type of vizualisation of the chart
plot1 <- plot + geom_col( # now we add the visualization (geom)col() produces a bar graph)
                    position = "dodge") #this places the visualizations side-by-side
                                        #if you change position to "stack" it will be a stacked graph!
plot1
}


offline_install() <- function() {
    
    install.packages("tidyverse")
    install.packages("haven")
    
}