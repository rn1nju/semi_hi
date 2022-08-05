<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<head><title>StudyBox</title><body>
<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/studyBox.css">

    <main>
        <section class="py-5 text-center container">
            <div class="row py-lg-5" id="myStudyType">
              <div class="col-lg-6 col-md-8 mx-auto">
                <h1>M Y S T U D Y</h1>
              </div>
            </div>
        </section>

        <div class="album py-5"style="margin-bottom:0;">
          <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
              <c:if test="${ empty myStudyList }">
                <span>지금 바로 <b>당신의 스터디</b>를 시작해주세요 !!!!!!!!!!</span>
              </c:if>
            
<!-- .col 스터디 카드 하나! -->
              <c:if test="${ ! empty myStudyList }">
                <c:forEach var="myStudy" items="${ myStudyList }"> 
                  <div class="col" id="studyBox">
                    <form action="${ path }/member/studyBox" method="GET">
                    <a onclick="location.href='${ path }/sboard/view?no=${ myStudy.SNo }'" style="text-decoration:none; cursor: pointer;" >
                    <div class="studyContent">
                      <div 
                          class="bd-placeholder-img card-img-top"
                          xmlns="http://www.w3.org/2000/svg"
                          role="img"
                          aria-label="Placeholder: Thumbnail"
                          preserveAspectRatio="xMidYMid slice"
                          focusable="false">
                          <div class="studyStart">시작 예정일 <br> | ${ myStudy.SDate } | </div>
                          <div class="studyTitle">${ myStudy.STitle }</div>

                        <div class="studyFilter">
                          <div class="testNo">
                              <c:if test="${ myStudy.language.LNo != 4 }">
                                <img src="${ path }/resources/images/Test_logo/${ myStudy.test.testType }.png" alt="${ path }/resources/images/Test_logo/basic.png" class="testImg"/>
                              </c:if>
                              <c:if test="${ myStudy.language.LNo == 4 }">
                                <img src="${ path }/resources/images/Test_logo/basic.png" class="testImg"/>
                              </c:if>
                          </div>      
                          <div class="sLevel">
                              <c:choose>
                                <c:when test="${ myStudy.SLevel == '초급' }">
                                  <img src="${ path }/resources/images/level.png" class="levelImg"/>
                                </c:when>
                                <c:when test="${ myStudy.SLevel == '중급' }">
                                  <img src="${ path }/resources/images/level.png" class="levelImg"/>
                                  <img src="${ path }/resources/images/level.png" class="levelImg"/>
                                </c:when>
                                <c:when test="${ myStudy.SLevel == '고급' }">
                                  <img src="${ path }/resources/images/level.png" class="levelImg"/>
                                  <img src="${ path }/resources/images/level.png" class="levelImg"/>
                                  <img src="${ path }/resources/images/level.png" class="levelImg"/>
                                </c:when>
                            </c:choose>   
                          </div>
                        </div>
                          <div class="writerInfo">
                                <img src="${ path }/resources/images/Hi_Profil.png" class="writerImg" />
                                <div class="writerNick">${ myStudy.member.nickName }</div>
                          </div>    
                      </div> 
                    </div> 
                    </a>
                    </form>

                    <div class="btnBox">
                      <button
                        type="button" 
                        class="btn"
                        onclick="location.href='${ path }/sboard/update?no=${ myStudy.SNo }'"
                      >
                        수정
                      </button>
                      <form action="${ path }/sboard/delete?no=${ myStudy.SNo }" method="POST">
                        <span>${ myStudy.SNo }</span>
                        <input type="hidden" name="no" value="${ myStudy.SNo }">
                        <button type="submit"class="btn" id="btnDelete">삭제</button>
                      </form>
                    </div>
                  </div>
                </c:forEach>
              </c:if>
<!-- .col 스터디 카드 하나! -->
            </div>
            <div class="btnBox">
                <button type="button" class="btn" id="btnMore" ><a href="${ path }/member/myStudyBox" style="text-decoration:none; color:white">더보기</a></button>
            </div>
          </div>
        </div>
    </main>

    <main>
      <section class="py-5 text-center container">
        <div class="row py-lg-5" id="saveStudyType">
          <div class="col-lg-6 col-md-8 mx-auto">
            <h1>찜 S T U D Y</h1>
          </div>
        </div>
      </section>

      <div class="album py-5">
        <div class="container">
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <div class="col" id="studyBox">
              <div class="studyContent">
                <div
                  class="bd-placeholder-img card-img-top"
                  xmlns="http://www.w3.org/2000/svg"
                  role="img"
                  aria-label="Placeholder: Thumbnail"
                  preserveAspectRatio="xMidYMid slice"
                  focusable="false"
                >
                  <div class="studyStart">시작 예정일</div>
                  <div class="studyTitle">스터디 제목</div>
                  <div class="studyFilter">
                    <div>
                        <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                        <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                        <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                      </div>
                    </div>
                    <div class="writerInfo">
                      <img src="${ path }/resources/images/Hi_Profil.png" class="writerImg" alt="" />
                      <div class="writerNick">닉네임</div>
                    <div class="studySaveI">
                      <!-- <i class="fa-solid fa-heart fa-2x"></i> -->
                      <i class="fa-regular fa-heart fa-2x"></i>
                    </div>
                  </div>
                </div>
              </div>
              <!-- <div class="btnBox">
                <button type="button" class="btn" id="btnDelete">삭제</button>
                <button type="button" class="btn" id="btn">마감</button>
              </div> -->
            </div>

            <div class="col" id="studyBox">
              <div class="studyContent">
                <div
                  class="bd-placeholder-img card-img-top"
                  xmlns="http://www.w3.org/2000/svg"
                  role="img"
                  aria-label="Placeholder: Thumbnail"
                  preserveAspectRatio="xMidYMid slice"
                  focusable="false"
                >
                  <div class="textWrapper" style="text-align: center">
                    <div class="studyStart">시작 예정일</div>
                    <div class="studyTitle">스터디 제목</div>
                    <!-- <i class="fas fa-heart"></i> -->
                    <div class="studyFilter">
                        <div>
                            <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                            <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                            <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                          </div>
                        </div>
                        <div class="writerInfo">
                          <img src="${ path }/resources/images/Hi_Profil.png" class="writerImg" alt="" />
                          <div class="writerNick">닉네임</div>
                      <div class="studySaveI">
                        <i class="fa-solid fa-heart fa-2x"></i>
                        <!-- <i class="fa-regular fa-heart fa-2x"></i> -->
                      </div>
                    </div>
                  </div>
                </div>
              </div> <!-- row row-cols-1 -->
              <!-- <div class="btnBox">
                <button type="submit" class="btn">삭제</button>
                <button type="button" class="btn">마감</button>
              </div> -->
            </div>

            <div class="col" id="studyBox">
              <div class="studyContent">
                <div
                  class="bd-placeholder-img card-img-top"
                  xmlns="http://www.w3.org/2000/svg"
                  role="img"
                  aria-label="Placeholder: Thumbnail"
                  preserveAspectRatio="xMidYMid slice"
                  focusable="false"
                >
                  <div class="textWrapper" style="text-align: center">
                    <div class="studyStart">시작 예정일</div>
                    <div class="studyTitle">스터디 제목</div>
                    <div class="studyFilter">
                        <div>
                            <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                            <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                            <img src="${ path }/resources/images/level.png" class="levelImg" alt="" />
                          </div>
                        </div>
                        <div class="writerInfo">
                          <img src="${ path }/resources/images/Hi_Profil.png" class="writerImg" alt="" />
                          <div class="writerNick">닉네임</div>
                      <div class="studySaveI">
                        <!-- <i class="fa-solid fa-heart fa-2x"></i> -->
                        <i class="fa-regular fa-heart fa-2x"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div> 
              <!-- <div class="btnBox">
                <button type="submit" class="btn">삭제</button>
                <button type="button" class="btn">마감</button>
              </div> -->
            </div>
          </div>
          <div class="btnBox">
            <button type="button" class="btn" id="btnMore"><a href="${ path }/member/jjimStudy">더보기</a></button>
          </div>
        </div>
      </div>
    </main>


    <script>
    </script>
  </body>
</html>
