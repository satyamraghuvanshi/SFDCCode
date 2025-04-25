import { LightningElement, api } from 'lwc';

export default class InputComponent extends LightningElement {
    @api firstNumber;
    @api secondNumber;

    handleFirstNumberChange(event) {
        this.firstNumber = event.target.value;
    }

    handleSecondNumberChange(event) {
        this.secondNumber = event.target.value;
    }
}