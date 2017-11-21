defmodule Gotest.Movies.Movie do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gotest.Movies.Movie


  schema "movies" do
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Movie{} = movie, attrs) do
    movie
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
