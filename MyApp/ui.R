##### Coursera - Data Science Specialization Course
##### Developing Data Products -> Course Project
##### Author: Ashish Rane
##### Project: Make plots using random distributions

library(ggplot2) # Assuming ggplot2 package is already installed
library(shiny) # Assuming shiny package is already installed

# Create an application user interface to plot random distributions
shinyUI(pageWithSidebar(
        
        # Title for the application
        headerPanel("Plot using ggplot2"),
        
        # Create a siderbar with a slider to input number of observations
        sidebarPanel(
                selectInput("geom", "Select a ggplot2 geometry:", choices = c("point", "line", "boxplot"), selected = "point" ),
                selectInput("x", "Choose x:", choices = colnames(mpg), selected = "cyl"),
                selectInput("y", "Choose y:", choices = colnames(mpg), selected = "hwy"),
                selectInput("colour", "Choose colour:", choices = colnames(mpg), selected = "manufacturer" ),
                selectInput("facet_wrap", "Choose facet_wrap:", choices = colnames(mpg), selected = "trans" )
        ),
        
        # Generate Plot
        mainPanel(
                plotOutput("ggplot_Plot"),
                h3(textOutput("ggplot_command")),
                p("In case you need any help, please refer to the documentation:",a("documentation.html",href="documentation.html"))
        )
))