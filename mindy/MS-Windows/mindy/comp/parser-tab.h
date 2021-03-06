typedef union {
    struct _nothing *nothing;
    struct token *token;
    struct body *body;
    struct constituent *constituent;
    struct expr *expr;
    struct bindings *bindings;
    struct param_list *param_list;
    struct param *param;
    struct keyword_param *keyword_param;
    struct id *id;
    struct local_methods *local_methods;
    struct method *method;
    struct binop_series *binop_series;
    struct binop *binop;
    struct literal *literal;
    struct arglist *arglist;
    struct argument *argument;
    struct plist *plist;
    struct return_type_list *return_type_list;
    struct literal_list *literal_list;
    struct block_epilog *block_epilog;
    struct condition_body *condition_body;
    struct incomplete_condition_body *incomplete_condition_body;
    struct condition_clause *condition_clause;
    struct for_header *for_header;
    struct exception_clauses *exception_clauses;
    struct exception_clause *exception_clause;
    struct for_clause *for_clause;
    struct to_part *to_part;
    struct superclass_list *superclass_list;
    struct class_guts *class_guts;
    struct slot_spec *slot_spec;
    struct initarg_spec *initarg_spec;
    boolean bool;
    struct inherited_spec *inherited_spec;
    enum slot_allocation slot_allocation;
    struct gf_suffix *gf_suffix;
    flags_t flags;
    struct else_part *else_part;

    struct defnamespace_constituent *defnamespace_constituent;
    struct variable_names *variable_names;
    struct use_clause *use_clause;
    struct use_options *use_options;
    struct use_option *use_option;
    struct import_option *import_option;
    struct renamings *renamings;
} YYSTYPE;
#define	HEADER_KEY	257
#define	HEADER_VAL	258
#define	HEADER_END	259
#define	BOGUS	260
#define	SYMBOL	261
#define	KEYWORD	262
#define	SYMBOL_LITERAL	263
#define	SHARP_T	264
#define	SHARP_F	265
#define	STRING	266
#define	CHARACTER	267
#define	INTEGER	268
#define	FLOAT	269
#define	BINARY_OPERATOR	270
#define	LPAREN	271
#define	RPAREN	272
#define	COMMA	273
#define	DOT	274
#define	SEMI	275
#define	LBRACKET	276
#define	RBRACKET	277
#define	LBRACE	278
#define	RBRACE	279
#define	COLON_COLON	280
#define	MINUS	281
#define	TILDE	282
#define	EQUAL	283
#define	EQUAL_EQUAL	284
#define	ARROW	285
#define	SHARP_PAREN	286
#define	SHARP_BRACKET	287
#define	NEXT	288
#define	REST	289
#define	KEY	290
#define	ALL_KEYS	291
#define	ABOVE	292
#define	ABSTRACT	293
#define	DBEGIN	294
#define	BELOW	295
#define	BLOCK	296
#define	BY	297
#define	CASE	298
#define	CLASS	299
#define	CLEANUP	300
#define	CONCRETE	301
#define	CONSTANT	302
#define	DEFINE	303
#define	DOMAIN	304
#define	EACH_SUBCLASS	305
#define	ELSE	306
#define	ELSEIF	307
#define	END	308
#define	EXCEPTION	309
#define	FINALLY	310
#define	FOR	311
#define	FREE	312
#define	FROM	313
#define	FUNCTION	314
#define	GENERIC	315
#define	HANDLER	316
#define	IF	317
#define	IN	318
#define	INHERITED	319
#define	INLINE	320
#define	INSTANCE	321
#define	KEYED_BY	322
#define	KEYWORD_RESERVED_WORD	323
#define	LET	324
#define	LOCAL	325
#define	METHOD	326
#define	OPEN	327
#define	OTHERWISE	328
#define	PRIMARY	329
#define	REQUIRED	330
#define	SEALED	331
#define	SELECT	332
#define	SLOT	333
#define	THEN	334
#define	TO	335
#define	UNLESS	336
#define	UNTIL	337
#define	USING	338
#define	VARIABLE	339
#define	VIRTUAL	340
#define	WHILE	341
#define	MODULE	342
#define	LIBRARY	343
#define	EXPORT	344
#define	CREATE	345
#define	USE	346
#define	ALL	347
#define	PREFIX_KEYWORD	348
#define	IMPORT_KEYWORD	349
#define	EXCLUDE_KEYWORD	350
#define	EXPORT_KEYWORD	351
#define	RENAME_KEYWORD	352
#define	UNTIL_KEYWORD	353
#define	WHILE_KEYWORD	354
#define	FEATURE_IF	355
#define	FEATURE_ELSE_IF	356
#define	FEATURE_ELSE	357
#define	FEATURE_ENDIF	358


extern YYSTYPE yylval;
