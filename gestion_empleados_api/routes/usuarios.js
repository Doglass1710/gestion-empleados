// routes/usuarios.js
import { Router } from 'express';

const router = Router();

router.get('/', (req, res) => {
  res.json({ ok: true, recurso: 'usuarios' });
});

export default router;