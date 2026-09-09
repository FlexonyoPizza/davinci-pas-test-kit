require_relative 'attestation_instructions'

module DaVinciPASTestKit
  module DaVinciPASV221
    class DataElementGuidanceAttestationTest < Inferno::Test
      id :pas_client_v221_data_element_guidance_attestation
      ATTESTATION_TITLE = 'Health IT module does not set additional expectations for data elements'.freeze
      title ATTESTATION_TITLE
      description %(
        During this test, the tester will confirm that the Health IT module's organization does not publish
        guidance setting expectations for where data elements are conveyed within PAS and inherited data
        structures, and instead submits change requests to PAS, HRex, or US Core when additional guidance
        is needed.
        To see the specifics of the attested requirements, click the "View Specification Requirements" link for this
        test.
      )
      attestation
      verifies_requirements 'hl7.fhir.us.davinci-pas_2.2.1@conf-16'
      input_instructions ATTESTATION_INPUT_INSTRUCTIONS

      input :data_element_guidance_attestation,
            title: ATTESTATION_TITLE,
            description: %(
              I attest that my organization does not publish guidance setting expectations for where data
              elements are conveyed within PAS and inherited data structures.
            ),
            type: 'radio',
            default: 'false',
            options: {
              list_options: [
                { label: 'Yes', value: 'true' },
                { label: 'No', value: 'false' }
              ]
            }
      input :data_element_guidance_attestation_note,
            title: 'Notes, if applicable:',
            type: 'textarea',
            optional: true

      run do
        assert data_element_guidance_attestation == 'true'
      end
    end
  end
end
