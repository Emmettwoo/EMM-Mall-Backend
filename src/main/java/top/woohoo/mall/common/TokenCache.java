package top.woohoo.mall.common;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

public class TokenCache {
    public static final String TOKEN_PREFIX = "token_";
    private static Logger logger = LoggerFactory.getLogger(TokenCache.class);


    private static LoadingCache<String, String> loadingCache = CacheBuilder.newBuilder().
            initialCapacity(1000).maximumSize(10000).expireAfterAccess(30, TimeUnit.MINUTES).build(
            new CacheLoader<String, String>() {
                // The default data loading implementation.
                // if the key does not have a value, this method is called to load.
                @Override
                public String load(String s) throws Exception {
                    return "null";
                }
            }
    );


    public static void setKey(String key, String value) {
        loadingCache.put(key, value);
    }

    public static String getKey(String key) {
        String value = null;
        try {
            value = loadingCache.get(key);
        } catch (ExecutionException e) {
            logger.error(key + " is not exist in loadingCache. ", e);
        }

        // 当key不存在时，调用Override的load方法，应取得字符串"null"
        if ("null".equals(value)) {
            return null;
        }
        return value;
    }

    // 验证完成后删除此key，防止二次使用。
    public static void delKey(String key) {
        // 验证成功（或者过期）后再手动删除key
        try {
            if (!"null".equals(loadingCache.get(key))) {
                loadingCache.invalidate(key);
            }
        } catch (ExecutionException e) {
            logger.error(key + " is not exist in loadingCache. ", e);
        }
    }
}