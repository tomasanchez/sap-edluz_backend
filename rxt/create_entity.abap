method RXTSET_CREATE_ENTITY.
    
    DATA ls_entity TYPE ztca_elrecxtech.

    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    io_data_provider->read_entry_data( IMPORTING es_data = er_entity ).

    ls_entity-idmeter           = er_entity-idmeter.
    ls_entity-idcomplaint       = er_entity-idcomplaint.
    ls_entity-dateclosed        = er_entity-dateclosed.
    ls_entity-diagnostico       = er_entity-diagnostico.

    INSERT ztca_elrecxtech
        FROM ls_entity.

    IF sy-subrc EQ 0.
        COMMIT WORK.
    ENDIF.


endmethod.