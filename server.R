library(shiny)
shinyServer(
    function(input, output) {
        
        output$data <- reactive({{as.numeric(input$id1) * as.numeric(input$units)}})
        #no idea why there's a small rounding error
        output$percent <- reactive({ ((as.numeric(input$id1) * as.numeric(input$units)) - as.numeric(input$id1))/ as.numeric(input$id1)*100 })
        
        output$plot <- renderPlot({
            
            x    <- ((as.numeric(input$id1) * as.numeric(input$units)) - as.numeric(input$id1)) / as.numeric(input$id1)*100
            plot(x, breaks = 1, col = 'darkblue', border = 'white', type= "h", main="Percent change in values",
                 xlab="Units", ylab="Percentage")
        })
    }
)