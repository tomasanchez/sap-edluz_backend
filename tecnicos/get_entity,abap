"Get Entity Technician"

METHOD TECNICOSSET_GET_ENTITY.

    DATA: ls_key_tab LIKE LINE OF it_key_tab,
          lv_teckey   TYPE ztca_eltecnicos.

    READ TABLE it_key_tab INTO ls_key_tab WITH KEY name = 'Idtech'.
    IF sy-subrc EQ 0.
      lv_teckey = ls_key_tab-value.
    SELECT SINGLE * FROM ztca_gym_clts
       INTO @DATA(ls_tec)
       WHERE Idtech EQ @lv_teckey.
      IF sy-subrc EQ 0.
        MOVE-CORRESPONDING ls_tec to er_entity.
      ENDIF.
    ENDIF.

ENDMETHOD.
