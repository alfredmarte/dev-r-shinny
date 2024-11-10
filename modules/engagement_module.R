# reengagement_module.R

reengagementUI <- function(id) {
    ns <- NS(id)
    tabItem(
        tabName = "reengagement",
        h2("Reengagement Campaigns"),
        fluidRow(
            column(
                width = 6,
                box(
                    title = "Campaign Effectiveness",
                    DTOutput(ns("campaign_effectiveness"))
                )
            )
        )
    )
}

reengagementServer <- function(input, output, session) {
    output$campaign_effectiveness <- renderDT({
        data.frame(Campaign = c("Email", "SMS"), Effectiveness = c(0.7, 0.5))
    })
}
