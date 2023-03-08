#### SETUP ####

library(shiny)
library(leaflet)
library(leafem)
library(sf)
library(dplyr)

source("map_decor.R")
nca <- readRDS("data/nca.RDS")

#### SHINY ####

ui <- fluidPage(
  leafletOutput("mymap", height = "95vh")
)

server <- function(input, output, session) {
  
  output$mymap <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      leafem::addGeotiff(file = "data/baseline__LUF_Core_Baseline_50m_NAmod.tif",
                         resolution = 56,
                         group = 'Baseline',
                         project = FALSE,
                         colorOptions = colorOptions(
                           palette = data_baseline_pal,
                           breaks = seq(1,22)),
                         options = leaflet::tileOptions(minZoom = 12,
                                                        maxZoom = 13)) %>%
      leaflet::addLegend(position = "bottomleft",
                         colors = legend_baseline_pal, 
                         labels = baseline_vals,
                         values = seq(1,21)) %>%
      leaflet::addPolygons(data = nca, 
                           group = "NCA",
                           color = "black",
                           fill = TRUE,
                           fillOpacity = 0,
                           weight = 1,
                           popup = ~Name) %>%
      addLayersControl(
        overlayGroups = c("Baseline", "NCA"),
        options = layersControlOptions(collapsed = FALSE))
  })
}

shinyApp(ui, server)
