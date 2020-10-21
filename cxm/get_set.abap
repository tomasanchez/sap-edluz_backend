METHOD CXMSET_GET_ENTITYSET.

    DATA: ls_key_tab LIKE LINE OF it_key_tab,
    ls_entity  LIKE LINE OF et_entityset.

    READ TABLE it_key_tab INTO ls_key_tab WITH KEY name = 'Idmeter'.
    
    IF sy-subrc EQ 0.
        SELECT * FROM ztca_elconsxmed
        INTO TABLE @DATA(lt_cxms)
        WHERE idmeter = @ls_key_tab-value.
        LOOP AT lt_cxms INTO DATA(ls_cxm).
        MOVE-CORRESPONDING ls_cxm TO ls_entity.
        APPEND ls_entity TO et_entityset.
    ENDLOOP.

    ELSE.
    
        READ TABLE it_key_tab INTO ls_key_tab WITH KEY name = 'Idtech'.

        IF sy-subrc EQ 0.
            SELECT * FROM ztca_elconsxmed
            INTO TABLE @DATA(lt_cxms2)
            WHERE idtech = @ls_key_tab-value.
            LOOP AT lt_cxms2 INTO DATA(ls_cxm2).
            MOVE-CORRESPONDING ls_cxm2 TO ls_entity.
            APPEND ls_entity TO et_entityset.
        ENDLOOP.

        ELSE.

            SELECT * FROM ztca_elconsxmed
                INTO TABLE @DATA(lt_cxms3).
            LOOP AT lt_cxms3 INTO DATA(ls_cxm3).
            MOVE-CORRESPONDING ls_cxm3 TO ls_entity.
            APPEND ls_entity TO et_entityset.
            ENDLOOP.
        ENDIF.
    ENDIF.
    
ENDMETHOD.