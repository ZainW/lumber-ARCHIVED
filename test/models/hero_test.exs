defmodule DotaAPI.HeroTest do
  use DotaAPI.ModelCase

  alias DotaAPI.Hero

  @valid_attrs %{agi_gain: "120.5", attack_range: 42, attack_rate: "120.5", attack_type: "some attack_type", base_agi: 42, base_armor: 42, base_attack_max: 42, base_attack_min: 42, base_health: 42, base_health_regen: "120.5", base_int: 42, base_mana: 42, base_mana_regen: "120.5", base_mr: 42, base_str: 42, cm_enabled: true, icon: "some icon", img: "some img", int_gain: "120.5", legs: 42, localized_names: "some localized_names", move_speed: 42, name: "some name", primary_attr: "some primary_attr", projectile_speed: 42, str_gain: "120.5", turn_rate: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Hero.changeset(%Hero{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Hero.changeset(%Hero{}, @invalid_attrs)
    refute changeset.valid?
  end
end
