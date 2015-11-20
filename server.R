library(shiny)
library(rCharts)

var_filter <- read.table(file="filter_step_RAW.csv",sep="\t",header=T)

shinyServer(function(input, output) {
  #print(input$dist)
  output$chart1 <- renderChart2({
    var_tmp <- data.frame( V1 = var_filter[,colnames(var_filter) == input$n_breaks2], V2 = var_filter[,colnames(var_filter) == input$n_breaks1], V3 = var_filter$STRAIN)
    #var_tmp$V2V3 <- paste(var_tmp$V2,var_tmp$V3,sep="-")
    for( i in unique(var_tmp$V2)){
      
      var_tmp$V1[ var_tmp$V2 == i] <- mean(var_tmp$V1[ var_tmp$V2 == i]) 
      
    }
    
    var_tmp <- unique(var_tmp)
    
    n1 <-  nPlot(V1 ~ V2 , group="V3", data = var_tmp, type = input$dist,id = 'chart1') 
    
    n1$addParams(dom="chart1")
    return(n1)
  })
  
  output$text1 <- renderText({ 
    input$n_breaks1
  })
  
  output$text2 <- renderText({ 
    input$n_breaks2
  })
  
  
  
})

