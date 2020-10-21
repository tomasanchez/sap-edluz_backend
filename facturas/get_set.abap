METHOD FACTURASSET_GET_ENTITYSET.

    DATA ls_entity LIKE LINE OF et_entityset.

    SELECT * FROM ZTCA_ELFACTURA
      INTO TABLE @DATA(lt_facturas).
    IF sy-subrc EQ 0.
      LOOP AT lt_facturas INTO DATA(ls_factura).
        MOVE-CORRESPONDING ls_factura TO ls_entity.
        APPEND ls_entity TO et_entityset.
      ENDLOOP.
    ENDIF.
    
ENDMETHOD.