Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2C8421B26
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Oct 2021 02:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhJEAeV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Oct 2021 20:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhJEAeT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Oct 2021 20:34:19 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4070BC061749;
        Mon,  4 Oct 2021 17:32:30 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id s69so23875119oie.13;
        Mon, 04 Oct 2021 17:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t/jVZ06a5/BtkTEQsv93Iskc6/yE5SoN8Er3SXjSRo0=;
        b=k1hzRXHnpGFdgZlsdx0jjlvXflQZHrNmyq9Y4yq3OXobuDSAb8tl+BDYQ1sC8ynD+E
         ycotN17PITJ4uCL42iPToynhMClDhNtWTfi9MN91XbCuWaqePUtfIf94zFojZn/Ds0d6
         7RHu87puT/TaTBbq0fs1KggB1GPcTaTtzikoMoBy8rJaEpmgMIQmxZjYly8D7emnYD0W
         2BwS83XKxyLaiBoWvlxQhDC2X2Wyxe/VSjJCsevUOLjg8nj3ZBkbDRS+s4Q5/QBWWjiN
         H6DVVxJ9eGkCRdpXJL9n0eXwwMCcANlvmjWstFTNpHcWfzPG9ubdCac3L4nUL1b/XrAp
         NmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=t/jVZ06a5/BtkTEQsv93Iskc6/yE5SoN8Er3SXjSRo0=;
        b=KDqRAT98nP6EWs6YR4bWeazdvPU85w1BbeSj74Mjo5G2hkidwjHC/C7jeasDETYuQm
         t3P2qIYzsX0i4AOWdoMaaConk9zdhP/i/eOEzoqDLv8jbeQUYaBGdKOT/dCSDI5M20V8
         +6xbx5u79u9xR2fSgt2FqSe8Ezfc/wErmDt1EIAWGuhvSCsBGKPE8Qe05odM/f+EaQRN
         R0Zx77onI1L7u6ML/cII7U7ForyzOnQOXhkJIKynpx4fVOEtkoiUUXatf3FYwDF6/l2s
         C5QDmx7bCAZfJoL1+hJMBiYtWwsS0mtXJ2iZFTgbtZE/5dcoQrJZa+Bk6dJjOMyKsprk
         y64Q==
X-Gm-Message-State: AOAM533u01JZKRpcsepiK9TSsqdrmGQm9NFK/n6yfLbJm6L9/SJxR7SZ
        0HRXThFxpMtcC7uJhL96Pw==
X-Google-Smtp-Source: ABdhPJwjJQ7XfFdyN8Xc/JOyzSejb/WwXqAWVF8AaGEJeKNYwMKvDso72xg0AhFxYLGQwXydOMF0sw==
X-Received: by 2002:a05:6808:57:: with SMTP id v23mr117164oic.172.1633393949568;
        Mon, 04 Oct 2021 17:32:29 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id k23sm3198138ook.45.2021.10.04.17.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 17:32:28 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:1ce5:3fb4:8fe9:30d1])
        by serve.minyard.net (Postfix) with ESMTPA id E5E0F1800F7;
        Tue,  5 Oct 2021 00:32:26 +0000 (UTC)
From:   minyard@acm.org
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Andrew Manley <andrew.manley@sealingtech.com>,
        linux-kernel@vger.kernel.org, Corey Minyard <cminyard@mvista.com>,
        Corey Minyard <minyard@acm.org>
Subject: [PATCH 3/3] i2c:imx: Use an hrtimer, not a timer, for checking for bus idle
Date:   Mon,  4 Oct 2021 19:32:16 -0500
Message-Id: <20211005003216.2670632-4-minyard@acm.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005003216.2670632-1-minyard@acm.org>
References: <20211005003216.2670632-1-minyard@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

The timer is too slow and significantly reduces performance.  Use an
hrtimer to get things working faster.

Signed-off-by: Corey Minyard <minyard@acm.org>
Tested-by: Andrew Manley <andrew.manley@sealingtech.com>
Reviewed-by: Andrew Manley <andrew.manley@sealingtech.com>
---
 drivers/i2c/busses/i2c-imx.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 26a04dc0590b..4b0e9d1784dd 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -38,7 +38,7 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/spinlock.h>
-#include <linux/timer.h>
+#include <linux/hrtimer.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -53,6 +53,8 @@
 /* This will be the driver name the kernel reports */
 #define DRIVER_NAME "imx-i2c"
 
+#define I2C_IMX_CHECK_DELAY 30000 /* Time to check for bus idle, in NS */
+
 /*
  * Enable DMA if transfer byte size is bigger than this threshold.
  * As the hardware request, it must bigger than 4 bytes.\
@@ -214,8 +216,8 @@ struct imx_i2c_struct {
 	enum i2c_slave_event last_slave_event;
 
 	/* For checking slave events. */
-	spinlock_t	  slave_lock;
-	struct timer_list slave_timer;
+	spinlock_t     slave_lock;
+	struct hrtimer slave_timer;
 };
 
 static const struct imx_i2c_hwdata imx1_i2c_hwdata = {
@@ -783,13 +785,16 @@ static irqreturn_t i2c_imx_slave_handle(struct imx_i2c_struct *i2c_imx,
 	}
 
 out:
-	mod_timer(&i2c_imx->slave_timer, jiffies + 1);
+	hrtimer_try_to_cancel(&i2c_imx->slave_timer);
+	hrtimer_forward_now(&i2c_imx->slave_timer, I2C_IMX_CHECK_DELAY);
+	hrtimer_restart(&i2c_imx->slave_timer);
 	return IRQ_HANDLED;
 }
 
-static void i2c_imx_slave_timeout(struct timer_list *t)
+static enum hrtimer_restart i2c_imx_slave_timeout(struct hrtimer *t)
 {
-	struct imx_i2c_struct *i2c_imx = from_timer(i2c_imx, t, slave_timer);
+	struct imx_i2c_struct *i2c_imx = container_of(t, struct imx_i2c_struct,
+						      slave_timer);
 	unsigned int ctl, status;
 	unsigned long flags;
 
@@ -798,6 +803,7 @@ static void i2c_imx_slave_timeout(struct timer_list *t)
 	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 	i2c_imx_slave_handle(i2c_imx, status, ctl);
 	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
+	return HRTIMER_NORESTART;
 }
 
 static void i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx)
@@ -1423,7 +1429,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	spin_lock_init(&i2c_imx->slave_lock);
-	timer_setup(&i2c_imx->slave_timer, i2c_imx_slave_timeout, 0);
+	hrtimer_init(&i2c_imx->slave_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
+	i2c_imx->slave_timer.function = i2c_imx_slave_timeout;
 
 	match = device_get_match_data(&pdev->dev);
 	if (match)
@@ -1538,7 +1545,7 @@ static int i2c_imx_remove(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	del_timer_sync(&i2c_imx->slave_timer);
+	hrtimer_cancel(&i2c_imx->slave_timer);
 
 	/* remove adapter */
 	dev_dbg(&i2c_imx->adapter.dev, "adapter removed\n");
-- 
2.25.1

