#|**************************************************************************************
  ██████╗  ██╗   ██╗ ███████╗ ███████╗ ████████╗ ██╗  ██████╗  ███╗   ██╗      ██╗
 ██╔═══██╗ ██║   ██║ ██╔════╝ ██╔════╝ ╚══██╔══╝ ██║ ██╔═══██╗ ████╗  ██║     ███║
 ██║   ██║ ██║   ██║ █████╗   ███████╗    ██║    ██║ ██║   ██║ ██╔██╗ ██║     ╚██║
 ██║▄▄ ██║ ██║   ██║ ██╔══╝   ╚════██║    ██║    ██║ ██║   ██║ ██║╚██╗██║      ██║
 ╚██████╔╝ ╚██████╔╝ ███████╗ ███████║    ██║    ██║ ╚██████╔╝ ██║ ╚████║      ██║
  ╚══▀▀═╝   ╚═════╝  ╚══════╝ ╚══════╝    ╚═╝    ╚═╝  ╚═════╝  ╚═╝  ╚═══╝      ╚═╝

The LE grammer

  <LE> ::= 1 <num>
           2| '<sym>
           3| ( append <LIST> (...) )
           4| <LIST>

 
 <LIST> ::= 5 ( list <LE> (...) )
            6| ( cons <LE> <LIST> )
            7| null
          

(cons 203 (cons (append (cons 'Eyal null) (list 'Levi 'Yoni)) null))

<AE>
=>(4) <LIST>
=>(6) ( cons <LE> <LIST> )
=>(1) ( cons 203 <LIST> )
=>(6) ( cons 203 ( cons <LE> <LIST> ) )
=>(3) ( cons 203 ( cons ( append <LIST> <LIST> ) <LIST> ) )
=>(6) ( cons 203 ( cons ( append ( cons <LE> <LIST> ) <LIST> ) <LIST> ) )
=>(2) ( cons 203 ( cons ( append ( cons 'Eyal <LIST> ) <LIST> ) <LIST> ) )
=>(2) ( cons 203 ( cons ( append ( cons 'Eyal <LIST> ) <LIST> ) <LIST> ) )
=>(7) ( cons 203 ( cons ( append ( cons 'Eyal null ) <LIST> ) <LIST> ) )
=>(7) ( cons 203 ( cons ( append ( cons 'Eyal null ) ( list <LE> <LE> ) ) <LIST> ) )
=>(2) ( cons 203 ( cons ( append ( cons 'Eyal null ) ( list 'Levi 'Yoni ) ) <LIST> ) )
=>(7) ( cons 203 ( cons ( append ( cons 'Eyal null ) ( list 'Levi 'Yoni ) ) null ) )

********************************************************************************************|#