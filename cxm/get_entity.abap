METHOD CXMSET_GET_ENTITY.

    DATA: ls_key_tab    LIKE LINE OF it_key_tab,
          lv_idtech     TYPE ztca_eltecnicos-idtech,
          lv_idmed      TYPE ztca_elmedidores-idmeter.

    READ TABLE it_key_tab INTO ls_key_tab WITH KEY name = 'Idmeter'.
    
    IF sy-subrc EQ 0.
      lv_idtech= ls_key_tab-value.

      READ TABLE it_key_tab INTO ls_key_tab WITH KEY name = 'Idtech'.
      IF sy-subrc EQ 0.
        lv_idmed = ls_key_tab-value.

        SELECT SINGLE * FROM ztca_elconsxmed
         INTO @DATA(ls_idmed)
         WHERE idtech   EQ @lv_tech
           AND idmeter  EQ @lv_idmed.
        IF sy-subrc EQ 0.
          MOVE-CORRESPONDING ls_idmed TO er_entity.
        ENDIF.
      ENDIF.
    ENDIF.
ENDMETHOD.