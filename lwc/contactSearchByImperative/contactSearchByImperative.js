import { LightningElement,track } from 'lwc';
import getContacts from '@salesforce/apex/ContactSearchController.getContacts';
export default class ContactSearchByImperative extends LightningElement {
   // searchKey = '';
    @track contacts;
    @track error;

    handleKeyChange(event) {
        const searchKey = event.target.value;
        getContacts({searchKey:searchKey})
        .then(result=>{
            this.contacts=result;
            this.error=undefined;
        })
        .catch(error=>{
            this.error=error;
            this.contacts=undefined;
        })
    }
}