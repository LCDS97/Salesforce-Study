public with sharing class SpoonacularRecipeController {
    
    @AuraEnabled
    public static string getRandomRecipe(){
        try {
            return SpoonacularIntegrationHandler.getRandomRecipe();
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static string getRecipeInformationById(String recipeId){
        try {
            return SpoonacularIntegrationHandler.getRecipeInformationById(recipeId);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static String getRecipeByIngredients(String ingredients){
        try {
           return SpoonacularIntegrationHandler.getRecipeByIngredients(ingredients);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}