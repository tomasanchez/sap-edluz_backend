"Delete Meter"

METHOD MEDIDORESET_DELETE_ENTITY.

    DATA: lv_idmeter TYPE ztca_elmedidores.
    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    READ TABLE it_key_tab ASSIGNING <fs_key_tab>
        WITH KEY name = 'Idmeter'.

        IF sy-subrc EQ 0.
            lv_idmeter = <fs_key_tab>-value.
        ENDIF.
    
    DELETE FROM ztca_elmedidores WHERE idmeter EQ @lv_idmeter.
    
    IF sy-subrc EQ 0.
           COMMIT WORK.
    ENDIF.

endmethod. 
