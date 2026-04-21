import { LightningElement, track } from 'lwc';
import calculateEligibility from '@salesforce/apex/LoanEligibilityController.calculateEligibility';

export default class LoanEligibilityForm extends LightningElement {
    @track incomeType;
    @track monthlyIncome;
    @track annualIncome;
    @track creditScore;
    @track eligibleAmount;
    @track isSalaried = false;
    @track isSelfEmployed = false;
    @track showCreditWarning = false;

    get incomeTypeOptions() {
        return [
            { label: 'Salaried', value: 'Salaried' },
            { label: 'Self-Employed', value: 'Self-Employed' }
        ];
    }

    handleIncomeTypeChange(event) {
        this.incomeType = event.detail.value;
        this.isSalaried = this.incomeType === 'Salaried';
        this.isSelfEmployed = this.incomeType === 'Self-Employed';
    }

    handleInput(event) {
        const field = event.target.label;
        if (field === 'Monthly Salary') this.monthlyIncome = event.target.value;
        if (field === 'Annual Revenue') this.annualIncome = event.target.value;
        if (field === 'Credit Score') this.creditScore = event.target.value;
    }

    calculate() {
        const income = this.isSalaried ? this.monthlyIncome : this.annualIncome;

        calculateEligibility({
            incomeType: this.incomeType,
            income: parseFloat(income),
            creditScore: parseInt(this.creditScore)
        })
        .then(result => {
            this.eligibleAmount = result;
            this.showCreditWarning = this.creditScore < 650;
        })
        .catch(error => {
            console.error(error);
        });
    }
}