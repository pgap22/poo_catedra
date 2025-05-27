package com.poo.catedra.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashChecker {

    // Devuelve el hash SHA-256 en formato hexadecimal
    public static String sha256(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = md.digest(input.getBytes());

            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                sb.append(String.format("%02x", b)); // convertir a hexadecimal
            }

            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Algoritmo SHA-256 no disponible", e);
        }
    }

    // Verifica si el hash calculado coincide con el esperado
    public static boolean verificarHash(String input, String hashEsperado) {
        String hashCalculado = sha256(input);
        return hashCalculado.equalsIgnoreCase(hashEsperado);
    }


}

