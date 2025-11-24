const express = require("express");
const cors = require("cors");

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// Ruta POST para crear empleados
app.post("/api/empleados", (req, res) => {
  const { nombres, apellidos, correo, puesto, edad, id_area } = req.body;

  if (!nombres || !apellidos || !correo || isNaN(edad) || isNaN(id_area)) {
    return res.status(400).json({ message: "Datos incompletos o inválidos" });
  }

  console.log("Empleado recibido:", req.body);

  res.status(201).json({ message: "Empleado creado exitosamente" });
});

app.listen(PORT, () => {
  console.log(`Servidor backend corriendo en http://localhost:${PORT}`);
});