  method CLIENTESSET_DELETE_ENTITY.

    DATA: lv_id_customer TYPE ztca_el_clientes-idcustomer.

    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    READ TABLE it_key_tab ASSIGNING <fs_key_tab>
    WITH KEY name = 'IDCUSTOMER'.

    IF sy-subrc EQ 0.
      lv_id_customer = <fs_key_tab>-value.
    ENDIF.

    DELETE FROM ztca_el_clientes WHERE IDCUSTOMER EQ @lv_id_customer.
    IF sy-subrc EQ 0.
      COMMIT WORK.
    ENDIF.

  endmethod.