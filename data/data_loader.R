load_sample_data <- function(n = 200) {
    set.seed(42)
    
    # Define reasons for disengagement and feedback options
    disengagement_reasons_options <- c(
        "Precio Alto", "Competidor - Mejor Entrega", "Competidor - Regala Herramientas",
        "Competidor - Ofrece Crédito", "Mal Servicio - Problemas de Comunicación",
        "Mal Servicio - Demora en la Cotización"
    )
    
    feedback_gestion_options <- c(
        "Comprometido", "Compra por Proyecto", "Compra por Ubicación", "Reubicado",
        "Requiere Seguimiento", "Reactivado", "No Receptivo", "Visitar"
    )
    
    # Generate customer data with the new and existing fields
    customer_data <- data.frame(
        id_cliente = 1:n,
        nombre = sample(c("Juan", "María", "Carlos", "Ana", "Pedro"), n, replace = TRUE),
        apellido = sample(c("Sánchez", "Martínez", "Rodríguez", "Fernández", "Pérez"), n, replace = TRUE),
        edad = sample(18:65, n, replace = TRUE),
        genero = sample(c("Masculino", "Femenino"), n, replace = TRUE),
        region = sample(c("Norte", "Sur", "Este", "Oeste"), n, replace = TRUE),
        segmento = sample(c("CONSTRUCTORAS", "RETAIL", "DISTRIBUCION", "ENERGIA RENOVABLE"), n, replace = TRUE),
        frecuencia_compra = sample(c("Alta", "Media", "Baja"), n, replace = TRUE),
        gasto_promedio = sample(500:20000, n, replace = TRUE),
        productos_favoritos = sample(c("Herramientas", "Materiales", "Seguridad"), n, replace = TRUE),
        probabilidad_recompra = runif(n, 0, 1),
        puntaje_de_engagement = round(runif(n, 0, 100), 2),
        days_since_last_purchase = sample(0:60, n, replace = TRUE),
        estado_del_cliente = cut(sample(1:60, n, replace = TRUE), 
                                 breaks = c(-Inf, 8, 15, 25, 45, Inf), 
                                 labels = c("Activo", "En Riesgo", "En Alto Riesgo", "Requiere Atención", "Perdido")),
        feedback_gestion = sample(feedback_gestion_options, n, replace = TRUE),
        causas_de_alejamiento = sapply(1:n, function(x) paste(sample(disengagement_reasons_options, sample(1:3, 1)), collapse = ", ")),
        valor_promedio_compra = sample(500:20000, n, replace = TRUE),
        accion_reengagement = sapply(1:n, function(x) {
            estado <- sample(c("Activo", "En Riesgo", "En Alto Riesgo", "Requiere Atención", "Perdido"), 1)
            switch(estado,
                   "En Riesgo" = "Enviar email de descuento",
                   "En Alto Riesgo" = "Asignar llamada de seguimiento",
                   "Requiere Atención" = "Invitar a evento o descuento",
                   "Perdido" = "Campaña de recuperación",
                   "No requiere acción")
        }),
        interaccion_reciente_con_competencia = sample(c(TRUE, FALSE), n, replace = TRUE),
        puntaje_de_lealtad = sample(1:10, n, replace = TRUE),
        ventas_totales = sample(1000:500000, n, replace = TRUE),
        fecha_de_ultima_compra = sample(seq(as.Date('2023/01/01'), as.Date('2024/12/31'), by = "day"), n, replace = TRUE)
    )
    
    # Add priority level for reengagement based on probability of repurchase
    customer_data$prioridad_reengagement <- with(customer_data, ifelse(probabilidad_recompra > 0.7, "Alta",
                                                                       ifelse(probabilidad_recompra > 0.4, "Media", "Baja")))
    
    return(customer_data)
}
