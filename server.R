
server <- function(input, output, session) {
  
  
  # NAVIGATION AND SUB-URLS --------------------------------------------------------
  
  ## update to sub-page/sub-URL when we move to a new tab from the navbar
  observeEvent(session$clientData$url_hash, {
    currentHash <- sub("#", "", session$clientData$url_hash)
    if(is.null(input$navbarID) || !is.null(currentHash) && currentHash != input$navbarID){
      freezeReactiveValue(input, "navbarID")
      updateNavbarPage(session, "navbarID", selected = currentHash)
    }
  }, priority = 1)
  
  ## push changes to the sub-URL to the browser history so that back/forward browser buttons work
  observeEvent(input$navbarID, {
    currentHash <- sub("#", "", session$clientData$url_hash) # might need to wrap this with `utils::URLdecode` if hash contains encoded characters (not the case here)
    pushQueryString <- paste0("#", input$navbarID)
    if(is.null(currentHash) || currentHash != input$navbarID){
      freezeReactiveValue(input, "navbarID")
      updateQueryString(pushQueryString, mode = "push", session)
    }
  }, priority = 0)


# BOOKMARKING -------------------------------------------------------------


  observeEvent(input$p1_bookmark, {
    session$doBookmark()
  })
  
  ## sets it so that the bookmark link takes you to the proper tab
  onBookmark(function(state) {
    state$values$currentURL <- input$navbarID
  })
  
  ## resets to the proper tab when following bookmark link
  onRestored(function(state){
    tab <- state$values$currentURL
    updateTabsetPanel(session, "navbarID", tab)
  })
  
  ## set up custom Modal with our custom text for when app bookmarks
  onBookmarked(showBookmarkUrlModalCustom)
  
  

# OBSERVE LINKS -----------------------------------------------------------

  observeEvent(input$to_table, {
    newvalue <- "data-table" 
    updateTabsetPanel(session, inputId = "navbarID", newvalue)
  })
  observeEvent(input$to_map, {
    newvalue <- "map" 
    updateTabsetPanel(session, inputId = "navbarID", newvalue)
  })
  observeEvent(input$to_trends, {
    newvalue <- "line-chart" 
    updateTabsetPanel(session, inputId = "navbarID", newvalue)
  })
  

  # DATA TABLE ---------------------------------------------------------
  
  ##### date #####
  output$date <- renderUI({
    pickerInput(
      inputId = "date_input",
      label = "Year", #"Select a Date",
      choices = possible_dates,
      inline = F
    )
  })
  

  
  ##### species #####  
  output$species <- renderUI({
    pickerInput(
      inputId = "species_input",
      label = "Species",
      choices = possible_species,
      inline = F
    )
  })
  
  #### data ####
  db2_data <- reactive({
    req(input$date_input)
    req(input$species_input)
    #req(input$daily_city_input)
    plot_data <- main_data |>
      dplyr::filter(year == input$date_input, 
                    species == input$species_input) |>
      select(-species, -year) |>
      arrange(island, desc(bill_length_mm))
    
    return(plot_data)
    
  })
  
  #### title ####
  output$title <- renderUI({
    req(input$species_input)
    req(input$date_input)
      h3(  
      HTML(paste0("<b>",input$species_input, "</b> penguins in <b>", input$date_input, "</b>"))
      )
        #)
  })
  
  #### table ####
  output$data_table <- renderReactable({
    req(db2_data())
    db2_data() |>
      reactable()
  })


}