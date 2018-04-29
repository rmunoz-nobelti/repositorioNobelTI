xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare default element namespace "";
(:: import schema at "../../Resources/CSV/SaldoVacaciones.xsd" ::)
declare namespace ns1="http://TargetNamespace.com/fileReference";
(:: import schema at "../../Resources/CSV/saldoVacacionesToCSV.xsd" ::)

declare variable $info as element() (:: schema-element(InfoProceso) ::) external;

declare function local:func($info as element() (:: schema-element(InfoProceso) ::)) as element() (:: schema-element(ns1:pendientes) ::) {
    
    
    <ns1:pendientes>
        <ns1:nombre>PersonnelNumber;Company;Employee_Vacation_HolidaysPerYear</ns1:nombre>
        {
        
            for $Pendientes in $info/Pendientes
            return 
            <ns1:pendiente>
               <ns1:CodigoEmpleado>{fn:data($Pendientes/CodigoEmpleado)}</ns1:CodigoEmpleado>   
              <ns1:Sociedad>{fn:data($Pendientes/Sociedad)}</ns1:Sociedad> 
               <ns1:SaldoVacaciones>{fn:data($Pendientes/SaldoVacaciones)}</ns1:SaldoVacaciones>
            
          </ns1:pendiente>
        }</ns1:pendientes>
};

local:func($info)