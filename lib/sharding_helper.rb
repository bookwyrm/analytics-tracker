require 'murmurhash3'

module ShardingHelper
  def ShardingHelper.generate_sharding_key(string)
    MurmurHash3::V32.murmur3_32_str_hash(string)
  end
end
