<!--NEW ABOUTUS PAGE IS MADE IN OUR PROJECT, BUT YOU CAN USE THIS -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> About Us</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="web.css">
    <link rel="stylesheet" href="AboutUs.css">
</head>

<body>
<% 
    String username = "";
    Object userNameObj = session.getAttribute("userName");
    if(userNameObj != null) {
        username = userNameObj.toString();
    }
%>
    <section id="header">
        <img src="img/logo/logo.png" class="logo" alt="">

        <div class="navbar">
            <img src="img/logo.png" class="logo">
            <ul>
                <li><a href="Home.jsp">Home</a></li>
                <li><a href="Product.jsp">Product</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="AboutUs.jsp">About Us</a></li>
                <%if(username.equals("")){%>
                <li>
                <li><a href="Login.jsp">Login</a></li>
                <%} %>
                <%if(username != ""){%>
                <li><a href="Logout.jsp">Logout</a></li>
                <%} %>
                <li><a href="UserProfile.jsp"><%out.println(username); %></a><li>
            </ul>
        </div>

    </section>

    <section id="about">
        <div class="about-1">
            <h1>ABOUT US</h1>
            <p> Welcome to View vintage.! We're a passionate community dedicated to provide you best quality   worldwide. 
                 <br> Our journey began with a simple idea: 
                 to create a platform where handmade treasures could shine and stories could be shared. 
                 <br>Founded by Anish and his group.
                 Handmade Heaven is driven by a mission to preserve cultural heritage, empower artisans, and promote sustainability.
                 <br>Every product you find here has been lovingly crafted by skilled hands, each telling a unique story of tradition, 
                 culture, and creativity.
                 <br> As you explore our website, we invite you to join us in our mission to cherish 
                 the artistry of handmade goods and make a positive impact in the world. </p>
        </div>

       <div id="about-2">
        <div class="content-box">
            <div class="continer">
                <div class="row">
                    <div class="col-md-4">
                        <div class="about-item text-center">
                            <i class="bi bi-book-half"></i>
                            <h3>MISSION</h3>
                                <hr>
                                <p> Our mission is to maintain cultural heritage, encourage regional   
                                     artists, and showcase the beauty of traditional craftsmanship.   
                                  <br> We aim to bring people together with one-of-a-kind, 
                                  handcrafted gifts that convey tales of talent, enthusiasm, and commitment. 
                                  <br>By giving craftsmen a platform to share   
                                  their skills and connect with a worldwide audience, we hope to empower them.  
                                  <br> where each handcrafted item is valued for its authenticity, originality, and sustainability. 
                                  <br> Join us in promoting a more thoughtful approach to shopping   
                                  <br> and appreciating the creativity of handcrafted goods.  
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="about-item text-center">
                            <i class="bi bi-globe2"></i>
                            <h3>VISION</h3>
                            <hr>
                            <p> At Handmade Heaven, our vision is to become a global hub for 
                               handmade treasures, known for our dedication to preserving 
                                <br> traditional craftsmanship and empowering artisans worldwide. 
                                We imagine a world where handmade goods  
                                <br> are cherished and valued for their authenticity, quality, and cultural significance. 
                                <br> By connecting enthusiasts and craftspeople through our platform, 
                                <br> we hope to build a thriving community that appreciates 
                                <br>the beauty of handcrafted goods. 
                            </p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="about-item text-center">
                            <i class="bi bi-pen"></i>
                            <h3>ACHIEVEMENTS</h3>
                            <hr>
                            <p> Handmade Heaven is delighted to have assisted many craftsmen 
                               since its establishment, giving them a stage on which to display 
                                <br>their skills and connect with a larger market. We have made it easier for thousands of handcrafted goods to be sold,
                                <br> improving the lives of both buyers and craftsmen. Our reputation as a reliable supplier of  
                                <br> handcrafted goods has been  established by our dedication to quality, authenticity, 
                                <br>and ethical business procedures. As we go forward, our commitments  
                                <br>remain the same: reaching a wider audience, encouraging closer  
                                <br> artisanal collaboration, and promoting the global  
                                <br> understanding of traditional craftsmanship.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       </div> 
    </section>


    <footer class="text-center">
        <p>Copyright &copy; 2024 view vintage. All rights reserved.</p>
    </footer>

    <section id="footer">
        <div class="footer-content">
            <h3>Contact Information</h3>
            <p>Email: @gmail.com</p>
            <p>Phone: 989898989898</p>
            <p>Address: SomeWhere</p>
        </div>
        <div class="footer-content">
            <h3>Follow Us</h3>
            <ul style="display: flex; ">
               <a href="https://www.facebook.com/"><i class="bi bi-facebook" style="margin-right: 20px;"></i></a>
               <a href="https://www.instagram.com"><i class="bi bi-instagram" style="margin-right: 20px;"></i></a>
               <a href="https://www.twitter.com"><i class="bi bi-twitter"></i></a>
            </ul>
        </div>
    </section> 
</body>

</html>
