require "test_helper"

class SongsSimpleFormControllerTest < ActionController::TestCase
  tests SongsController

  test "new" do
    get :new, id: 1
    response.body.must_equal %{<form class="simple_form edit_song" id="edit_song_1" action="/songs/1" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="_method" value="patch" />
<div class="input string required song_title"><label class="string required" for="song_title"><abbr title="required">*</abbr> Title</label><input class="string required" required="required" aria-required="true" type="text" value="Murder" name="song[title]" id="song_title" /></div>

  <div class=\"input string required artist_name\"><label class=\"string required\" for=\"artist_name\"><abbr title=\"required\">*</abbr> Name</label><input class=\"string required\" required=\"required\" aria-required=\"true\" type=\"text\" value=\"Selecter\" name=\"artist[name]\" id=\"artist_name\" /></div>
</form>}
  end

  test "create" do
    post :create, id: 1, params: { song: { title: "", artist_attributes: { name: "" } } }
    response.body.must_equal %{<form class="simple_form edit_song" id="edit_song_1" action="/songs/1" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="_method" value="patch" />
<div class=\"input string required song_title field_with_errors\"><label class=\"string required\" for=\"song_title\"><abbr title=\"required\">*</abbr> Title</label><input class=\"string required\" required=\"required\" aria-required=\"true\" aria-invalid=\"true\" type=\"text\" value=\"\" name=\"song[title]\" id=\"song_title\" /><span class=\"error\">can&#39;t be blank</span></div>

  <div class=\"input string required artist_name field_with_errors\"><label class=\"string required\" for=\"artist_name\"><abbr title=\"required\">*</abbr> Name</label><input class=\"string required\" required=\"required\" aria-required=\"true\" aria-invalid=\"true\" type=\"text\" value=\"\" name=\"artist[name]\" id=\"artist_name\" /><span class=\"error\">can&#39;t be blank</span></div>
</form>}
  end
end
