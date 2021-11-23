library(shiny)
library(modules)

lib <- use("R")

ui <- h1(lib$greet$hello())

server <- function(input, output, session) {}

shinyApp(ui=ui, server=server)
