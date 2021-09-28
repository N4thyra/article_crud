defmodule ArticleCrudWeb.ArticleController do
  use ArticleCrudWeb, :controller
  alias Article.Article
  alias ArticleCrud.EctoGenOutput.Models.GetArticlesItem

  def index(conn, _params) do
    articles = Article.get_articles()

    inspect(articles)

    render(conn, "index.html", articles: articles)
  end

  def show(conn, %{"id" => id}) do
    article = Article.get_article(id)

    render(conn, "show.html", article: article)
  end

  def new(conn, _params) do
    render(conn, "new.html", changeset: GetArticlesItem)
  end

  def create(conn, %{"Elixir.ArticleCrud.EctoGenOutput.Models.GetArticlesItem" => data}) do

    case Article.create_article(data["title"], data["body"]) do
      {:ok, _} ->
        conn
          |> put_flash(:info, "Article created!")
          |> redirect(to: Routes.article_path(conn, :index))
    end
  end


  def edit(conn, %{"id" => id}) do
    article = Article.get_article(id)
    changeset = Article.change_article(article)
    render(conn, "edit.html", changeset: changeset, id: id)
  end


  def update(conn, %{"id" => id, "get_articles_item" => data}) do
    case Article.update_article(id, data) do
      {:ok, _} ->
        conn
          |> put_flash(:info, "Article updated!")
          |> redirect(to: Routes.article_path(conn, :index))
    end
  end

  def delete(conn, %{"id" => id}) do
    Article.delete_article(id)

    conn
      |> put_flash(:info, "Article removed!")
      |> redirect(to: Routes.article_path(conn, :index))
  end
end
