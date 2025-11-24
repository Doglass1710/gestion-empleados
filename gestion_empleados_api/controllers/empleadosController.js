// controllers/empleadosController.js

import { crearEmpleado } from "../Models/empleadosModel.js";

export const crearEmpleadoController = async (req, res) => {
    try {
        const { nombres, apellidos, id_area, correo, puesto } = req.body;

        // Validaciones
        if (!nombres || !apellidos || !id_area) {
            return res.status(400).json({
                error: "Los campos nombres, apellidos e id_area son obligatorios"
            });
        }

        const result = await crearEmpleado({
            nombre: nombres,
            apellido: apellidos,
            correo: correo || null,
            puesto: puesto || null,
            id_area
        });

        return res.status(201).json({
            message: "Empleado creado con éxito",
            id: result.insertId
        });

    } catch (error) {
        console.error("Error al crear empleado:", error);
        return res.status(500).json({
            error: "Error interno al crear empleado"
        });
    }
};
