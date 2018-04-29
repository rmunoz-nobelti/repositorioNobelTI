xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://cl.gtd.com/ausentismoRequest";
(:: import schema at "../../Resources/XSD/ausentismoRequest.xsd" ::)
declare namespace ns1="http://cl.gtd.com/licenciasLocRequest";
(:: import schema at "../XSD/licenciasLocRequest.xsd" ::)

declare variable $licencias as element() (:: schema-element(ns1:licencias) ::) external;

declare function local:func($licencias as element() (:: schema-element(ns1:licencias) ::)) as element() (:: schema-element(ns2:ausentismoRequest) ::) {
    <ns2:ausentismoRequest>
        <ns2:inInexCod>8</ns2:inInexCod>
        <ns2:clXMLSolic>{fn-bea:serialize($licencias/Interfaz8Solic)}</ns2:clXMLSolic>
    </ns2:ausentismoRequest>
};

local:func($licencias)