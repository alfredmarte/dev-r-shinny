# segmentation_module.R

segmentationUI <- function(id) {
    ns <- NS(id)
    tabItem(
        tabName = "segmentation",
        h2("Customer Segmentation"),
        fluidRow(
            column(
                width = 6,
                box(
                    title = "Segments Overview",
                    DTOutput(ns("segments_overview"))
                )
            )
        )
    )
}

segmentationServer <- function(input, output, session) {
    output$segments_overview <- renderDT({
        data.frame(Segment = c("Retail", "Wholesale"), CustomerCount = c(150, 50))
    })
}
