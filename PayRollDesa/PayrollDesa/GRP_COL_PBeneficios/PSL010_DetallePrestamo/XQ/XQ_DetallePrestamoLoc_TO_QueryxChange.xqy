xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://cl.gtd.com/detallePrestamoLocRequest";
(:: import schema at "../XSD/detallePrestamoLocRequest.xsd" ::)
declare namespace ns2="http://cl.gtd.com/beneficioRequest";
(:: import schema at "../../Resources/XSD/beneficioRequest.xsd" ::)

declare variable $detallePrestamo as element() (:: schema-element(ns1:detallePrestamo) ::) external;

declare function local:func($detallePrestamo as element() (:: schema-element(ns1:detallePrestamo) ::)) as element() (:: schema-element(ns2:beneficioRequest) ::) {
    <ns2:beneficioRequest>
        <ns2:inInexCod>12</ns2:inInexCod>
        <ns2:clXMLSolic>{fn-bea:serialize($detallePrestamo/Interfaz12Solic)}</ns2:clXMLSolic>
    </ns2:beneficioRequest>
};

local:func($detallePrestamo)