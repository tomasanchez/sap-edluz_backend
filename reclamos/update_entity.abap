method RECLAMOSSET_UPDATE_ENTITY.

    DATA:   lv_idcustomer       TYPE ztca_el_clientes-idcustomer,
            lv_idcomplaint      TYPE ztca_elreclamo-idcomplaint.

    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    READ TABLE it_key_tab ASSIGNING <fs_key_tab>
    WITH KEY name = 'idcustomer'.

    IF sy-subrc EQ 0.
    lv_idcustomer = <fs_key_tab>-value.
    ENDIF.

    READ TABLE it_key_tab ASSIGNING <fs_key_tab>
    WITH KEY name = 'Idcomplaint'.

    IF sy-subrc EQ 0.
    lv_idcomplaint = <fs_key_tab>-value.
    ENDIF.
    
    UPDATE ztca_elconsxmed
    SET status            = er_entity-status
        urgency           = er_entity-urgency
    WHERE idcustomer   EQ lv_idcustomer
    AND   idcomplaint    EQ lv_idcomplaint.

    IF sy-subrc EQ 0.
        COMMIT WORK.
    ENDIF.
    
endmethod.