// Models/empleadosModel.js
import { db } from "../db/connection.js";

export async function crearEmpleado({ nombre, apellido, correo, puesto, id_area }) {
    const [result] = await db.execute(
        "INSERT INTO empleados (nombre, apellido, correo, puesto, id_area) VALUES (?, ?, ?, ?, ?)",
        [nombre, apellido, correo, puesto, id_area]
    );
    return result;
}
