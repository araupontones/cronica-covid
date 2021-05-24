#create title and subtitle for chart of new cases

#' @param db A tibble with the acumulated cases by day
#' @param date A date in which the cut will be made
#' @result A list with title and subtitle


title_subtitle_line_fecha <- function(db, date){
  
  
  casos_nuevos <- prettyNum(owid_chart$casos_nuevos[owid_chart$date == date], big.mark = ",")
  casos_hasta_hoy <- prettyNum(owid_chart$confirmed[owid_chart$date == date], big.mark = ",")
  muertes_hasta_hoy <- prettyNum(owid_chart$deaths[owid_chart$date == date], big.mark = ",")
  date_label <-  glue('{day(date)} de {month(date, label = T, abbr = F)} del {year(date)}')
  
  title = glue('{date_label}')
  
  subtitle = glue('Casos nuevos: {casos_nuevos}<br>Casos confirmados acumulados: {casos_hasta_hoy}')
  
  return(list(title = title,
              subtitle = subtitle))
  
}
