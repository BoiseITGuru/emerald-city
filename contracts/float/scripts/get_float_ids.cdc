import FLOAT from 0x01
import NonFungibleToken from 0x03

pub fun main(account: Address): [UInt64] {
  let nftCollection = getAccount(account).getCapability(FLOAT.FLOATCollectionPublicPath)
                        .borrow<&FLOAT.Collection{NonFungibleToken.CollectionPublic}>()
                        ?? panic("Could not borrow the Collection from the account.")
  return nftCollection.getIDs()
}