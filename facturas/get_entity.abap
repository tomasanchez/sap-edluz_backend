METHOD FACTURASSET_GET_ENTITY.

    DATA: ls_key_tab LIKE LINE OF it_key_tab,
          lv_key   TYPE ztca_elfactura-idbill.

    READ TABLE it_key_tab INTO ls_key_tab WITH KEY name = 'Idbill'.
    IF sy-subrc EQ 0.
      lv_key = ls_key_tab-value.
    SELECT SINGLE * FROM ztca_elfactura
       INTO @DATA(ls_factura)
       WHERE idbill EQ @lv_key.
      IF sy-subrc EQ 0.
        MOVE-CORRESPONDING ls_factura to er_entity.
      ENDIF.
    ENDIF.

ENDMETHOD.