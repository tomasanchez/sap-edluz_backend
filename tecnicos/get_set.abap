"Get entity Set"

METHOD TECINOSSET_GET_ENTITYSET.

    DATA ls_entity LIKE LINE OF et_entityset.

    SELECT * FROM ztca_eltecnicos
      INTO TABLE @DATA(lt_tecs).
    IF sy-subrc EQ 0.
      LOOP AT lt_tecs INTO DATA(ls_tec).
        MOVE-CORRESPONDING ls_tec TO ls_entity.
        APPEND ls_entity TO et_entityset.
      ENDLOOP.
    ENDIF.
    
ENDMETHOD.
