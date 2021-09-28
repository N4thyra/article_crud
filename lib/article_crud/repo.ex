defmodule ArticleCrud.Repo do
  use Ecto.Repo,
    otp_app: :article_crud,
    adapter: Ecto.Adapters.Postgres
end
