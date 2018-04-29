xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare default element namespace "";
(:: import schema at "../../Resources/CSV/SaldoVacaciones.xsd" ::)
declare namespace ns1="http://cl.gtd.com/saldoVacacionesLocResponse";
(:: import schema at "../XSD/saldoVacacionesLocResponse.xsd" ::)

declare variable $saldoVacacionesResponse as element() (:: schema-element(ns1:InfoProceso) ::) external;

declare function local:func($saldoVacacionesResponse as element() (:: schema-element(ns1:InfoProceso) ::)) as element() (:: schema-element(InfoProceso) ::) {
    <InfoProceso>
        <nombre>PersonnelNumber;Company;Employee_Vacation_HolidaysPerYear</nombre>
        {
            for $Pendientes in $saldoVacacionesResponse/ns1:Pendientes
            return 
            <Pendientes>
             
                <CodigoEmpleado>{fn:data($Pendientes/ns1:CodigoEmpleado)}</CodigoEmpleado>
                   <Sociedad>{fn:data($Pendientes/ns1:Sociedad)}</Sociedad>
                <SaldoVacaciones>{fn:data($Pendientes/ns1:SaldoVacaciones)}</SaldoVacaciones>
              
               
                
                
          
          </Pendientes>
        }
    </InfoProceso>
};

local:func($saldoVacacionesResponse)