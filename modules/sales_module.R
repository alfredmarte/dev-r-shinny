# sales_module.R

salesUI <- function(id) {
    ns <- NS(id)
    tabItem(
        tabName = "sales",
        h2("Sales Analysis"),
        fluidRow(
            column(
                width = 6,
                box(
                    title = "Sales by Product",
                    DTOutput(ns("sales_by_product"))
                )
            )
        )
    )
}

salesServer <- function(input, output, session) {
    output$sales_by_product <- renderDT({
        data.frame(Product = c("Product A", "Product B"), Sales = c(50000, 30000))
    })
}
