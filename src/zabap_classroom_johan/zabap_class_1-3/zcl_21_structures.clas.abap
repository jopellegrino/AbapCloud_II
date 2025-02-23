CLASS zcl_21_structures DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_21_structures IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "ACCESO (RELLENADO DE LA STRUCTURA)

    TYPES: BEGIN OF lty_flights,                                    "STRUCTURA USADA PARA CREAR LA TABLA
             flight_date   TYPE /dmo/flight-flight_date,
             price         TYPE /dmo/flight-price,
             currency_code TYPE /dmo/flight-currency_code,
           END OF lty_flights.

    DATA: BEGIN OF ls_flight_info,                                  "STRUCTURA PROFUNDA
            carrier    TYPE /dmo/flight-carrier_id VALUE 'AA',
            connind    TYPE /dmo/flight-connection_id VALUE '0018',
            lt_flights TYPE lty_flights,                            "ESTA STRUCTURA ESTA COMPUESTA POR 3 CAMPOS MAS (VER ARRIBA)
          END OF ls_flight_info.

    "RELLENADO 1

    ls_flight_info-carrier = 'XX'.      "LLENADO DE CAMPOS SIMPLES
    ls_flight_info-connind = '0022'.

    ls_flight_info-lt_flights-flight_date = cl_abap_context_info=>get_system_date(  ). "RELLENA DE CAMPOS DE LA STRUCTURA CON LA FECHA ACTUAL
    ls_flight_info-lt_flights-price = '200'.
    ls_flight_info-lt_flights-currency_code = 'USD'.

    IF ls_flight_info-carrier EQ 'XX'.

      out->write( data = ls_flight_info name = 'INFORMACION DE FLIGHT' ).

    ENDIF.


  ENDMETHOD.
ENDCLASS.
