xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://cl.gtd.com/schemas/vacacionesAprobadasResponse";
(:: import schema at "../XSD/vacacionesAprobadasExpResponse.xsd" ::)
declare namespace ns1="http://cl.gtd.com/vacacionesAprobadasLocResponse";
(:: import schema at "../../PSL007_VacacionesAprobadas/XSD/vacacionesAprobadasLocResponse.xsd" ::)

declare variable $vacacionesAprobadasLoc as element() (:: schema-element(ns1:InfoProceso) ::) external;

declare function local:func($vacacionesAprobadasLoc as element() (:: schema-element(ns1:InfoProceso) ::)) as element() (:: schema-element(ns2:vacacionesAprobadasResponse) ::) {
     <ns2:vacacionesAprobadasResponse>
        <ns2:estadoOperacion>
            <ns2:codigo>7</ns2:codigo>
            <ns2:descripcion>{fn:data($vacacionesAprobadasLoc/ns1:LogProceso/ns1:Errores)}</ns2:descripcion>
        </ns2:estadoOperacion>
    </ns2:vacacionesAprobadasResponse>
    
};

local:func($vacacionesAprobadasLoc)