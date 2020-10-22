method CXMSET_UPDATE_ENTITY.

    DATA:   lv_idtech   TYPE ztca_eltecnicos-idtech,
            lv_idmeter  TYPE ztca_elmedidores-idmeter.

    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    READ TABLE it_key_tab ASSIGNING <fs_key_tab>
    WITH KEY name = 'Idtech'.

    IF sy-subrc EQ 0.
    lv_idtech = <fs_key_tab>-value.
    ENDIF.

    READ TABLE it_key_tab ASSIGNING <fs_key_tab>
    WITH KEY name = 'Idmeter'.

    IF sy-subrc EQ 0.
    lv_idmeter = <fs_key_tab>-value.
    ENDIF.
    
    UPDATE ztca_elconsxmed
    SET consumption     = er_entity-consumption
        idbill          = er_entity-idbill
        monthc          = er_entity-monthc
    WHERE idtech   EQ lv_idtech
    AND   idmeter    EQ lv_idmeter.

    IF sy-subrc EQ 0.
        COMMIT WORK.
    ENDIF.
    
endmethod.
