@EndUserText.label: 'travel data'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_RAP_Travel_U_KEMIN as projection on zi_rap_travel_u_kemin
{
    key TravelId,
    @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Agency', element: 'AgencyID' } } ]
    @Search.defaultSearchElement: true
    AgencyId,
    @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Customer', element: 'CustomerID' } } ]
    @Search.defaultSearchElement: true
    CustomerId,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Currency', element: 'Currency' } } ]
    CurrencyCode,
    Description,
    Status,
    Createdby,
    Createdat,
    Lastchangedby,
    Lastchangedat,
    /* Associations */
    _Agency,
    _Booking: redirected to composition child ZC_RAP_Booking_U_KEMIN,
    _Currency,
    _Customer
}
