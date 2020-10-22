method TECNICOSSET_UPDATE_ENTITY.

    DATA: lv_id_tec TYPE ztca_eltecnicos-idtech.
    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    READ TABLE it_key_tab ASSIGNING <fs_key_tab>
    WITH KEY name = 'Idtech'.

    IF sy-subrc EQ 0.
        lv_id_tec = <fs_key_tab>-value.
    ENDIF.

    io_data_provider->read_entry_data( IMPORTING es_data = er_entity ).

    UPDATE ztca_eltecnicos
    SET name      = er_entity-name
      lastname  = er_entity-lastname
      zip       = er_entity-zip
      tel       = er_entity-tel
      province  = er_entity-province
      city      = er_entity-city
      street    = er_entity-street
    WHERE idtech EQ lv_id_tec.

    IF sy-subrc EQ 0.
        COMMIT WORK.
    ENDIF.

endmethod.
