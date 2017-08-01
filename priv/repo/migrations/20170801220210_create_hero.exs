defmodule DotaAPI.Repo.Migrations.CreateHero do
  use Ecto.Migration

  def change do
    create table(:heroes) do
      add :name, :string
      add :localized_names, :string
      add :primary_attr, :string
      add :attack_type, :string
      add :img, :string
      add :icon, :string
      add :base_health, :integer
      add :base_health_regen, :decimal
      add :base_mana, :integer
      add :base_mana_regen, :decimal
      add :base_armor, :integer
      add :base_mr, :integer
      add :base_attack_min, :integer
      add :base_attack_max, :integer
      add :base_str, :integer
      add :base_agi, :integer
      add :base_int, :integer
      add :str_gain, :decimal
      add :agi_gain, :decimal
      add :int_gain, :decimal
      add :attack_range, :integer
      add :projectile_speed, :integer
      add :attack_rate, :decimal
      add :move_speed, :integer
      add :turn_rate, :decimal
      add :cm_enabled, :boolean, default: false, null: false
      add :legs, :integer

      timestamps()
    end
  end
end
