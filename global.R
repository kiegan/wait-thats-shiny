# PACKAGES ----------------------------------------------------------------

library(shiny)
library(tidyr)
library(dplyr)
library(shinydashboard)
library(shinyWidgets)
library(reactable) ## for sortable tables
library(palmerpenguins)


# DATA --------------------------------------------------------------------
main_data <- palmerpenguins::penguins


## dropdown selector options
possible_dates <- unique(main_data$year)
possible_species <- unique(main_data$species)
possible_islands <- unique(main_data$island)

 
# BOOKMARKING -------------------------------------------------------------

## set bookmarking to be server-based rather than URL-based
enableBookmarking(store="server")

## Create custom Modal to pop up when a user bookmarks or "Shares"
showBookmarkUrlModalCustom <- function(url){
  store <- getShinyOption("bookmarkStore", default = "")
  if (store == "url") {
    subtitle <- "This link stores the current state of this application."
  }
  else if (store == "server") {
    subtitle <- "The current state of this application has been stored on the server."
  }
  else {
    subtitle <- NULL
  }
  showModal(urlModal(url, title = "Share a link to this table.", subtitle = "Copy this link to share this table."))
  
}

