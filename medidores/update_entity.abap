method CLIENTESSET_UPDATE_ENTITY.

    DATA: lv_id TYPE ztca_elmedidores-idmeter.
    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    READ TABLE it_key_tab ASSIGNING <fs_key_tab>
    WITH KEY name = 'Idmeter'.

    IF sy-subrc EQ 0.
        lv_id = <fs_key_tab>-value.
    ENDIF.

    io_data_provider->read_entry_data( IMPORTING es_data = er_entity ).

    UPDATE ztca_elmedidores
    SET datem       = er_entity-datem
        idcustomer  = er_entity-idcustomer
    WHERE idmeter EQ lv_id.

    IF sy-subrc EQ 0.
        COMMIT WORK.
    ENDIF.

endmethod.
