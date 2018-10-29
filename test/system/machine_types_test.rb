require "application_system_test_case"

class MachineTypesTest < ApplicationSystemTestCase
  setup do
    @machine_type = machine_types(:one)
  end

  test "visiting the index" do
    visit machine_types_url
    assert_selector "h1", text: "Machine Types"
  end

  test "creating a Machine type" do
    visit machine_types_url
    click_on "New Machine Type"

    fill_in "Creation Timestamp", with: @machine_type.creation_timestamp
    fill_in "Description", with: @machine_type.description
    fill_in "Google", with: @machine_type.google_id
    fill_in "Guest Cpus", with: @machine_type.guest_cpus
    fill_in "Image Space Gb", with: @machine_type.image_space_gb
    fill_in "Is Shared Cpu", with: @machine_type.is_shared_cpu
    fill_in "Kind", with: @machine_type.kind
    fill_in "Maximum Persistent Disks", with: @machine_type.maximum_persistent_disks
    fill_in "Maximum Persistent Disks Size Gb", with: @machine_type.maximum_persistent_disks_size_gb
    fill_in "Memory Mb", with: @machine_type.memory_mb
    fill_in "Name", with: @machine_type.name
    fill_in "Self Link", with: @machine_type.self_link
    fill_in "Zone", with: @machine_type.zone
    click_on "Create Machine type"

    assert_text "Machine type was successfully created"
    click_on "Back"
  end

  test "updating a Machine type" do
    visit machine_types_url
    click_on "Edit", match: :first

    fill_in "Creation Timestamp", with: @machine_type.creation_timestamp
    fill_in "Description", with: @machine_type.description
    fill_in "Google", with: @machine_type.google_id
    fill_in "Guest Cpus", with: @machine_type.guest_cpus
    fill_in "Image Space Gb", with: @machine_type.image_space_gb
    fill_in "Is Shared Cpu", with: @machine_type.is_shared_cpu
    fill_in "Kind", with: @machine_type.kind
    fill_in "Maximum Persistent Disks", with: @machine_type.maximum_persistent_disks
    fill_in "Maximum Persistent Disks Size Gb", with: @machine_type.maximum_persistent_disks_size_gb
    fill_in "Memory Mb", with: @machine_type.memory_mb
    fill_in "Name", with: @machine_type.name
    fill_in "Self Link", with: @machine_type.self_link
    fill_in "Zone", with: @machine_type.zone
    click_on "Update Machine type"

    assert_text "Machine type was successfully updated"
    click_on "Back"
  end

  test "destroying a Machine type" do
    visit machine_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Machine type was successfully destroyed"
  end
end
