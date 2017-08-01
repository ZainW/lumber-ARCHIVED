defmodule DotaAPI.HeroController do
  use DotaAPI.Web, :controller

  alias DotaAPI.Hero

  def index(conn, _params) do
    heroes = Repo.all(Hero)
    render(conn, "index.json", heroes: heroes)
  end

  def create(conn, %{"hero" => hero_params}) do
    changeset = Hero.changeset(%Hero{}, hero_params)

    case Repo.insert(changeset) do
      {:ok, hero} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", hero_path(conn, :show, hero))
        |> render("show.json", hero: hero)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DotaAPI.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    hero = Repo.get!(Hero, id)
    render(conn, "show.json", hero: hero)
  end

  def update(conn, %{"id" => id, "hero" => hero_params}) do
    hero = Repo.get!(Hero, id)
    changeset = Hero.changeset(hero, hero_params)

    case Repo.update(changeset) do
      {:ok, hero} ->
        render(conn, "show.json", hero: hero)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DotaAPI.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    hero = Repo.get!(Hero, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(hero)

    send_resp(conn, :no_content, "")
  end
end
