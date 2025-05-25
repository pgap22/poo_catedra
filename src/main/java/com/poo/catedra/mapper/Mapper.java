package com.poo.catedra.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

@FunctionalInterface
public interface Mapper<T> {
    T map(ResultSet rs) throws SQLException;
}
