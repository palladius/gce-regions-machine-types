require 'test_helper'

class MachineTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @machine_type = machine_types(:one)
  end

  test "should get index" do
    get machine_types_url
    assert_response :success
  end

  test "should get new" do
    get new_machine_type_url
    assert_response :success
  end

  test "should create machine_type" do
    assert_difference('MachineType.count') do
      post machine_types_url, params: { machine_type: { creation_timestamp: @machine_type.creation_timestamp, description: @machine_type.description, google_id: @machine_type.google_id, guest_cpus: @machine_type.guest_cpus, image_space_gb: @machine_type.image_space_gb, is_shared_cpu: @machine_type.is_shared_cpu, kind: @machine_type.kind, maximum_persistent_disks: @machine_type.maximum_persistent_disks, maximum_persistent_disks_size_gb: @machine_type.maximum_persistent_disks_size_gb, memory_mb: @machine_type.memory_mb, name: @machine_type.name, self_link: @machine_type.self_link, zone: @machine_type.zone } }
    end

    assert_redirected_to machine_type_url(MachineType.last)
  end

  test "should show machine_type" do
    get machine_type_url(@machine_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_machine_type_url(@machine_type)
    assert_response :success
  end

  test "should update machine_type" do
    patch machine_type_url(@machine_type), params: { machine_type: { creation_timestamp: @machine_type.creation_timestamp, description: @machine_type.description, google_id: @machine_type.google_id, guest_cpus: @machine_type.guest_cpus, image_space_gb: @machine_type.image_space_gb, is_shared_cpu: @machine_type.is_shared_cpu, kind: @machine_type.kind, maximum_persistent_disks: @machine_type.maximum_persistent_disks, maximum_persistent_disks_size_gb: @machine_type.maximum_persistent_disks_size_gb, memory_mb: @machine_type.memory_mb, name: @machine_type.name, self_link: @machine_type.self_link, zone: @machine_type.zone } }
    assert_redirected_to machine_type_url(@machine_type)
  end

  test "should destroy machine_type" do
    assert_difference('MachineType.count', -1) do
      delete machine_type_url(@machine_type)
    end

    assert_redirected_to machine_types_url
  end
end
