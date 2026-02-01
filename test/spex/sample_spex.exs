defmodule TestPhoenixProject.SampleSpex do
  use Spex

  spex "Blog post management" do
    scenario "creating a post" do
      given_ "a valid post title" do
        :ok
      end

      when_ "the post is created" do
        :ok
      end

      then_ "the post should be saved" do
        assert true
      end
    end
  end
end
