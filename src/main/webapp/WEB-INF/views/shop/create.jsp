<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>Insert title here</title>

			<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

			<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

			<script type="text/javascript" src="/resources/js/shop/sidebar.js"></script>

			<script src="/resources/se/js/HuskyEZCreator.js"></script>

			<script src="/resources/se/js/jindo.min.js"></script>

			<style type="text/css">
				#att_zone {
					width: 660px;
					min-height: 150px;
					padding: 10px;
					border: 1px dotted #00f;
				}

				#att_zone:empty:before {
					content: attr(data-placeholder);
					color: #999;
					font-size: .9em;
				}
			</style>
		</head>

		<body>
			<div class="container">

				<form id="boardWriteForm" method="post">

					<div>
						<label for="">상품이름</label>
						<input type="text" name="title" id="">
						<label for="">상품 설명</label>
						<input type="text" name="title" id="">
					</div>

					<label for="">색상을 입력해주세요</label>
					<input id="option_input_color" type="text" placeholder="옵션을 입력해주세요" />
					<button type="button" id="option_button_color">추가</button>
					<div id="option_group_color"></div>

					<label for="">사이즈를 입력해주세요</label>
					<input id="option_input_size" type="text" placeholder="옵션을 입력해주세요" />
					<button type="button" id="option_button_size">추가</button>
					<div id="option_group_size"></div>

					<div id='image_preview'>
						<h3>메인 사진</h3>
						<input type='file' id='btnAtt' name="image" multiple='multiple'/>
						<div id='att_zone' 
							  data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
					</div>

					<div>
						<div>
							<b>제목</b>
						</div>
						<input type="text" id="title" name="title" value="" maxlength="100" style="width: 100%;" />
					</div>
					<div class="contentDiv">
						<textarea id="txtContent" name="contents" rows="30" style="width: 100%;"></textarea>
					</div>
					<div class="buttonDiv">
						<button type="button" class="btn btn-primary" onclick="onWrite()">쓰기</button>
						<button type="button" class="btn btn-primary" onclick="history.go(-1);">취소</button>
						<input type="hidden" name="seq" value="${board.seq}" />
					</div>
				</form>
			</div>
		</body>

		<script>

			const option_evnet = function (input, group, button, name) {

				const option_input = document.getElementById(input);
				const option_group = document.getElementById(group)
				const option_button = document.getElementById(button);

				option_button.addEventListener("click", (e) => {
					e.preventDefault();
					if (option_input.value === "") {
						return
					}
					const value = option_input.value;
					const div = document.createElement("div");
					const input = document.createElement("input")
					const deleteButton = document.createElement("button");
					deleteButton.onclick = (e) => {
						const parentNode = e.target.parentNode
						parentNode.remove();
					}

					deleteButton.innerText = "x";
					input.value = value;
					input.name = name;
					div.append(input);
					div.append(deleteButton)
					option_group.append(div);
					option_input.value = "";
				})
			}

			option_evnet("option_input_color", "option_group_color", "option_button_color", "color")
			option_evnet("option_input_size", "option_group_size", "option_button_size", "size");

		</script>

		<script type="text/javascript">
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef: oEditors,
				elPlaceHolder: document.getElementById('txtContent'), // html editor가 들어갈 textarea id 입니다.
				sSkinURI: "/resources/se/SmartEditor2Skin.html", // html editor가 skin url 입니다.
				fOnAppLoad: function () {
					//수정모드를 구현할 때 사용할 부분입니다. 로딩이 끝난 후 값이 체워지게 하는 구현을 합니다.
					var title = localStorage.getItem("title");
					var contents = localStorage.getItem("contents"); //db에서 불러온 값은 여기에서 체워넣습니다.
					document.getElementById("title").value = title;
					oEditors.getById["txtContent"].exec("PASTE_HTML", [contents]); //로딩이 끝나면 contents를 txtContent에 넣습니다.
				},
				fCreator: "createSEditor2"
			});

			var onWrite = function () {
				oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용합니다.

				var contents = document.getElementById("txtContent").value;
				var title = document.getElementById("title").value;
				localStorage.setItem("contents", contents);
				localStorage.setItem("title", title); //localStorage에 제목과 내용을 저장.

				var boardWriteForm = document.getElementById("boardWriteForm");
				//boardWriteForm.action ="writeSubmit";			//저장할 페이지로 쏩니다.              
				boardWriteForm.submit();
			};

			var pasteHTML = function (filename) {
				var sHTML = '<img src="${pageContext.request.contextPath}/resources/upload/' + filename + '">';
				oEditors.getById["txtContent"].exec("PASTE_HTML", [sHTML]);
			};
		</script>


<script>
    ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
      imageView = function imageView(att_zone, btn){
    
        var attZone = document.getElementById(att_zone);
        var btnAtt = document.getElementById(btn)
        var sel_files = [];
        
        // 이미지와 체크 박스를 감싸고 있는 div 속성
        var div_style = 'display:inline-block;position:relative;'
                      + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
        // 미리보기 이미지 속성
        var img_style = 'width:100%;height:100%;z-index:none';
        // 이미지안에 표시되는 체크박스의 속성
        var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
                      + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
      
        btnAtt.onchange = function(e){
          var files = e.target.files;
          var fileArr = Array.prototype.slice.call(files)
          for(f of fileArr){
            imageLoader(f);
          }
        }  
        
      
        // 탐색기에서 드래그앤 드롭 사용
        attZone.addEventListener('dragenter', function(e){
          e.preventDefault();
          e.stopPropagation();
        }, false)
        
        attZone.addEventListener('dragover', function(e){
          e.preventDefault();
          e.stopPropagation();
          
        }, false)
      
        attZone.addEventListener('drop', function(e){
          var files = {};
          e.preventDefault();
          e.stopPropagation();
          var dt = e.dataTransfer;
          files = dt.files;
          for(f of files){
            imageLoader(f);
          }
          
        }, false)
        
    
        
        /*첨부된 이미리즐을 배열에 넣고 미리보기 */
        imageLoader = function(file){
          sel_files.push(file);
          var reader = new FileReader();
          reader.onload = function(ee){
            let img = document.createElement('img')
            img.setAttribute('style', img_style)
            img.src = ee.target.result;
            attZone.appendChild(makeDiv(img, file));
          }
          
          reader.readAsDataURL(file);
        }
        
        /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
        makeDiv = function(img, file){
          var div = document.createElement('div')
          div.setAttribute('style', div_style)
          
          var btn = document.createElement('input')
		  btn.name = "image"
          btn.setAttribute('type', 'button')
          btn.setAttribute('value', 'x')
          btn.setAttribute('delFile', file.name);
          btn.setAttribute('style', chk_style);
          btn.onclick = function(ev){
            var ele = ev.srcElement;
            var delFile = ele.getAttribute('delFile');
            for(var i=0 ;i<sel_files.length; i++){
              if(delFile== sel_files[i].name){
                sel_files.splice(i, 1);      
              }
            }
            
            dt = new DataTransfer();
            for(f in sel_files) {
              var file = sel_files[f];
              dt.items.add(file);
            }
            btnAtt.files = dt.files;
            var p = ele.parentNode;
            attZone.removeChild(p)
          }
          div.appendChild(img)
          div.appendChild(btn)
          return div
        }
      }
    )('att_zone', 'btnAtt')
    
    </script>
		</html>