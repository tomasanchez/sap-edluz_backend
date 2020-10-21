"Get Set - Medidores"

METHOD MEDIDORESSET_GET_ENTITYSET.

    DATA ls_entity LIKE LINE OF et_entityset.

    SELECT * FROM ZTCA_ELMEDIDORES
      INTO TABLE @DATA(lt_medidores).
    IF sy-subrc EQ 0.
      LOOP AT lt_medidoress INTO DATA(ls_medidor).
        MOVE-CORRESPONDING ls_medidor TO ls_entity.
        APPEND ls_entity TO et_entityset.
      ENDLOOP.
    ENDIF.
    
ENDMETHOD.
