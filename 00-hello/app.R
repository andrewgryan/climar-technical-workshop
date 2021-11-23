library(shiny)

ui <- h1("Hello, R-Shiny!")

server <- function(input, output, session) {}

shinyApp(ui=ui, server=server)
