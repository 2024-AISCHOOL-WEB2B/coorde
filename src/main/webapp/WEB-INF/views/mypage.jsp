<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Coordy</title>
<!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta name="author" content="Phoenixcoded" />

	<link
      rel="stylesheet"
      href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css"
    />

    <!-- vendor css -->
    <link rel="stylesheet" href="resources/assets/css/mypage.css">
</head>
<body>
<div class="wrap">
        <div class="container">
            <div class="title">OOTB</div>
            <div class="nav">
                <div>
                    <a href="/edit.html">EDIT</a>
                </div>
                <div>WISH LIST</div>  
                <div>
                    <a href="/main.html">LOG OUT</a>
                </div>
            </div>
            <form action="">
            <div class="products">
                <div class="product">
                    <input type="checkbox" class="product-checkbox">
                    <img src="https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200" alt="Product 1" onclick="showModal('Product 1', '43,700원', 'https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200')">
                    <div class="product-info">
                        <p>Product Name 1</p>
                        <p class="price">43,700원</p>
                    </div>
                </div>
                <div class="product">
                    <input type="checkbox" class="product-checkbox">
                    <img src="https://image.msscdn.net/thumbnails/images/goods_img/20230914/3561943/3561943_16953419165174_big.jpg?w=1200" alt="Product 2" onclick="showModal('Product 2', '43,700원', 'https://image.msscdn.net/thumbnails/images/goods_img/20230914/3561943/3561943_16953419165174_big.jpg?w=1200')">
                    <div class="product-info">
                        <p>Product Name 2</p>
                        <p class="price">43,700원</p>   
                    </div>
                </div>
                <div class="product">
                    <input type="checkbox" class="product-checkbox">
                    <img src="https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200" alt="Product 3" onclick="showModal('Product 3', '43,700원', 'https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200')">
                    <div class="product-info">
                        <p>Product Name 3</p>
                        <p class="price">43,700원</p>
                    </div>
                </div>
            </div>
            <div class="products">
                <div class="product">
                    <input type="checkbox" class="product-checkbox">
                    <img src="https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200" alt="Product 4" onclick="showModal('Product 4', '43,700원', 'https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200')">
                    <div class="product-info">
                        <p>Product Name 4</p>
                        <p class="price">43,700원</p>
                    </div>
                </div>
                <div class="product">
                    <input type="checkbox" class="product-checkbox">
                    <img src="https://image.msscdn.net/thumbnails/images/goods_img/20230914/3561943/3561943_16953419165174_big.jpg?w=1200" alt="Product 5" onclick="showModal('Product 5', '43,700원', 'https://image.msscdn.net/thumbnails/images/goods_img/20230914/3561943/3561943_16953419165174_big.jpg?w=1200')">
                    <div class="product-info">
                        <p>Product Name 5</p>
                        <p class="price">43,700원</p>   
                    </div>
                </div>
                <div class="product">
                    <input type="checkbox" class="product-checkbox">
                    <img src="https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200" alt="Product 6" onclick="showModal('Product 6', '43,700원', 'https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200')">
                    <div class="product-info">
                        <p>Product Name 6</p>
                        <p class="price">43,700원</p>
                    </div>
                </div>
            </div>
            <div class="products">
                <div class="product">
                    <input type="checkbox" class="product-checkbox">
                    <img src="https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200" alt="Product 7" onclick="showModal('Product 7', '43,700원', 'https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200')">
                    <div class="product-info">
                        <p>Product Name 7</p>
                        <p class="price">43,700원</p>
                    </div>
                </div>
                <div class="product">
                    <input type="checkbox" class="product-checkbox">
                    <img src="https://image.msscdn.net/thumbnails/images/goods_img/20230914/3561943/3561943_16953419165174_big.jpg?w=1200" alt="Product 8" onclick="showModal('Product 8', '43,700원', 'https://image.msscdn.net/thumbnails/images/goods_img/20230914/3561943/3561943_16953419165174_big.jpg?w=1200')">
                    <div class="product-info">
                        <p>Product Name 8</p>
                        <p class="price">43,700원</p>   
                    </div>
                </div>
                <div class="product">
                    <input type="checkbox" class="product-checkbox">
                    <img src="https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200" alt="Product 9" onclick="showModal('Product 9', '43,700원', 'https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200')">
                    <div class="product-info">
                        <p>Product Name 9</p>
                        <p class="price">43,700원</p>
                    </div>
                </div>
            </div>
            <div class="faq">
                <a href="#">FAQ</a>
                <button id="delete-button">DELETE</button>
            </div>
        </form>
            

            <div class="usage-info">
                <h2>이용안내</h2>
                <p> - 체크 버튼을 클릭 후 DELETE 버튼을 누르면 목록에서 삭제됩니다.</p>
                <p> - 회원가입시와 동일한 이용방법으로 제공되는 정보를 관리하실 수 있습니다.</p>
                <p> - 정확한 회원 정보를 통해 정확한 안내와 주문처리를 위해 등록된 정보를 확인해 주십시오.</p>
            </div>
        </div>
    </div>
    
    <form action="">
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <img id="modal-img" src="" alt="Product Image">
            <div class="product-info">
                <p id="modal-product-name"></p>
                <p id="modal-product-price"></p>
            </div>
            <table>
                <thead>
                    <tr>
                        <th></th>
                        <th>작아요</th>
                        <th>적당해요</th>
                        <th>커요</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>총장</td>
                        <td><input type="radio" id="length-small" name="cl_size" value="small"><label for="length-small"></label></td>
                        <td><input type="radio" id="length-medium" name="cl_size" value="medium"><label for="length-medium"></label></td>
                        <td><input type="radio" id="length-large" name="cl_size" value="large"><label for="length-large"></label></td>
                    </tr>
                    <tr>
                        <td>어깨</td>
                        <td><input type="radio" id="shoulder-small" name="cl_sh" value="small"><label for="shoulder-small"></label></td>
                        <td><input type="radio" id="shoulder-medium" name="cl_sh" value="medium"><label for="shoulder-medium"></label></td>
                        <td><input type="radio" id="shoulder-large" name="cl_sh" value="large"><label for="shoulder-large"></label></td>
                    </tr>
                    <tr>
                        <td>가슴</td>
                        <td><input type="radio" id="chest-small" name="cl_ch" value="small"><label for="chest-small"></label></td>
                        <td><input type="radio" id="chest-medium" name="cl_ch" value="medium"><label for="chest-medium"></label></td>
                        <td><input type="radio" id="chest-large" name="cl_ch" value="large"><label for="chest-large"></label></td>
                    </tr>
                    <tr>
                        <td>팔</td>
                        <td><input type="radio" id="arm-small" name="cl_arm" value="small"><label for="arm-small"></label></td>
                        <td><input type="radio" id="arm-medium" name="cl_arm" value="medium"><label for="arm-medium"></label></td>
                        <td><input type="radio" id="arm-large" name="cl_arm" value="large"><label for="arm-large"></label></td>
                    </tr>
                </tbody>
            </table>
            <button class="submit-button" onclick="submitModal()">저장</button>
        </div>
    </div>
</form>


    <script>
          function showModal(productName, productPrice, productImgSrc) {
            document.getElementById('modal-product-name').innerText = productName;
            document.getElementById('modal-product-price').innerText = productPrice;
            document.getElementById('modal-img').src = productImgSrc;
            document.getElementById('myModal').style.display = 'block';
        }

        function closeModal() {
            document.getElementById('myModal').style.display = 'none';
        }

        function submitModal() {
            alert('저장되었습니다.');
            closeModal();
        }

        window.onclick = function(event) {
            if (event.target == document.getElementById('myModal')) {
                closeModal();
            }
        }

        document.getElementById('delete-button').addEventListener('click', function() {
            const deleteButton = document.getElementById('delete-button');
            deleteButton.style.backgroundColor = 'blue';
            setTimeout(() => {
                deleteButton.style.backgroundColor = ''; 
            }, 50);

            const checkboxes = document.querySelectorAll('.product-checkbox');
            checkboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    checkbox.closest('.product').remove();
                }
            });
        });
    </script>

</body>
</html>