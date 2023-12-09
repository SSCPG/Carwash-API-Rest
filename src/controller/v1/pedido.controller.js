import service from '../../service/v1/pedido.service.js'
import { cuerpoPedidoFormat, washServiceFormat } from './utils/pedido.js'
import { fechaFormat } from './utils/fechaFormat.js'

export const createPedido = async (req, res) => {
  const { encabezadoPedido, allService, allAceites, allNewFilters } = req.body

  const idPedido = await service.getNewIdPedido()
  encabezadoPedido.idPedido = idPedido

  console.log(allAceites, 'Desde el controlador')

  try {
    await service.createEncabezadoPedido(encabezadoPedido)

    const newCuerpoPedido = cuerpoPedidoFormat({ allAceites, allNewFilters, idPedido })
    const newWashService = washServiceFormat(allService, encabezadoPedido)

    for (const item of newWashService) {
      await service.createWashService(item)
    }

    for (const item of newCuerpoPedido) {
      await service.createCuerpoPedido(item)
    }

    for (const item of newCuerpoPedido) {
      await service.restarInventario(item.idProducto, item.cantidad)
    }

    res.json({ message: 'Pedido creado correctamente' })
  } catch (error) {
    res.status(500).json({ message: error.message })
  }
}

export const getEncabezadoPedido = async (req, res) => {
  try {
    const encabezadoPedido = await service.getEncabezadoPedido()
    const data = encabezadoPedido.map((pedido) => {
      return {
        ...pedido,
        fecha: fechaFormat(pedido.fecha)
      }
    })
    if (encabezadoPedido.length === 0) {
      return res.send({
        status: 200,
        message: 'No hay pedidos registrados',
        data
      })
    } else if (encabezadoPedido.length > 0) {
      res.send({
        status: 200,
        message: 'Pedidos encontrados',
        data
      })
    } else {
      res.send({
        status: 404,
        message: 'No se encontraron pedidos'
      })
    }
  } catch (error) {
    res.status(500).json({ message: error.message })
  }
}

export const getDescripcionPedidoById = async (req, res) => {
  const { id } = req.params
  try {
    const [ventas] = await service.getDescripcionPedidoById(id)
    const [washService] = await service.getWashServiceById(id)
    const [pedido] = await service.getPedidoById(id)
    const result = {
      pedido,
      washService,
      ventas: ventas.map((venta) => {
        return {
          ...venta,
          idCategoria: venta.idCategoria === 'A' ? 'Aceite' : 'Filtro'
        }
      })
    }
    if (pedido.length === 0) {
      return res.send({
        status: 200,
        message: 'No hay pedidos registrados',
        data: result
      })
    } else if (ventas.length === 0 && washService.length === 0) {
      res.send({
        status: 404,
        message: 'OPS! No se encontraron detalles del pedido'
      })
    } else {
      res.send({
        status: 200,
        message: 'Pedidos encontrados',
        data: result
      })
    }
  } catch (error) {
    res.status(500).json({ message: error.message })
  }
}
