Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C044327DB6
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Mar 2021 12:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234526AbhCAL40 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Mar 2021 06:56:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234593AbhCALzY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Mar 2021 06:55:24 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDD8C06178C
        for <linux-i2c@vger.kernel.org>; Mon,  1 Mar 2021 03:54:44 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id u18so3524368plc.12
        for <linux-i2c@vger.kernel.org>; Mon, 01 Mar 2021 03:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ICJaP56TQ9DRa8C1YyXVWT1al8mvxYpqSagVIYpBKEQ=;
        b=fMd8tRlGuI+4sbTohkzaxUd6RX9rUcC75BKaQS0grFUDIqeo18aAxqjtf7F0o/tUVo
         ZI5YXlTTzptJfc5GEkO3m3fbpOjyZ62BZkOwwy8LdIHi6JBFqeXFFlYxilcwoT/SQef4
         361a8hLOijA/7CAbs3XJi8P9FpJgdDPV3b1LpvinChdpPXO45ioswaLrU49vdH2CRxq2
         5AprEbmtQuRebnDy2DBv3Sg14fEID4OtnQY5DoQBnMHm7tfvSc2EL8Bxtg5f2FYXa8aa
         s3TLURGnIJaJhfPwZWzqGE+bRBzFJpti4JhzPXCkrUPbKFnaM1pJOPNlJwgQhlfRIg7V
         AI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ICJaP56TQ9DRa8C1YyXVWT1al8mvxYpqSagVIYpBKEQ=;
        b=Rl+nqIme1WwfcrT6tI8Q02z+kpbu2Q0wEnq7tlgZacVqhQgpLALvlkMBWfBkZrD4lg
         KmovWwuxp94IyxF0xV+cleQKaDNVJNKLH41HYbmAeoB2Ot6t2mz8Dh+u+XpNFXqrs4rS
         SnN8fTfZ3/oUmOovQcJ3J+N6Wv4o21Jt1yrSnArkZMtDQPS0HM/Q1X9fVVcMqLyi6oD9
         t0rLBPBoXo36PUzEjwsBFzrvmco4HhlC70yiawy9qiLa/GktdZac6nE1/XsI+iWJFsfj
         T6iST4GeWtP5Vqjt9CoF96pGexj97yO+NwdkPZKQtBGo/sFSKVeKSc/V4JNmNQAbK655
         3Cdg==
X-Gm-Message-State: AOAM532BGQPbIr/bhieZ9IRPnQ2HqYicmJzzXtMWJBhG+xvys5/n6PGI
        p/a5C5UMX345XV62Ujr1mU54Tg==
X-Google-Smtp-Source: ABdhPJwptLHnEtAnMoeDbzeSu8013SEJi2aLOBtUCrU6fm4GVGwNJnof5d6MREyFtZngci6G0Dd1ig==
X-Received: by 2002:a17:90a:9604:: with SMTP id v4mr16588427pjo.201.1614599684157;
        Mon, 01 Mar 2021 03:54:44 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id h6sm16555987pfv.84.2021.03.01.03.54.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 03:54:43 -0800 (PST)
Date:   Mon, 1 Mar 2021 17:24:41 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, wsa@kernel.org,
        jasowang@redhat.com, wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210301115441.a4s5xzwm6d6ohz7f@vireshk-i7>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01-03-21, 14:41, Jie Deng wrote:
> +/**
> + * struct virtio_i2c_req - the virtio I2C request structure
> + * @out_hdr: the OUT header of the virtio I2C message
> + * @write_buf: contains one I2C segment being written to the device
> + * @read_buf: contains one I2C segment being read from the device
> + * @in_hdr: the IN header of the virtio I2C message
> + */
> +struct virtio_i2c_req {
> +	struct virtio_i2c_out_hdr out_hdr;
> +	u8 *write_buf;
> +	u8 *read_buf;
> +	struct virtio_i2c_in_hdr in_hdr;
> +};

I am not able to appreciate the use of write/read bufs here as we
aren't trying to read/write data in the same transaction. Why do we
have two bufs here as well as in specs ?

What about this on top of your patch ?

---
 drivers/i2c/busses/i2c-virtio.c | 31 +++++++++++--------------------
 include/uapi/linux/virtio_i2c.h |  3 +--
 2 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
index 8c8bc9545418..e71ab1d2c83f 100644
--- a/drivers/i2c/busses/i2c-virtio.c
+++ b/drivers/i2c/busses/i2c-virtio.c
@@ -67,14 +67,13 @@ static int virtio_i2c_send_reqs(struct virtqueue *vq,
 		if (!buf)
 			break;
 
+		reqs[i].buf = buf;
+		sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);
+
 		if (msgs[i].flags & I2C_M_RD) {
-			reqs[i].read_buf = buf;
-			sg_init_one(&msg_buf, reqs[i].read_buf, msgs[i].len);
 			sgs[outcnt + incnt++] = &msg_buf;
 		} else {
-			reqs[i].write_buf = buf;
-			memcpy(reqs[i].write_buf, msgs[i].buf, msgs[i].len);
-			sg_init_one(&msg_buf, reqs[i].write_buf, msgs[i].len);
+			memcpy(reqs[i].buf, msgs[i].buf, msgs[i].len);
 			sgs[outcnt++] = &msg_buf;
 		}
 
@@ -84,13 +83,8 @@ static int virtio_i2c_send_reqs(struct virtqueue *vq,
 		err = virtqueue_add_sgs(vq, sgs, outcnt, incnt, &reqs[i], GFP_KERNEL);
 		if (err < 0) {
 			pr_err("failed to add msg[%d] to virtqueue.\n", i);
-			if (msgs[i].flags & I2C_M_RD) {
-				kfree(reqs[i].read_buf);
-				reqs[i].read_buf = NULL;
-			} else {
-				kfree(reqs[i].write_buf);
-				reqs[i].write_buf = NULL;
-			}
+			kfree(reqs[i].buf);
+			reqs[i].buf = NULL;
 			break;
 		}
 	}
@@ -118,14 +112,11 @@ static int virtio_i2c_complete_reqs(struct virtqueue *vq,
 			break;
 		}
 
-		if (msgs[i].flags & I2C_M_RD) {
-			memcpy(msgs[i].buf, req->read_buf, msgs[i].len);
-			kfree(req->read_buf);
-			req->read_buf = NULL;
-		} else {
-			kfree(req->write_buf);
-			req->write_buf = NULL;
-		}
+		if (msgs[i].flags & I2C_M_RD)
+			memcpy(msgs[i].buf, req->buf, msgs[i].len);
+
+		kfree(req->buf);
+		req->buf = NULL;
 	}
 
 	return i;
diff --git a/include/uapi/linux/virtio_i2c.h b/include/uapi/linux/virtio_i2c.h
index 92febf0c527e..61f0086ac75b 100644
--- a/include/uapi/linux/virtio_i2c.h
+++ b/include/uapi/linux/virtio_i2c.h
@@ -48,8 +48,7 @@ struct virtio_i2c_in_hdr {
  */
 struct virtio_i2c_req {
 	struct virtio_i2c_out_hdr out_hdr;
-	u8 *write_buf;
-	u8 *read_buf;
+	u8 *buf;
 	struct virtio_i2c_in_hdr in_hdr;
 };
 
-- 
viresh
