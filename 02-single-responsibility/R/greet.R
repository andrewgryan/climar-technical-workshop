hello <- function() {
    "Hello, R/!"
}

hazardColor <- function(data, domainType="symmetric") {
    if (domainType == "symmetric") {
        extent = max(abs(c(min(data), max(data))))
        domain = c(-extent, extent)
    } else if (domainType == "minmax") {
        domain = min_max(data)
    } else {
        domain = c(0, max(data))
    }

    leaflet::colorBin("Reds", domain=domain)
}

min_max <- function(data) {
    c(min(data), max(data))
}
