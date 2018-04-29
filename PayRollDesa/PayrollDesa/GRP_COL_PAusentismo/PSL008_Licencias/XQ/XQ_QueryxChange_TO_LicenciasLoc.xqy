xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare default element namespace "";
(:: import schema at "../../Resources/XSD/ausentismoResponse.xsd" ::)
declare namespace ns1="http://cl.gtd.com/licenciasLocResponse";
(:: import schema at "../XSD/licenciasLocResponse.xsd" ::)

declare variable $licenciasResponse as element() (:: schema-element(InfoProceso) ::) external;

declare function local:func($licenciasResponse as element() (:: schema-element(InfoProceso) ::)) as element() (:: schema-element(ns1:InfoProceso) ::) {
    <ns1:InfoProceso>
        <ns1:MensajeRetorno>{fn:data($licenciasResponse/MensajeRetorno)}</ns1:MensajeRetorno>
        <ns1:LogProceso>
            <ns1:Errores>{fn:data($licenciasResponse/LogProceso/Errores)}</ns1:Errores>
            <ns1:Resumen>{fn:data($licenciasResponse/LogProceso/Resumen)}</ns1:Resumen>
        </ns1:LogProceso>
    </ns1:InfoProceso>
};

local:func($licenciasResponse)