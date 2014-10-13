require 'murmurhash3'

module ShardingHelper
  def ShardingHelper.generate_sharding_key(string)
    MurmurHash3::V32.murmur3_32_str_hash(string)
  end

  # This calculation could be cached; maybe just on the model.
  # It is better to store the actual sharding key (not just the shard
  # id) because it lets us re-shard in the future if we ever need to.
  def ShardingHelper.shard_symbol_for_key(sharding_key, symbol_prefix = 'shard_')
    "#{symbol_prefix}#{sharding_key % 4}".to_sym
  end
end
