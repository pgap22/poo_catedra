package com.poo.catedra.dao;

import com.poo.catedra.mapper.ClienteMapper;
import com.poo.catedra.model.Cliente;
import com.poo.catedra.utils.Conexion;

import java.util.List;

public class ClienteDAO {

    private final ClienteMapper mapper = new ClienteMapper();

    public List<Cliente> obtenerTodos() {
        String sql = "SELECT * FROM clientes";
        return Conexion.query(sql, mapper);
    }

    public Cliente obtenerPorId(int id) {
        String sql = "SELECT * FROM clientes WHERE id = ?";
        return Conexion.queryOne(sql, mapper, id);
    }

    public int insertar(Cliente cliente) {
        String sql = "INSERT INTO clientes ( nombre, documentoIdentificacion, tipoPersona, telefono, correo, direccion, estado, creadoPorId, fechaCreacion, fechaActualizacion ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        return Conexion.execute(sql,
                cliente.getNombre(),
                cliente.getDocumentoIdentificacion(),
                cliente.getTipoPersona().name(), // Asegúrate de que esto coincida con ENUM en BD
                cliente.getTelefono(),
                cliente.getCorreo(),
                cliente.getDireccion(),
                cliente.getEstado(),
                cliente.getCreadoPorId(),
                cliente.getFechaCreacion(),
                cliente.getFechaActualizacion()
        );
    }

    public int actualizar(Cliente cliente) {
        String sql = """
            UPDATE clientes SET
                nombre = ?,
                documentoIdentificacion = ?,
                tipoPersona = ?,
                telefono = ?,
                correo = ?,
                direccion = ?,
                estado = ?,
                creadoPorId = ?,
                fechaActualizacion = ?,
                fechaInactivacion = ?
            WHERE id = ?
        """;

        return Conexion.execute(sql,
                cliente.getNombre(),
                cliente.getDocumentoIdentificacion(),
                cliente.getTipoPersona().name(), // Asegúrate de que esto coincida con ENUM en BD
                cliente.getTelefono(),
                cliente.getCorreo(),
                cliente.getDireccion(),
                cliente.getEstado(),
                cliente.getCreadoPorId(),
                cliente.getFechaActualizacion(),
                cliente.getFechaInactivacion(),
                cliente.getId()
        );
    }

    public int eliminar(int id) {
        String sql = "DELETE FROM clientes WHERE id = ?";
        return Conexion.execute(sql, id);
    }

    public Cliente obtenerPorDocumentoIdentificacion(String documentoIdentificacion) {
        String sql = "SELECT * FROM clientes WHERE documentoIdentificacion = ?"; // Corregido
        return Conexion.queryOne(sql, mapper, documentoIdentificacion);
    }

    public List<Cliente> obtenerTodosActivos() {
        String sql = "SELECT * FROM clientes WHERE estado = 1";
        return Conexion.query(sql, mapper);
    }
}