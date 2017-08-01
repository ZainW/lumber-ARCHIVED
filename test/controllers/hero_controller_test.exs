defmodule DotaAPI.HeroControllerTest do
  use DotaAPI.ConnCase

  alias DotaAPI.Hero
  @valid_attrs %{agi_gain: "120.5", attack_range: 42, attack_rate: "120.5", attack_type: "some attack_type", base_agi: 42, base_armor: 42, base_attack_max: 42, base_attack_min: 42, base_health: 42, base_health_regen: "120.5", base_int: 42, base_mana: 42, base_mana_regen: "120.5", base_mr: 42, base_str: 42, cm_enabled: true, icon: "some icon", img: "some img", int_gain: "120.5", legs: 42, localized_names: "some localized_names", move_speed: 42, name: "some name", primary_attr: "some primary_attr", projectile_speed: 42, str_gain: "120.5", turn_rate: "120.5"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, hero_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    hero = Repo.insert! %Hero{}
    conn = get conn, hero_path(conn, :show, hero)
    assert json_response(conn, 200)["data"] == %{"id" => hero.id,
      "name" => hero.name,
      "localized_names" => hero.localized_names,
      "primary_attr" => hero.primary_attr,
      "attack_type" => hero.attack_type,
      "img" => hero.img,
      "icon" => hero.icon,
      "base_health" => hero.base_health,
      "base_health_regen" => hero.base_health_regen,
      "base_mana" => hero.base_mana,
      "base_mana_regen" => hero.base_mana_regen,
      "base_armor" => hero.base_armor,
      "base_mr" => hero.base_mr,
      "base_attack_min" => hero.base_attack_min,
      "base_attack_max" => hero.base_attack_max,
      "base_str" => hero.base_str,
      "base_agi" => hero.base_agi,
      "base_int" => hero.base_int,
      "str_gain" => hero.str_gain,
      "agi_gain" => hero.agi_gain,
      "int_gain" => hero.int_gain,
      "attack_range" => hero.attack_range,
      "projectile_speed" => hero.projectile_speed,
      "attack_rate" => hero.attack_rate,
      "move_speed" => hero.move_speed,
      "turn_rate" => hero.turn_rate,
      "cm_enabled" => hero.cm_enabled,
      "legs" => hero.legs}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, hero_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, hero_path(conn, :create), hero: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Hero, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, hero_path(conn, :create), hero: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    hero = Repo.insert! %Hero{}
    conn = put conn, hero_path(conn, :update, hero), hero: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Hero, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    hero = Repo.insert! %Hero{}
    conn = put conn, hero_path(conn, :update, hero), hero: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    hero = Repo.insert! %Hero{}
    conn = delete conn, hero_path(conn, :delete, hero)
    assert response(conn, 204)
    refute Repo.get(Hero, hero.id)
  end
end
