require_relative 'attestation_instructions'

module DaVinciPASTestKit
  module DaVinciPASV221
    class ClinicalDataReviewAttestationTest < Inferno::Test
      id :pas_client_v221_clinical_data_review_attestation
      ATTESTATION_TITLE = 'Health IT module allows providers to review, amend, or withhold clinical data before ' \
                          'submission'.freeze
      title ATTESTATION_TITLE
      description %(
        During this test, the tester will confirm that, prior to sending clinical data as part of the PAS
        exchange, the Health IT module gives the provider (or their designated agent) the ability - but not the
        obligation - to review patient information and, where appropriate, amend or withhold the submission.
        Providers can choose to turn off the ability to review documentation, and the module allows them that
        option.
        To see the specifics of the attested requirements, click the "View Specification Requirements" link for this
        test.
      )
      attestation
      verifies_requirements 'hl7.fhir.us.davinci-pas_2.2.1@use-5'
      input_instructions ATTESTATION_INPUT_INSTRUCTIONS

      input :clinical_data_review_attestation,
            title: ATTESTATION_TITLE,
            description: %(
              I attest that, prior to sending clinical data as part of the PAS exchange, the Health IT module
              gives the provider (or their designated agent) the ability - but not the obligation - to review
              patient information and, where appropriate, amend or withhold the submission, and allows the
              provider to turn off the ability to review documentation.
            ),
            type: 'radio',
            default: 'false',
            options: {
              list_options: [
                { label: 'Yes', value: 'true' },
                { label: 'No', value: 'false' }
              ]
            }
      input :clinical_data_review_attestation_note,
            title: 'Notes, if applicable:',
            type: 'textarea',
            optional: true

      run do
        assert clinical_data_review_attestation == 'true'
      end
    end
  end
end
