<!doctype dsssl-spec [
<!element dsssl-spec o o
  (char-repertoire?, style-specification,
        (style-specification|external-specification)*)>
<!element style-specification o o (style-specification-body)>
<!element style-specification-body o o (#pcdata)>
<?ArcBase dsssl>
<!notation dsssl PUBLIC
  "ISO/IEC 10179:1996//NOTATION DSSSL Architecture Definition Document//EN">
<!entity % dssslDtd system "dsssl.dtd">
<!attlist #notation dsssl
  ArcDocF NAME #FIXED dsssl-specification
  ArcDTD CDATA "%dssslDtd"
  ArcQuant CDATA "NAMELEN 64"
>
]>

(define *sans-serif-font* "Helvetica")
(define *rgb-color-space*
  (color-space "ISO/IEC 10179:1996//Color-Space Family::Device RGB"))

(define *midnight-blue-color*
  (color *rgb-color-space* (/ 25 255) (/ 25 255) (/ 112 255)))

(define *sea-green-color*
  (color *rgb-color-space* (/ 46 255) (/ 139 255) (/ 87 255)))

(declare-initial-value quadding 'justify)
(declare-initial-value line-spacing 12pt)

(root (make simple-page-sequence
            right-header: (literal "ISO/IEC 10179:1996(E)")
            center-footer: (page-number-sosofo)
            header-margin: .5in
            footer-margin: .5in
            left-margin: 1in
            right-margin: 1in
            top-margin: 1in
            line-thickness: (* (actual-font-size) .05)
            bottom-margin: 1in
            page-width: 211mm
            page-height: 297mm))

(element TITLEP (empty-sosofo))
(element FIXME (empty-sosofo))
(element STDSRC (empty-sosofo))

(element P
         (make paragraph
               space-before: 4pt
               space-after: 4pt
               first-line-start-indent: (if (first-sibling?) 0pt 10pt)))

(element REFREF
         (make paragraph
               space-before: 4pt
               space-after: 4pt
               first-line-start-indent: 0pt))

(element CIT
         (make sequence
               font-posture: 'italic))

(element SCOPE (h1 "Scope"))
(element CONF (h1 "Conformance"))
(element REFS (h1 "Normative references"))
(element DEFS (h1 "Definitions"))

(element INTRO
         (sosofo-append
               (h1t (literal "Introduction"))
               (process-children)))

(define (h1 str)
  (sosofo-append
        (h1t (sosofo-append
                   (number-clause-sosofo (current-node))
                   (literal " " str)))
        (process-children)))

(element H1T (h1t (sosofo-append
                        (number-clause-sosofo (parent (current-node)))
                        (literal " ")
                        (process-children))))


(define (h1t sosofo)
  (make paragraph
        keep-with-next?: #t
        font-weight: 'bold
        space-before: 20pt
        space-after: 8pt
        line-spacing: 20pt
        font-size: 16pt
        sosofo))

(define (number-title)
  (number-clause-sosofo (parent (current-node))))

(element (INTRO H2 H2T)
         (h2t (process-children)))


(element H2T (h2t (sosofo-append
                        (number-title)
                        (literal " ")
                        (process-children))))
         
(define (h2t content)
  (make paragraph
        keep-with-next?: #t
        font-weight: 'bold
        space-before: 15pt
        space-after: 7pt
        line-spacing: 18pt
        font-size: 14pt
        content))

(element H3T
         (make paragraph
               keep-with-next?: #t
               font-weight: 'bold
               space-before: 12pt
               space-after: 6pt
               line-spacing: 14pt
               font-size: 12pt
               (number-title)
               (literal " ")
               (process-children)))

(element H4T
         (make paragraph
               keep-with-next?: #t
               space-before: 10pt
               space-after: 5pt
               font-weight: 'bold
               (number-title)
               (literal " ")
               (process-children)))

(define *indent-step* 20pt)

(element UL
         (make sequence
               start-indent: (+ (inherited-start-indent)
                                *indent-step*)))
(element OL
         (make sequence
               start-indent: (+ (inherited-start-indent)
                                *indent-step*)))

(define (list-item-para str)
  (make paragraph
        space-before: 4pt
        space-after: 4pt
        first-line-start-indent: (- *indent-step*)
        (make line-field
              field-align: 'end
              field-width: *indent-step*
              (literal str))
        (process-children)))
  
(element (OL LI P)
         (if (first-sibling?)
             (list-item-para
              (string-append
               (format-number (child-number
                               (parent (current-node)))
                              "1")
               ".  "))
             (next-match)))

(element (UL LI P)
         (if (first-sibling?)
             (list-item-para "\bullet;  ")
             (next-match)))

(element HDREF
         (with-mode ref
                    (process-element-with-id (attribute-string "refid"))))

(mode ref
      (default
           (handle-ref
            (with-mode title-ref
                       (process-first-descendant (string-append (gi) "T")))))
      (element SCOPE
               (handle-ref (literal "Scope")))
      (element CONF 
               (handle-ref (literal "Conformaance")))
      (element REFS (handle-ref (literal "Normative references")))
      (element DEFS (handle-ref (literal "Definitions"))))

(define (handle-ref title-sosofo)
  (sosofo-append
   (literal "section ")
   (number-clause-sosofo (current-node))
   (literal ", ")
   (make link
         destination: (current-node-address)
         color: *midnight-blue-color*
         font-posture: 'italic
         (make score
               type: 'after
               title-sosofo))
   (literal ", page ")
   (current-node-page-number-sosofo)))

(mode title-ref
      (element h1t (process-children))
      (element h2t (process-children))
      (element h3t (process-children))
      (element h4t (process-children))
      (element h5t (process-children))
      (element h6t (process-children)))

(element CPTR
         (make paragraph
               font-family-name: "Courier"
               lines: 'asis
               quadding: 'start))

(element CODE
         (make sequence
               font-family-name: "Courier"))

(element V
         (make sequence
               font-family-name: "Courier"
               font-posture: 'oblique))

(element NOTE
         (make display-group
               font-size: 8pt
               line-spacing: 10pt
               start-indent: 20pt
               end-indent: 20pt
               space-before: 6pt
               space-after: 6pt
               (make paragraph
                     first-line-start-indent: 0pt
                     keep-with-next?: #t
                     (literal "NOTE "
                              (format-number (element-number) "1")))
               (process-children)))

(define (proto-start)
  (make rule
        orientation: 'horizontal
        keep-with-next?: #t
        space-after: 4pt
        space-before: 10pt))

(element PROTOG (sosofo-append (proto-start) (process-children)))

(element PROTO
         (sosofo-append (proto-start)
                        (make paragraph
                              first-line-start-indent: 0pt
                              font-family-name: "Courier"
                              quadding: 'start)))

(element (PROTOG PROTO)
         (make paragraph
               first-line-start-indent: 0pt
               font-family-name: "Courier"
               quadding: 'start))

(element HP1
         (make sequence
               font-posture: 'italic))

(element SV
         (make sequence
               font-family-name: *sans-serif-font*
               font-posture: 'oblique))

(element SYN
         (make paragraph
               color: *sea-green-color*
               first-line-start-indent: 0pt
               quadding: 'start))

(element SYNT
         (make sequence
               font-family-name: *sans-serif-font*
               (make paragraph-break)
               (make sequence
                     font-posture: 'upright
                     (literal "["
                              (format-number (element-number) "1")
                              "] "))
               (process-children)
               (literal " = ")))

(element SK
         (make sequence
               font-family-name: "Courier"))

(define (reverse x)
  (let loop ((x x)
             (y '()))
    (if (null? x)
        y
        (loop (cdr x) (cons (car x) y)))))

(define (number-clause-sosofo node)
  (literal
   (format-number-list (reverse (number-clause node))
                       "1"
                       ".")))

(define (number-clause node)
  (case (gi node)
    (("H4" "H3" "H2")
     (cons (child-number node)
           (number-clause (parent node))))
    (("H1")
     (list (+ 4 (child-number node))))
    (("SCOPE")
     (list 1))
    (("CONF")
     (list 2))
    (("REFS")
     (list 3))
    (("DEFS")
     (list 4))))

(element (defs dl dt)
         (make paragraph
               font-weight: 'bold
               keep-with-next?: #t
               space-before: 6pt
               (literal "4."
                        (format-number (child-number) "1")
                        "  ")
               (process-children)))

(element (annexi h0t)
         (make sequence
               quadding: 'center
               (h1t (sosofo-append (literal "Annex "
                                            (format-number (child-number) "A")
                                            ": ")
                                   (process-children)))))

(element figref
         (with-mode ref
                    (process-element-with-id (attribute-string "refid"))))

(mode ref
      (element fig
               (sosofo-append
                (literal (format-number (element-number) "1")
                         ", ")
                (make link
                      destination: (current-node-address)
                      color: *midnight-blue-color*
                      font-posture: 'italic
                      (make score
                            type: 'after
                            (process-first-descendant "figcap")))))
      (element figcap
               (with-mode #f
                          (process-children))))

(element fig
         (make display-group
               space-before: 10pt
               space-after: 10pt
               start-indent: 0pt
               end-indent: 0pt
               display-alignment: 'center
               label: 'clause
               keep: #t))

(element figcap
         (make paragraph
               font-weight: 'bold
               quadding: 'center
               (literal "Figure "
                        (format-number (element-number
                                        (ancestor "fig"))
                                       "1")
                        " \em-dash; ")
               (process-children)))

(define (collect-figures)
  (make sequence
        content-map: '((clause #f))
        (make sequence
              label: 'clause
              (process-children))))

(element h1 (collect-figures))
(element h2 (collect-figures))
(element h3 (collect-figures))

(define *include-pictures* #t)

(element artwork
         (if *include-pictures*
             (make external-graphic
                   display?: #t
                   entity-system-id: (entity-generated-system-id
                                      (attribute-string "NAME")))
             (make paragraph
                   (literal "(Picture omitted)"))))