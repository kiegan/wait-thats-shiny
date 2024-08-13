
ui <- function(req) {shinyUI(
  tagList(
    tags$head(
      tags$link(rel = "stylesheet", 
                type = "text/css", 
                href = "styles-demo.css"),
      tags$html(lang = "en"), ## adding english as the site language
    ),
    navbarPage(
      id = "navbarID",
      title = "Data Explorer",
      windowTitle = "Data Explorer",
      collapsible = TRUE,
      tags$style(type="text/css",
                 ".shiny-notification-content { visibility: hidden; }",
                 ".shiny-notification-panel { visibility: hidden; }", 
                 ".shiny-notification-error {visibility: hidden;}"
      ),
      
      # HOME PAGE ---------------------------------------------------------------
      
      tabPanel("Home", value = "home", 
               h1("Welcome to the Data Explorer"), 
               p("This site lets users explore data on whatever data are presented in this data explorer. Here, we use the example of the Palmer Penguins dataset. "), 
               p("The Palmer Penguins data can be gathered from the palmerpenguins R package."),
               h2("Explore the Data"), 
               br(),
               #p("There are several ways to explore the data on this site. Compare counts across cities by day, view crimes by city on the map, and trends over time. "),
               fluidRow(column(4, 
                               div(class = "homepage-cards",
                               h4("See the yearly data for a certain species across islands"), 
                               br(),
                               actionButton("to_table", label = "Data Table")
                               )
                               ), 
                        column(4, 
                               div(class = "homepage-cards",
                               h4("Explore penguins on a map"), 
                               br(),
                               actionButton("to_map", label = "Interactive Map")
                               )
                               ), 
                        column(4, 
                               div(class = "homepage-cards",
                               h4("Compare penguin trends over time"),
                               br(),
                               actionButton("to_trends", label = "Trends over Time")
                               )
                               )
                        ),
               br(),
               h2("Learn More"),
               HTML("<b>Curious about the data sources?</b><br>Visit our Methodology page."),
               br(), 
               br(),
               HTML("<b>Curious about who built this site and why?</b><br>Learn more about the Data Explorer project here. Learn more about the team here.")),
      
      navbarMenu("Explore Data", 
                 tabPanel("Data Table", value = "data-table",
                  sidebarPanel(uiOutput("date"),
                              uiOutput("species"),
                              ), 
                 mainPanel(
                   fluidRow(
                     column(8, uiOutput("title")),
                   column(4, br(), div(style="float: right;", 
                                       bookmarkButton(label = "Share this Table", id = "p1_bookmark",
                                            icon = tags$i(class = "fas fa-share-nodes", style="font-size: 1em;"),
                                            title = "Share a link to this table in the application.",
                                            style="font-size:1.1em; background:black; color: white;")))
                   ),
                   br(),
                   reactableOutput("data_table"))), 
                tabPanel("Map", value = "map", 
                         sidebarPanel("Put your filters here!"), 
                         mainPanel(
                           fluidRow(
                             column(8, h3("Surprise! This page is empty. Put your visualization here :)"))
                           )
                         )),
                tabPanel("Line chart", value = "line-chart", 
                         sidebarPanel("Put your filters here!"),
                         mainPanel(
                           fluidRow(
                             column(8, h3(HTML("Surprise! This page is also empty. Put your <b>other</b> visualization here.")))
                           )
                         )),
      ), 
      tabPanel("About", value = "about",
               h1("About this Tool"), 
               p("Introductory text about this tool and what its purpose is."),
               h2("Frequently Asked Questions"), 
               br(),
               h4("What is the purpose of this tool?"), 
               p("Provide some background on why these data are important, useful, and can help provide insights to users of the tool."), 
               br(),
               h4("What are the limitations of this tool?"), 
               p("Share important information the users of this tool need to know about limitations in the data they're exploring. What kind of context do they need to understand what they're seeing?"), 
               br(), 
               h4("Who should I contact if I have questions?"), 
               p("Contact info here.")), 
      tabPanel("Methodology", value = "methodology", 
               h1("Methods and Data Sources"),
               p("On this page, learn how we collect and harmonize the data used in this tool."))
    ),
  ) # close tagList
) # close ShinyUI
}