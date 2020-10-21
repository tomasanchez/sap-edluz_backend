METHOD MEDIDORESSET_GET_ENTITY.

    DATA: ls_key_tab LIKE LINE OF it_key_tab,
          lv_medkey   TYPE ztca_elmedidores-idmeter.

    READ TABLE it_key_tab INTO ls_key_tab WITH KEY name = 'Idmeter'.
    IF sy-subrc EQ 0.
      lv_medkey = ls_key_tab-value.
    SELECT SINGLE * FROM ztca_elmedidores
       INTO @DATA(ls_medidor)
       WHERE Idmeter EQ @lv_medkey.
      IF sy-subrc EQ 0.
        MOVE-CORRESPONDING ls_medidor to er_entity.
      ENDIF.
    ENDIF.

ENDMETHOD.
