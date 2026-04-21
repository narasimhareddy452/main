import { LightningElement } from 'lwc';

export default class Helloexp extends LightningElement {
    firstname='';
    lastname='';
    handlechange(event){
        const field=event.target.name;
        if(field==='firstname'){
            this.firstname=event.target.value;
        }
        else if(field==='lastname'){
            this.lastname=event.target.value;
        }
    }
       get uppercasedfullname(){
        return '${this.firstname}${this.lastname}'.toUpperCase();
       }
    }