defmodule TestPhoenixProject.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TestPhoenixProject.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(scope, attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        content: "some content",
        published: true,
        title: "some title"
      })

    {:ok, post} = TestPhoenixProject.Blog.create_post(scope, attrs)
    post
  end
end
