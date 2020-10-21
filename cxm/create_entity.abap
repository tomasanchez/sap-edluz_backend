method CXMSET_CREATE_ENTITY.
    
    DATA ls_entity TYPE ztca_elconsxmed.

    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    io_data_provider->read_entry_data( IMPORTING es_data = er_entity ).

    ls_entity-idmeter           = er_entity-idmeter.
    ls_entity-idtech            = er_entity-idtech.
    ls_entity-consumption       = er_entity-consumption.
    ls_entity-idbill            = er_entity-idbill.
    ls_entity-monthc            = er_entity-monthc.

    INSERT ztca_elconsxmed
        FROM ls_entity.

    IF sy-subrc EQ 0.
        COMMIT WORK.
    ENDIF.


endmethod.