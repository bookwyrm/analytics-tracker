require 'murmurhash3'

module ShardingHelper
  def ShardingHelper.generate_sharding_key(string)
    MurmurHash3::V32.murmur3_32_str_hash(string)
  end

  def ShardingHelper.shard_symbol_for_key(sharding_key, symbol_prefix = 'shard_')
    "#{symbol_prefix}#{sharding_key % 4}".to_sym
  end
end
