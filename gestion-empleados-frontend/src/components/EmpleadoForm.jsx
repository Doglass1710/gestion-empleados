import React, { useState } from "react";

function EmpleadoForm() {
  const [formData, setFormData] = useState({
    nombres: "",
    apellidos: "",
    correo: "",
    puesto: "",
    edad: "",
    id_area: ""
  });

  const [resultados, setResultados] = useState([]);
  const [busqueda, setBusqueda] = useState("");

  // Manejar cambios en inputs
  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  // Crear empleado
  const handleSubmit = async (e) => {
    e.preventDefault();
    const res = await fetch("http://localhost:3000/api/empleados", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(formData)
    });
    const data = await res.json();
    alert(data.message);

    // limpiar formulario después de registrar
    setFormData({
      nombres: "",
      apellidos: "",
      correo: "",
      puesto: "",
      edad: "",
      id_area: ""
    });
  };

  // Buscar empleados SOLO por apellido
  const handleBuscar = async () => {
    const res = await fetch(
      `http://localhost:3000/api/empleados?apellidos=${busqueda}`
    );
    const data = await res.json();
    setResultados(data);
  };

  return (
    <div>
      <h2>Registro de Empleados</h2>
      <form onSubmit={handleSubmit}>
        <input
          name="nombres"
          placeholder="Nombres"
          value={formData.nombres}
          onChange={handleChange}
        />
        <input
          name="apellidos"
          placeholder="Apellidos"
          value={formData.apellidos}
          onChange={handleChange}
        />
        <input
          name="correo"
          placeholder="Correo"
          value={formData.correo}
          onChange={handleChange}
        />
        <input
          name="puesto"
          placeholder="Puesto"
          value={formData.puesto}
          onChange={handleChange}
        />
        <input
          name="edad"
          placeholder="Edad"
          value={formData.edad}
          onChange={handleChange}
        />
        <input
          name="id_area"
          placeholder="ID Área"
          value={formData.id_area}
          onChange={handleChange}
        />
        <button type="submit">Crear empleado</button>
      </form>

      <h3>Buscar empleados por apellido</h3>
      <input
        placeholder="Apellido"
        value={busqueda}
        onChange={(e) => setBusqueda(e.target.value)}
      />
      <button onClick={handleBuscar}>Buscar</button>

      <ul>
        {resultados.map((emp) => (
          <li key={emp.id}>
            {emp.nombres} {emp.apellidos} - {emp.correo} - {emp.puesto}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default EmpleadoForm;