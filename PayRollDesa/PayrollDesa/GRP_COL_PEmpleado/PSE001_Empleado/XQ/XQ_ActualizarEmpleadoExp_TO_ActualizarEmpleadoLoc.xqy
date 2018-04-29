xquery version "1.0" encoding "UTF-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://cl.gtd.com/actualizarEmpleadoLocRequest";
(:: import schema at "../../PSL003_ActualizarEmpleado/XSD/actualizarEmpleadoLocRequest.xsd" ::)
declare namespace ns1="http://cl.gtd.com/schemas/actualizarEmpleadoRequest";
(:: import schema at "../XSD/actualizarEmpleadoExpRequest.xsd" ::)

declare variable $actualizarEmpleadoReq as element() (:: schema-element(ns1:actualizarEmpleadoRequest) ::) external;

declare function local:func($actualizarEmpleadoReq as element() (:: schema-element(ns1:actualizarEmpleadoRequest) ::)) as element() (:: schema-element(ns2:actualizarEmpleado) ::) {
    <ns2:actualizarEmpleado>
        <Interfaz2Solic>
            <UNICO>
                <EMP_CODIGO>{fn:data($actualizarEmpleadoReq/ns1:codigo)}</EMP_CODIGO>
                
                <EMP_APELLIDO1>{fn:substring($actualizarEmpleadoReq/ns1:apellidoPaterno,1,15)}</EMP_APELLIDO1>

             
 
                {
                if(string-length($actualizarEmpleadoReq/ns1:apellidoMaterno) > 0)
                then  <EMP_APELLIDO2>{fn:substring($actualizarEmpleadoReq/ns1:apellidoMaterno,1,15)}</EMP_APELLIDO2>
                else(<EMP_APELLIDO2></EMP_APELLIDO2>)
                }
                
          
                  {           
                    if (string-length($actualizarEmpleadoReq/ns1:segundoNombre)>0)
                        then 
                  <EMP_NOMBRE>{fn:substring(fn:concat($actualizarEmpleadoReq/ns1:primerNombre," ",$actualizarEmpleadoReq/ns1:segundoNombre),1,30)}</EMP_NOMBRE>           
                    else(
                    <EMP_NOMBRE>{fn:data($actualizarEmpleadoReq/ns1:primerNombre)}</EMP_NOMBRE>           
                    )
                }
                
                
              
                
               
              
               
                {           
                if(string-length($actualizarEmpleadoReq/ns1:tipoIdentificador) > 0)
                then  <EMP_TIPO_IDENTIF>{fn:data($actualizarEmpleadoReq/ns1:tipoIdentificador)}</EMP_TIPO_IDENTIF>          
                else(<EMP_TIPO_IDENTIF></EMP_TIPO_IDENTIF>)
                }
     
     
     
                {           
                if(string-length($actualizarEmpleadoReq/ns1:sexo) > 0)
                then  <EMP_SEXO>{dvmtr:lookup('UT_Common/DVM/Sexo', 'Codigo_AX', fn:data($actualizarEmpleadoReq/ns1:sexo/text()), 'Codigo_Payroll', 'No se encontró valor para campo Sexo.')}</EMP_SEXO>         
                else(<EMP_SEXO></EMP_SEXO>)
                }
                
                
                {           
                if(string-length($actualizarEmpleadoReq/ns1:estadoCivil) > 0)
                then <EMP_ESTADO_CIVIL>{dvmtr:lookup('UT_Common/DVM/EstadoCivil', 'Codigo_AX', fn:data($actualizarEmpleadoReq/ns1:estadoCivil/text()), 'Codigo_Payroll', 'No se encontró valor para campo Estado Civil.')}</EMP_ESTADO_CIVIL>        
                else(<EMP_ESTADO_CIVIL></EMP_ESTADO_CIVIL>)
                }
                
                {           
                if(string-length($actualizarEmpleadoReq/ns1:codigoPaisIdentificacion) > 0)
                then  <UGN1_CODIGO_IDENT>{fn:data($actualizarEmpleadoReq/ns1:codigoPaisIdentificacion)}</UGN1_CODIGO_IDENT>
                else(<UGN1_CODIGO_IDENT></UGN1_CODIGO_IDENT>)
                }
                
                 {           
                if(string-length($actualizarEmpleadoReq/ns1:codigoPaisNacimiento) > 0)
                then  <UGN1_CODIGO_NACI>{fn:data($actualizarEmpleadoReq/ns1:codigoPaisNacimiento)}</UGN1_CODIGO_NACI>
                else(<UGN1_CODIGO_NACI></UGN1_CODIGO_NACI>)
                }
              
              
                 {           
                if(string-length($actualizarEmpleadoReq/ns1:codigoCiudadResidencia) > 0)
                then   <UGN1_CODIGO_RESID>{fn:data($actualizarEmpleadoReq/ns1:codigoPaisResidencia)}</UGN1_CODIGO_RESID>
                else(<UGN1_CODIGO_RESID></UGN1_CODIGO_RESID>)
                }
                
                 {           
                if(string-length($actualizarEmpleadoReq/ns1:codigoDepartamentoResidencia) > 0)
                then      <UGN2_CODIGO_RESID>{fn:number($actualizarEmpleadoReq/ns1:codigoDepartamentoResidencia)}</UGN2_CODIGO_RESID>
                else(<UGN2_CODIGO_RESID></UGN2_CODIGO_RESID>)
                }
                
              
            
                {   
                if(string-length($actualizarEmpleadoReq/ns1:codigoCiudadResidencia) > 0)
                then  <UGN3_CODIGO_RESID>{fn:number(fn:substring-after($actualizarEmpleadoReq/ns1:codigoCiudadResidencia,$actualizarEmpleadoReq/ns1:codigoDepartamentoResidencia))}</UGN3_CODIGO_RESID>
                else(<UGN3_CODIGO_RESID></UGN3_CODIGO_RESID>)      
                }
               

                {           
                    if (string-length($actualizarEmpleadoReq/ns1:fechaNacimiento)>0)
                        then <EMP_FECHA_NACI>{concat(substring($actualizarEmpleadoReq/ns1:fechaNacimiento,7,4),'-',substring(
                        $actualizarEmpleadoReq/ns1:fechaNacimiento,1,2),'-',substring($actualizarEmpleadoReq/ns1:fechaNacimiento,4,2))}</EMP_FECHA_NACI>
                    else(<EMP_FECHA_NACI></EMP_FECHA_NACI>)
                }
                
                
             {   
                if(string-length($actualizarEmpleadoReq/ns1:localidad) > 0)
                then    <EMP_LOCALIDAD>{fn:data($actualizarEmpleadoReq/ns1:localidad)}</EMP_LOCALIDAD>
                else(<EMP_LOCALIDAD></EMP_LOCALIDAD>)      
                }
                
                
              {   
                if(string-length($actualizarEmpleadoReq/ns1:centroCostoContable) > 0)
                then    <EMP_CC_CONTABLE>{fn:data($actualizarEmpleadoReq/ns1:centroCostoContable)}</EMP_CC_CONTABLE>
                else(<EMP_CC_CONTABLE></EMP_CC_CONTABLE>)      
                }
                
                
                 {   
                if(string-length($actualizarEmpleadoReq/ns1:descripcionCentroCosto) > 0)
                then     <CENCOS_NOMBRE>{fn:data($actualizarEmpleadoReq/ns1:descripcionCentroCosto)}</CENCOS_NOMBRE>
                else(<CENCOS_NOMBRE></CENCOS_NOMBRE>)      
                }
                
                
                
              
                
                
                
                {
                    if (string-length(fn:string($actualizarEmpleadoReq/ns1:tipoNombramiento))>0)
                        then <EMP_TIPO_NOMBRAMIENTO>{fn:data($actualizarEmpleadoReq/ns1:tipoNombramiento)}</EMP_TIPO_NOMBRAMIENTO>
                    else  (<EMP_TIPO_NOMBRAMIENTO>4</EMP_TIPO_NOMBRAMIENTO>)
                }
                
                
                {
                    if (string-length($actualizarEmpleadoReq/ns1:fuenteReclutamiento)>0)
                        then <EMP_FUENTE_RECLUTAMIENTO>{fn:data($actualizarEmpleadoReq/ns1:fuenteReclutamiento)}</EMP_FUENTE_RECLUTAMIENTO>
                  
                    else (  <EMP_FUENTE_RECLUTAMIENTO>3</EMP_FUENTE_RECLUTAMIENTO>)
                }
                
                
                  {
                    if (string-length($actualizarEmpleadoReq/ns1:claseEmpleado)>0)
                        then  <EMP_CLASE_EMPLEADO>{fn:data($actualizarEmpleadoReq/ns1:claseEmpleado)}</EMP_CLASE_EMPLEADO>
                  
                    else (<EMP_CLASE_EMPLEADO></EMP_CLASE_EMPLEADO>)
                }
                
               
                    {
                    if (string-length($actualizarEmpleadoReq/ns1:tipoContrato)>0)
                        then     <EMP_TIPO_CONTRATO>{fn:data($actualizarEmpleadoReq/ns1:tipoContrato)}</EMP_TIPO_CONTRATO>
                  
                    else (<EMP_TIPO_CONTRATO></EMP_TIPO_CONTRATO>)
                }
                
             
                
                
                {           
                    if (string-length($actualizarEmpleadoReq/ns1:fechaIniContrato)>0)
                        then <EMP_FECHA_INI_CONTRATO>{concat(substring($actualizarEmpleadoReq/ns1:fechaIniContrato,7,4),'-',substring(
                        $actualizarEmpleadoReq/ns1:fechaIniContrato,1,2),'-',substring($actualizarEmpleadoReq/ns1:fechaIniContrato,4,2))}</EMP_FECHA_INI_CONTRATO>
                    else(<EMP_FECHA_INI_CONTRATO></EMP_FECHA_INI_CONTRATO>)
                }
                
                
                {           
                    if (string-length($actualizarEmpleadoReq/ns1:fechaFinContrato)>0)
                        then <EMP_FECHA_FIN_CONTRATO>{concat(substring($actualizarEmpleadoReq/ns1:fechaFinContrato,7,4),'-',substring(
                        $actualizarEmpleadoReq/ns1:fechaFinContrato,1,2),'-',substring($actualizarEmpleadoReq/ns1:fechaFinContrato,4,2))}</EMP_FECHA_FIN_CONTRATO>
                    else(<EMP_FECHA_FIN_CONTRATO></EMP_FECHA_FIN_CONTRATO>)
                }
                
                
                
               {
                    if (string-length($actualizarEmpleadoReq/ns1:cargo)>0)
                        then  <EMP_CARGO>{fn:number($actualizarEmpleadoReq/ns1:cargo)}</EMP_CARGO>               
                    else (<EMP_CARGO></EMP_CARGO>)
                }
                
                
                
                {
                    if (string-length($actualizarEmpleadoReq/ns1:cargoNombre)>0)
                        then  <CARGO_NOMBRE>{fn:data($actualizarEmpleadoReq/ns1:cargoNombre)}</CARGO_NOMBRE>
                    else (<CARGO_NOMBRE></CARGO_NOMBRE>)
                }
                
              
                
                {           
                    if (string-length($actualizarEmpleadoReq/ns1:fechaCargo)>0)
                        then <EMP_FECHA_CARGO>{concat(substring($actualizarEmpleadoReq/ns1:fechaCargo,7,4),'-',substring(
                        $actualizarEmpleadoReq/ns1:fechaCargo,1,2),'-',substring($actualizarEmpleadoReq/ns1:fechaCargo,4,2))}</EMP_FECHA_CARGO>
                    else(<EMP_FECHA_CARGO></EMP_FECHA_CARGO>)
                }


              {
                    if (string-length($actualizarEmpleadoReq/ns1:formaPago)>0)
                        then   <EMP_FORMA_PAGO>{dvmtr:lookup('UT_Common/DVM/FormaPago', 'Codigo_AX', fn:data($actualizarEmpleadoReq/ns1:formaPago/text()), 'Codigo_Payroll', 'No se encontró valor para campo Forma Pago.')}</EMP_FORMA_PAGO>
                    else (<EMP_FORMA_PAGO></EMP_FORMA_PAGO>)
                }


                {
                    if (string-length($actualizarEmpleadoReq/ns1:bancoCodigo)>0)
                        then    <EMP_BANCO_CODIGO>{fn:data($actualizarEmpleadoReq/ns1:bancoCodigo)}</EMP_BANCO_CODIGO>
                    else (<EMP_BANCO_CODIGO></EMP_BANCO_CODIGO>)
                }
               
               
               {
                    if (string-length($actualizarEmpleadoReq/ns1:tipoCuenta)>0)
                        then   <EMP_TIPO_CUENTA>{dvmtr:lookup('UT_Common/DVM/TipoCuenta', 'Codigo_AX', fn:data($actualizarEmpleadoReq/ns1:tipoCuenta/text()), 'Codigo_Payroll', 'No se encontró valor para campo Tipo Cuenta.')}</EMP_TIPO_CUENTA>
                    else (<EMP_TIPO_CUENTA></EMP_TIPO_CUENTA>)
                }
               
                
                 {
                    if (string-length($actualizarEmpleadoReq/ns1:cuentaCorriente)>0)
                        then     <EMP_CTACTE>{fn:data($actualizarEmpleadoReq/ns1:cuentaCorriente)}</EMP_CTACTE>
                    else (<EMP_CTACTE></EMP_CTACTE>)
                }
               
               
                     {
                    if (string-length($actualizarEmpleadoReq/ns1:direccion)>0)
                        then    <EMP_DIRECCION>{fn:data($actualizarEmpleadoReq/ns1:direccion)}</EMP_DIRECCION>
                    else (<EMP_DIRECCION></EMP_DIRECCION>)
                }
               
                    {
                    if (string-length($actualizarEmpleadoReq/ns1:telefono)>0)
                        then  <EMP_TELEFONO>{fn:data($actualizarEmpleadoReq/ns1:telefono)}</EMP_TELEFONO>
                    else (<EMP_TELEFONO></EMP_TELEFONO>)
                }
               
               
                     {
                    if (string-length($actualizarEmpleadoReq/ns1:email)>0)
                        then   <EMP_EMAIL>{fn:data($actualizarEmpleadoReq/ns1:email)}</EMP_EMAIL>
                    else (<EMP_EMAIL></EMP_EMAIL>)
                }
                
               
            </UNICO>
        </Interfaz2Solic>
    </ns2:actualizarEmpleado>
};

local:func($actualizarEmpleadoReq)