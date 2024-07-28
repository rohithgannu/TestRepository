import { LightningElement,api,track,wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactExp.getContactList';
import { refreshApex } from '@salesforce/apex';
export default class Assignment1 extends LightningElement {
contactsList;
wiredcontactList;
@api recordId;
@wire(getContactList, {recordId : "$recordId"})
    getContactList(result){
        this.wiredcontactList = result;
        if(result.data){
            this.contactsList = result.data;
        }
        else if(result.error){
            this.contactsList = result.error;
        }
    }

handleClick(){
    refreshApex(this.wiredcontactList);
}  

}