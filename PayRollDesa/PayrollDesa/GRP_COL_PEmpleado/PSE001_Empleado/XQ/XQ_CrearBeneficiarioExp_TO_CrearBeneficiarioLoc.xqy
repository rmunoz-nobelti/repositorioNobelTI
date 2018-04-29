xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://cl.gtd.com/crearBeneficiarioLocRequest";
(:: import schema at "../../PSL005_CrearBeneficiario/XSD/crearBeneficiarioLocRequest.xsd" ::)
declare namespace ns1="http://cl.gtd.com/schemas/crearBeneficiarioRequest";
(:: import schema at "../XSD/crearBeneficiarioExpRequest.xsd" ::)

declare variable $crearBeneficiarioReq as element() (:: schema-element(ns1:crearBeneficiarioRequest) ::) external;

declare function local:func($crearBeneficiarioReq as element() (:: schema-element(ns1:crearBeneficiarioRequest) ::)) as element() (:: schema-element(ns2:crearBeneficiario) ::) {
    <ns2:crearBeneficiario>
        <Interfaz6Solic>
            <UNICO>
                <EMP_CODIGO>{fn:data($crearBeneficiarioReq/ns1:codigo)}</EMP_CODIGO>
                
                 {           
                    if (string-length($crearBeneficiarioReq/ns1:segundoNombre)>0)
                        then 
                  <NOMBRE>{fn:substring(fn:concat($crearBeneficiarioReq/ns1:primerNombre," ",$crearBeneficiarioReq/ns1:segundoNombre),1,30)}</NOMBRE>           
                    else(
                    <NOMBRE>{fn:data($crearBeneficiarioReq/ns1:primerNombre)}</NOMBRE>           
                    )
                }
                

                <APELLIDO1>{fn:substring($crearBeneficiarioReq/ns1:apellidoPaterno,1,15)}</APELLIDO1>
                <APELLIDO2>{fn:substring($crearBeneficiarioReq/ns1:apellidoMaterno,1,15)}</APELLIDO2>
                <TIPO_IDENT>{fn:data($crearBeneficiarioReq/ns1:tipoIdentificacion)}</TIPO_IDENT>
                <IDENT_NUM>{fn:data($crearBeneficiarioReq/ns1:numeroIdentificador)}</IDENT_NUM>
              
               {           
                    if (string-length($crearBeneficiarioReq/ns1:fechaNacimiento)>0)
                        then <FEC_NACIO>{concat(substring($crearBeneficiarioReq/ns1:fechaNacimiento,7,4),'-',substring(
                        $crearBeneficiarioReq/ns1:fechaNacimiento,1,2),'-',substring($crearBeneficiarioReq/ns1:fechaNacimiento,4,2))}</FEC_NACIO>
                    else()
                }
                      
                <SEXO>{dvmtr:lookup('UT_Common/DVM/Sexo','Codigo_AX', fn:data($crearBeneficiarioReq/ns1:sexo/text()), 'Codigo_Payroll', 'No se encontró valor para campo Sexo.')}</SEXO>
                
                <RELAC_FAM>{fn:data($crearBeneficiarioReq/ns1:relacionFamiliar)}</RELAC_FAM>
                
               
            </UNICO>
        </Interfaz6Solic>
    </ns2:crearBeneficiario>
};

local:func($crearBeneficiarioReq)