# competitor_module.R

competitorUI <- function(id) {
    ns <- NS(id)
    tabItem(
        tabName = "competitor",
        h2("Competitor Analysis"),
        fluidRow(
            column(
                width = 6,
                box(
                    title = "Market Share",
                    DTOutput(ns("market_share"))
                )
            )
        )
    )
}

competitorServer <- function(input, output, session) {
    output$market_share <- renderDT({
        data.frame(Competitor = c("Competitor A", "Competitor B"), MarketShare = c(0.4, 0.35))
    })
}
