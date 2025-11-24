// routes/areas.js
import { Router } from 'express';

const router = Router();

router.get('/', (req, res) => {
  res.json({ ok: true, recurso: 'areas' });
});

export default router;