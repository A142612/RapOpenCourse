@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'booking data'
@Metadata.ignorePropagatedAnnotations: true

define view entity zi_rap_booking_u_kemin as select from /dmo/booking
association        to parent zi_rap_travel_u_kemin as _Travel     on  $projection.TravelID = _Travel.TravelID
association [1..1] to /DMO/I_Carrier    as _Carrier    on  $projection.CarrierId = _Carrier.AirlineID
  association [1..1] to /DMO/I_Customer   as _Customer   on  $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Connection as _Connection on  $projection.CarrierId    = _Connection.AirlineID
                                                         and $projection.ConnectionId = _Connection.ConnectionID
  association [1..1] to /DMO/I_Flight     as _Flight     on  $projection.CarrierId    = _Flight.AirlineID
                                                         and $projection.ConnectionId = _Flight.ConnectionID
                                                         and $projection.FlightDate   = _Flight.FlightDate
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    
    /* associations */
      _Travel,
      _Carrier,
      _Customer,
      _Connection,
      _Flight
}
