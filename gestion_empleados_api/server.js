import express from "express";
import cors from "cors";
import empleadosRoutes from "./routes/empleados.js";
import { db } from "./db/connection.js";

const app = express();
const PORT = 3000;

app.use(cors({ origin: "http://localhost:3001" }));
app.use(express.json());

// Rutas
app.use("/api/empleados", empleadosRoutes);

// Búsqueda
app.get("/api/empleados", async (req, res) => {
  const apellido = req.query.apellido || req.query.apellidos || "";
  const correo = req.query.correo || "";
  const puesto = req.query.puesto || "";

  let query = "SELECT * FROM empleados WHERE 1=1";
  const params = [];

  if (apellido) {
    query += " AND apellido LIKE ?";
    params.push(`%${apellido}%`);
  }

  if (correo) {
    query += " AND correo LIKE ?";
    params.push(`%${correo}%`);
  }

  if (puesto) {
    query += " AND puesto LIKE ?";
    params.push(`%${puesto}%`);
  }

  try {
    const [rows] = await db.execute(query, params);
    res.json(rows);
  } catch (error) {
    console.error("Error al buscar empleados:", error);
    res.status(500).json({ message: "Error interno" });
  }
});

app.listen(PORT, () => {
  console.log(`Servidor backend corriendo en http://localhost:${PORT}`);
});
