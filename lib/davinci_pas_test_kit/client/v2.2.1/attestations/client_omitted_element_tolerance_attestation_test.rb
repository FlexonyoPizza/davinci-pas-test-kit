require_relative 'attestation_instructions'

module DaVinciPASTestKit
  module DaVinciPASV221
    class OmittedElementToleranceAttestationTest < Inferno::Test
      id :pas_client_v221_omitted_element_tolerance_attestation
      ATTESTATION_TITLE = 'Health IT module does not treat omitted optional data elements as conformance errors'.freeze
      title ATTESTATION_TITLE
      description %(
        During this test, the tester will confirm that the Health IT module does not treat the omission of data
        elements that profile cardinality and other constraints allow to be omitted as a conformance error.
        To see the specifics of the attested requirements, click the "View Specification Requirements" link for this
        test.
      )
      attestation
      verifies_requirements 'hl7.fhir.us.davinci-pas_2.2.1@conf-14'
      input_instructions ATTESTATION_INPUT_INSTRUCTIONS

      input :omitted_element_tolerance_attestation,
            title: ATTESTATION_TITLE,
            description: %(
              I attest that the Health IT module does not treat the omission of data elements that profile
              cardinality and other constraints allow to be omitted as a conformance error.
            ),
            type: 'radio',
            default: 'false',
            options: {
              list_options: [
                { label: 'Yes', value: 'true' },
                { label: 'No', value: 'false' }
              ]
            }
      input :omitted_element_tolerance_attestation_note,
            title: 'Notes, if applicable:',
            type: 'textarea',
            optional: true

      run do
        assert omitted_element_tolerance_attestation == 'true'
      end
    end
  end
end
