
 <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="/WEB-INF/jsp/home-admin.jsp">Admin Panel</a>
                    
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i>  ${Iuser.firstName} ${Iuser.lastName} <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="AdminProfile?usrid=${Iuser.userID}">Profile</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="LogoutServlet">Logout</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav">
                            <li class="active">
                                <a href="#">Dashboard</a>
                            </li>
<!--                             <li class="dropdown"> -->
<!--                                 <a href="#" data-toggle="dropdown" class="dropdown-toggle">Settings <b class="caret"></b> -->

<!--                                 </a> -->
<!--                                 <ul class="dropdown-menu" id="menu1"> -->
<!--                                     <li> -->
<!--                                         <a href="#">Tools <i class="icon-arrow-right"></i> -->

<!--                                         </a> -->
<!--                                         <ul class="dropdown-menu sub-menu"> -->
<!--                                             <li> -->
<!--                                                 <a href="#">Reports</a> -->
<!--                                             </li> -->
<!--                                             <li> -->
<!--                                                 <a href="#">Logs</a> -->
<!--                                             </li> -->
<!--                                             <li> -->
<!--                                                 <a href="#">Errors</a> -->
<!--                                             </li> -->
<!--                                         </ul> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="#">SEO Settings</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="#">Other Link</a> -->
<!--                                     </li> -->
<!--                                     <li class="divider"></li> -->
<!--                                     <li> -->
<!--                                         <a href="#">Other Link</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="#">Other Link</a> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                             </li> -->
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">Content <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                	<li>
                                        <a tabindex="-1" href="AlbumList">Albums</a>
                                    </li>
                                	<li>
                                        <a tabindex="-1" href="SongList">Songs</a>
                                    </li>
                                     <li>
                                        <a tabindex="-1" href="ArtistList">Artists</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="EditorList">Editors</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="GenreList">Genres</a>
                                    </li>
                                    <li>
                                    	<a href="Associations" >Associations</a>
<!--                                         <a tabindex="-1" href="#"></a> -->
                                    </li>
                       
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="#">FAQ</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">Users <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="UserList?param=1">User List</a>
                                    </li>
<!--                                     <li> -->
<!-- <!--                                         <a tabindex="-1" href="UserList?param=2">Search</a> --> 
<!-- 											<a tabindex="-1" href="#">Search</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a tabindex="-1" href="#">Permissions</a> -->
<!--                                     </li> -->
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>