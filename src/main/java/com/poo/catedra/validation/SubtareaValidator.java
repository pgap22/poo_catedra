package com.poo.catedra.validation;

import com.poo.catedra.model.Subtarea;
import java.util.ArrayList;
import java.util.List;

public class SubtareaValidator {

    /**
     * Valida los datos de una subtarea.
     *
     * @param subtarea La subtarea a validar.
     * @return Una lista de errores. Si la lista está vacía, la subtarea es válida.
     */
    public static List<String> validar(Subtarea subtarea) {
        List<String> errores = new ArrayList<>();

        // Validar que la subtarea no sea nula
        if (subtarea == null) {
            errores.add("La subtarea no puede ser nula.");
            return errores;
        }

        // Validar asignacionId
        if (subtarea.getAsignacionId() <= 0) {
            errores.add("Debe seleccionar una asignación válida.");
        }

        // Validar tituloSubtarea
        if (subtarea.getTituloSubtarea() == null || subtarea.getTituloSubtarea().isBlank()) {
            errores.add("El título de la subtarea es obligatorio.");
        } else if (subtarea.getTituloSubtarea().length() > 191) {
            errores.add("El título de la subtarea no puede tener más de 191 caracteres.");
        }

        // Validar descripcion
        if (subtarea.getDescripcion() == null || subtarea.getDescripcion().isBlank()) {
            errores.add("La descripción de la subtarea es obligatoria.");
        } else if (subtarea.getDescripcion().length() > 191) {
            errores.add("La descripción de la subtarea no puede tener más de 191 caracteres.");
        }

        return errores;
    }
}