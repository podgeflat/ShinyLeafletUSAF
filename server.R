server <- function(input,output, session){
  
  data <- reactive({
    x <- df
  })
  
  output$mymap <- renderLeaflet({
    df <- data()
    
    m <- leaflet(df)  %>% addProviderTiles("Esri.WorldImagery") %>% 
      addCircles(~lon, ~lat, 
                 color = pal(df$Total_Years),
                 weight = 3, 
                 radius = ~(Total_Years) * 300, #include this line if you want bigger circles for longer records
                 popup=paste("Name:", df$station_name,"<br>",
                             "Start Year:", df$Wind_speed._start_year, "<br>",
                             "End Year:", df$Wind_speed._end_year, "<br>",
                             "Total Years:", df$Total_Years)) %>%
      addLegend(pal = pal, values = ~(Total_Years), group = "circles", position = "topleft") 
    
    m
  })
}