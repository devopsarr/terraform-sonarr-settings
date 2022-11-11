package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestApply(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir:  "../examples/complete-sonarr-settings",
		BackendConfig: map[string]interface{}{},
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
}
