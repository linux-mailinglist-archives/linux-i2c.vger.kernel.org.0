Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7081B77713E
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Aug 2023 09:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233810AbjHJHW3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Aug 2023 03:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232876AbjHJHW2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Aug 2023 03:22:28 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE8F21BF7
        for <linux-i2c@vger.kernel.org>; Thu, 10 Aug 2023 00:22:02 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6873a30d02eso413381b3a.3
        for <linux-i2c@vger.kernel.org>; Thu, 10 Aug 2023 00:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691652122; x=1692256922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oCsFa++ogn7H/UBzN64O3INdySKF0/YyEIYVfwtbNi4=;
        b=cCKBkQQg3S66/frhBsmAlmRxovXilvClD1MVf+P/F/DowmmK8Ocu/GlQ9T4uPUxv4U
         u12XtTQ0rXPiTyvqbb55WTf+xmwq7qnFLIuoyT5J7YPA1SzpiRY+LCiKiTxbL73hTN3X
         pXOnqtky7JiPc0mU49MbYEH9OWr5oMrktoGi1Y6Fm7MQVTtLRkyRpvZB5AUYp7ILOAuu
         WbmmbVpIZAiQkjMdzY89weCPT3rE+mKG3NuBf2Hizx5BMKmbrYAtF6OhvTbg98urRmp4
         9JwvnEHzcwNDk0FeudEeL8ALFcAtKHd7IFL6MdTqicfcckmSlIdYbKK1ItGJB8uHzoLb
         TEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691652122; x=1692256922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCsFa++ogn7H/UBzN64O3INdySKF0/YyEIYVfwtbNi4=;
        b=C53UeZad1BO5ZSZ8QTl2V22BrYHfnTXpnU7KPjvHVqsFcSmgK6XwvOrg2dKJv1v1Un
         BDKzS7NHRZJNuYqSgxeS1V5shwXDP6VxbqqFEUTC3dt9cadkh9qDUtkbFmxqwPPtn1F3
         FkJSNjyNs7L5E1Fqk8gWBH+wE0Lo5JdVIyg6UQXxSG6zDEQSuaLWPhle/oBAFul33I1m
         nvTUH03wzvbb/7vTFyQumFSWp8Fic0xjqzCFgVFBoz25bvlSwWNLbAVT8P6GGEHHf8H0
         gor/HM7cHsmixO6BOa58yupmbP4exE9hGlVKOSsiYOtURf31jW3/ubOyxAiDCjR6xmG+
         dfqg==
X-Gm-Message-State: AOJu0YzFdVA/bG/pTsVIDp4HdnlJ8lf5cThBh8DLxL15/LBzM57X+W5d
        Yh7SJLjJcbIg5k4gtT3mlJ+d+Q==
X-Google-Smtp-Source: AGHT+IEND+WgzSbKSq1IjO2/9yuM5dCUzGFWbXi0PrhVd/2hDTcBqIjIu+42sIy/hJZwuV+CdVSa7A==
X-Received: by 2002:a05:6a20:325a:b0:134:a8a1:3bf with SMTP id hm26-20020a056a20325a00b00134a8a103bfmr1309418pzc.30.1691652122340;
        Thu, 10 Aug 2023 00:22:02 -0700 (PDT)
Received: from localhost ([49.7.199.210])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b001b8a3a0c928sm880830plc.181.2023.08.10.00.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 00:22:02 -0700 (PDT)
From:   Jian Zhang <zhangjian.3032@bytedance.com>
To:     brendan.higgins@linux.dev, benh@kernel.crashing.org,
        joel@jms.id.au, andrew@aj.id.au
Cc:     zhangjian3032@gmail.com, yulei.sh@bytedance.com,
        xiexinnan@bytedance.com,
        linux-i2c@vger.kernel.org (open list:ARM/ASPEED I2C DRIVER),
        openbmc@lists.ozlabs.org (moderated list:ARM/ASPEED I2C DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT),
        linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] i2c: aspeed: Fix i2c bus hang in slave read
Date:   Thu, 10 Aug 2023 15:21:55 +0800
Message-Id: <20230810072155.3726352-1-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
as a slave, a situation arises where the master sends a START signal
without the accompanying STOP signal. This action results in a
persistent I2C bus timeout. The core issue stems from the fact that
the i2c controller remains in a slave read state without a timeout
mechanism. As a consequence, the bus perpetually experiences timeouts.

This proposed patch addresses this problem by introducing a status
check during i2c transmit timeouts. In the event that the controller
is in a slave read state, the i2c controller will be reset to restore
proper functionality and allow the I2C bus to resume normal operation.

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index e76befe3f60f..1a95205fc946 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -113,6 +113,7 @@
 		 ASPEED_I2CD_M_RX_CMD |					       \
 		 ASPEED_I2CD_M_TX_CMD |					       \
 		 ASPEED_I2CD_M_START_CMD)
+#define ASPEED_I2CD_SLAVE_CMDS_MASK			GENMASK(31, 29)
 
 /* 0x18 : I2CD Slave Device Address Register   */
 #define ASPEED_I2CD_DEV_ADDR_MASK			GENMASK(6, 0)
@@ -706,6 +707,22 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
 		     ASPEED_I2CD_BUS_BUSY_STS))
 			aspeed_i2c_recover_bus(bus);
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/*
+		 * If master timed out and bus is in slave mode.
+		 * reset the slave mode.
+		 */
+		if (readl(bus->base + ASPEED_I2C_CMD_REG) & ASPEED_I2CD_SLAVE_CMDS_MASK) {
+			spin_lock_irqsave(&bus->lock, flags);
+			u32 func_ctrl_reg_val = readl(bus->base + ASPEED_I2C_FUN_CTRL_REG);
+
+			writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
+			writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);
+			bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
+			spin_unlock_irqrestore(&bus->lock, flags);
+		}
+#endif
+
 		/*
 		 * If timed out and the state is still pending, drop the pending
 		 * master command.
-- 
2.30.2

