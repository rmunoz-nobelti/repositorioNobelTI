xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://cl.gtd.com/licenciasLocResponse";
(:: import schema at "../../PSL008_Licencias/XSD/licenciasLocResponse.xsd" ::)
declare namespace ns2="http://cl.gtd.com/schemas/licenciasResponse";
(:: import schema at "../XSD/licenciasExpResponse.xsd" ::)

declare variable $licenciasLoc as element() (:: schema-element(ns1:InfoProceso) ::) external;

declare function local:func($licenciasLoc as element() (:: schema-element(ns1:InfoProceso) ::)) as element() (:: schema-element(ns2:licenciasResponse) ::) {
    <ns2:licenciasResponse>
        <ns2:estadoOperacion>
            <ns2:codigo>8</ns2:codigo>
            <ns2:descripcion>{fn:data($licenciasLoc/ns1:LogProceso/ns1:Errores)}</ns2:descripcion>
        </ns2:estadoOperacion>
    </ns2:licenciasResponse>
};

local:func($licenciasLoc)