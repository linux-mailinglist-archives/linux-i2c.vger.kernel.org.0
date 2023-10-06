Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4E4A7BB043
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Oct 2023 04:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbjJFCWt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Oct 2023 22:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjJFCWk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Oct 2023 22:22:40 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A8E102
        for <linux-i2c@vger.kernel.org>; Thu,  5 Oct 2023 19:22:39 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c0ecb9a075so12389855ad.2
        for <linux-i2c@vger.kernel.org>; Thu, 05 Oct 2023 19:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1696558958; x=1697163758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgD2XlWyO1IkxKrZZ4NotDzi7FafWvmObFFGZh4fKtk=;
        b=Im7qPefsjDS9nbLox8rqJoVIvjqksZW2nFDzD7g83S4eQToetBFtf7KowlaD+pp27H
         6kZvdBYd/9vvoMkMs2kaTp8k6gcKzeblf+HoT+n82oxQ+F5l8vPLv06AMKG/MXietmI6
         lJEA6n7n3YxV1sr1FM1Pe5nljZhDep/nqDao31U9bR+93nyFlB8pQH4EkNeU3OxdmR/+
         qtnLQ2A2G5OLcKxmVZiJQE4I7KPloDN7vae6K4IndRPoEBzolxawGmVLkmFYA3uK+uLh
         BT//2uZyX9/un0E40hNwzW2FZXvks3pPG8/e1aV1ynC9eGo6+KdJAIO3U6RdUttv78Gu
         G09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696558958; x=1697163758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgD2XlWyO1IkxKrZZ4NotDzi7FafWvmObFFGZh4fKtk=;
        b=dleVDig67llbfnOyF4afsXXUKPFxIsRTJk3usSPYMiC649psP/j5fgGVB00dCP/fdk
         EZFR90PzzmYICUJXiFjfXc3iu19bkPrHi53+27HHhb6PJakZq2oD6oINegzOrTFR0Mwm
         TNur3iadJAi5oWBqiKqY/f1S4rQ4O/GTJc2nqk52qdwwv+dZSnUz8Zd1/4egn590gigO
         lfdgWNxWrMQXovv5oiqCu1K1CHtTGYa93JPFIKUORksc4oN3QSEsUIBGjW+JdzBTUA5/
         A9HPpxKvXfEkkIimPDedXDJvfhPxvMmx3U68HVZ6u44QlrO520ps9ARHtWgironzaomi
         JNeA==
X-Gm-Message-State: AOJu0YwIqhgMSwr8FQBOI3mPITa3lFQqObrGrBjtxrIlrVHgFsbbA+h2
        L2q77rw5CoGqs5w7iTATAxOhXw==
X-Google-Smtp-Source: AGHT+IG+mQuSZhsZ7s1GbN7oZkzhFLn2RCUCg1Is6VpUBCVfYtfZj/tayH7KU48aIsSbMRFm9GPikA==
X-Received: by 2002:a17:902:e542:b0:1c3:d07f:39f7 with SMTP id n2-20020a170902e54200b001c3d07f39f7mr7233603plf.62.1696558958573;
        Thu, 05 Oct 2023 19:22:38 -0700 (PDT)
Received: from localhost ([49.7.199.22])
        by smtp.gmail.com with ESMTPSA id 10-20020a170902c20a00b001ae0152d280sm2487893pll.193.2023.10.05.19.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 19:22:38 -0700 (PDT)
From:   Jian Zhang <zhangjian.3032@bytedance.com>
To:     brendan.higgins@linux.dev, benh@kernel.crashing.org,
        joel@jms.id.au, andrew@aj.id.au
Cc:     zhangjian3032@gmail.com, yulei.sh@bytedance.com,
        xiexinnan@bytedance.com, Andi Shyti <andi.shyti@kernel.org>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Tommy Huang <tommy_huang@aspeedtech.com>,
        Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org (open list:ARM/ASPEED I2C DRIVER),
        openbmc@lists.ozlabs.org (moderated list:ARM/ASPEED I2C DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT),
        linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] i2c: aspeed: Fix i2c bus hang in slave read
Date:   Fri,  6 Oct 2023 10:22:33 +0800
Message-Id: <20231006022233.3963590-1-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

In this case, the i2c bus will be reset, but the slave_state reset is
missing.

Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when timeout occurs")
Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

---
Changelog:
 v3 - move to __aspeed_i2c_reg_slave.
 v2 - remove the i2c slave reset and only move the
 `bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE` to the aspeed_i2c_init.
---
 drivers/i2c/busses/i2c-aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 5a416b39b818..28e2a5fc4528 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -749,6 +749,8 @@ static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 slave_addr)
 	func_ctrl_reg_val = readl(bus->base + ASPEED_I2C_FUN_CTRL_REG);
 	func_ctrl_reg_val |= ASPEED_I2CD_SLAVE_EN;
 	writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);
+
+	bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
 }
 
 static int aspeed_i2c_reg_slave(struct i2c_client *client)
@@ -765,7 +767,6 @@ static int aspeed_i2c_reg_slave(struct i2c_client *client)
 	__aspeed_i2c_reg_slave(bus, client->addr);
 
 	bus->slave = client;
-	bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
 	spin_unlock_irqrestore(&bus->lock, flags);
 
 	return 0;
-- 
2.30.2

