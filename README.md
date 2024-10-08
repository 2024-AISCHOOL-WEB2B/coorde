![OOTB_Logo](/src/main/webapp/resources/assets/images/browser/LOGO.png)
## OOTB project
Outfit On The Body - 통계적 기법을 이용한 몸에 맞는 의류 추천 서비스

## 팀원 소개
- 김창선 - PM, Back-end
- 김창민 - 머신러닝, Back-end
- 방찬혁 - Back-end, 크롤링, DataBase
- 양준영 - Front-end, Back-end


## 프로젝트 소개
회원 가입시 입력한 정보로 신체 치수를 예측하여 의류 추천시 신체 치수와 일치하는 의류 사이즈를 추천하고, 후기를 통해 입력된 정보로 신체 치수를 보완하여 더 정확한 사이즈 추천이 가능합니다.

## 개발 기간
- 2024.07.02(화) ~ 2024.08.02(금)
- 계획 수립
- 요구사항 분석
- 설계 (DB, UI/UX, Web, 데이터 모델링)
- 기획 발표
- 구현
- 서비스 테스트
- 최종 발표

## 기대효과
- 의류 업체의 매출 증가 효과
- 사용자 불편 해소로 만족도 증가

## 개발환경
- Version : Java 1.6
- IDE : Eclipse
- Framework : Spring Framework 5.0.7
- ORM : Mybatis

## 기술 스택
- Server : Apache
- DataBase : MySQL
- WS/WAS : Tomcat
- 아이디어 회의 : Notion


## 프로젝트 아키텍쳐
### 시스템 아키텍처
![Arch](/src/main/webapp/resources/assets/images/browser/Arch.png)

### 메뉴 구성
![구성도](/src/main/webapp/resources/assets/images/browser/구성도.png)

## 주요 기능
- 의류 추천 및 필터링
  
   비회원 - 키와 몸무게 입력시 신체치수를 예측하여 자동 입력

   회원 - 회원 가입시 저장된 정보로 자동 입력

- 위시리스트 기반 선호 의류 추천
- 위시리스트 추가, 삭제 및 필터링
- 후기 데이터로 정보 보완
- 사용자 문의사항 질문하기, 답변확인
- 회원 정보 수정
- 매니저 의류리스트 검색, 수정, 삭제 및 필터링
- 매니저 유저리스트 검색, 삭제 및 필터링
- 매니저 문의사항 질문확인, 답변하기
- 로그인, 회원가입, 회원탈퇴

![mainpage](/src/main/webapp/resources/assets/images/browser/mainpage.png)
![mypage](/src/main/webapp/resources/assets/images/browser/mypage.png)
![faqpage](/src/main/webapp/resources/assets/images/browser/faqpage.png)

### 트러블 슈팅
1. JSP 파일에서 자바스크립트의 리터럴(`)을 사용하여 변수 값을 삽입하려고 할 때, ${}구문이 JSP의 EL식으로 해석되어 오류 발생 원인으로 JSP 내장 표현식으로 처리하려 하기 때문에 발생함을 파악 해결방법으로 JSP에서 자바스크립트의 리터럴을 사용하는 경우 ${} 앞에 \(역슬래시)를 추가해 JSP가 이를 자바스크립트 구문으로 인식하도록 적용
![error](/src/main/webapp/resources/assets/images/browser/error.png)


2. 모달을 여는 부분인 showModal 과 닫는 부분인 closeModal의 함수 중복 호출 문제 발생함을 파악

```
function showModal(productElement) {
    event.preventDefault();
    event.stopPropagation();
    console.log('showModal called');
    const modal = document.getElementById('myModal');
    const productName = productElement.querySelector('.product-name').textContent;
    const productPrice = productElement.querySelector('.discounted-price').textContent;
    const productImgSrc = productElement.querySelector('img').src;
    const productCategory = productElement.getAttribute('data-category');

    document.getElementById('modal-product-name').textContent = productName;
    document.getElementById('modal-product-price').textContent = productPrice;
    document.getElementById('modal-img').src = productImgSrc;

    // 모달 내용 동적 생성
    const tbody = modal.querySelector('tbody');
    tbody.innerHTML = generateModalContent(productCategory);

    modal.style.display = 'block';

    setTimeout(() => {
        modal.addEventListener('click', function(e) {
            if (e.target === modal) {
                closeModal();
            }
        });
    }, 100);
}

```
```
function closeModal() {
    event.stopPropagation(); // 이벤트 전파 중지
    document.getElementById('myModal').style.display = 'none';
}
```
중복된 showModal과 closeModal 함수 정의를 하나로 통합해 이벤트 리스너를 중복으로 추가하지 않도록 하여 문제 해결
```
function showModal(productElement) {
    event.preventDefault();
    event.stopPropagation();
    console.log('showModal called');
    const modal = document.getElementById('myModal');
    const productName = productElement.querySelector('.product-name').textContent;
    const productPrice = productElement.querySelector('.discounted-price').textContent;
    const productImgSrc = productElement.querySelector('img').src;
    const productCategory = productElement.getAttribute('data-category');

    document.getElementById('modal-product-name').textContent = productName;
    document.getElementById('modal-product-price').textContent = productPrice;
    document.getElementById('modal-img').src = productImgSrc;

    // 모달 내용 동적 생성
    const tbody = modal.querySelector('tbody');
    tbody.innerHTML = generateModalContent(productCategory);

    modal.style.display = 'block';

    // 이벤트 리스너를 한번만 추가하도록 수정
    modal.onclick = function(e) {
        if (e.target === modal) {
            closeModal();
        }
    };
}

function closeModal() {
    document.getElementById('myModal').style.display = 'none';
}

```


## Main Tools
<img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=Python&logoColor=white"><img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=OpenJDK&logoColor=white"><img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white"><img src="https://img.shields.io/badge/Spring Security-6DB33F?style=for-the-badge&logo=Spring Security&logoColor=white"><img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=MySQL&logoColor=white"><img src="https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=Flask&logoColor=white"><img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"><img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"><img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white">




