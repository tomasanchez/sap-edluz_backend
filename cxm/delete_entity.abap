method CXMSET_DELETE_ENTITY.

    DATA:   lv_id_tech  TYPE ztca_eltecnicos-idtech,
            lv_id_meter TYPE ztca_elmedidores-idmeter.

    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    READ TABLE it_key_tab ASSIGNING <fs_key_tab>
    WITH KEY name = 'Idtech'.

    IF sy-subrc EQ 0.
        lv_id_tech = <fs_key_tab>-value.
    ENDIF.

    READ TABLE it_key_tab ASSIGNING <fs_key_tab>
    WITH KEY name = 'Idmeter'.

    IF sy-subrc EQ 0.
        lv_id_meter = <fs_key_tab>-value.
    ENDIF.

    DELETE FROM ztca_elconsxmed 
    WHERE idtech    EQ lv_id_tech
    AND idmeter     EQ lv_id_meter.

    IF sy-subrc EQ 0.
        COMMIT WORK.
    ENDIF.

    
endmethod.
