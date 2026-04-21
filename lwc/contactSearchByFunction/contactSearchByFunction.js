import { LightningElement,track,wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactSearchController.getContacts';
export default class ContactSearchByFunction extends LightningElement {
    @track searchKey;
    @track contacts;
    @track error;
    @wire(getContacts,{searchKey : '$searchKey'}) 
    wiredContacts(data,error){
        if(data){
            this.contacts=data;
            this.error=undefined;
        }
        if(error){
            this.error=error;
            this.contacts=undefined;

    }
}
    handleChange(event){
        this.searchKey=event.target.value;
        }
}