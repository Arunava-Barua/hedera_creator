pragma solidity ^0.8.0;

contract ContentSharingContract {
    address public owner;

    struct Content {
        uint256 id;
        string title;
        string description;
        string contentHash; // IPFS hash or URL
        address creator;
    }

    mapping(uint256 => Content) public contents;
    uint256 public contentCount;

    event ContentUploaded(uint256 indexed id, string title, address indexed creator);

    constructor() {
        owner = msg.sender;
    }
    //

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function uploadContent(string memory _title, string memory _description, string memory _contentHash) public {
        contentCount++;
        contents[contentCount] = Content(contentCount, _title, _description, _contentHash, msg.sender);
        emit ContentUploaded(contentCount, _title, msg.sender);
    }

    function getContent(uint256 _id) public view returns (string memory, string memory, string memory, address) {
        Content memory content = contents[_id];
        return (content.title, content.description, content.contentHash, content.creator);
    }
}
