###LOAD the library
library(shiny)
library(rCharts)




shinyUI(pageWithSidebar(
  headerPanel("Interactive visualisation of sequencing results for 96 samples"),
  sidebarPanel(
      selectInput("n_breaks1", label = "Visualize by",
                  choices = c("SAMPLE", "STRAIN", "STATUS"), selected = "STRAIN"),
      #
      selectInput("n_breaks2", label = "Values",
                  choices = c("NUMBER_SEQ", "MEAN_SIZE"), selected = "NUMBER_SEQ"),
      
      radioButtons("dist", "Distribution type:",
                   c("Vertical" = "multiBarChart",
                     "Horizontal" = "multiBarHorizontalChart"
                    ))
  #    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
    #              value=min(1000, nrow(dataset)), step=500, round=0)
    ),
    mainPanel(
      h4("The code for the sequencing report integrates the strengths of R for data analysis.

The data are the report of a RNA-seq sequencing for 78 samples of humans, sheeps, pigs and cows. This samples has differents status (a treatment given or not).

The global objective of the project is to explore the difference between genes expression for individuals treated and untreated individuals."),
      p('PLOT'),
      textOutput("text1"),
      p('for'),
      textOutput("text2"),
      br(""),
      p('Find the source code and more information about the project there :'),
      a('https://github.com/gaeleven/DDP9_Project'),
      showOutput("chart1","nvd3")
     
    )
  
  )
  
 )

