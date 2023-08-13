<%
    String message = (String)session.getAttribute("message");
    if(message != null)
    {
//    out.println(message);

%>

<div class="alert alert-sucess alert-dismissible fade show" role="alert" style="background-color: #9cf8d8">
  <strong><%= message %></strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<%
    session.removeAttribute("message");
}


%>