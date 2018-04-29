xquery version "1.0" encoding "ISO-8859-15";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://cl.gtd.com/crearEmpleadoLocRequest";
(:: import schema at "../../PSL002_CrearEmpleado/XSD/crearEmpleadoLocRequest.xsd" ::)
declare namespace ns1="http://cl.gtd.com/schemas/crearEmpleadoRequest";
(:: import schema at "../XSD/crearEmpleadoExpRequest.xsd" ::)

declare variable $crearEmpleadoReq as element() (:: schema-element(ns1:crearEmpleadoRequest) ::) external;

declare function local:func($crearEmpleadoReq as element() (:: schema-element(ns1:crearEmpleadoRequest) ::)) as element() (:: schema-element(ns2:crearEmpleado) ::) {
    <ns2:crearEmpleado>
        <Interfaz1Solic>
            <UNICO>
                <EMP_CODIGO>{fn:data($crearEmpleadoReq/ns1:codigo)}</EMP_CODIGO>
                <EMP_APELLIDO1>{fn:substring($crearEmpleadoReq/ns1:apellidoPaterno,1,15)}</EMP_APELLIDO1>
                <EMP_APELLIDO2>{fn:substring($crearEmpleadoReq/ns1:apellidoMaterno,1,15)}</EMP_APELLIDO2>
                
                 {           
                    if (string-length($crearEmpleadoReq/ns1:segundoNombre)>0)
                        then 
                  <EMP_NOMBRE>{fn:substring(fn:concat($crearEmpleadoReq/ns1:primerNombre," ",$crearEmpleadoReq/ns1:segundoNombre),1,30)}</EMP_NOMBRE>           
                    else(
                    <EMP_NOMBRE>{fn:data($crearEmpleadoReq/ns1:primerNombre)}</EMP_NOMBRE>           
                    )
                }
                
                
               
                <EMP_TIPO_IDENTIF>{fn:data($crearEmpleadoReq/ns1:tipoIdentificador)}</EMP_TIPO_IDENTIF>
                <EMP_SEXO>{dvmtr:lookup('UT_Common/DVM/Sexo', 'Codigo_AX', fn:data($crearEmpleadoReq/ns1:sexo/text()), 'Codigo_Payroll', 'No se encontró valor para campo Sexo.')}</EMP_SEXO>
                <EMP_ESTADO_CIVIL>{dvmtr:lookup('UT_Common/DVM/EstadoCivil', 'Codigo_AX', fn:data($crearEmpleadoReq/ns1:estadoCivil/text()), 'Codigo_Payroll', 'No se encontró valor para campo Estado Civil.')}</EMP_ESTADO_CIVIL>
                <UGN1_CODIGO_IDENT>{fn:data($crearEmpleadoReq/ns1:codigoPaisIdentificacion)}</UGN1_CODIGO_IDENT>
                <UGN1_CODIGO_NACI>{fn:data($crearEmpleadoReq/ns1:codigoPaisNacimiento)}</UGN1_CODIGO_NACI>
                <UGN1_CODIGO_RESID>{fn:data($crearEmpleadoReq/ns1:codigoPaisResidencia)}</UGN1_CODIGO_RESID>
                <UGN2_CODIGO_RESID>{fn:data($crearEmpleadoReq/ns1:codigoDepartamentoResidencia)}</UGN2_CODIGO_RESID>
                <UGN3_CODIGO_RESID>{fn:number(fn:substring-after($crearEmpleadoReq/ns1:codigoCiudadResidencia,$crearEmpleadoReq/ns1:codigoDepartamentoResidencia))}</UGN3_CODIGO_RESID>              

               {           
                    if (string-length($crearEmpleadoReq/ns1:fechaNacimiento)>0)
                        then <EMP_FECHA_NACI>{concat(substring($crearEmpleadoReq/ns1:fechaNacimiento,7,4),'-',substring(
                        $crearEmpleadoReq/ns1:fechaNacimiento,1,2),'-',substring($crearEmpleadoReq/ns1:fechaNacimiento,4,2))}</EMP_FECHA_NACI>
                    else(<EMP_FECHA_NACI></EMP_FECHA_NACI>)
                }
                
                <EMP_SOCIEDAD>{dvmtr:lookup('UT_Common/DVM/Sociedad', 'Codigo_AX', fn:data($crearEmpleadoReq/ns1:sociedad/text()), 'Codigo_Payroll', 'No se encontró valor para campo Sociedad.')}</EMP_SOCIEDAD>
                <EMP_LOCALIDAD>{fn:data($crearEmpleadoReq/ns1:localidad)}</EMP_LOCALIDAD>
                <EMP_CC_CONTABLE>{fn:data($crearEmpleadoReq/ns1:centroCostoContable)}</EMP_CC_CONTABLE>
                <CENCOS_NOMBRE>{fn:data($crearEmpleadoReq/ns1:descripcionCentroCosto)}</CENCOS_NOMBRE>
                <EMP_TIPO_NOMINA>{fn:data($crearEmpleadoReq/ns1:tipoNomina)}</EMP_TIPO_NOMINA>
             
              {
                    if (string-length(fn:string($crearEmpleadoReq/ns1:tipoNombramiento))>0)
                        then <EMP_TIPO_NOMBRAMIENTO>{fn:data($crearEmpleadoReq/ns1:tipoNombramiento)}</EMP_TIPO_NOMBRAMIENTO>
                    else if (string-length(fn:string($crearEmpleadoReq/ns1:tipoNombramiento))=0)
                        then <EMP_TIPO_NOMBRAMIENTO>4</EMP_TIPO_NOMBRAMIENTO>
                    else (<EMP_TIPO_NOMBRAMIENTO></EMP_TIPO_NOMBRAMIENTO>)
                }
                
          
             {
                    if (string-length($crearEmpleadoReq/ns1:fuenteReclutamiento)>0)
                        then <EMP_FUENTE_RECLUTAMIENTO>{fn:data($crearEmpleadoReq/ns1:fuenteReclutamiento)}</EMP_FUENTE_RECLUTAMIENTO>
                    else if (string-length($crearEmpleadoReq/ns1:fuenteReclutamiento)=0)
                        then <EMP_FUENTE_RECLUTAMIENTO>3</EMP_FUENTE_RECLUTAMIENTO>
                    else (<EMP_FUENTE_RECLUTAMIENTO></EMP_FUENTE_RECLUTAMIENTO>)
            }
                
                <EMP_CLASE_EMPLEADO>{fn:data($crearEmpleadoReq/ns1:claseEmpleado)}</EMP_CLASE_EMPLEADO>
                
                
            
                 
               {           
                    if (string-length($crearEmpleadoReq/ns1:fechaIngreso)>0)
                        then <EMP_FECHA_INGRESO>{concat(substring($crearEmpleadoReq/ns1:fechaIngreso,7,4),'-',substring(
                        $crearEmpleadoReq/ns1:fechaIngreso,1,2),'-',substring($crearEmpleadoReq/ns1:fechaIngreso,4,2))}</EMP_FECHA_INGRESO>
                    else(<EMP_FECHA_INGRESO></EMP_FECHA_INGRESO>)
                }
                
                
                <EMP_TIPO_CONTRATO>{fn:data($crearEmpleadoReq/ns1:tipoContrato)}</EMP_TIPO_CONTRATO>
                
                
                
                {           
                    if (string-length($crearEmpleadoReq/ns1:fechaFinContrato)>0)
                        then <EMP_FECHA_FIN_CONTRATO>{concat(substring($crearEmpleadoReq/ns1:fechaFinContrato,7,4),'-',substring(
                        $crearEmpleadoReq/ns1:fechaFinContrato,1,2),'-',substring($crearEmpleadoReq/ns1:fechaFinContrato,4,2))}</EMP_FECHA_FIN_CONTRATO>
                    else(<EMP_FECHA_FIN_CONTRATO></EMP_FECHA_FIN_CONTRATO>)
                }
                
                
                {
                    if (string-length($crearEmpleadoReq/ns1:cargo)>0)
                        then  <EMP_CARGO>{fn:number($crearEmpleadoReq/ns1:cargo)}</EMP_CARGO>               
                    else (<EMP_CARGO></EMP_CARGO>)
                }
                
                
                
                
                <CARGO_NOMBRE>{fn:data($crearEmpleadoReq/ns1:cargoNombre)}</CARGO_NOMBRE>
                <EMP_FORMA_PAGO>{dvmtr:lookup('UT_Common/DVM/FormaPago', 'Codigo_AX', fn:data($crearEmpleadoReq/ns1:formaPago/text()), 'Codigo_Payroll', 'No se encontró valor para campo Forma Pago.')}</EMP_FORMA_PAGO>
                <EMP_BANCO_CODIGO>{fn:data($crearEmpleadoReq/ns1:bancoCodigo)}</EMP_BANCO_CODIGO>
                <EMP_TIPO_CUENTA>{dvmtr:lookup('UT_Common/DVM/TipoCuenta', 'Codigo_AX', fn:data($crearEmpleadoReq/ns1:tipoCuenta/text()), 'Codigo_Payroll', 'No se encontró valor para campo Tipo Cuenta.')}</EMP_TIPO_CUENTA>
                <EMP_CTACTE>{fn:data($crearEmpleadoReq/ns1:cuentaCorriente)}</EMP_CTACTE>
                
                
                {
                if(fn:string-length($crearEmpleadoReq/ns1:direccion)>0) then
                 <EMP_DIRECCION>{fn:data($crearEmpleadoReq/ns1:direccion)}</EMP_DIRECCION>
                else(<EMP_DIRECCION></EMP_DIRECCION>)
                }
            
            
               {
                if(fn:string-length($crearEmpleadoReq/ns1:telefono)>0) then
                 <EMP_TELEFONO>{fn:data($crearEmpleadoReq/ns1:telefono)}</EMP_TELEFONO>
                else(<EMP_TELEFONO></EMP_TELEFONO>)
               }
                
                
               {
                if(fn:string-length($crearEmpleadoReq/ns1:email)>0) then
                 <EMP_MAIL>{fn:data($crearEmpleadoReq/ns1:email)}</EMP_MAIL>
                else(<EMP_MAIL></EMP_MAIL>)
               }
                

            </UNICO>
        </Interfaz1Solic>
    </ns2:crearEmpleado>
};

local:func($crearEmpleadoReq)