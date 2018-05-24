package com.nuc.oms.timedTask;

import com.nuc.oms.entity.Music;
import com.nuc.oms.jpa.MusicJPA;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Set;

/**
 * 定时将redis数据刷入mysql
 */
@Component
@Transactional
public class RedisTask {
    private Logger logger = LoggerFactory.getLogger(RedisTask.class);
    @Autowired
    StringRedisTemplate stringRedisTemplate;
    @Autowired
    MusicJPA musicJPA;



    @Scheduled(fixedDelay = 1000)        //fixedDelay = 1000表示当前方法执行完毕1000ms后，Spring scheduling会再次调用该方法
    public void testFixDelay() {
        logger.info("redis数据刷新计划");
        Set<String> keys = stringRedisTemplate.keys("like:*");
        for (String key : keys) {
            try {
                String s = stringRedisTemplate.opsForValue().get(key);
                String mid = key.replaceAll("like:", "");
                Music music = musicJPA.getOne(Integer.valueOf(mid));
                logger.info(String.valueOf(music.getMid())+music.getMpicurl());
                music.setMgood(Integer.valueOf(s));
                musicJPA.save(music);
            } catch (Exception e) {
                logger.error("redis数据刷入异常", e);
            }
        }

    }
}