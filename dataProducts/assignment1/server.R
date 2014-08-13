# server.R

library(ggplot2)
bNames  <- read.csv("baby_names.csv")

shinyServer(function(input, output) {
     yearInput <- reactive({ 
         input$year
     })

     genderInput <- reactive({
         switch(input$gender,
                "male" = "M",
                "female" = "F")
     })
     
     rankInput <- reactive ({
         switch(input$rank,
                "Top 3" = 3,
                "Top 5" = 5,
                "Top 10" = 10)    
     })
     

     
     output$barChart <- renderPlot({
         mySub <- subset(bNames,Gender== genderInput() & Year== yearInput(),
                         select=c(Name,Frequency))
         sortIndex <- order(-mySub$Frequency)
         topNames <- mySub[sortIndex[1:rankInput()], ]
         topNames$Name <- as.character(topNames$Name) 
         title <- paste(input$rank,input$gender,"names in",input$year)
         color <- ifelse(input$gender == "female","red","blue")
         
         ggplot(topNames, aes(x= reorder(Name, -Frequency),Frequency)) +
             geom_bar(stat="identity", colour=paste("dark",color), fill=color) +
             xlab("Baby Name") +
             ylab("Frequency") +
             ggtitle(title) +
             theme(plot.title = element_text(lineheight=0.8, face="bold"))
     })
})