METHOD RXTSET_GET_ENTITYSET.

    DATA: ls_key_tab LIKE LINE OF it_key_tab,
    ls_entity  LIKE LINE OF et_entityset.

    READ TABLE it_key_tab INTO ls_key_tab WITH KEY name = 'Idcomplaint'.
    
    IF sy-subrc EQ 0.
        SELECT * FROM ztca_elrecxtech
        INTO TABLE @DATA(lt_rxts)
        WHERE idcomplaint = @ls_key_tab-value.
        LOOP AT lt_rxts INTO DATA(ls_rxt).
        MOVE-CORRESPONDING ls_rxt TO ls_entity.
        APPEND ls_entity TO et_entityset.
    ENDLOOP.

    ELSE.
    
        READ TABLE it_key_tab INTO ls_key_tab WITH KEY name = 'Idtech'.

        IF sy-subrc EQ 0.
            SELECT * FROM ztca_elrecxtech
            INTO TABLE @DATA(lt_rxts2)
            WHERE idtech = @ls_key_tab-value.
            LOOP AT lt_rxts2 INTO DATA(ls_rxt2).
            MOVE-CORRESPONDING ls_rxt2 TO ls_entity.
            APPEND ls_entity TO et_entityset.
        ENDLOOP.

        ELSE.

            SELECT * FROM ztca_elrecxtech
                INTO TABLE @DATA(lt_rxts3).
            LOOP AT lt_rxts3 INTO DATA(ls_rxt3).
            MOVE-CORRESPONDING ls_rxt3 TO ls_entity.
            APPEND ls_entity TO et_entityset.
            ENDLOOP.
        ENDIF.
    ENDIF.
    
ENDMETHOD.