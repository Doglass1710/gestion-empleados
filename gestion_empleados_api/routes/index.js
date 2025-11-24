import express from 'express';
import empleadosRoutes from './empleados.js';

const router = express.Router();

// Prefijo para empleados
router.use('/empleados', empleadosRoutes);

export default router;