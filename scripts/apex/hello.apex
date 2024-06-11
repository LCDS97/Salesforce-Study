// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// SpoonacularIntegrationHandler.getRandomRecipe();
// SpoonacularIntegrationHandler.getRecipeInformation('123');
List<String> lstIngredients = new List<String>();
lstIngredients.add('sugar');
lstIngredients.add('banana');
SpoonacularIntegrationHandler.getRecipeByIngredients(lstIngredients);