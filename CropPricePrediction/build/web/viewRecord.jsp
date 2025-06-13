<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html lang="en">

<head>
     <meta charset="UTF-8">
    <%@include file="dashboard_css.jsp" %>
</head>
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <%@include file="header_1.jsp" %>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close ti-close"></i>
          <p class="settings-heading">SIDEBAR SKINS</p>
          <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Light</div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark</div>
          <p class="settings-heading mt-2">HEADER SKINS</p>
          <div class="color-tiles mx-0 px-4">
            <div class="tiles success"></div>
            <div class="tiles warning"></div>
            <div class="tiles danger"></div>
            <div class="tiles info"></div>
            <div class="tiles dark"></div>
            <div class="tiles default"></div>
          </div>
        </div>
      </div>
      <div id="right-sidebar" class="settings-panel">
        <i class="settings-close ti-close"></i>
        <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="todo-tab" data-toggle="tab" href="#todo-section" role="tab" aria-controls="todo-section" aria-expanded="true">TO DO LIST</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="chats-tab" data-toggle="tab" href="#chats-section" role="tab" aria-controls="chats-section">CHATS</a>
          </li>
        </ul>
        <div class="tab-content" id="setting-content">
          <div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
            <div class="add-items d-flex px-3 mb-0">
              <form class="form w-100">
                <div class="form-group d-flex">
                  <input type="text" class="form-control todo-list-input" placeholder="Add To-do">
                  <button type="submit" class="add btn btn-primary todo-list-add-btn" id="add-task">Add</button>
                </div>
              </form>
            </div>
            <div class="list-wrapper px-3">
              <ul class="d-flex flex-column-reverse todo-list">
                <li>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox">
                      Team review meeting at 3.00 PM
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox">
                      Prepare for presentation
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox">
                      Resolve all the low priority tickets due today
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li class="completed">
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox" checked>
                      Schedule meeting for next week
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li class="completed">
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox" checked>
                      Project review
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
              </ul>
            </div>
            <h4 class="px-3 text-muted mt-5 font-weight-light mb-0">Events</h4>
            <div class="events pt-4 px-3">
              <div class="wrapper d-flex mb-2">
                <i class="ti-control-record text-primary mr-2"></i>
                <span>Feb 11 2018</span>
              </div>
              <p class="mb-0 font-weight-thin text-gray">Creating component page build a js</p>
              <p class="text-gray mb-0">The total number of sessions</p>
            </div>
            <div class="events pt-4 px-3">
              <div class="wrapper d-flex mb-2">
                <i class="ti-control-record text-primary mr-2"></i>
                <span>Feb 7 2018</span>
              </div>
              <p class="mb-0 font-weight-thin text-gray">Meeting with Alisa</p>
              <p class="text-gray mb-0 ">Call Sarah Graves</p>
            </div>
          </div>
           To do section tab ends 
          <div class="tab-pane fade" id="chats-section" role="tabpanel" aria-labelledby="chats-section">
            <div class="d-flex align-items-center justify-content-between border-bottom">
              <p class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
              <small class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See All</small>
            </div>
            <ul class="chat-list">
              <li class="list active">
                <div class="profile"><img src="images/faces/face1.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Thomas Douglas</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">19 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="images/faces/face2.jpg" alt="image"><span class="offline"></span></div>
                <div class="info">
                  <div class="wrapper d-flex">
                    <p>Catherine</p>
                  </div>
                  <p>Away</p>
                </div>
                <div class="badge badge-success badge-pill my-auto mx-2">4</div>
                <small class="text-muted my-auto">23 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="images/faces/face3.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Daniel Russell</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">14 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="images/faces/face4.jpg" alt="image"><span class="offline"></span></div>
                <div class="info">
                  <p>James Richardson</p>
                  <p>Away</p>
                </div>
                <small class="text-muted my-auto">2 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="images/faces/face5.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Madeline Kennedy</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">5 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="images/faces/face6.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Sarah Graves</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">47 min</small>
              </li>
            </ul>
          </div>
           chat tab ends 
        </div>
      </div>
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
      <%@include file="admin_slider.jsp" %>
      <!-- partial -->
      <%
       
String name=(String)session.getAttribute("farmername");
//out.print("Hello "+name);
//          String fname;
//      String fname=session.getAttribute("farmername");
//      System.out.println("sss"+fname);
      %>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="main">
 <%
        String jdbcURL = "jdbc:mysql://localhost:3306/croppriceprediction?useSSL=false&serverTimezone=UTC";
        String dbUser = "root";
        String dbPassword = "";
        int page_d = 1;
        int recordsPerPage = 15;
        if (request.getParameter("page") != null) {
            page_d = Integer.parseInt(request.getParameter("page"));
        }
        
        List<String[]> records = new ArrayList<>();
        int noOfRecords = 0;
        int noOfPages = 0;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            
            // Query to get data with pagination
            String sql = "SELECT SQL_CALC_FOUND_ROWS * FROM price_dataset LIMIT ?, ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, (page_d - 1) * recordsPerPage);
            stmt.setInt(2, recordsPerPage);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                records.add(new String[]{
                    rs.getString("district"),
                    rs.getString("city"),
                    rs.getString("crop"),
                        rs.getString("max_price"),
                    rs.getString("modal_price"),
                        rs.getString("temp"),
                            rs.getString("humidity"),
                     rs.getString("arrival_date")
//                    String.valueOf(rs.getDouble("min_price")),
//                    String.valueOf(rs.getDouble("max_price")),
//                    String.valueOf(rs.getDouble("modal_price")),
//                    rs.getDate("arrival_date").toString()
                });
            }
            rs.close();
            stmt.close();

            // Get total records count
            Statement countStmt = conn.createStatement();
            ResultSet countRs = countStmt.executeQuery("SELECT FOUND_ROWS()");
            if (countRs.next()) {
                noOfRecords = countRs.getInt(1);
            }
            countRs.close();
            countStmt.close();

            conn.close();
            noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    <table class="table">
        <tr>
            <th>District</th>
            <th>City</th>
            <th>Crop</th>
        
            <th>Max Price (Rs./Quintal)</th>
     
            <th>Modal Price(Rs./Quintal)</th>
              <th>Temperature</th>
                <th>Humidity</th>
            <th> Date</th>
        </tr>
        <%
            for (String[] record : records) {
        %>
        <tr>
            <td><%= record[0] %></td>
            <td><%= record[1] %></td>
            <td><%= record[2] %></td>
           <td><%= record[3] %></td>
            <td><%= record[4] %></td>
         <td><%= record[5] %></td>
          <td><%= record[6] %></td>
 <td><%= record[7] %></td>
        </tr>
        <%
            }
        %>
    </table>
    <style>
        .pagination {
    text-align: center;
    margin: 20px 0;
}

.pagination a {
    display: inline-block;
    padding: 8px 15px;
    margin: 5px;
    border: 1px solid #ddd;
    border-radius: 5px;
    text-decoration: none;
    color: #333;
    background-color: #f8f9fa;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.pagination a:hover {
    background-color: #007bff;
    color: white;
}

.pagination a.active {
    font-weight: bold;
    background-color: #007bff;
    color: white;
    border-color: #007bff;
}

.pagination a.disabled {
    pointer-events: none;
    background-color: #e9ecef;
    color: #6c757d;
    border-color: #ddd;
}

    </style>
    <div class="pagination">
        <%
            for (int i = 1; i <= noOfPages; i++) {
                if (i == page_d) {
        %>
        <a class="active" href="viewRecord.jsp?page=<%= i %>"><%= i %></a>
        <%
                } else {
        %>
        <a href="viewRecord.jsp?page=<%= i %>"><%= i %></a>
        <%
                }
            }
        %>
    </div>
	</div>

        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2023.  Premium <a href="" target="_blank"></a>  All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="ti-heart text-danger ml-1"></i></span>
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="admin_asset/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="admin_asset/vendors/chart.js/Chart.min.js"></script>
  <script src="admin_asset/vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="admin_asset/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <script src="admin_asset/js/dataTables.select.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="admin_asset/js/off-canvas.js"></script>
  <script src="admin_asset/js/hoverable-collapse.js"></script>
  <script src="admin_asset/js/template.js"></script>
  <script src="admin_asset/js/settings.js"></script>
  <script src="admin_asset/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="admin_asset/js/dashboard.js"></script>
  <script src="admin_asset/js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->
</body>

</html>

