public with sharing class LoanEligibilityController {
    @AuraEnabled
    public static Decimal calculateEligibility(String incomeType, Decimal income, Integer creditScore) {
        Decimal baseMultiplier = incomeType == 'Salaried' ? 25 : 20;
        Decimal eligibility = income * baseMultiplier;

        // Credit score penalty
        if (creditScore < 650) {
            eligibility = eligibility * 0.7; // reduce by 30%
        } else if (creditScore < 750) {
            eligibility = eligibility * 0.9;
        }
        return eligibility.setScale(2);
    }
}