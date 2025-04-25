import { LightningElement, track } from 'lwc';

export default class CalculatorComponent extends LightningElement {
    firstNumber = 0;
    secondNumber = 0;
    @track result = 0;

    connectedCallback() {
        const inputComponent = this.template.querySelector('c-input-component');
        if (inputComponent) {
            this.firstNumber = inputComponent.firstNumber;
            this.secondNumber = inputComponent.secondNumber;
        }
    }

    handleAdd() {
        this.result = Number(this.firstNumber) + Number(this.secondNumber);
    }

    handleSubtract() {
        this.result = Number(this.firstNumber) - Number(this.secondNumber);
    }

    handleMultiply() {
        this.result = Number(this.firstNumber) * Number(this.secondNumber);
    }

    handleDivide() {
        if (Number(this.secondNumber) !== 0) {
            this.result = Number(this.firstNumber) / Number(this.secondNumber);
        } else {
            this.result = 'Error: Division by zero';
        }
    }
}