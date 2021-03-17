#priority 100
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.recipe.RecipeFunctionMatrix;

public function removeAndHideItem(stack as IItemStack) as void {
  craftingTable.removeRecipe(stack);
  mods.jei.JEI.hideItem(stack);
}

public function removeMultipleRecipes(stacks as IItemStack[]) as void {
	for stack in stacks {
		craftingTable.removeRecipe(stack);
	}
}

public function removeAndHideMultipleItems(stacks as IItemStack[]) as void {
	for stack in stacks {
		craftingTable.removeRecipe(stack);
		mods.jei.JEI.hideItem(stack);
	}
}

public function replaceShaped(recipeName as string, output as IItemStack, ingredients as IIngredient[][]) as void {
	craftingTable.removeRecipe(output);
	craftingTable.addShaped(recipeName, output, ingredients);
}