CLASS zcl_19_control_structure_a DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_19_control_structure_a IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    """""""""""IF*--ELSEIF--ELSE--ENDIF*""""""""""

    out->write(  |**IF-ELSEIF-ELSE-ENDIF**     | ).

    DATA(lv_char) = 'Aa'.

    IF lv_char EQ 'A'.
      out->write( |La variable LV_CHAR es igual a: { lv_char }| ).

    ELSEIF lv_char EQ 'B'.
      out->write( |La variable LV_CHAR es igual a: { lv_char }| ).

    ELSEIF lv_char EQ 'C'.
      out->write( |La variable LV_CHAR es igual a: { lv_char }| ).

    ELSE.
      out->write(  |El valor esta indefinido| ).

    ENDIF.

    DATA(lv_num) = 3.

    IF lv_num EQ 3 OR lv_char EQ 'A'.                  "EL IF TIENE DOS CONDICIONES
      out->write( |El valor es valido| ).

    ENDIF.

    DATA(lv_text1) = 'ABAP'.
    DATA(lv_text2) = 'Programming'.
    DATA(lv_text3) = 'Classes'.

    IF lv_text1 = 'ABAP'.                              "NESTED IF (IF ANIDADO)
      IF lv_text2 EQ 'Programming'.
        IF lv_text3 = 'Classes'.
          out->write( 'If Anidado: Correct' ).

        ELSE.
          out->write( 'If Anidado: Incorrect' ).

        ENDIF.
      ENDIF.
    ENDIF.

    CLEAR lv_num.                                      "VARIABLE VACIA

    IF lv_num IS INITIAL.
      out->write( 'Clear lv_num: The variable is empty' ).

    ENDIF.


    """"""""""CASE/ENDCASE""""""""""
    out->write(  |   | ).
    out->write(  |**CASE-ENDCASE**     | ).

    DATA(lv_client) = cl_abap_random_int=>create( seed = cl_abap_random=>seed(  )   "CLASE STANDAR PARA OBTENER UN #RANDOM
                                                  min = 1
                                                  max = 20         )->get_next(  ).


    CASE lv_client.                                             "UNICA CONDICION ES LA INICIAL CON LA VARIABLE TRATADA Y EN WHEN SON LOS CASOS COMPARATIVOS SOLO SE PUEDE COLOCAR CASOS QUE PUEDE TOMAR LA VARIABLE(SIN OPERADORES DE COMPARACION)

      WHEN 1.                                                   "UN CASE SIEMPRE SE PUEDE REEMPLAZAR POR UN IF PERO ALREVEZ NO
        out->write( |El Valor de "LV_CLIENT" es: LV_CLIENT | ).
        out->write( |'Company client 1 | ).

      WHEN 2.
        out->write( |El Valor de "LV_CLIENT" es: LV_CLIENT | ).
        out->write( |'Company client 2 | ).

      WHEN 3.
        out->write( |El Valor de "LV_CLIENT" es: LV_CLIENT | ).
        out->write( |'Company client 3 | ).

      WHEN OTHERS.
        out->write( |El cliente no esta registado en la base de datos| ).

    ENDCASE.


    """"""""""DO-ENDDO""""""""""SE EJECUTA UN NUMERO DE VECES SIN CONDICION
    out->write(  |   | ).
    out->write(  |**DO-ENDDO**      | ).

    lv_num = 0.

    DO.                                     "DEBES ESPECIFICAR (n TIMES) SI NO SERA INFINITO (10MIN MAX)

      out->write( |Valor de lv_num:{ lv_num }| ).

      lv_num += 1.

      IF lv_num GT 8.                       "EXIT HACE SALIR DEL BUCLE CUANDO SE CUMPLE EL IF
        EXIT.
      ENDIF.

      IF lv_num GT 3.                       "CONTINUE HACE QUE NO SE LEA EL CODIGO QUE LE SIGUE Y VUELVE A CONTINUAR EN OTRO CICLO
        CONTINUE.
      ENDIF.

      out->write( |ESTO SIGNIFICA QUE NO SE ACTIVO EL "CONTINUE"| ).
      out->write( |{ lv_num }| ).

    ENDDO.


    """"""""""CHECK""""""""""                      "PARECIESE EL CONTRARIO DE CONTINUE (YA QUE HACE EL CODIGO QUE ESTA DESPUES DE EL SI CUMPLE LA CONDICION)
    out->write(  |   | ).
    out->write(  |**DO-ENDDO-CHECK**  | ).

    DO 20 TIMES.                                   "LO QUE HACE ESTO ES NO IMPRIMIR CUANDO LA ITERACION DEL BUCLE(SY-INDEX) SEA IMPAR

      DATA(lv_div) = sy-index MOD 2.               "VARIABLE DEL SISTEMA QUE SIGUE EL NUMERO DE ITERACIONES DEL BUCLE

      CHECK lv_div = 0.                            "MOD 2 ES QUE CUANDO SY-INDEX SEA PAR ENTONCES TODO SERA CERO
      out->write( |La variable del sistema SY-INDEX vale: { sy-index } | ).

    ENDDO.


    """"""""""SWITCH""""""""""OPERADOR CONDICIONAL

    out->write(  |  | ).
    out->write(  |**SWITCH**  | ).


    DO 6 TIMES.
      DATA(lv_value) = SWITCH #( sy-index                        "PARA SINTAXIS PRIMERO LA VARIABLE A TRABAJAR, EL TIPO DE DATO LO DEFINE ESA VAR.
                                 WHEN 1 THEN |Iteracion 1|       "ESTO ASIGNA EL VALOR QUE ESTA EN EL WHEN A LA VARIABLE LV_VALUE
                                 WHEN 2 THEN |Iteracion 2|
                                 WHEN 3 THEN |Iteracion 3|
                                 ELSE |El num. de la operacion es mayor a 3| ).

      out->write( lv_value ).
    ENDDO.


    """"""""""COND""""""""""NUEVA FORMA DE IF-ELSEIF SIN TANTA REDUDANCIA DEL LAS VARIABLES

    out->write(  |  | ).
    out->write(  |**COND**  | ).

    DATA(lv_get_time) = cl_abap_context_info=>get_system_time(  ).  "DA LA HORA

    DATA(lv_time) = COND #( WHEN lv_get_time < '120000' THEN | { lv_get_time TIME = ISO  } AM |                        "DOS OPCIONES COLOCAR DIRECTAMENTE EL TIPO DE DATO LUEGO DEL "COND STRING( )"
                            WHEN lv_get_time > '120000' THEN | {  CONV t( lv_get_time - 12 * 3600 ) TIME = ISO } PM|   "O AUTOREFERENCIA "#(  )" QUE TOMA EL TIPO QUE RESULTE DE LA OPERACION
                            WHEN lv_get_time = '120000' THEN | High Noon|                                             "LO PASE A FORMATO 12H Y LUEGO LO CONVERTI A TIME TIME Y LUEGO SE PASA POR "TIME=ISO DA LA HORA FORMATEADA
                            ELSE |Tiempo sin identificar|
                                                                                                ).
    out->write( lv_time  ).


    """"""""""WHILE-ENDWHILE""""""""""SE EJECUTA HASTA QUE NO SE CUMPLA LA CONDICION (PRIMERO VERIFICA LA CONDICION)
    out->write(  |  | ).
    out->write(  |**WHILE-ENDWHILE**  | ).
    CLEAR lv_num.

    WHILE lv_num LE 10.                                 "SE PUEDE USAR EXIT-CONTINUE-CHECK

      lv_num += 1.
      out->write( |Valor de "lv_num": { lv_num } | ).
      out->write( |Iteration: { sy-index }|  ).

      IF lv_num GT 5.
        EXIT.
      ENDIF.

    ENDWHILE.

    out->write( 'End Of Program'  ).


""""""""""LOOP-ENDLOOP""""""""""

    out->write(  |  | ).
    out->write(  |**LOOP-ENDLOOP**  | ).


    ENDMETHOD.
ENDCLASS.
