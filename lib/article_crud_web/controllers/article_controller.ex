defmodule ArticleCrudWeb.ArticleController do
  use ArticleCrudWeb, :controller
  alias Article.Article
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
      |> render("new.html", changeset: :nil, title: nil, body: nil)
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{"title" => title, "body" => body}) do
    case Article.changeset(%Article{}, %{"title" => title, "body" => body}) do
      {:ok, _} ->
        Article.create_article(title, body)
        conn
          |> put_flash(:info, "Article created!")
          |> redirect(to: Routes.article_path(conn, :index))
      {:error, changeset} ->
         conn
          |> Apps.include(["text-input", "text-area"])
          |> render("new.html", changeset: changeset, title: title, body: body)
      end
  end


  def edit(conn, %{"id" => id}) do
    article = Article.get_article(id)

    conn
      |> Apps.include(["text-input", "text-area"])
      |> render("edit.html", changeset: nil, article: article, id: id)
  end


  def update(conn, %{"id" => id, "title" => title, "body" => body}) do
    case Article.changeset(%Article{}, %{"title" => title, "body" => body}) do
      {:ok, _} ->
        Article.update_article(id, title, body)
        conn
          |> put_flash(:info, "Article updated!")
          |> redirect(to: Routes.article_path(conn, :index))
      {:error, changeset} ->
         conn
          |> Apps.include(["text-input", "text-area"])
          |> render("edit.html", changeset: changeset, article: %{:title => title, :body => body}, id: id)
    end
  end

  def delete(conn, %{"id" => id}) do

    Article.delete_article(id)

    conn
      |> put_flash(:info, "Article removed!")
      |> redirect(to: Routes.article_path(conn, :index))
  end
end
