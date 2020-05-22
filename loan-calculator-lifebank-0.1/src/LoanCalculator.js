import React, {useMemo, useState} from 'react';

import InputSlider from './InputSlider';

export default (props) => {
	const configuration = useMemo(
		() => {
			const {portletInstance} = props.configuration;

			const configuration = {};

			Object.keys(portletInstance).forEach(
				key => {
					const value = portletInstance[key];

					if (value.length > 0) {
						configuration[key] = value;
					}
				}
			);

			return configuration;
		},
		[]
	);

	const {
		amountLabel = 'Loan Amount',
		amountUnitsSingular = 'AED',
		amountUnitsPlural = 'AED',
		amountUnitsPrefix = true,
		amountInitValue = '120000',
		amountMinValue = '25000',
		amountMaxValue = '300000',
		amountStepSize = '5000',
		termLabel = 'Loan Term',
		termUnitsSingular = 'month',
		termUnitsPlural = 'months',
		termUnitsPrefix = false,
		termInitValue = '36',
		termMinValue = '12',
		termMaxValue = '60',
		termStepSize = '1',
		monthsPerTermUnit = '1',
		interestRateLabel = 'Interest Rate',
		interestRateUnitsSingular = '%',
		interestRateUnitsPlural = '%',
		interestRateUnitsPrefix = false,
		interestRateInitValue = '4.65',
		interestRateMinValue = '3.0',
		interestRateMaxValue = '9.0',
		interestRateStepSize = '0.05'
	} = configuration;

	const [interestRate, setInterestRate] = useState(parseFloat(interestRateInitValue));
	const [loanAmount, setLoanAmount] = useState(parseFloat(amountInitValue));
	const [term, setTerm] = useState(parseFloat(termInitValue));


	const monthlyPayment = useMemo(
		() => {
			const P = loanAmount;
			const J = interestRate/(12*100);
			const N = term * parseFloat(monthsPerTermUnit);

			return P * (J/(1-(1+J) ** -N));
		},
		[interestRate, loanAmount, term]
	);

	const formatter = Intl.NumberFormat(themeDisplay.getBCP47LanguageId(), {style: 'decimal'});

	const formattedMonthlyPayment = formatter.format(monthlyPayment);

	const unitsDisplay = <span className={amountUnitsPrefix ? 'mr-1' : 'ml-1'} key="value">{amountUnitsPlural}</span>;

	const monthlyPaymentDisplay = amountUnitsPrefix ? [unitsDisplay, formattedMonthlyPayment] : [formattedMonthlyPayment, unitsDisplay];

	return (
		<div className="loanCaculator">
			<InputSlider
				id="loanAmount"
				label={amountLabel}
				max={parseFloat(amountMaxValue)}
				min={parseFloat(amountMinValue)}
				minMaxLabelTuple={[amountUnitsSingular, amountUnitsPlural]}
				minMaxLabelPrefix={amountUnitsPrefix}
				onValueChange={setLoanAmount}
				step={amountStepSize}
				value={loanAmount}
				valueLabelPrefix={amountUnitsPrefix}
				valueLabelTuple={[amountUnitsSingular, amountUnitsPlural]}
			/>

			<InputSlider
				id="term"
				label={termLabel}
				max={parseFloat(termMaxValue)}
				min={parseFloat(termMinValue)}
				minMaxLabelPrefix={termUnitsPrefix}
				minMaxLabelTuple={[termUnitsSingular, termUnitsPlural]}
				onValueChange={setTerm}
				step={parseFloat(termStepSize)}
				value={term}
				valueLabelPrefix={termUnitsPrefix}
				valueLabelTuple={[termUnitsSingular, termUnitsPlural]}
			/>

			<InputSlider
				id="interestRate"
				label={interestRateLabel}
				max={parseFloat(interestRateMaxValue)}
				min={parseFloat(interestRateMinValue)}
				minMaxLabelPrefix={interestRateUnitsPrefix}
				minMaxLabelTuple={[interestRateUnitsSingular, interestRateUnitsPlural]}
				onValueChange={setInterestRate}
				parseValue={val => parseFloat(val).toFixed(2)}
				step={interestRateStepSize}
				value={interestRate}
				valueLabelPrefix={interestRateUnitsPrefix}
				valueLabelTuple={[interestRateUnitsSingular, interestRateUnitsPlural]}
			/>

			<div className="col-6 col-offset-1 mt-2 align-items-end d-flex flex-wrap justify-content-around">
				<h4>Monthly Payment: </h4>

				<div className="display-4 flex-shrink-0 mx-1">{monthlyPaymentDisplay}</div>
			</div>
		</div>
	);
}