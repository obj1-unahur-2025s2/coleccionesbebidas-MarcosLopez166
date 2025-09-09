object tito {
    var cantidad = 0
    var bebida = cianuro // ultima bebida consumida
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    // ultima bebida consumida
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}

object wisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}

object licuadoDeFrutas {
    const nutrientes = [] //aun que sea constante, se le puede hacer por ejemplo un .add(element)

    method agregarNutriente(unNutriente) {
        nutrientes.add(unNutriente)
    }
    method rendimiento(cantidad) {
        return nutrientes.sum() * (cantidad.div(1000))
    }
}

object saborizada {
    var bebida = wisky

    method mezclarCon_(unaBebida) {
        bebida = unaBebida
    }
    method rendimiento(cantidad) {
        return 1 + bebida.rendimiento(cantidad/4)
    }
}

object coctel {
    const bebidas = #{}

    method agregar_(unabebida) {
        bebidas.add(unabebida)
    }
    method rendimiento(cantidad) {
        var producto = 1
        bebidas.forEach({unaBebida => 
        producto = 
        unaBebida.rendimiento(cantidad / bebidas.size()) * producto})
        return producto
    }
}