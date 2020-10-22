  method CLIENTESSET_CREATE_ENTITY.

    DATA: ls_entity TYPE ztca_el_clientes.

    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.
    io_data_provider->read_entry_data( IMPORTING es_data = er_entity ).

    ls_entity-idcustomer = er_entity-idcustomer.
    ls_entity-name = er_entity-name.
    ls_entity-lastname = er_entity-lastname.
    ls_entity-province = er_entity-province.
    ls_entity-city = er_entity-city.
    ls_entity-street = er_entity-street.
    ls_entity-zip = er_entity-zip.
    ls_entity-tel = er_entity-tel.

    INSERT ztca_el_clientes
    FROM ls_entity.

    IF sy-subrc EQ 0.
      COMMIT WORK.
    ENDIF.


  endmethod.