xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare default element namespace "";
(:: import schema at "../../Resources/XSD/saldoVacacionesQ7.xsd" ::)
declare namespace ns1="http://cl.gtd.com/saldoVacacionesLocResponse";
(:: import schema at "../XSD/saldoVacacionesLocResponse.xsd" ::)

declare variable $saldoVacacionesReqQ7 as element() (:: schema-element(Interfaz13Resp) ::) external;

declare function local:func($saldoVacacionesReqQ7 as element() (:: schema-element(Interfaz13Resp) ::)) as element() (:: schema-element(ns1:InfoProceso) ::) {
    <ns1:InfoProceso>
        {
            for $PENDIENTES in $saldoVacacionesReqQ7/PENDIENTES
            return 
            <ns1:Pendientes>
              <ns1:CodigoEmpleado>{fn:data($PENDIENTES/EMP_CODIGO)}</ns1:CodigoEmpleado>
                <ns1:Sociedad>{dvmtr:lookup('UT_Common/DVM/Sociedad', 'Codigo_Payroll', fn:string(fn:data($PENDIENTES/SOCIEDAD)), 'Codigo_AX', 'No se encontro valor para campo Sociedad.' )} </ns1:Sociedad>
                 <ns1:SaldoVacaciones>{fn:data($PENDIENTES/SALDO)}</ns1:SaldoVacaciones>
             
           
              
               
               
            </ns1:Pendientes>
        }
    </ns1:InfoProceso>
};

local:func($saldoVacacionesReqQ7)