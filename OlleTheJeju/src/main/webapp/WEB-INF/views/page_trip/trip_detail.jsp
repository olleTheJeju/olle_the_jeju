<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관광일정 detail</title>
		<link href="./resources/css/navi.css" rel="stylesheet" type="text/css" />
        <link href="./resources/css/trip/trip_detail.css" rel="stylesheet" type="text/css" />
        <link href="./resources/css/footer.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
        
	</head>
	<body>
		<div class="wrapper">
			<jsp:include page="../include/header.jsp"></jsp:include>
			<div class="main">
				<br><br>
                <div class="main-text">
                    <h2>제주도 모든 여행지를 한번에!</h2>
                    <p>
                        제주의 아름다운 여행지를 취향에 맞게 선택해 보세요!<br>
                        368개의 크고 작은 오름을 비롯하여 눈 돌리면 어디에서나 마주치는 한라산 그리고 푸른바다<br>
                        제주의 아름다운 여행지가 여러분의 선택을 기다립니다!
                    </p>
                </div>
                <br><br>
                <div class="nail">
                    <div id="carouselExampleFade" class="carousel slide carousel-fade slider" data-bs-ride="carousel">
                        <div class="carousel-inner imgs">
                            <div class="carousel-item active">
                                <img src="./resources/img/1.png" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="./resources/img/dolpin.png" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="./resources/img/test.jpg" class="d-block w-100" alt="...">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                    <div class="content_info">
                        <br>
                        <h4>제주 국제 공항</h4>
                        <div class="name">
                            <h6><strong>작성자</strong> | 관리자</h6>
                            <h6 class="like"><i class="fa fa-heart-o" aria-hidden="true"></i> | 100</h6>
                            <h6><i class="fa fa-thumb-tack" aria-hidden="true"></i> | 100</h6>
                            <h6>조회수 | 100</h6>
                        </div>
                        <div class="content">
                            <h6>기본정보 : </h6>
                            <br>
                            <h6>주소 : </h6>
                            <br>
                            <h6>전화번호 : </h6>
                        </div>
                        <br>
                        <div class="find_btn">
                            <button class="btn btn-outline-success chk-btn" type="button">길찾기</button>
                        </div>
                    </div>
                </div>
                <br><br><br>
                <div class="trip_text">
                    <h3>장소 상세</h3>
                    <hr class="line">
                    <br>
                    <div class="main-second">
                    </div>
                </div>
                <div class="bottom-btn-group2">
                    <input id="btn1" class="btn btn-secondary" type="button" value="목록" onclick="location.href='trip_main.do'">
                    <input id="btn2" class="btn btn-primary" type="button" value="수정" onclick="">
                    <input id="btn3" class="btn btn-danger" type="button" value="삭제" onclick="">
                </div>
                <br><br>
			</div>
			<jsp:include page="../include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>