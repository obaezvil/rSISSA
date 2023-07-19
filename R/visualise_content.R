#' Visualizar módulos en formato HTML
#' 
#' @param modulo caracter indicando cuál módulo visualizar:
#' \itemize{
#'   \item{'Intro': }{Introducción al curso}
#'   \item{'Modulo1': }{Introducción a R - Parte 1}
#'   \item{'Modulo2': }{Introducción a R - Parte 2}
#'   \item{'Modulo3': }{Rásters y datos espaciales}
#'   \item{'Modulo4': }{Procesamiento de datos}
#'   \item{'Modulo5': }{Estadísticas espaciales y temporales}
#'   \item{'Modulo6': }{Evaluación de productos de precipitación}
#'   \item{'Modulo7': }{Introducción a machine learning - I}
#'   \item{'Modulo8': }{Introducción a machine learning - II}
#'   \item{'Modulo9': }{Fusión de productos de precipitación}
#'   \item{'Modulo10': }{Funciones y cómputo en paralelo}
#'   \item{'Modulo11': }{Trabajando con RMarkdown y Leaflet}
#'}
#'
#' @return esta función lleva al usiario al módulo seleccionado.
#' @export
#'
#' @examples
render_lectures <- function(modulo){
  
  # Setting the directory
  dir <- .get_libpath("rSISSA")
  dir <- file.path(dir, "doc")
  
  # Setting the lecture names
  lectures <- c("Intro", paste0("Modulo", 1:11))
  
  # Checking if the name corresponds to the existing lectures
  if(!modulo %in% lectures)
    stop("Por favor indique el nombre del módulo: 
          'Intro' : Introducción al curso
          'Modulo1' : Introducción a R - Parte 1
          'Modulo2' : Introducción a R - Parte 2
          'Modulo3' : Rásters y datos espaciales
          'Modulo4' : Procesamiento de datos
          'Modulo5' : Estadísticas espaciales y temporales
          'Modulo6': Evaluación de productos de precipitación
          'Modulo7': Introducción a machine learning - I
          'Modulo8': Introducción a machine learning - II
          'Modulo9': Fusión de productos de precipitación
          'Modulo10': Funciones y cómputo en paralelo
          'Modulo11': Trabajando con RMarkdown y Leaflet")
  
  if(modulo == "Intro"){
    browseURL(file.path(dir, "Modulo0_Introduccion.html"))
  } else if (modulo == "Modulo1"){
    browseURL(file.path(dir, "Modulo1_Introduccion_a_R_I.html"))
  } else if (modulo == "Modulo2"){
    browseURL(file.path(dir, "Modulo2_Introduccion_a_R_II.html"))
  } else if (modulo == "Modulo3"){
    browseURL(file.path(dir, "Modulo3_Rasters_y_datos_espaciales.html"))
  } else if (modulo == "Modulo4"){
    browseURL(file.path(dir, "Modulo4_Procesamiento_de_Datos.html"))
  } else if (modulo == "Modulo5"){
    browseURL(file.path(dir, "Modulo5_Estadisticas_espaciales_y_temporales.html"))
  } else if (modulo == "Modulo6"){
    browseURL(file.path(dir, "Modulo6_Evaluacion_Productos_P.html"))
  } else if (modulo == "Modulo7"){
    browseURL(file.path(dir, "Modulo7_Introduccion_a_Machine_Learning_I.html"))
  } else if (modulo == "Modulo8"){
    browseURL(file.path(dir, "Modulo8_Introduccion_a_Machine_Learning_II.html"))
  } else if (modulo == "Modulo9"){
    browseURL(file.path(dir, "Modulo9_Fusion_de_Productos_de_Precipitacion.html"))
  } else if (modulo == "Modulo10"){
    browseURL(file.path(dir, "Modulo10_Funciones_y_Computo_en_paralelo.html"))
  } else if (modulo == "Modulo11"){
    browseURL(file.path(dir, "Modulo11_Markdown_y_Leaflet.html"))
  } 
  
} # end render_lectures


#' Visualizar ejercicios en formato HTML
#'
#' @param exercise caracter indicando cuál ejercicio visualizar:
#'   'Ejercicio_practico1', 'Ejercicio_practico2', or 'Ejercicio_practico3'
#' @param resuelto argumento lógico. Se debe visualizar la solución? FALSE por defecto
#'
#' @return esta función lleva al usiario al ejercicio seleccionado.
#' @export
#'
#' @examples
render_exercises <- function(ejercicio, resuelto = FALSE){
  
  # Setting the directory
  dir <- .get_libpath("rSISSA")
  dir <- file.path(dir, "doc")
  
  # Setting the lecture names
  exercises <- paste0("Ejercicio_practico", c(1.1, 1.2, 2, 3, 4))
  
  # Checking if the name corresponds to the existing lectures
  if(!ejercicio %in% exercises)
    stop("Por favor indique el nombre del ejercicio:
          'Ejercicio_practico1.1', 'Ejercicio_practico1.2', 'Ejercicio_practico2', 'Ejercicio_practico3', or 'Ejercicio_practico4'")
  
  # Checking if the parameter resuelto is logical
  if(!is.logical(resuelto))
    stop("El parámetro 'resuelto' debe de ser TRUE o FALSE")
  
  # Extracting number
  nbr <- substr(ejercicio, 19, nchar(ejercicio))
  
  if(resuelto){
    browseURL(file.path(dir, paste0("Ejercicio", nbr, "_resuelto.html")))
  } else {
    browseURL(file.path(dir, paste0("Ejercicio", nbr, ".html")))
  } 
  
} # end render_exercises


# utils function that finds library of the packages
.get_libpath <- function(package){
  
  # Get library paths
  paths <- .libPaths()
  
  # iterative process to find package
  pos <- NA
  for(i in 1:length(paths)){
    
    pos[i] <- file.exists(file.path(paths[i], package))
    
  }
  
  # Checking libpaths that include the package
  final_path <- paths[which(pos == "TRUE")]
  
  # Checking that the package is there
  if(length(final_path) < 1)
    stop("The package ", package, " could not be found!")
  
  # retrieving library path
  final_path <- file.path(final_path[1], package)
  return(final_path)
  
}
