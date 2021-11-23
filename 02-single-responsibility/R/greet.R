hello <- function() {
    "Hello, R/!"
}

hazardColor <- function(data, symmetric=FALSE) {
    if (symmetric) {
        extent = max(abs(c(min(data), max(data))))
        domain = c(-extent, extent)
    } else {
        domain = c(0, max(data))
    }

    leaflet::colorBin("Reds", domain=domain)
}
