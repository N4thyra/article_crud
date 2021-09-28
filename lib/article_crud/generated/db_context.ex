# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule ArticleCrud.EctoGenOutput.DbContext do
  @moduledoc """
  This module contains functions for calling DB's stored procedures.

  Functions inside this module require as a first argument a pid. It is the pid of Postgrex driver process.
  """

  require Logger

  import Elixir.ArticleCrud.Repo, only: [query: 2]

  @spec delete_article(integer()) :: {:error, any()} | {:ok, [boolean()]}
  def delete_article(id) do
    Logger.debug("Calling stored procedure", procedure: "delete_article")

    query(
      "select * from public.delete_article($1)",
      [id]
    )
    |> ArticleCrud.EctoGenOutput.Parsers.DeleteArticleParser.parse_delete_article_result()
  end

  @spec get_articles(integer() | nil) ::
          {:error, any()} | {:ok, [ArticleCrud.EctoGenOutput.Models.GetArticlesItem.t()]}
  def get_articles(id \\ nil) do
    Logger.debug("Calling stored procedure", procedure: "get_articles")

    query(
      "select * from public.get_articles($1)",
      [id]
    )
    |> ArticleCrud.EctoGenOutput.Parsers.GetArticlesParser.parse_get_articles_result()
  end

  @spec insert_article(binary(), binary()) :: {:error, any()} | {:ok, [boolean()]}
  def insert_article(title, body) do
    Logger.debug("Calling stored procedure", procedure: "insert_article")

    query(
      "select * from public.insert_article($1, $2)",
      [title, body]
    )
    |> ArticleCrud.EctoGenOutput.Parsers.InsertArticleParser.parse_insert_article_result()
  end

  @spec update_article(integer(), binary(), binary()) :: {:error, any()} | {:ok, [boolean()]}
  def update_article(id, title, body) do
    Logger.debug("Calling stored procedure", procedure: "update_article")

    query(
      "select * from public.update_article($1, $2, $3)",
      [id, title, body]
    )
    |> ArticleCrud.EctoGenOutput.Parsers.UpdateArticleParser.parse_update_article_result()
  end
end