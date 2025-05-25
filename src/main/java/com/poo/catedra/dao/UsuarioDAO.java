package com.poo.catedra.dao;

import com.poo.catedra.mapper.UsuarioMapper;
import com.poo.catedra.model.Usuario;
import com.poo.catedra.utils.Conexion;

import java.sql.SQLException;
import java.util.List;

public class UsuarioDAO {

    private final UsuarioMapper mapper = new UsuarioMapper();

    public List<Usuario> obtenerTodos() {
        String sql = "SELECT * FROM usuarios";
        return Conexion.query(sql, mapper);
    }

    public Usuario obtenerPorId(int id) {
        String sql = "SELECT * FROM usuarios WHERE id = ?";
        return Conexion.queryOne(sql, mapper, id);
    }

    public int insertar(Usuario usuario) {
        String sql = "INSERT INTO usuarios (nombreUsuario, rol) VALUES (?, ?)";
        return Conexion.execute(sql, usuario.getNombreUsuario(), usuario.getRol());
    }

    public int actualizar(Usuario usuario) {
        String sql = "UPDATE usuarios SET nombreUsuario = ?, rol = ? WHERE id = ?";
        return Conexion.execute(sql, usuario.getNombreUsuario(), usuario.getRol(), usuario.getId());
    }

    public int eliminar(int id) {
        String sql = "DELETE FROM usuarios WHERE id = ?";
        return Conexion.execute(sql, id);
    }
}