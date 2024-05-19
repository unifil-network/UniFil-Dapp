//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {IGateway} from "./ipc/interfaces/IGateway.sol";
import {SubnetID} from "./ipc/structs/Subnet.sol";
import {FvmAddress} from "./ipc/structs/FvmAddress.sol";

contract SubnetController {
    address public immutable gateway;
    constructor (address _gateway) {
        gateway = _gateway;
    }

    function fund(SubnetID calldata subnetId, FvmAddress calldata to, uint256 amount) external {
        IGateway _gateway  = IGateway(gateway);
        _gateway.fundWithToken(subnetId, to, amount);
    }

    function release(FvmAddress calldata to) external payable {
        IGateway _gateway  = IGateway(gateway);
        _gateway.release{value: msg.value}(to);
    }
}