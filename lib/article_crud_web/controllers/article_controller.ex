defmodule ArticleCrudWeb.ArticleController do
  use ArticleCrudWeb, :controller
  alias Article.Article
  alias ArticleCrud.EctoGenOutput.Models.GetArticlesItem
  alias ArticleCrudWeb.Apps

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
    conn
      |> Apps.include(["text-input", "text-area"])
      |> render("new.html", changeset: GetArticlesItem)
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
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

    conn
      |> Apps.include(["text-input", "text-area"])
      |> render("edit.html", changeset: changeset, id: id)
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
