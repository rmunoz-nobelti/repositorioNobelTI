xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://cl.gtd.com/crearPrestamoLocRequest";
(:: import schema at "../../PSL006_CrearPrestamo/XSD/crearPrestamoLocRequest.xsd" ::)
declare namespace ns1="http://cl.gtd.com/schemas/crearPrestamoRequest";
(:: import schema at "../XSD/crearPrestamoExpRequest.xsd" ::)

declare variable $crearPrestamoLoc as element() (:: schema-element(ns1:crearPrestamoRequest) ::) external;

declare function local:func($crearPrestamoLoc as element() (:: schema-element(ns1:crearPrestamoRequest) ::)) as element() (:: schema-element(ns2:crearPrestamo) ::) {
    <ns2:crearPrestamo>
        <Interfaz11Solic>
            <UNICO>
                <ID_PRESTAMO>{fn:data($crearPrestamoLoc/ns1:identificadorPrestamo)}</ID_PRESTAMO>
                <EMP_CODIGO>{fn:data($crearPrestamoLoc/ns1:codigo)}</EMP_CODIGO>
                <PRE_CODIGO>{fn:data($crearPrestamoLoc/ns1:codigoClasePrestamo)}</PRE_CODIGO>
                
                  {           
                    if (string-length($crearPrestamoLoc/ns1:fechaOtorgamiento)>0)
                        then <PEC_FECHA_PAGARE>{concat(substring($crearPrestamoLoc/ns1:fechaOtorgamiento,7,4),'-',substring(
                        $crearPrestamoLoc/ns1:fechaOtorgamiento,1,2),'-',substring($crearPrestamoLoc/ns1:fechaOtorgamiento,4,2))}</PEC_FECHA_PAGARE>
                    else()
                }
                
                {           
                    if (string-length($crearPrestamoLoc/ns1:fechaInicioPago)>0)
                        then <PEC_FECHA>{concat(substring($crearPrestamoLoc/ns1:fechaInicioPago,7,4),'-',substring(
                        $crearPrestamoLoc/ns1:fechaInicioPago,1,2),'-',substring($crearPrestamoLoc/ns1:fechaInicioPago,4,2))}</PEC_FECHA>
                    else()
                }
                
                <PEC_VALOR_TOTAL>{fn:data($crearPrestamoLoc/ns1:valorTotalPrestamo)}</PEC_VALOR_TOTAL>
                <PEC_PLAZO_MESES>{fn:data($crearPrestamoLoc/ns1:plazoEnMeses)}</PEC_PLAZO_MESES>
                <PEC_DOCUMENTO>{fn:data($crearPrestamoLoc/ns1:informacionAdicional)}</PEC_DOCUMENTO>
            </UNICO>
        </Interfaz11Solic>
    </ns2:crearPrestamo>
};

local:func($crearPrestamoLoc)