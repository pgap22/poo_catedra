package com.poo.catedra.controllers;

import com.poo.catedra.utils.SesionHelper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "sesionController", value = "/sesionController")
public class SesionController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String logout = req.getParameter("logout");

        if(!logout.isEmpty()){
            SesionHelper.cerrarSesion(req);
            resp.sendRedirect("/login/login.jsp");
        }
    }
}