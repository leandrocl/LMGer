
<%@ page import="br.com.tdsis.lm.manager.Irmao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'irmao.label', default: 'Irmao')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="irmao.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: irmaoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="irmao.pessoa.label" default="Pessoa" /></td>
                            
                            <td valign="top" class="value"><g:link controller="pessoa" action="show" id="${irmaoInstance?.pessoa?.id}">${irmaoInstance?.pessoa?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="irmao.grau.label" default="Grau" /></td>
                            
                            <td valign="top" class="value"><g:link controller="grau" action="show" id="${irmaoInstance?.grau?.id}">${irmaoInstance?.grau?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="irmao.dataDaIniciacao.label" default="Data Da Iniciacao" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${irmaoInstance?.dataDaIniciacao}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="irmao.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: irmaoInstance, field: "status")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="irmao.cargo.label" default="Cargo" /></td>
                            
                            <td valign="top" class="value"><g:link controller="cargo" action="show" id="${irmaoInstance?.cargo?.id}">${irmaoInstance?.cargo?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="irmao.lojaMae.label" default="Loja Mae" /></td>
                            
                            <td valign="top" class="value"><g:link controller="loja" action="show" id="${irmaoInstance?.lojaMae?.id}">${irmaoInstance?.lojaMae?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${irmaoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
