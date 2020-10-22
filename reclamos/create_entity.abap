    
method RECLAMOSSET_CREATE_ENTITY.
       
    DATA ls_entity TYPE ztca_elreclamo.

    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    io_data_provider->read_entry_data( IMPORTING es_data = er_entity ).

    ls_entity-idcomplaint       = er_entity-idcomplaint.
    ls_entity-idcustomer        = er_entity-idcustomer.
    ls_entity-dateopen          = er_entity-dateopen.
    ls_entity-status            = er_entity-status.
    ls_entity-type              = er_entity-type.
    ls_entity-urgency           = er_entity-urgency.

    INSERT ztca_elreclamo
        FROM ls_entity.

    IF sy-subrc EQ 0.
        COMMIT WORK.
    ENDIF.

endmethod.