package com.poo.catedra.mapper;

import com.poo.catedra.model.Subtarea;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SubtareaMapper implements Mapper<Subtarea> {

    @Override
    public Subtarea map(ResultSet rs) throws SQLException {
        Subtarea subtarea = new Subtarea();
        subtarea.setId(rs.getInt("id"));
        subtarea.setAsignacionId(rs.getInt("asignacionId"));
        subtarea.setTituloSubtarea(rs.getString("tituloSubtarea"));
        subtarea.setDescripcion(rs.getString("descripcion"));
        return subtarea;
    }
}