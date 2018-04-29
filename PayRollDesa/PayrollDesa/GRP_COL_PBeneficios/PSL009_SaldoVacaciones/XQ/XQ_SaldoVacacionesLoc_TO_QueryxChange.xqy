xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://cl.gtd.com/saldoVacacionesLocRequest";
(:: import schema at "../XSD/saldoVacacionesLocRequest.xsd" ::)
declare namespace ns2="http://cl.gtd.com/beneficioRequest";
(:: import schema at "../../Resources/XSD/beneficioRequest.xsd" ::)

declare variable $saldoVacaciones as element() (:: schema-element(ns1:saldoVacaciones) ::) external;

declare function local:func($saldoVacaciones as element() (:: schema-element(ns1:saldoVacaciones) ::)) as element() (:: schema-element(ns2:beneficioRequest) ::) {
    <ns2:beneficioRequest>
        <ns2:inInexCod>13</ns2:inInexCod>
        <ns2:clXMLSolic>{fn-bea:serialize($saldoVacaciones/Interfaz13Solic)}</ns2:clXMLSolic>
    </ns2:beneficioRequest>
};

local:func($saldoVacaciones)