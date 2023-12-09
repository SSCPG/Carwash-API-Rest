import { pool } from '../../db.js'

const getAllClientes = async () => {
  const [data] = await pool.query('SELECT * FROM cliente')
  return data
}

const createCliente = async (cliente) => {
  const { idCliente, nombre, apellido, telefono, email, direccion } = cliente

  const newCliente = {
    idCliente,
    nombre,
    apellido,
    telefono,
    email,
    direccion
  }

  const [data] = await pool.query('INSERT INTO cliente SET ?', [newCliente])
  return data
}

const updateCliente = async (id, cliente) => {
  const { nombre, apellido, telefono, email, direccion } = cliente
  const [data] = await pool.query('UPDATE cliente SET nombre = IFNULL(?, nombre), apellido = IFNULL(?, apellido), telefono = IFNULL(?, telefono), email = IFNULL(?, email), direccion = IFNULL(?, direccion) WHERE idCliente = ?', [nombre, apellido, telefono, email, direccion, id])
  return data
}

const deleteCliente = async (id) => {
  const [data] = await pool.query('DELETE FROM cliente WHERE idCliente = ?', [id])
  return data
}

export default {
  getAllClientes,
  createCliente,
  updateCliente,
  deleteCliente
}
