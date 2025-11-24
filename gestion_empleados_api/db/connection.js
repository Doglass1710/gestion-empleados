// db/connection.js
import mysql from "mysql2/promise";

export const db = await mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "D6M7NR98XD3C*50",
  database: "gestion_empleados"
});

