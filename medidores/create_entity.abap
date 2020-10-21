method MEDIDORESSET_CREATE_ENTITY.
    
    DATA ls_entity TYPE ztca_elmedidores.

    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    io_data_provider->read_entry_data( IMPORTING es_data = er_entity ).

    ls_entity-idmeter    = er_entity-idmeter.
    ls_entity-datem      = er_entity-datem.
    ls_entity-idcustomer = er_entity-idcustomer.


    INSERT ztca_elmedidores 
        FROM ls_entity.
   
    IF sy-subrc EQ 0.
           COMMIT WORK.
    ENDIF.

endmethod.
