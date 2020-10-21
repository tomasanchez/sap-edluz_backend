method CXMSET_UPDATE_ENTITY.

    DATA:   lv_idtech   TYPE ztca_eltecnicos-idtech,
            lv_idcomplaint  TYPE ztca_elreclamo-idcomplaint.

    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    READ TABLE it_key_tab ASSIGNING <fs_key_tab>
    WITH KEY name = 'Idtech'.

    IF sy-subrc EQ 0.
    lv_idtech = <fs_key_tab>-value.
    ENDIF.

    READ TABLE it_key_tab ASSIGNING <fs_key_tab>
    WITH KEY name = 'Idcomplaint'.

    IF sy-subrc EQ 0.
    lv_idcomplaint = <fs_key_tab>-value.
    ENDIF.
    
    UPDATE ztca_elrecxtech
    SET dateclosed     = er_entity-dateclosed
        diagnostico    = er_entity-diagnostico
    WHERE idtech   EQ lv_idtech
    AND   idcomplaint    EQ lv_idcomplaint.

    IF sy-subrc EQ 0.
        COMMIT WORK.
    ENDIF.
    
endmethod.