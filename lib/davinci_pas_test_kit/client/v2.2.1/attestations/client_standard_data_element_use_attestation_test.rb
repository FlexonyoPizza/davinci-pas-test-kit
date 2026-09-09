require_relative 'attestation_instructions'

module DaVinciPASTestKit
  module DaVinciPASV221
    class StandardDataElementUseAttestationTest < Inferno::Test
      id :pas_client_v221_standard_data_element_use_attestation
      ATTESTATION_TITLE = 'Health IT module uses standard PAS data elements to communicate needed data'.freeze
      title ATTESTATION_TITLE
      description %(
        During this test, the tester will confirm that the Health IT module uses standard PAS data elements
        (those found within PAS-defined or inherited profiles and marked as mandatory or mustSupport) to
        communicate information those elements are intended to convey.
        To see the specifics of the attested requirements, click the "View Specification Requirements" link for this
        test.
      )
      attestation
      verifies_requirements 'hl7.fhir.us.davinci-pas_2.2.1@conf-15'
      input_instructions ATTESTATION_INPUT_INSTRUCTIONS

      input :standard_data_element_use_attestation,
            title: ATTESTATION_TITLE,
            description: %(
              I attest that the Health IT module uses standard PAS data elements (those found within PAS-defined
              or inherited profiles and marked as mandatory or mustSupport) to communicate information those
              elements are intended to convey.
            ),
            type: 'radio',
            default: 'false',
            options: {
              list_options: [
                { label: 'Yes', value: 'true' },
                { label: 'No', value: 'false' }
              ]
            }
      input :standard_data_element_use_attestation_note,
            title: 'Notes, if applicable:',
            type: 'textarea',
            optional: true

      run do
        assert standard_data_element_use_attestation == 'true'
      end
    end
  end
end
