xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare default element namespace "";
(:: import schema at "../../Resources/CSV/DetallePrestamo.xsd" ::)
declare namespace ns1="http://cl.gtd.com/detallePrestamoLocResponse";
(:: import schema at "../XSD/detallePrestamoLocResponse.xsd" ::)

declare variable $detallePrestamoResponse as element() (:: schema-element(ns1:InfoProceso) ::) external;

declare function local:func($detallePrestamoResponse as element() (:: schema-element(ns1:InfoProceso) ::)) as element() (:: schema-element(InfoProceso) ::) {
    <InfoProceso>
        {
            for $Pendientes in $detallePrestamoResponse/ns1:Pendientes
            return 
            <Pendientes>
                <CodigoEmpleado>{fn:data($Pendientes/ns1:CodigoEmpleado)}</CodigoEmpleado>
                <IdPrestamo>{fn:data($Pendientes/ns1:IdPrestamo)}</IdPrestamo>
                <TotalCuotas>{fn:data($Pendientes/ns1:TotalCuotas)}</TotalCuotas>
                <NumeroCuotaPagada>{fn:data($Pendientes/ns1:NumeroCuotaPagada)}</NumeroCuotaPagada>
                <ValorCuota>{fn:data($Pendientes/ns1:ValorCuota)}</ValorCuota>
                <FechaDescuento>{fn:data($Pendientes/ns1:FechaDescuento)}</FechaDescuento>                   
            </Pendientes>
        }
    </InfoProceso>
};

local:func($detallePrestamoResponse)