defmodule DotaAPI.Hero do
  use DotaAPI.Web, :model

  schema "heroes" do
    field :name, :string
    field :localized_names, :string
    field :primary_attr, :string
    field :attack_type, :string
    field :img, :string
    field :icon, :string
    field :base_health, :integer
    field :base_health_regen, :decimal
    field :base_mana, :integer
    field :base_mana_regen, :decimal
    field :base_armor, :integer
    field :base_mr, :integer
    field :base_attack_min, :integer
    field :base_attack_max, :integer
    field :base_str, :integer
    field :base_agi, :integer
    field :base_int, :integer
    field :str_gain, :decimal
    field :agi_gain, :decimal
    field :int_gain, :decimal
    field :attack_range, :integer
    field :projectile_speed, :integer
    field :attack_rate, :decimal
    field :move_speed, :integer
    field :turn_rate, :decimal
    field :cm_enabled, :boolean, default: false
    field :legs, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :localized_names, :primary_attr, :attack_type, :img, :icon, :base_health, :base_health_regen, :base_mana, :base_mana_regen, :base_armor, :base_mr, :base_attack_min, :base_attack_max, :base_str, :base_agi, :base_int, :str_gain, :agi_gain, :int_gain, :attack_range, :projectile_speed, :attack_rate, :move_speed, :turn_rate, :cm_enabled, :legs])
    |> validate_required([:name, :localized_names, :primary_attr, :attack_type, :img, :icon, :base_health, :base_health_regen, :base_mana, :base_mana_regen, :base_armor, :base_mr, :base_attack_min, :base_attack_max, :base_str, :base_agi, :base_int, :str_gain, :agi_gain, :int_gain, :attack_range, :projectile_speed, :attack_rate, :move_speed, :turn_rate, :cm_enabled, :legs])
  end
end
