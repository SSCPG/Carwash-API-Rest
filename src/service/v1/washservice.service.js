import { pool } from '../../db.js'

const getAllWashServices = async () => {
  const [data] = await pool.query('SELECT id, pedido.idPedido, pedido.idCliente, placa, washservice.fecha, tipoServicio, marca, modelo, precio FROM `washservice` LEFT JOIN pedido ON washservice.idPedido = pedido.idPedido;')
  return data
}

const getWashServicesComplete = async () => {
  const [data] = await pool.query("SELECT * FROM washservice WHERE tipoServicio = 'Completo';")
  return data
}

const getWashServicesBasic = async () => {
  const [data] = await pool.query("SELECT * FROM washservice WHERE tipoServicio = 'Básico';")
  return data
}

const createWashService = async (washService) => {
  const { idPedido, placa, marca, modelo, tipoServicio, precio, fecha } = washService
  const newWashService = {
    idPedido,
    placa,
    marca,
    modelo,
    tipoServicio,
    precio,
    fecha
  }

  const [data] = await pool.query('INSERT INTO washservice SET ?', [newWashService])
  return data
}

export default {
  getAllWashServices,
  getWashServicesComplete,
  getWashServicesBasic,
  createWashService
}
