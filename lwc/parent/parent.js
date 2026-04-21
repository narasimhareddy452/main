import { LightningElement } from 'lwc';

export default class Parent extends LightningElement {
    handleonchange(event){
      this.template.querySelector('c-child').changeMessage(event.target.value);
    }
}