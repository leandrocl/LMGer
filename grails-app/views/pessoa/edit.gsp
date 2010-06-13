
<%@ page import="br.com.tdsis.lm.manager.Pessoa" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${pessoaInstance}">
            <div class="errors">
                <g:renderErrors bean="${pessoaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${pessoaInstance?.id}" />
                <g:hiddenField name="version" value="${pessoaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nome"><g:message code="pessoa.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pessoaInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" maxlength="100" value="${pessoaInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataDeNascimento"><g:message code="pessoa.dataDeNascimento.label" default="Data De Nascimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pessoaInstance, field: 'dataDeNascimento', 'errors')}">
                                    <g:datePicker name="dataDeNascimento" precision="day" value="${pessoaInstance?.dataDeNascimento}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sexo"><g:message code="pessoa.sexo.label" default="Sexo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pessoaInstance, field: 'sexo', 'errors')}">
                                    <g:select name="sexo" from="${pessoaInstance.constraints.sexo.inList}" value="${pessoaInstance?.sexo}" valueMessagePrefix="pessoa.sexo"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataDeCadastro"><g:message code="pessoa.dataDeCadastro.label" default="Data De Cadastro" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pessoaInstance, field: 'dataDeCadastro', 'errors')}">
                                    <g:datePicker name="dataDeCadastro" precision="day" value="${pessoaInstance?.dataDeCadastro}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="status"><g:message code="pessoa.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pessoaInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${pessoaInstance.constraints.status.inList}" value="${pessoaInstance?.status}" valueMessagePrefix="pessoa.status"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="user"><g:message code="pessoa.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pessoaInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${br.com.tdsis.lm.manager.User.list()}" optionKey="id" value="${pessoaInstance?.user?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
