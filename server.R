library(shiny)
library(DT)

# Source module files
source("modules/dashboard_module.R")
source("modules/churn_module.R")
source("modules/competitor_module.R")
source("modules/engagement_module.R")
source("modules/reengagement_module.R")
source("modules/sales_module.R")
source("modules/segmentation_module.R")

server <- function(input, output, session) {
    callModule(dashboardServer, "dashboard")
    callModule(churnServer, "churn")
    callModule(competitorServer, "competitor")
    callModule(engagementServer, "engagement")
    callModule(reengagementServer, "reengagement")
    callModule(salesServer, "sales")
    callModule(segmentationServer, "segmentation")
}
