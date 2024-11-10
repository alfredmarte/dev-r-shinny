library(shiny)
library(shinydashboard)
library(DT)

# Source module files
source("modules/dashboard_module.R")
source("modules/churn_module.R")
source("modules/competitor_module.R")
source("modules/engagement_module.R")
source("modules/reengagement_module.R")
source("modules/sales_module.R")
source("modules/segmentation_module.R")

ui <- dashboardPage(
    dashboardHeader(title = "Sales App"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Dashboard", tabName = "dashboard"),
            menuItem("Churn Analysis", tabName = "churn"),
            menuItem("Competitor Analysis", tabName = "competitor"),
            menuItem("Engagement", tabName = "engagement"),
            menuItem("Reengagement", tabName = "reengagement"),
            menuItem("Sales Analysis", tabName = "sales"),
            menuItem("Segmentation", tabName = "segmentation")
        )
    ),
    dashboardBody(
        tabItems(
            dashboardUI("dashboard"),
            churnUI("churn"),
            competitorUI("competitor"),
            engagementUI("engagement"),
            reengagementUI("reengagement"),
            salesUI("sales"),
            segmentationUI("segmentation")
        )
    )
)
