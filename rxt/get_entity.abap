METHOD RXTSET_GET_ENTITY.

    DATA: ls_key_tab    LIKE LINE OF it_key_tab,
          lv_idtech     TYPE ztca_eltecnicos-idtech,
          lv_idcomp      TYPE ztca_elreclamo-idcomplaint.

    READ TABLE it_key_tab INTO ls_key_tab WITH KEY name = 'Idcomplaint'.
    
    IF sy-subrc EQ 0.
      lv_idtech = ls_key_tab-value.

      READ TABLE it_key_tab INTO ls_key_tab WITH KEY name = 'Idtech'.
      IF sy-subrc EQ 0.
        lv_idcomp = ls_key_tab-value.

        SELECT SINGLE * FROM ztca_elrecxtech
         INTO @DATA(ls_comp)
         WHERE idtech   EQ @lv_idtech
           AND idcomplaint  EQ @lv_idcomp.
        IF sy-subrc EQ 0.
          MOVE-CORRESPONDING ls_comp TO er_entity.
        ENDIF.
      ENDIF.
    ENDIF.
ENDMETHOD.
