import express from 'express';
import { crearEmpleadoController } from '../controllers/empleadosController.js';

const router = express.Router();

router.post('/', crearEmpleadoController);

export default router;
