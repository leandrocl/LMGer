
<%@ page import="br.com.tdsis.lm.manager.Loja" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'loja.label', default: 'Loja')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'loja.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="prefixo" title="${message(code: 'loja.prefixo.label', default: 'Prefixo')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'loja.nome.label', default: 'Nome')}" />
                        
                            <g:sortableColumn property="numero" title="${message(code: 'loja.numero.label', default: 'Numero')}" />
                        
                            <g:sortableColumn property="dataDaFundacao" title="${message(code: 'loja.dataDaFundacao.label', default: 'Data Da Fundacao')}" />
                        
                            <th><g:message code="loja.filiacao.label" default="Filiacao" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${lojaInstanceList}" status="i" var="lojaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${lojaInstance.id}">${fieldValue(bean: lojaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: lojaInstance, field: "prefixo")}</td>
                        
                            <td>${fieldValue(bean: lojaInstance, field: "nome")}</td>
                        
                            <td>${fieldValue(bean: lojaInstance, field: "numero")}</td>
                        
                            <td><g:formatDate date="${lojaInstance.dataDaFundacao}" /></td>
                        
                            <td>${fieldValue(bean: lojaInstance, field: "filiacao")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${lojaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
