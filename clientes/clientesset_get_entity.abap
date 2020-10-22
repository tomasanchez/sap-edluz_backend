  method CLIENTESSET_GET_ENTITY.
    DATA: ls_key_tab LIKE LINE OF it_key_tab,
          lv_customer TYPE ztca_el_clientes-idcustomer.

    READ TABLE it_key_tab INTO ls_key_tab WITH KEY name = 'IDCUSTOMER'.
    IF sy-subrc eq 0.
       lv_customer = ls_key_tab-value.

       SELECT SINGLE * FROM ztca_el_clientes
       INTO @DATA(ls_customer)
       WHERE idcustomer EQ @lv_customer.
          IF sy-subrc EQ 0.
            MOVE-CORRESPONDING ls_customer TO er_entity.
          ENDIF.
    ENDIF.

  endmethod.