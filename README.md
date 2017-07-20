<h1>뷰 헬퍼</h1>

<h3>link_to</h3>
- link_to 작성법
 <%= link_to "텍스트", "url", class: "link" %>
1. url 직접 입력<br>
<%= link_to "[뷰헬퍼삭제1]", "/posts/destroy/#{@post.id}" %><br>
2. 컨트롤러와 액션 명시<br>
<%= link_to "[뷰헬퍼삭제2]", {controller: :posts, action: :destroy, post_id: @post.id} %><br>
3. url에 이름 붙여 사용<br>
<%= link_to "[뷰헬퍼삭제3]", post_destroy_path(post_id: @post.id) %><br>
- link_to 에 클래스 주기
- 텍스트 말고 다른 tag들 넣기 (텍스트 지우고 버튼태그넣기)

<h3>image_tag 사용하기</h3>
- 이미지 app-assets-images 아래에 넣기
- html vs 뷰헬퍼 <%= image_tag "사진 경로", class: "" %>

<h3>form 대신 form_tag 사용하기</h3>
- other.html.erb / other 메소드 생성
- form_tag 사용 방법<br>
  <%= form_tag("/posts/create", method: "post") do %>
    <input type="text" name="title" />
    <input type="text" name="content" />
    <input type="submit" />
  <% end %>
- 좋은 이유?<br>
  html form을 쓸 경우 application_controller.rb에서 주석처리했음.<br>
  form_tag 쓰면 자동으로 input 두개 추가됨. 보안문제 때문.<br>
  form 에서 날라온 값 중 authenticity_token 이름으로 정확한 값이 날라왔는지 확인해줌!<br>
  html폼태그는 토큰 값을 자동으로 만들어주지 못해서 주석처리하고 작업한것.
  해커가 라우트에 url로 요청하면 내 사이트 맘대로 게시글 쓰거나 글 삭제할 수 있기 때문에 토큰값이 필요.<br>
- Q. form 나머지 2가지 방법으로 만들어보기

<h3>input-text 대신 text_field_tag 사용하기</h3>
- 사용법<br>
  <%= text_field_tag "name값", "value초기화", 속성: "" %>
  <%= text_field_tag "title", nil, placeholder: "제목" %>

<h3>중요! 모델과 연동되는 form_for 사용하기</h3>
- 작성법<br>
(edit.html.erb아래에 작성)<br>
<%= form_for 테이블row값, url:"url주소", method: "get/post" do |f| %><br>
    <%= f.text_field :title %><br>
    <%= f.text_field :content %><br>
    <%= f.submit %><br>
<% end %>
(:title, :content는 Posts테이블의 컬럼명. 지정하면 알아서 @post에 있는 해당값들이 input에 들어감)
- submit할 경우 form_for 보낸 값은 적용된 모델이름의 hash에 담겨 보내짐<br>
 {"post"=>{"title"=>"title내용", "content"=>"content내용"}}
- 바로 수정해볼 경우 수정이 안되있고 내용없음!<br>
 -> 해쉬 안에 해쉬로 담겨서 보내지기 때문에 update 액션 수정<br>
 @post.title = params[:post][:title]<br>
 @post.content = params[:post][:content]<br>