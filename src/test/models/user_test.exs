defmodule ChristmaslistApi.UserTest do
  use ChristmaslistApi.ModelCase

  alias ChristmaslistApi.User

  @valid_attrs %{auth0Token: "some auth0Token", email: "some email", firstName: "some firstName", isPremium: true, lastName: "some lastName"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
