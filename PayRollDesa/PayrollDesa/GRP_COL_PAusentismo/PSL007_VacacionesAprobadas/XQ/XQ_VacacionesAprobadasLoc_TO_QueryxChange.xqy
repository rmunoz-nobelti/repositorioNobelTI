xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://cl.gtd.com/vacacionesAprobadasLocRequest";
(:: import schema at "../XSD/vacacionesAprobadasLocRequest.xsd" ::)
declare namespace ns2="http://cl.gtd.com/ausentismoRequest";
(:: import schema at "../../Resources/XSD/ausentismoRequest.xsd" ::)

declare variable $vacacionesAprobadas as element() (:: schema-element(ns1:vacacionesAprobadas) ::) external;

declare function local:func($vacacionesAprobadas as element() (:: schema-element(ns1:vacacionesAprobadas) ::)) as element() (:: schema-element(ns2:ausentismoRequest) ::) {
    <ns2:ausentismoRequest>
        <ns2:inInexCod>7</ns2:inInexCod>
        <ns2:clXMLSolic>{fn-bea:serialize($vacacionesAprobadas/Interfaz7Solic)}</ns2:clXMLSolic>
    </ns2:ausentismoRequest>
};

local:func($vacacionesAprobadas)