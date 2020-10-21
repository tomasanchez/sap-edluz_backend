method FACTURASSET_UPDATE_ENTITY.

    DATA: lv_id TYPE ztca_elfactura-idbill.
    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    READ TABLE it_key_tab ASSIGNING <fs_key_tab>
    WITH KEY name = 'Idbill'.

    IF sy-subrc EQ 0.
        lv_id = <fs_key_tab>-value.
    ENDIF.

    io_data_provider->read_entry_data( IMPORTING es_data = er_entity ).

    UPDATE ztca_elfactura
    SET dateb       = er_entity-dateb
        total       = er_entity-total
    WHERE idbill EQ lv_id.

    IF sy-subrc EQ 0.
        COMMIT WORK.
    ENDIF.

endmethod.