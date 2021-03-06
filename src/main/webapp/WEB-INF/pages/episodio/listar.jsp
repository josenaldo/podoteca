<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
<h1>Episódios</h1>

<c:if test="${not empty mensagem}">
	<t:alert messageText="${mensagem}" messageStyle="${tipoDaMensagem}"></t:alert>
</c:if>

<table class="table table-stripped table-hover">
	<tr>
		<th>ID</th>
		<th>Título</th>
		<th>Descrição</th>
		<th>URL</th>
		<th>Podcast</th>
		<th></th>
		<th></th>
		<th></th>	
	</tr>
	<c:forEach items="${episodios}" var="episodio">
		<tr class="left">
			<td>${episodio.id}</td>
			<td class="break-column">${episodio.titulo}</td>
			<td class="break-column">
				${episodio.descricao}
			</td>
			<td class="break-column">
				<a href="${episodio.url}" target="_blank">
					${episodio.url}
				</a>
			</td>
			<td class="break-column">
				<a href="${contextPath}/podcasts/${episodio.podcast.id}">
					${episodio.podcast.nome}
				</a>
			</td>
			
			<td class="buttom-column">
				<a href="${contextPath}/episodios/${episodio.id}" title="Visualizar"
					class="btn btn-info"> <i class="icon-zoom-in"></i>
				</a>
			</td>
			<td class="buttom-column">
				<a href="${contextPath}/episodios/${episodio.id}/editar" title="Editar"
					class="btn btn-warning"> <i class="icon-edit"></i>
				</a>
			</td>
			<td class="buttom-column">
				<form:form method="DELETE" action="${contextPath}/episodios/${episodio.id}" >
					<button type="submit" class="btn btn-danger" title="Remover">
						<i class="icon-minus"></i>
					</button>
				</form:form>
			</td>	
		</tr>
	</c:forEach>
</table>

<a href="${contextPath}/episodios/adicionar" class="btn btn-primary">
	<i class="icon-plus"></i> Adicionar
</a>