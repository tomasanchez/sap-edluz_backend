"Delete Tech"

METHOD TECNICOSSET_DELETE_ENTITY.

    DATA: lv_id_tech TYPE ztca_eltecnicos.
    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    READ TABLE it_key_tab ASSIGNING <fs_key_tab>
        WITH KEY name = 'Idtech'.

        IF sy-subrc EQ 0.
            lv_id_tech = <fs_key_tab>-value.
        ENDIF.
    
    DELETE FROMztca_eltecnicos WHERE id_clte EQ @lv_id_tech.
    
    IF sy-subrc EQ 0.
           COMMIT WORK.
    ENDIF.

endmethod. 
