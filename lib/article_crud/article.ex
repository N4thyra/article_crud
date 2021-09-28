defmodule Article.Article do
  alias ArticleCrud.EctoGenOutput.DbContext
  alias ArticleCrud.EctoGenOutput.Models.GetArticlesItem

  def get_articles do
    DbContext.get_articles()
    |> elem(1)
  end

  def get_article(id) do
    hd(id
        |> String.to_integer()
        |> DbContext.get_articles()
        |> elem(1)
      )
  end

  def update_article(id, article) do
    DbContext.update_article(String.to_integer(id), article["title"], article["body"])
  end

  def delete_article(id) do
    DbContext.delete_article(String.to_integer(id))
  end

  @spec create_article(binary, binary) :: {:error, any} | {:ok, [boolean]}
  def create_article(title, body) do
    DbContext.insert_article(title, body)
  end
end
