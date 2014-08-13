# ui.R

shinyUI(pageWithSidebar(
    headerPanel("Top Baby Names In The US"),
    sidebarPanel(
        strong("Documentation:"),
        helpText("This app lets you find out which were the most popular 
                     names in the US from 2002 to 2012. Simply choose the year, gender
                     and the rank you are interested in (top 3,5,10).
                     The App will do some magic and display graphical results on
                     the right panel."),
        sliderInput("year", label = h4("Choose Year:"), min=2002, max= 2012, value=2012),
        br(),
        selectInput("gender", h4("Choose Gender:"), 
                    choices = c("male", "female")),
        br(),
        radioButtons("rank",h4("Choose Rank:"),
                     choices = c("Top 3", "Top 5", "Top 10"))
    ),
    mainPanel(
        plotOutput("barChart")
    )
))
