import { Router } from 'express'
// Aqui deben ir las funciones a importar del controlador
import { createPedido, getEncabezadoPedido, getDescripcionPedidoById, createNewAbono } from '../../controller/v1/pedido.controller.js'

const router = Router()

router.post('/', createPedido)

router.get('/', getEncabezadoPedido)

router.get('/:id', getDescripcionPedidoById)

router.post('/abono', createNewAbono)

export default router
