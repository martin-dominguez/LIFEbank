import React, {useState} from 'react';

import ClaySlider from '@clayui/slider';

export default (props) => {
	const {
		id,
		label,
		max,
		min,
		minMaxLabelPrefix,
		minMaxLabelTuple,
		onValueChange,
		parseValue,
		step,
		value,
		valueLabelPrefix,
		valueLabelTuple
	} = props;

	const [editing, setEditing] = useState(false);
	const [editValue, setEditValue] = useState(value);



	const handleBlur = () => {
		let val = editValue;

		val = parseFloat(val);

		if (isNaN(val) || val < min) {
			val = min;
		}
		else if (val > max) {
			val = max;
		}
		else if (val % step != 0) {
			val = Math.floor(val / step) * step;
		}

		onValueChange(val);
		setEditValue(val);

		setEditing(!editing);
	}

	const maxLabel = <span className={minMaxLabelPrefix ? 'mr-1' : 'ml-1'} key="maxLabel">{max == 1 ? minMaxLabelTuple[0] : minMaxLabelTuple[1]}</span>;
	const minLabel = <span className={minMaxLabelPrefix ? 'mr-1' : 'ml-1'} key="minLabel">{min == 1 ? minMaxLabelTuple[0] : minMaxLabelTuple[1]}</span>;
	const valueLabel = <span className={valueLabelPrefix ? 'mr-1' : 'ml-1'} key="valueLabel">{value == 1 ? valueLabelTuple[0] : valueLabelTuple[1]}</span>;

	const editValueInput = <input
		autoFocus
		className="unstyled-input"
		key="input"
		onBlur={handleBlur}
		onChange={event => setEditValue(event.target.value)}
		size={editValue.toString().length}
		type="text"
		value={editValue}
	/>;

	const formatter = Intl.NumberFormat(themeDisplay.getBCP47LanguageId(), {style: 'decimal'});

	const formattedValue = parseValue ? parseValue(value) : formatter.format(value);
	const formattedMax = formatter.format(max);
	const formattedMin = formatter.format(min);

	const valueDisplay = editing ? editValueInput : <span key="value">{formattedValue}</span>;

	const maxValueWithLabel = minMaxLabelPrefix ? [maxLabel, formattedMax] : [formattedMax, maxLabel];
	const minValueWithLabel = minMaxLabelPrefix ? [minLabel, formattedMin] : [formattedMin, minLabel];
	const valueValueWithLabel = valueLabelPrefix ? [valueLabel, valueDisplay] : [valueDisplay, valueLabel];

	return (
		<div className="form-group">
			<div className="d-flex justify-content-between">
				<label htmlFor={id}><h3>{label}</h3></label>

				<div className="value-container" onClick={() => setEditing(true)}>{valueValueWithLabel}</div>
			</div>

			<ClaySlider
				id={id}
				max={max}
				min={min}
				onValueChange={onValueChange}
				step={step}
				value={value}
			/>

			<div className="d-flex justify-content-between">
				<label className="min">{minValueWithLabel}</label>

				<label className="max">{maxValueWithLabel}</label>
			</div>
		</div>
	);
}