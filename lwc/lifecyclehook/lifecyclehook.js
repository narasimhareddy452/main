import { LightningElement ,api} from 'lwc';

export default class Lifecyclehook extends LightningElement {
    @api templateno=temp1;
    constructor(){
        super();
        console.log('inside constructor');
    }
    connectedCallback(){
        console.log('inside connected callback');
    }
    disconnectedCallback(){
        console.log('inside disconnected call back');
    }
    changetemplate(){
        console.log('inside changetemplate');
        if(templateno=temp1){
            this.templateno=temp2;
        }
        else{
            this.templateno=temp1;
        }
    }

}