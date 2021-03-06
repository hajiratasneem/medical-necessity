library POVDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include PowerOperatedVehicles version '1.0.0' called POV

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "ICD-9-CM": 'http://hl7.org/fhir/sid/icd-9'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://bluebutton.cms.gov/resources/codesystem/hcpcs'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'
codesystem "NUCCPT":'https://www.nlm.nih.gov/research/umls/sourcereleasedocs/current/NUCCPT/sourcerepresentation.html'

valueset "Musculoskeletal Assessment": '2.16.840.1.113883.3.7643.3.1031'
valueset "Findings of Neurological Assessment for Orientation or Balance": '2.16.840.1.113883.3.7643.3.1032'
valueset "Immobilization": '2.16.840.1.113883.17.4077.3.2006'
valueset "Serious or Life Threatening Illness": '2.16.840.1.113883.3.464.1003.199.12.1055'
valueset "CardioPulmonary Examination": '2.16.840.1.113883.3.6037.1001.23.95.21'
valueset "Body weight": '2.16.840.1.113762.1.4.1045.159'
valueset "Height": '2.16.840.1.113883.3.464.1003.121.12.1014'
valueset "Face to Face Encounter": '2.16.840.1.113762.1.4.1047.428'
valueset "Inpatient Encounter": '2.16.840.1.113883.3.117.1.7.1.23'
valueset "Physical Examination": '2.16.840.1.113883.3.6037.1001.23.95.31'


parameter "DeviceRequest" DeviceRequest
parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "Claim" Claim

context Patient

define QT:
	"QuestionnaireResponse".item

define DeviceRequestHcpcsCoding: 
    POV."DeviceRequestHcpcsCoding"


define DateOfOrder: 
    POV."DateOfOrder"


define DescriptionOfItem: 
    POV."DescriptionOfItem"


define DeviceOrderType: 
    POV."DeviceOrderType"

define StartDate: 
    POV."StartDate"

define Supplier: 
	POV."Supplier"


define SupplierName: 
	POV."SupplierName"


define SupplierNPI:
    POV."SupplierNPI"


define SupplierPTAN: 
    POV."SupplierPTAN"

    
define SupplierAddressObject: 
	POV."SupplierAddressObject"


define SupplierAddress: 
	POV."SupplierAddress"

define ServiceEncounter:
	POV."ServiceEncounter"


define ServiceCondition:
	POV."ServiceCondition"


define RelevantDiagnosis:
	POV."RelevantDiagnosis"

define EncounterResource: 
	POV."EncounterResource"

define FaceToFaceEncounter:
	POV."FaceToFaceEncounter"

define FFEncounter:
    POV."FFEncounter"
        
define InpatientEncounter:
    POV."InpatientEncounter"


define PhysicalExamination:
    POV."PhysicalExamination"


define PhysicalExaminationType:
    POV."PhysicalExaminationType"


define ComorbiditiesType:
    POV."ComorbiditiesType"


define Comorbidities:
    POV."Comorbidities"


define MobilityDiagnosis: 
    POV."MobilityDiagnosis"


define Mobility:
    POV."Mobility"


define MobilityEstimation:
    POV."MobilityEstimation"


define Musculoskeletal:
    POV."Musculoskeletal"


define MusculoskeletalAnalysis:
    POV."MusculoskeletalAnalysis"


define Neurological:
    POV."Neurological"


define NeurologicalAnalysis:
    POV."NeurologicalAnalysis"


define CardioPulmonary:
    POV."CardioPulmonary"


define CardioPulmonaryAnalysis:
    POV."CardioPulmonaryAnalysis"

define Weight:
    POV."Weight"

define PatientHeight:
    POV."PatientHeight"

define QuantityOfItem:
    First("Claim".item).quantity.value

define QA61:
	("QT".item I
		where I.linkId.value = '6.1')QR
		return First(QR.answer).value

define QA62:
	("QT".item I
		where I.linkId.value = '6.2')QR
		return First(QR.answer).value

define QA63:
	("QT".item I
		where I.linkId.value = '6.3')QR
		return First(QR.answer).value

define QA64:
	("QT".item I
		where I.linkId.value = '6.4')QR
		return First(QR.answer).value

define QA65:
	("QT".item I
		where I.linkId.value = '6.5')QR
		return First(QR.answer).value

define QA66:
	("QT".item I
		where I.linkId.value = '6.6')QR
		return First(QR.answer).value

define QA67:
	("QT".item I
		where I.linkId.value = '6.7')QR
		return First(QR.answer).value

define QA68:
	("QT".item I
		where I.linkId.value = '6.8')QR
		return First(QR.answer).value

define QA69:
	("QT".item I
		where I.linkId.value = '6.9')QR
		return First(QR.answer).value

define QA610:
	("QT".item I
		where I.linkId.value = '6.10')QR
		return First(QR.answer).value

define QA611:
	("QT".item I
		where I.linkId.value = '6.11')QR
		return First(QR.answer).value


define QA612:
	("QT".item I
		where I.linkId.value = '6.12')QR
		return First(QR.answer).value


define OrderDetails:
    if (("DateOfOrder" is not null)
        and ("DescriptionOfItem" is not null)
        and ("StartDate" is not null))
        then true
        else false

define SupplierDetails:
    if (("SupplierName" is not null)
        and ("SupplierNPI" is not null)
        and ("SupplierAddress" is not null))
        then true
        else false

define ClinicalAnalysis:
    if (("ServiceCondition" is not null)
        and ("PhysicalExamination" is not null)
        and ("MusculoskeletalAnalysis" = true)
        and ("NeurologicalAnalysis" = true)
        and ("CardioPulmonaryAnalysis" = true)
        and ("Weight" is not null)
        and ("PatientHeight" is not null))
        then true
        else false

define EncounterFF:
    if (("FFEncounter" = false) and ("FaceToFaceEncounter" is not null)
        or ("FFEncounter" = true) and ("FaceToFaceEncounter" is null))
        then true
        else false

define ModifierDecision:
    if ((First("QA71").value = 'GA') or (First("QA71").value = 'GZ'))
        then true
        else false

define QuestionnaireRequirements:
    if ((First("QA61").value  = true)
        and (First("QA62").value  = true)
        and (First("QA63").value  = true)
        and (First("QA64").value  = true)
        and (First("QA65").value  = true)
        and (First("QA66").value  = true)
        and (First("QA67").value  = true)
        and (First("QA68").value  = true)
        and (First("QA69").value  = true)
        and (First("QA610").value  = true)
        and (First("QA611").value  = true)
        and (First("QA612").value  = true))
        then true
        else false


define PrimaryDecision:
    if (("OrderDetails" = true)
        and ("SupplierDetails" = true)
        and ("ClinicalAnalysis" = true)
        and ("EncounterFF" = true)
        and ("QuestionnaireRequirements" = true)
        and ("ModifierDecision" = false))
        then true 
        else false

define FinalDecision:
    if ("PrimaryDecision" = true)
    then 'YES'
    else 'NO'




