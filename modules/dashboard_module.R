# dashboard_module.R

dashboardUI <- function(id) {
    ns <- NS(id)
    tabItem(
        tabName = "dashboard",
        h2("Dashboard Overview"),
        fluidRow(
            column(
                width = 6,
                box(
                    title = "Key Metrics",
                    DTOutput(ns("key_metrics"))
                )
            )
        )
    )
}

dashboardServer <- function(input, output, session) {
    output$key_metrics <- renderDT({
        data.frame(Metric = c("Sales", "Churn Rate"), Value = c(100000, 0.05))
    })
}
