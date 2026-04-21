import { LightningElement,track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountSearchController.getAccounts';
export default class AccountSearchImperative extends LightningElement {
    @track accounts;
    accountName='';
    handleChange(event){
        this.accountName= event.target.value;
    }
    handleSearch(){
        getAccounts({accountName: this.accountName})
        .then(result => {
            this.accounts = result;
            })
        .catch(error => {
            this.error = error;
            this.accounts = undefined;
        });
}
}