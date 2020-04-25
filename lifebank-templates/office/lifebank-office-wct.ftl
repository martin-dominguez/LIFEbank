<!-- Web Content template for LIFEbank
    Structure Requirements: Office

    @project: LIFEbank
    @date: 24/3/2020
    @author: martin.dominguez@liferay.com
-->
${Name.getData()}${PhoneNumber.getData()}${Email.getData()}
<#assign latitude = 0>
<#assign longitude = 0>

<#if (Address.getData() != "")>
	<#assign geolocationJSONObject = jsonFactoryUtil.createJSONObject(Address.getData())>

	<#assign latitude = geolocationJSONObject.getDouble("latitude")>
	<#assign longitude = geolocationJSONObject.getDouble("longitude")>

	<@liferay_map["map-display"]
		geolocation=true
		latitude=latitude
		longitude=longitude
		name="Address${randomizer.nextInt()}"
	/>
</#if>