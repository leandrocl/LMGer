
<%@ page import="br.com.tdsis.lm.manager.Grau" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'grau.label', default: 'Grau')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'grau.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="saudacao" title="${message(code: 'grau.saudacao.label', default: 'Saudacao')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'grau.nome.label', default: 'Nome')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${grauInstanceList}" status="i" var="grauInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${grauInstance.id}">${fieldValue(bean: grauInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: grauInstance, field: "saudacao")}</td>
                        
                            <td>${fieldValue(bean: grauInstance, field: "nome")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${grauInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
