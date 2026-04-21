import { LightningElement,api,track } from 'lwc';

export default class ChildComponentforPC extends LightningElement {  
    @track Message;
    @api childMessage(strString)
    {
    this.Message = strString.toUppercase();
    };    
}