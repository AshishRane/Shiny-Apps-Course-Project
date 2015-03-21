library(shiny)
library(ggplot2)

# Apply logic to generate and plot a random distribution

shinyServer(function(input, output) {
        
        # Equqation to generate a distribution plot. renderplot is used for this purpose.
        # The call is "reactive and hence it will automatically re-execute with changes in input
        # Plot diagram will be generated as output.
   
        output$ggplot_Plot <- renderPlot({
                ggplot_command = sprintf("g = ggplot(mpg, aes(x=%s, y=%s, colour=%s)) + facet_wrap(~%s) + geom_%s()",
                                         input$x, input$y, input$colour, input$facet_wrap, input$geom)
                eval(parse(text=ggplot_command))
                g
        })
        
        output$ggplot_command <- renderText({
                ggplot_command = sprintf("g = ggplot(mpg, aes(x=%s, y=%s, colour=%s)) + facet_wrap(~%s) + geom_%s()",
                                         input$x, input$y, input$colour, input$facet_wrap, input$geom) 
        })
        
})