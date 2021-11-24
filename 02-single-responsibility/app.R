library(shiny)
library(leaflet)
library(modules)

# Code change

lib <- use("R")  # Loads code from R/ directory

ui <- fillPage(
               absolutePanel(top = 10, right = 10,
                             selectInput("scheme", "Color scheme", c("Risk", "Hazard", "Exposure"))
                             ),
               leafletOutput("map", width = "100%", height = "100%"))

server <- function(input, output, session) {

    # NOTE this approach doesn't take full advantage of R Shiny's reactive
    #      programming features but it is a good template to practice
    #      refactoring and separation of concerns

    data <- quakes$mag
    radius <- 10^quakes$mag/10  # Could this be extracted into a meaningful method??

    colorMap <- lib$greet$hazardColor(data)  # Should a coloring method live in R/greet.R??

    output$map <- renderLeaflet({
        leaflet(quakes) %>%
            addProviderTiles(providers$Stamen.TonerLite) %>%
            setView(lng = 175, lat = -37, zoom = 4) %>%
            addCircles(radius = radius,
                       stroke=FALSE,
                       fillOpacity=1,
                       fillColor=colorMap(data)) %>%
            addLegend(position = "bottomright",
                      pal = colorMap,
                      values = data,
                      opacity = 1
            )


    })
}

shinyApp(ui=ui, server=server)
