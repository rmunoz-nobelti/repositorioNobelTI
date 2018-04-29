xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://cl.gtd.com/vacacionesAprobadasLocRequest";
(:: import schema at "../../PSL007_VacacionesAprobadas/XSD/vacacionesAprobadasLocRequest.xsd" ::)
declare namespace ns1="http://cl.gtd.com/schemas/vacacionesAprobadasRequest";
(:: import schema at "../XSD/vacacionesAprobadasExpRequest.xsd" ::)

declare variable $vacacionesAprobadasReq as element() (:: schema-element(ns1:vacacionesAprobadasRequest) ::) external;

declare function local:func($vacacionesAprobadasReq as element() (:: schema-element(ns1:vacacionesAprobadasRequest) ::)) as element() (:: schema-element(ns2:vacacionesAprobadas) ::) {
    <ns2:vacacionesAprobadas>
        <Interfaz7Solic>
            <UNICO>
                <EMP_CODIGO>{fn:data($vacacionesAprobadasReq/ns1:cedulaEmpleado)}</EMP_CODIGO>
                <PARV_DIAS_TIEMPO>{fn:data($vacacionesAprobadasReq/ns1:diasSolicitadosEnTiempo)}</PARV_DIAS_TIEMPO>
                <PARV_DIAS_DINERO>{fn:data($vacacionesAprobadasReq/ns1:diasSolicitadosEnDinero)}</PARV_DIAS_DINERO>
                
                {           
                       if (string-length($vacacionesAprobadasReq/ns1:fechaInicioVacaciones)>0)
                        then <PARV_FECHA_SALIDA>{concat(substring($vacacionesAprobadasReq/ns1:fechaInicioVacaciones,7,4),'-',substring(
                        $vacacionesAprobadasReq/ns1:fechaInicioVacaciones,1,2),'-',substring($vacacionesAprobadasReq/ns1:fechaInicioVacaciones,4,2))}</PARV_FECHA_SALIDA>
                    else()
                }
                
              
                
            </UNICO>
        </Interfaz7Solic>
    </ns2:vacacionesAprobadas>
};

local:func($vacacionesAprobadasReq)