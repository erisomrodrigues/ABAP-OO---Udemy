*&---------------------------------------------------------------------*
*& Report zconstrutores_17
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zconstrutores_17.

CLASS LCL_DOMINIO DEFINITION.
    PUBLIC SECTION.
        DATA:
            NOME    TYPE dd01l-domname,
            TAB_A   TYPE TABLE OF dd07v,
            TAB_B   TYPE TABLE OF dd07V.

        CLASS-METHODS:
            CLASS_CONSTRUCTOR.

        METHODS:
            CONSTRUCTOR IMPORTING IV_NOME TYPE dd01l-domname,
            RESGATAR_VALORES.
ENDCLASS.

START-OF-SELECTION.
    DATA: LO_DOMINIO_XFELD TYPE REF TO LCL_DOMINIO.

    CREATE OBJECT lo_dominio_xfeld
      EXPORTING
        iv_nome = 'XFIELD'.

        CREATE OBJECT lo_dominio_xfeld
      EXPORTING
        iv_nome = 'XFIELD'.


CLASS LCL_DOMINIO IMPLEMENTATION.
    METHOD resgatar_valores.
        CALL FUNCTION 'DD_DOMA_GET'
          EXPORTING
            domain_name   = NOME
          TABLES
            dd07v_tab_a   = TAB_A
            dd07v_tab_n   = TAB_B
          EXCEPTIONS
            illegal_value = 1
            op_failure    = 2
            others        = 3
          .
        IF SY-SUBRC <> 0.
*         MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*           WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
        ENDIF.
   ENDMETHOD.

   METHOD CONSTRUCTOR.
   NOME = IV_NOME.
   WRITE:/ 'O DOMINIO', NOME,'FOI CRIADO'.
   ENDMETHOD.

   METHOD CLASS_CONSTRUCTOR.
   WRITE:/ 'CLASSE INICIADA'.
   ENDMETHOD.



ENDCLASS.
