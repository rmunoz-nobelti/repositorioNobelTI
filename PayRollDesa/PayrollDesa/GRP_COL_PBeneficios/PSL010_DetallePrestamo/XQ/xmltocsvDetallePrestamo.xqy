xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare default element namespace "";
(:: import schema at "../../Resources/CSV/DetallePrestamo.xsd" ::)
declare namespace ns1="http://TargetNamespace.com/fileReference";
(:: import schema at "../../Resources/CSV/detallePrestamoToCSV.xsd" ::)

declare variable $info as element() (:: schema-element(InfoProceso) ::) external;

declare function local:func($info as element() (:: schema-element(InfoProceso) ::)) as element() (:: schema-element(ns1:pendientes) ::) {
<ns1:pendientes>
    {
        for $Pendientes in $info/Pendientes
        return 
        <ns1:pendiente>
            <ns1:CodigoEmpleado>{fn:data($Pendientes/CodigoEmpleado)}</ns1:CodigoEmpleado>
            <ns1:IdPrestamo>{fn:data($Pendientes/IdPrestamo)}</ns1:IdPrestamo>
            <ns1:TotalCuotas>{fn:data($Pendientes/TotalCuotas)}</ns1:TotalCuotas>
            <ns1:NumeroCuotaPagada>{fn:data($Pendientes/NumeroCuotaPagada)}</ns1:NumeroCuotaPagada>
            <ns1:ValorCuota>{fn:data($Pendientes/ValorCuota)}</ns1:ValorCuota>
            <ns1:FechaDescuento>{fn:data($Pendientes/FechaDescuento)}</ns1:FechaDescuento>
        </ns1:pendiente>
    }

        
    </ns1:pendientes>   
};

local:func($info)