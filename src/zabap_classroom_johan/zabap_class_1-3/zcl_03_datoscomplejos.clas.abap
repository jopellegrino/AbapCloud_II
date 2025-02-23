CLASS zcl_03_datoscomplejos DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_03_datoscomplejos IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lv_apellido TYPE string VALUE 'Pellegrino'.

    TYPES:BEGIN OF lty_employee, "DECLARAR (TEMPLATE) (HACE QUE EL COMPILADOR SAPA QUE EXISTE)
            id           TYPE i,
            name         TYPE string,
            age          TYPE i,
            departamento TYPE String,
          END OF lty_employee.

    DATA ls_employe_limpieza TYPE lty_employee. "INSTANCIA DE UN OBJETO (RESERVA MEMORIA PARA USAR EL TIPO LOCAL LTY_EMPLOYEE)

    DATA ls_employe_fabrica TYPE lty_employee.

    ls_employe_limpieza = VALUE #( id = 1234
                                name = 'Dey'
                                age = 30
                                departamento = 'limpieza'   ).

    out->write(  |ID: { ls_employe_limpieza-age } DEPARTAMENTO: { ls_employe_limpieza-departamento } | ).

    out->write( |ID: { ls_employe_limpieza-id } NAME: { ls_employe_limpieza-name } AGE: { ls_employe_limpieza-age }| ).



    TYPES: BEGIN OF ENUM lty_status_payment,  "STRUTURA DE STATUS
             pending_payment,
             paid,
           END OF ENUM lty_status_payment.

    DATA lv_status TYPE lty_status_payment.

    lv_status = paid.

    out->write( |El Stutus del pedido es: { lv_status } | ).




  ENDMETHOD.
ENDCLASS.
