extends Resource
class_name RecipeBook

@export var recipes: Array[Recipe]


static func find_combo(spell_a: SpellData, spell_b: SpellData) -> SpellData:
	var recipe_book: RecipeBook = load("res://Core/Spells/Combo/recipe_book.tres")
	var loaded_recipes: Array[Recipe] = recipe_book.recipes
	for recipe in loaded_recipes:
		if recipe_matches(recipe, spell_a, spell_b):
			return recipe.combo
	return null


static func ingredient_matches(ingredient: Ingredient, spell: SpellData) -> bool:
	return ingredient.element == spell.element and ingredient.form == spell.form


static func recipe_matches(recipe: Recipe, spell_a: SpellData, spell_b: SpellData) -> bool:
	return (
		ingredient_matches(recipe.ingredient_a, spell_a) and ingredient_matches(recipe.ingredient_b, spell_b)
		or
		ingredient_matches(recipe.ingredient_b, spell_a) and ingredient_matches(recipe.ingredient_a, spell_b)
	)
