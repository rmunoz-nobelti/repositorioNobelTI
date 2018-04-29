xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://cl.gtd.com/licenciasLocRequest";
(:: import schema at "../../PSL008_Licencias/XSD/licenciasLocRequest.xsd" ::)
declare namespace ns1="http://cl.gtd.com/schemas/licenciasRequest";
(:: import schema at "../XSD/licenciasExpRequest.xsd" ::)

declare variable $licenciasReq as element() (:: schema-element(ns1:licenciasRequest) ::) external;

declare function local:func($licenciasReq as element() (:: schema-element(ns1:licenciasRequest) ::)) as element() (:: schema-element(ns2:licencias) ::) {
    <ns2:licencias>
        <Interfaz8Solic>
            <UNICO>
                <EMP_CODIGO>{fn:data($licenciasReq/ns1:codigo)}</EMP_CODIGO>
                <TAUS_CODIGO>{fn:data($licenciasReq/ns1:codigoTipoAusentismo)}</TAUS_CODIGO>
             
               
                 {           
                    if (string-length($licenciasReq/ns1:fechaInicialAusentismo)>0)
                        then <AUS_FECHA_INICIAL>{concat(substring($licenciasReq/ns1:fechaInicialAusentismo,7,4),'-',substring(
                        $licenciasReq/ns1:fechaInicialAusentismo,1,2),'-',substring($licenciasReq/ns1:fechaInicialAusentismo,4,2))}</AUS_FECHA_INICIAL>
                    else()
                }
                
                <AUS_UNIDADES>{fn:data($licenciasReq/ns1:numeroUnidadesNovedad)}</AUS_UNIDADES>
                
                  {           
                    if (string-length($licenciasReq/ns1:fechaFinalAusentismo)>0)
                        then <AUS_FECHA_FINAL>{concat(substring($licenciasReq/ns1:fechaFinalAusentismo,7,4),'-',substring(
                        $licenciasReq/ns1:fechaFinalAusentismo,1,2),'-',substring($licenciasReq/ns1:fechaFinalAusentismo,4,2))}</AUS_FECHA_FINAL>
                    else()
                }
                
                 {           
                    if (string-length($licenciasReq/ns1:fechaLiquidacionAusentismo)>0)
                        then <AUS_FECHA_LIQ>{concat(substring($licenciasReq/ns1:fechaLiquidacionAusentismo,7,4),'-',substring(
                        $licenciasReq/ns1:fechaLiquidacionAusentismo,1,2),'-',substring($licenciasReq/ns1:fechaLiquidacionAusentismo,4,2))}</AUS_FECHA_LIQ>
                    else()
                }
                
           
                
            </UNICO>
        </Interfaz8Solic>
    </ns2:licencias>
};

local:func($licenciasReq)