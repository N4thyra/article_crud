defmodule Article.Article do
  alias ArticleCrud.EctoGenOutput.DbContext
  alias ArticleCrud.EctoGenOutput.Models.GetArticlesItem

  def get_articles do
    case DbContext.get_articles() do
      {:ok, items} ->
        items
      {:error, err} ->
        err
    end

  end

  def get_article(id) do
    case DbContext.get_articles(String.to_integer(id)) do
      {:ok, item} ->
          hd(item)
      {:error, err} ->
        err
    end
  end


  def update_article(id, article) do
    DbContext.update_article(String.to_integer(id), article["title"], article["body"])
  end

  def delete_article(id) do
    DbContext.delete_article(String.to_integer(id))
  end


  def change_article(article) do
    data  = article
    types = %{}
    params = %{}
    changeset =
      {data, types}
      |> Ecto.Changeset.cast(params, Map.keys(types))
  end

  @spec create_article(binary, binary) :: {:error, any} | {:ok, [boolean]}
  def create_article(title, body) do
    DbContext.insert_article(title, body)
  end
end
