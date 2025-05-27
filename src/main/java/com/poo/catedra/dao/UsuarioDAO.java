package com.poo.catedra.dao;

import com.poo.catedra.mapper.UsuarioMapper;
import com.poo.catedra.model.Usuario;
import com.poo.catedra.utils.Conexion;
import com.poo.catedra.utils.HashChecker;

import java.util.List;

public class UsuarioDAO {

    private final UsuarioMapper mapper = new UsuarioMapper();

    /**
     * Obtiene todos los usuarios de la base de datos.
     * @return Lista de usuarios.
     */
    public List<Usuario> obtenerTodos() {
        String sql = "SELECT * FROM usuarios";
        return Conexion.query(sql, mapper);
    }

    /**
     * Obtiene un usuario por su id.
     * @param id Identificador del usuario.
     * @return Usuario encontrado o null si no existe.
     */
    public Usuario obtenerPorId(int id) {
        String sql = "SELECT * FROM usuarios WHERE id = ?";
        return Conexion.queryOne(sql, mapper, id);
    }

    /**
     * Inserta un nuevo usuario en la base de datos.
     * @param usuario Usuario a insertar.
     * @return ID generado del nuevo usuario o -1 si no se generó.
     */
    public int insertar(Usuario usuario) {
        String sql = "INSERT INTO usuarios (email, rol, password, estado, fecha_creacion, fecha_actualizacion) VALUES (?, ?, ?, ?, ?, ?)";
        return Conexion.execute(sql,
                usuario.getEmail(),
                usuario.getRol(),
                usuario.getPassword(),
                usuario.getEstado(),
                usuario.getFecha_creacion(),
                usuario.getFecha_actualizacion()
        );
    }

    /**
     * Actualiza un usuario existente.
     * @param usuario Usuario con los datos actualizados.
     * @return Número de filas afectadas.
     */
    public int actualizar(Usuario usuario) {
        String sql = "UPDATE usuarios SET email = ?, rol = ?, password = ?, estado = ?, fecha_actualizacion = ?, fecha_inactivacion = ? WHERE id = ?";
        return Conexion.execute(sql,
                usuario.getEmail(),
                usuario.getRol(),
                usuario.getPassword(),
                usuario.getEstado(),
                usuario.getFecha_actualizacion(),
                usuario.getFecha_inactivacion(),
                usuario.getId()
        );
    }

    /**
     * Elimina un usuario por su id.
     * @param id Identificador del usuario a eliminar.
     * @return Número de filas afectadas.
     */
    public int eliminar(int id) {
        String sql = "DELETE FROM usuarios WHERE id = ?";
        return Conexion.execute(sql, id);
    }

    /**
     * Autentica un usuario comparando email y contraseña.
     * @param email Email del usuario.
     * @param password Contraseña sin hashear para validar.
     * @return Usuario autenticado o null si falla autenticación.
     */
    public Usuario autenticar(String email, String password) {
        String sql = "SELECT * FROM usuarios WHERE email = ?";
        Usuario usuario = Conexion.queryOne(sql, mapper, email);

        if (usuario == null) {
            return null;
        }

        boolean passValida = HashChecker.verificarHash(password, usuario.getPassword());
        return passValida ? usuario : null;
    }

    public Usuario obtenerPorEmail(String email) {
        String sql = "SELECT * FROM usuarios WHERE email = ?";
        return Conexion.queryOne(sql, mapper, email);
    }
}
