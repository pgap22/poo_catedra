package com.poo.catedra.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.logging.Logger;

@WebFilter(urlPatterns = {"/admin/*"}) // Aplica a todo lo que esté bajo /admin/
public class RolFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        if (session != null && session.getAttribute("id") != null) {
            String rol = (String) session.getAttribute("rol");
            Logger log = Logger.getLogger("RolFilter");
            log.info("Rol: " + rol);
            if ("admin".equals(rol)) {
                chain.doFilter(request, response); // sigue con la petición
            } else {
                res.sendRedirect(req.getContextPath() + "/unauthorized.jsp");
            }
        } else {
            res.sendRedirect(req.getContextPath() + "/login/login.jsp");
        }
    }
}

