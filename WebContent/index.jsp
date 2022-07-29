
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<!--
   Reflex by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<html>
   <head>
      <title>ReShop</title>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mainfont.css" />
      


</head>
<body>
<c:import url="header.jsp" charEncoding="UTF-8"></c:import>
            <!-- Intro -->

               
            
   
                  <!-- 메인 배너 슬라이스 적용-->

  <ul class="slides">
    <input type="radio" name="radio-btn" id="img-1" checked />
    <li class="slide-container">
    <div class="slide">
      <img src="images/mainbanner3.jpg">
        </div>
    <div class="nav">
      <label for="img-6" class="prev">&#x2039;</label>
      <label for="img-2" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-2" />
    <li class="slide-container">
        <div class="slide">
          <img src="images/mainbanner1.jpg">
        </div>
    <div class="nav">
      <label for="img-1" class="prev">&#x2039;</label>
      <label for="img-3" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-3" />
    <li class="slide-container">
        <div class="slide">
          <img src="images/im04.jpg">
        </div>
    <div class="nav">
      <label for="img-2" class="prev">&#x2039;</label>
      <label for="img-4" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-4" />
    <li class="slide-container">
        <div class="slide">
          <img src="images/mainbanner2.jpg">
        </div>
    <div class="nav">
      <label for="img-3" class="prev">&#x2039;</label>
      <label for="img-5" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-5" />
    <li class="slide-container">
        <div class="slide">
          <img src="images/im05.jpg">
        </div>
    <div class="nav">
      <label for="img-4" class="prev">&#x2039;</label>
      <label for="img-6" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-6" />
    <li class="slide-container">
        <div class="slide">
          <img src="images/im02.jpg">
        </div>
    <div class="nav">
      <label for="img-5" class="prev">&#x2039;</label>
      <label for="img-1" class="next">&#x203a;</label>
    </div>
    </li>

    <li class="nav-dots">
      <label for="img-1" class="nav-dot" id="img-dot-1"></label>
      <label for="img-2" class="nav-dot" id="img-dot-2"></label>
      <label for="img-3" class="nav-dot" id="img-dot-3"></label>
      <label for="img-4" class="nav-dot" id="img-dot-4"></label>
      <label for="img-5" class="nav-dot" id="img-dot-5"></label>
      <label for="img-6" class="nav-dot" id="img-dot-6"></label>
    </li>
</ul>
   
   
            <!-- 베스트 아이템 쇼핑하기로 바로가기 버튼 적용 -->
            
         
               <section class="wrapper style2 special">
                  <div class="inner">
                  
                     <header>
                        <h2>Best Item</h2>

                     </header>

                     
                     <footer>
                        <ul class="actions special">
                           <li><a href="#" class="button">Shop</a></li>
                        </ul>
                     </footer>
                  </div>
               </section>



            <!-- 기부소식 칼럼 -->
               <section class="wrapper style1 special">
                  <div class="inner">
                     <header>
                        <h2>News of Donation</h2>
                        <p>It tells the story of a beautiful world of sharing and circulation.</p>
                        
                     </header>
                     <section class="spotlight">
                        <span class="image"><img src="images/im05.jpg" alt="" /></span>
                        <div class="content">
                           <header>
                              <h3>Have a safe summer, beautiful sharing package.</h3>
                           </header>
                           <p>Human-generated carbon emissions create greenhouse gases that make the Earth sick.
Greenhouse gases increase abnormal weather conditions such as heat waves, typhoons, droughts, and floods, threatening human survival.
It's simply a 'climate crisis' beyond climate change.</p>
                           <footer>
                              <ul class="actions">
                                 <li><a href="#" class="button">소식보기</a></li>
                              </ul>
                           </footer>
                        </div>
                     </section>
                     <section class="spotlight">
                        <span class="image"><img src="images/im04.jpg" alt="" /></span>
                        <div class="content">
                           <header>
                              <h3>Nostra adpiscing</h3>
                           </header>
                           <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos magna fames ac turpis egestas amet non lorem amet.</p>
                           <footer>
                              <ul class="actions">
                                 <li><a href="#" class="button">소식보기</a></li>
                              </ul>
                           </footer>
                        </div>
                     </section>
                     <section class="spotlight">
                        <span class="image"><img src="images/im01.jpg" alt="" /></span>
                        <div class="content">
                           <header>
                              <h3>Tempus litoria</h3>
                           </header>
                           <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos magna fames ac turpis egestas amet non lorem amet.</p>
                           <footer>
                              <ul class="actions">
                                 <li><a href="#" class="button">소식보기</a></li>
                              </ul>
                           </footer>
                        </div>
                     </section>
                     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos malesuada fames ac turpis egestas. In non lorem amet. Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam tristique eu nibh.</p>
                     <footer>
                        <ul class="actions special">
                           <li><a href="#" class="button">Details</a></li>
                        </ul>
                     </footer>
                  </div>
               </section>

            <!-- Three -->
               <section class="wrapper style3 special">
                  <div class="inner">
                     <header>
                        <h2>Amet ullamcorper</h2>
                        <p>Aptent taciti sociosqu litora torquent et conubia sed etiam.<br />
                        Phasellus convallis elit id ullamcorper pulvinar. Duis aliquam<br />
                        turpis mauris, ultricies erat malesuada quis.</p>
                     </header>
                     <footer>
                        <ul class="actions special">
                           <li><a href="#" class="button big">Get Started</a></li>
                        </ul>
                     </footer>
                  </div>
               </section>

            <!-- Footer -->
               <section id="footer" class="wrapper split style2">
                  <div class="inner">
                     <section>
                        <header>
                           <h3>Magna lorem ipsum</h3>
                        </header>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos magna fames ac turpis egestas amet non lorem amet.</p>
                        <ul class="icons">
                           <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                           <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
                           <li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
                           <li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
                        </ul>
                     </section>
                     <section>
                        <form method="post" action="#">
                           <div class="fields">
                              <div class="field half"><input type="text" name="name" id="name" placeholder="Name" /></div>
                              <div class="field half"><input type="email" name="email" id="email" placeholder="Email" /></div>
                              <div class="field"><textarea name="message" id="message" placeholder="Message" rows="4"></textarea></div>
                           </div>
                           <ul class="actions">
                              <li><input type="submit" value="Send Message" /></li>
                           </ul>
                        </form>
                     </section>
                  </div>
                  <div class="copyright">
                     <p>&copy; Untitled. All rights reserved. Lorem ipsum dolor sit amet nullam.</p>
                  </div>
               </section>

         </div>

      <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>

   </body>
   <!-- <script>
      let main1Tags = document.getElementsByClassName("main1");
      for(let i=0;i<main1Tags.length;i++){
         main1Tags[i].onmouseover=function(){
            document.getElementById("sub1").style.display = "";
         }
         main1Tags[i].onmouseout=function(){
            document.getElementById("sub1").style.display = "none";
         }
      }
   </script> -->
   
   
</html>