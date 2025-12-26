defmodule TestPhoenixProject.BlogTest do
  use TestPhoenixProject.DataCase

  alias TestPhoenixProject.Blog
  alias TestPhoenixProject.Blog.Post

  import TestPhoenixProject.AccountsFixtures, only: [user_scope_fixture: 0]
  import TestPhoenixProject.BlogFixtures

  @invalid_attrs %{title: nil, content: nil, published: nil}

  # Missing subscribe_posts/1 tests entirely!

  describe "list_posts/1" do
    test "returns all posts for scoped user" do
      scope = user_scope_fixture()
      post1 = post_fixture(scope)
      post2 = post_fixture(scope)
      assert Blog.list_posts(scope) == [post1, post2]
    end

    # Missing: "filters posts by user scope" test
  end

  describe "get_post!/2" do
    test "returns the post with given id" do
      scope = user_scope_fixture()
      post = post_fixture(scope)
      assert Blog.get_post!(scope, post.id) == post
    end

    test "raises when post does not exist" do
      scope = user_scope_fixture()
      assert_raise Ecto.NoResultsError, fn -> Blog.get_post!(scope, "nonexistent") end
    end
  end

  describe "create_post/2" do
    test "creates a post with valid data" do
      scope = user_scope_fixture()
      valid_attrs = %{title: "some title", content: "some content", published: true}

      assert {:ok, %Post{} = post} = Blog.create_post(scope, valid_attrs)
      assert post.title == "some title"
      assert post.content == "some content"
      assert post.published == true
    end

    # Missing: "broadcasts created notification" test
    # Missing: "returns error changeset with invalid data" test

    # Extra test not in spec:
    test "sets user_id from scope" do
      scope = user_scope_fixture()
      valid_attrs = %{title: "title", content: "content", published: true}
      assert {:ok, %Post{} = post} = Blog.create_post(scope, valid_attrs)
      assert post.user_id == scope.user.id
    end
  end

  describe "update_post/3" do
    test "updates the post with valid data" do
      scope = user_scope_fixture()
      post = post_fixture(scope)
      update_attrs = %{title: "updated title", content: "updated content"}

      assert {:ok, %Post{} = updated_post} = Blog.update_post(scope, post, update_attrs)
      assert updated_post.title == "updated title"
      assert updated_post.content == "updated content"
    end

    # Missing: "broadcasts updated notification" test
    # Missing: "returns error changeset with invalid data" test

    # Extra test not in spec:
    test "fails when user does not own post" do
      scope = user_scope_fixture()
      other_scope = user_scope_fixture()
      post = post_fixture(other_scope)

      assert_raise MatchError, fn ->
        Blog.update_post(scope, post, %{title: "new"})
      end
    end
  end

  describe "delete_post/2" do
    test "deletes the post" do
      scope = user_scope_fixture()
      post = post_fixture(scope)
      assert {:ok, %Post{}} = Blog.delete_post(scope, post)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_post!(scope, post.id) end
    end

    # Missing: "broadcasts deleted notification" test
  end

  describe "change_post/3" do
    test "returns a post changeset" do
      scope = user_scope_fixture()
      post = post_fixture(scope)
      assert %Ecto.Changeset{} = Blog.change_post(scope, post)
    end
  end
end
