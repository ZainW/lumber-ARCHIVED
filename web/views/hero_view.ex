defmodule DotaAPI.HeroView do
  use DotaAPI.Web, :view

  def render("index.json", %{heroes: heroes}) do
    %{data: render_many(heroes, DotaAPI.HeroView, "hero.json")}
  end

  def render("show.json", %{hero: hero}) do
    %{data: render_one(hero, DotaAPI.HeroView, "hero.json")}
  end

  def render("hero.json", %{hero: hero}) do
    %{id: hero.id,
      name: hero.name,
      localized_names: hero.localized_names,
      primary_attr: hero.primary_attr,
      attack_type: hero.attack_type,
      img: hero.img,
      icon: hero.icon,
      base_health: hero.base_health,
      base_health_regen: hero.base_health_regen,
      base_mana: hero.base_mana,
      base_mana_regen: hero.base_mana_regen,
      base_armor: hero.base_armor,
      base_mr: hero.base_mr,
      base_attack_min: hero.base_attack_min,
      base_attack_max: hero.base_attack_max,
      base_str: hero.base_str,
      base_agi: hero.base_agi,
      base_int: hero.base_int,
      str_gain: hero.str_gain,
      agi_gain: hero.agi_gain,
      int_gain: hero.int_gain,
      attack_range: hero.attack_range,
      projectile_speed: hero.projectile_speed,
      attack_rate: hero.attack_rate,
      move_speed: hero.move_speed,
      turn_rate: hero.turn_rate,
      cm_enabled: hero.cm_enabled,
      legs: hero.legs}
  end
end
