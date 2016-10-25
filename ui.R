# Submission for Developing Data Products: Course Project Week 4 - Shiny Application
# by khychan
# October, 2016

library(shiny)

# Define UI for application
shinyUI(fluidPage(
  
# Application title
        titlePanel("How much money to reserve for insurance claims?"),
  
# Set panel sliders and drop-down box
                sidebarPanel(
# Number of simulations
                        sliderInput("simulations",
                                        "Simulations:",
                                        min = 1000,
                                        max = 10000,
                                        value = 10000,
                                        step = 1000),
                        tags$h4("Poisson distribution for number of claims"),
# Set parameter for Poisson distribution which is used for claim counts
                        sliderInput("claims.per.annum",
                                        "Claims each year:",
                                        min = 500,
                                        max = 2000,
                                        value = 1000,
                                        step = 250),
                        tags$h4("Lognormal distribution for each claim"),
# Set mean and standard deviations for Lognormal distribution which is used for claim severity
                        sliderInput("mean.input",
                                        "Mean ($):",
                                        min = 500,
                                        max = 10000,
                                        value = 5000,
                                        step = 500),
                        sliderInput("stdev.input",
                                        "Standard deviation ($):",
                                        min = 500,
                                        max = 10000,
                                        value = 5000,
                                        step = 500),
# Set capital adequacy level
                        selectInput("threshold",
                                    "Adequacy Level:",
                                    choices = c("95.0%","99.0%","99.5%")),
# Documentation
                        tags$h4("Documentation"),
                        helpText("Adequate reserving is a key concern for insurance companies. ",
                                 "This simple example demonstrates the impact of changing the ",
                                 "frequency and severity of claims on the reserving required to ",
                                 "not only meet the best estimate but also an extreme claims cost in a given year."),
                        helpText("Step 1: Choose number of simulations;",
                                "Step 2: Choose average claim count per annum;",
                                "Step 3: Choose mean claim cost;",
                                "Step 4: Choose standard deviation of claim cost;",
                                "Step 5: Choose capital adequacy level."),
                        tags$h4("Output"),                        
                        helpText("Black lines represent the mean while red line the capital adequacy level chosen."),
                        tags$h4("Note"),                        
                        helpText("Claim counts are estimated using the Poisson distribution while claim ",
                                 "severity is estimated using the Lognormal distribution.")
                ),
                
# Show a plot of the generated distributions and capital requirement
                mainPanel(
                       plotOutput("graph1"),
                       plotOutput("graph2"),
                       verbatimTextOutput("capitalRequirement")
                )
))
