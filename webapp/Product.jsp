<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>

    <link rel="stylesheet" href="product.css">
    
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
    <div class="navbar">
        <img src="img/logo.png" class="logo">
        <ul>
            <li><a href="Home.jsp">Home</a></li>
            <li><a href="Product.jsp">Product</a></li>
            <li><a href="Contact.jsp">Contact</a></li>
            <li><a href="AboutUs.jsp">About Us</a></li>
            <li><a href="Cart.jsp">Cart</a></li>
            <% if(username.equals("")) { %>
                <li><a href="Login.jsp">Login</a></li>
            <% } else { %>
                <li><a href="Logout.jsp">Logout</a></li>
                <li><a href="UserProfile.jsp"><%= username %></a></li>
            <% } %>
        </ul>
    </div>
</section>
    
    
    <div class="container">
        <h1>Our <span>Products</span></h1>
        <div class="products">
            <!-- Product 1 -->
            <div class="product">
                <img src="img/1.jpg" alt="Product 1">
                <h2>Sony A95L OLED</h2>
                <h2>RS. 60000 </h2>
                <p>The best Sony TV on the market is the Sony A95L OLED. It's very similar to the Samsung S95C OLED, as it features the same impressive QD-OLED panel that delivers incredibly deep, inky blacks and bright, vibrant colors that stand out well. It features the amazing processing capabilities that Sony is known for, so it's a great choice 
                    for movie lovers looking for the absolute best TV for a basement home theater setup</p>
                <button>Add to Cart</button> 
            </div>

            <!-- Product 2 -->
            <div class="product">
                <img src="img/2.jpg" alt="Product 2">
                <h2>Samsung S95C OLED</h2>
                <h2>RS. 120000 </h2>
                <p>The best Samsung TV we've tested is the Samsung S95C OLED. It's a very impressive TV that delivers fantastic picture quality. It has the same perfect inky blacks in a dark room as OLEDs with WOLED panels, like the LG G3 OLED, with no blooming or distracting haloing around bright objects. It also has great peak brightness in HDR, so bright highlights stand out well, and it tracks the creator's intent properly. It stands out thanks to its incredibly bright colors, resulting in a much more vibrant, realistic HDR experience.</p>
                <button>Add to Cart</button>
            </div>

            <!-- Product 3 -->
            <div class="product"> 
                <img src="img/3.jpeg" alt="Product 3">
                <h2>LG G3 OLED</h2>
                <h2>RS. 90000</h2>
                <p>he best LG TV we've tested is the LG G3 OLED. It's an impressive TV that delivers fantastic picture quality with 
                    stunning dark scene performance, thanks to its near-infinite contrast ratio and perfect black uniformity. It delivers a visually stunning HDR experience, especially if you're in a dark room, and its unique, modern design means it looks amazing even when it's off. It also has a fantastic array of gaming features, including 4k @ 120Hz support on it.</p>
                <button>Add to Cart</button>
            </div>

            <!-- Product 4 -->
            <div class="product">
                <img src="img/4.1.jpeg" alt="Product 4">
                <h2>Hisense UX</h2>
                <h2>RS. 130000</h2>
                <p> The Hisense UX is the best Hisense TV we've tested. It delivers incredible picture quality overall in both bright and dark rooms. It has fantastic contrast and 
                    a Mini LED local dimming feature, resulting in very deep blacks with almost no noticeable blooming around bright areas of the screen. HDR content looks amazing, 
                    thanks to its high peak brightness and wide color gamut, and it tracks the content creator's intent decently well, although 
                    most content is a bit too bright. The TV has sub-par native HDR gradient handling, but its gradient smoothing feature does a great job of cleaning up the banding</p>
                <button>Add to Cart</button>
            </div>

            <!-- Product 5 -->
            <div class="product">
                <img src="img/5.jpg" alt="Product 4">
                <h2>TCL QM8 QLED TV</h2>
                <h2>RS. 180000</h2>
                <p>The TCL QM8/QM850G QLED is TCL's 2023 flagship model. It's a Mini LED QLED TV equipped with a backlight capable of very high levels of brightness in both HDR and SDR and comes with a local dimming
                     feature that has up to 2300 dimming zones in its bigger sizes. It's capable of doing up to 144Hz at 1440p and 4k or up to 240Hz at 1080p, supports every variable refresh rate (VRR) technology,
                     and comes with TCL's Game Master overlay, which gives gamers quick access to a plethora of gaming-oriented features. It's also one of the first TVs to receive the IMAX Enhanced Certification. 
                     The TV supports DTS and Dolby advanced audio formats through its eARC HDMI port and also supports advanced video formats, particularly Dolby Vision and HDR10+. 
                </p>
                <button>Add to Cart</button>
            </div>

            <!-- Product 6 -->
            <div class="product">
                <img src="img/6.jpg" alt="Product 4">
                <h2>Samsung QN900C Neo QLED 8K TV</h2>
                <h2>RS. 300000</h2>
                <p>Samsung's QN900C Neo QLED 8K TV perfectly encapsulates the South Korean company's approach to flagship products, in that it's so stacked with features, some may see it as bordering on overkill.

                    While other manufacturers have mostly abandoned 8K TV production due to slow adoption from consumers and tighter energy regulations in the EU, Samsung is (for now) refusing to budge, delivering its most advanced 8K television to date in the QN900C.</p>
                <button>Add to Cart</button>
            </div>
        </div>
    </div>


    <body>
        <div class="container">
            <div class="products">
            </div>
            <div class="pagination">
                <button onclick="location.href='/product2.html'">Next Page</button>
            </div>
        </div>
        <script src="script.js"></script>

    
    </body>
</body>
</html>
