xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare default element namespace "";
(:: import schema at "../../Resources/XSD/ausentismoResponse.xsd" ::)
declare namespace ns1="http://cl.gtd.com/vacacionesAprobadasLocResponse";
(:: import schema at "../XSD/vacacionesAprobadasLocResponse.xsd" ::)

declare variable $vacacionesAprobadasLoc as element() (:: schema-element(InfoProceso) ::) external;

declare function local:func($vacacionesAprobadasLoc as element() (:: schema-element(InfoProceso) ::)) as element() (:: schema-element(ns1:InfoProceso) ::) {
    <ns1:InfoProceso>
        <ns1:MensajeRetorno>{fn:data($vacacionesAprobadasLoc/MensajeRetorno)}</ns1:MensajeRetorno>
        <ns1:LogProceso>
            <ns1:Errores>{fn:data($vacacionesAprobadasLoc/LogProceso/Errores)}</ns1:Errores>
            <ns1:Resumen>{fn:data($vacacionesAprobadasLoc/LogProceso/Resumen)}</ns1:Resumen>
        </ns1:LogProceso>
    </ns1:InfoProceso>
};

local:func($vacacionesAprobadasLoc)