import { Router } from 'express'
// Aqui deben ir las funciones a importar del controlador
import { createPedido, getEncabezadoPedido, getDescripcionPedidoById } from '../../controller/v1/pedido.controller.js'

const router = Router()

router.post('/', createPedido)

router.get('/', getEncabezadoPedido)

router.get('/:id', getDescripcionPedidoById)

export default router
