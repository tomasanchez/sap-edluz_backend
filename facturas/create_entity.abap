method FACTURASSET_CREATE_ENTITY.
    
    DATA ls_entity TYPE ztca_elFACTURA.

    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    io_data_provider->read_entry_data( IMPORTING es_data = er_entity ).

    ls_entity-idbill    = er_entity-idbill.
    ls_entity-dateb     = er_entity-dateb.
    ls_entity-total     = er_entity-total.


    INSERT ztca_elFACTURA 
        FROM ls_entity.
   
    IF sy-subrc EQ 0.
           COMMIT WORK.
    ENDIF.

endmethod.