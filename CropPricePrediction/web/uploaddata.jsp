<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marathi Word Input</title>
</head>
<body>
    <h2>Enter Marathi Word</h2>
    <%
        String marathiWord = request.getParameter("marathiWord");
        String question_word=request.getParameter("que");
String ans=request.getParameter("ans");
        System.out.println("ans"+marathiWord);
        out.println(marathiWord);
        response.getWriter().println("<!DOCTYPE html>");
        response.getWriter().println("<html lang=\"en\">");
        response.getWriter().println("<head>");
        response.getWriter().println("<meta charset=\"UTF-8\">");
        response.getWriter().println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
        response.getWriter().println("<title>Marathi Servlet Response</title>");
        response.getWriter().println("</head>");
        response.getWriter().println("<body>");
        response.getWriter().println("<h2>Marathi Word Received <p>??? ???????? ???? ??? ??? ???</p>"+marathiWord+"</h2>");
        response.getWriter().println("<p>Received Marathi Word: <s/");
        response.getWriter().println("</body>");
        response.getWriter().println("</html>");
    %>
</body>
</html>