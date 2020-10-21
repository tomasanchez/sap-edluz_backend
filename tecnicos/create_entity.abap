"Create Tecnicos"

method TECNICOSSET_CREATE_ENTITY.
    
    DATA ls_entity TYPE ztca_eltecnicos.

    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    io_data_provider->read_entry_data( IMPORTING es_data = er_entity ).

    ls_entity-idtech    = er_entity-idtech.
    ls_entity-name      = er_entity-name.
    ls_entity-lastname  = er_entity-lastname.
    ls_entity-zip       = er_entity-zip.
    ls_entity-tel       = er_entity-tel.
    ls_entity-province  = er_entity-province.
    ls_entity-city      = er_entity-city.
    ls_entity-street    = er_entity-street.

    INSERT ztca_eltecnicos 
        FROM ls_entity.
   
    IF sy-subrc EQ 0.
           COMMIT WORK.
    ENDIF.

endmethod.
