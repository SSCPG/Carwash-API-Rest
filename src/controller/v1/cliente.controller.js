import service from '../../service/v1/cliente.service.js'

export const getAllClientes = async (req, res) => {
  try {
    const clientes = await service.getAllClientes()
    if (clientes.length === 0) {
      return res.send({
        status: 200,
        message: 'No se encontraron clientes',
        data: clientes
      })
    } else if (clientes.length > 0) {
      res.send({
        status: 200,
        message: 'Clientes encontrados',
        data: clientes
      })
    } else {
      res.send({
        status: 404,
        message: 'No se encontraron clientes'
      })
    }
  } catch (error) {
    res.status(500).send({
      status: 500,
      message: 'Error al obtener los clientes',
      error: error.message
    })
  }
}

export const getAllClientesId = async (req, res) => {
  try {
    const clientes = await service.getAllClientes()
    if (clientes.length === 0) {
      return res.send({
        status: 200,
        message: 'No se encontraron clientes',
        data: clientes
      })
    } else if (clientes.length > 0) {
      const clientesId = clientes.map((cliente) => {
        return cliente.idCliente
      })
      res.send({
        status: 200,
        message: 'Clientes encontrados',
        data: clientesId
      })
    } else {
      res.send({
        status: 404,
        message: 'No se encontraron clientes'
      })
    }
  } catch (error) {
    res.status(500).send({
      status: 500,
      message: 'Error al obtener los clientes',
      error: error.message
    })
  }
}

export const createCliente = async (req, res) => {
  try {
    const { idCliente, nombre, apellido, telefono, email, direccion } = req.body
    const cliente = {
      idCliente,
      nombre,
      apellido,
      telefono,
      email,
      direccion
    }
    const newCliente = await service.createCliente(cliente)
    res.status(201).send({
      status: 201,
      message: 'Cliente creado',
      data: newCliente
    })
  } catch (error) {
    res.status(500).send({
      status: 500,
      message: 'Error al crear el cliente',
      error: error.message
    })
  }
}

export const updateCliente = async (req, res) => {
  try {
    const { nombre, apellido, telefono, email, direccion } = req.body
    const cliente = {
      nombre,
      apellido,
      telefono,
      email,
      direccion
    }
    const updateCliente = await service.updateCliente(req.params.id, cliente)
    res.status(200).send({
      status: 200,
      message: 'Cliente actualizado',
      data: updateCliente
    })
  } catch (error) {
    res.status(500).send({
      status: 500,
      message: 'Error al actualizar el cliente',
      error: error.message
    })
  }
}

export const deleteCliente = async (req, res) => {
  try {
    const deleteCliente = await service.deleteCliente(req.params.id)
    res.status(200).send({
      status: 200,
      message: 'Cliente eliminado',
      data: deleteCliente
    })
  } catch (error) {
    res.status(500).send({
      status: 500,
      message: 'Error al eliminar el cliente',
      error: error.message
    })
  }
}
