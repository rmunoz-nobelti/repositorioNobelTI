xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://cl.grupogtd.com/schemas/errorHandler";
(:: import schema at "../../../UTL_ErrorHandler/GRP_COL/XSD/errorHandlerResponse.xsd" ::)
declare namespace ns2="http://cl.gtd.com/schemas/vacacionesAprobadasResponse";
(:: import schema at "../XSD/vacacionesAprobadasExpResponse.xsd" ::)

declare variable $estadoOperacion as element() (:: schema-element(ns1:estadoOperacion) ::) external;

declare function local:func($estadoOperacion as element() (:: schema-element(ns1:estadoOperacion) ::)) as element() (:: schema-element(ns2:vacacionesAprobadasResponse) ::) {
    <ns2:vacacionesAprobadasResponse>
        <ns2:estadoOperacion>
            <ns2:codigo>{fn:data($estadoOperacion/ns1:codigo)}</ns2:codigo>
            <ns2:descripcion>{fn:data($estadoOperacion/ns1:descripcion)}</ns2:descripcion>
        </ns2:estadoOperacion>
    </ns2:vacacionesAprobadasResponse>
};

local:func($estadoOperacion)