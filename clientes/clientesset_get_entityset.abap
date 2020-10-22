  method CLIENTESSET_GET_ENTITYSET.
    DATA: ls_entity LIKE LINE OF et_entityset.

    SELECT * FROM ztca_el_clientes
    INTO TABLE @DATA(lt_customer).

    IF sy-subrc EQ 0.
       LOOP AT lt_customer INTO DATA(ls_customer).
         MOVE-CORRESPONDING ls_customer TO ls_entity.
         APPEND ls_entity TO et_entityset.
       ENDLOOP.
    ENDIF.

  endmethod.