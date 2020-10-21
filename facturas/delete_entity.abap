METHOD FACTURASSET_DELETE_ENTITY.

    DATA: lv_idbill TYPE ztca_elFACTURA-idbill.
    FIELD-SYMBOLS: <fs_key_tab> TYPE /iwbep/s_mgw_name_value_pair.

    READ TABLE it_key_tab ASSIGNING <fs_key_tab>
        WITH KEY name = 'Idbill'.

        IF sy-subrc EQ 0.
            lv_idbill = <fs_key_tab>-value.
        ENDIF.
    
    DELETE FROM ztca_elFACTURA WHERE idbill EQ @lv_idbill.
    
    IF sy-subrc EQ 0.
           COMMIT WORK.
    ENDIF.

endmethod. 