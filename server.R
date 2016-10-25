# Submission for Developing Data Products: Course Project Week 4 - Shiny Application
# by khychan
# October, 2016

library(shiny)
library(ggplot2)

# Define server logic required to draw histograms and calculate capital requirement
shinyServer(function(input, output) {
# Calculate total claim counts
        claims <- reactive({
        set.seed(123)
        simulations <- input$simulations
        claims.per.annum <- input$claims.per.annum
        mean.input <- input$mean.input
        stdev.input <- input$stdev.input
        
        sigma <- sqrt(log(stdev.input^2/mean.input^2+1))
        mu <- log(mean.input)-0.5*sigma^2        

        sapply(1:simulations, function(x) rpois(1,claims.per.annum))
        })
# Calculate total claim cost amounts
        claimsCost <- reactive({
        set.seed(123)
        sigma <- sqrt(log(input$stdev.input^2/input$mean.input^2+1))
        mu <- log(input$mean.input)-0.5*sigma^2        

        sapply(1:input$simulations, function(x) sum(rlnorm(rpois(1,input$claims.per.annum),mu,sigma))/10^6)
        })
# Capital sufficiency thresholds        
        threshold <- reactive({
                switch(input$threshold,
                            "95.0%" = 0.95,
                            "99.0%" = 0.99,
                            "99.5%" = 0.995
        )
        })
# Output distribution of claim counts with mean line        
        output$graph1 <- renderPlot({
                qplot(claims(),geom="histogram", bins = 50, main ="Histogram of Claim Counts in a Year", xlab= "Total Claim Counts in a Year", ylab= "Frequency", fill=I("lightgreen"))+
                        geom_vline(xintercept = mean(claims()),lwd=1)
        })
# Output distribution of claim amounts with mean and quantile lines using selection  
        output$graph2 <- renderPlot({
                qplot(claimsCost(),geom="histogram", bins = 50, main ="Histogram of Claim Costs in a Year", xlab= "Total Claims Cost in a Year ($m)", ylab= "Frequency", fill=I("lightblue"))+
                        geom_vline(xintercept=mean(claimsCost()),lwd=1)+
                        geom_vline(xintercept = quantile(claimsCost(),threshold()),lwd=1,col='red')
        })
# Capital requirement based on chosen threshold        
        output$capitalRequirement <- renderText({
                paste("Capital Requirement is: $", paste(as.character(format(quantile(claimsCost(),threshold()),digits=2,nsmall=2))), "m")
        })
        
})
