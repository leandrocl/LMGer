
<%@ page import="br.com.tdsis.lm.manager.Irmao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'irmao.label', default: 'Irmao')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'irmao.id.label', default: 'Id')}" />
                        
                            <th><g:message code="irmao.pessoa.label" default="Pessoa" /></th>
                   	    
                            <th><g:message code="irmao.grau.label" default="Grau" /></th>
                   	    
                            <g:sortableColumn property="dataDaIniciacao" title="${message(code: 'irmao.dataDaIniciacao.label', default: 'Data Da Iniciacao')}" />
                        
                            <g:sortableColumn property="status" title="${message(code: 'irmao.status.label', default: 'Status')}" />
                        
                            <th><g:message code="irmao.cargo.label" default="Cargo" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${irmaoInstanceList}" status="i" var="irmaoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${irmaoInstance.id}">${fieldValue(bean: irmaoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: irmaoInstance, field: "pessoa")}</td>
                        
                            <td>${fieldValue(bean: irmaoInstance, field: "grau")}</td>
                        
                            <td><g:formatDate date="${irmaoInstance.dataDaIniciacao}" /></td>
                        
                            <td>${fieldValue(bean: irmaoInstance, field: "status")}</td>
                        
                            <td>${fieldValue(bean: irmaoInstance, field: "cargo")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${irmaoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
