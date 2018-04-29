xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare default element namespace "";
(:: import schema at "../../Resources/XSD/detallePrestamoQ7.xsd" ::)
declare namespace ns1="http://cl.gtd.com/detallePrestamoLocResponse";
(:: import schema at "../XSD/detallePrestamoLocResponse.xsd" ::)

declare variable $detallePrestamoReqQ7 as element() (:: schema-element(Interfaz12Resp) ::) external;

declare function local:func($detallePrestamoReqQ7 as element() (:: schema-element(Interfaz12Resp) ::)) as element() (:: schema-element(ns1:InfoProceso) ::) {
    <ns1:InfoProceso>
        {
            for $PENDIENTES in $detallePrestamoReqQ7/PAGO
            return 
            <ns1:Pendientes>
                <ns1:CodigoEmpleado>{fn:data($PENDIENTES/EMP_CODIGO)}</ns1:CodigoEmpleado>
                <ns1:IdPrestamo>{fn:data($PENDIENTES/ID_PRESTAMO)}</ns1:IdPrestamo>
                <ns1:TotalCuotas>{fn:data($PENDIENTES/TOTAL_CUOTAS)}</ns1:TotalCuotas>
                <ns1:NumeroCuotaPagada>{fn:data($PENDIENTES/CUOTA_PAGADA)}</ns1:NumeroCuotaPagada>
                <ns1:ValorCuota>{fn:data($PENDIENTES/VALOR_CUOTA)}</ns1:ValorCuota>
                
                
<ns1:FechaDescuento>{replace(concat(substring(fn:data($PENDIENTES/FECHA_DESCUENTO),8,3),'/',substring(
                        fn:data($PENDIENTES/FECHA_DESCUENTO),5,3),'/',
                        substring(fn:data($PENDIENTES/FECHA_DESCUENTO),1,5)), '-', '')} </ns1:FechaDescuento>


            </ns1:Pendientes>
        }
    </ns1:InfoProceso>
};

local:func($detallePrestamoReqQ7)