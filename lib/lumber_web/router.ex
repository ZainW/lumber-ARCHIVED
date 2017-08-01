defmodule DotaAPIWeb.Router do
  use DotaAPIWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DotaAPIWeb do
    pipe_through :api
    resources "/heroes", HeroController, except: [:new, :edit]
  end
end
