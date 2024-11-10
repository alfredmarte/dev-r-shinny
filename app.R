# app.R

library(shiny)
library(shinydashboard)
library(DT)
library(ggplot2)

# Load all modules
# app.R
source("modules/churn_module.r")
source("modules/competitor_module.r")
source("modules/dashboard_module.r")
source("modules/engagement_module.r")
source("modules/reengagement_module.r")
source("modules/sales_module.r")
source("modules/segmentation_module.r")

# Define UI layout with references to module UI functions
ui <- dashboardPage(
    dashboardHeader(title = "Sales Dashboard"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Churn Analysis", tabName = "churn", icon = icon("chart-bar")),
            menuItem("Competitor Analysis", tabName = "competitor", icon = icon("chart-line")),
            menuItem("Dashboard", tabName = "dashboard", icon = icon("tachometer-alt")),
            menuItem("Engagement", tabName = "engagement", icon = icon("user-check")),
            menuItem("Reengagement", tabName = "reengagement", icon = icon("redo")),
            menuItem("Sales", tabName = "sales", icon = icon("dollar-sign")),
            menuItem("Segmentation", tabName = "segmentation", icon = icon("th-large"))
        )
    ),
    dashboardBody(
        tabItems(
            tabItem(tabName = "churn", churnUI("churn_module")),
            tabItem(tabName = "competitor", competitorUI("competitor_module")),
            tabItem(tabName = "dashboard", dashboardUI("dashboard_module")),
            tabItem(tabName = "engagement", engagementUI("engagement_module")),
            tabItem(tabName = "reengagement", reengagementUI("reengagement_module")),
            tabItem(tabName = "sales", salesUI("sales_module")),
            tabItem(tabName = "segmentation", segmentationUI("segmentation_module"))
        )
    )
)

# Define server logic with module server calls
server <- function(input, output, session) {
    churnServer("churn_module")
    competitorServer("competitor_module")
    dashboardServer("dashboard_module")
    engagementServer("engagement_module")
    reengagementServer("reengagement_module")
    salesServer("sales_module")
    segmentationServer("segmentation_module")
}

# Run the app
shinyApp(ui = ui, server = server)
