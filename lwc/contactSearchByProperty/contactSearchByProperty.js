import { LightningElement ,track,wire} from 'lwc';
import getContacts from '@salesforce/apex/ContactSearchController.getContacts';
export default class ContactSearchByProperty extends LightningElement {
@track searchKey;
@wire(getContacts,{searchKey : '$searchKey'})contacts;
handleChange(event){
this.searchKey=event.target.value;
}}