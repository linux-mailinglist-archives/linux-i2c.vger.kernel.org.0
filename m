Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE947AC60A
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Sep 2023 03:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjIXBC1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 Sep 2023 21:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjIXBC0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 Sep 2023 21:02:26 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53710109
        for <linux-i2c@vger.kernel.org>; Sat, 23 Sep 2023 18:02:20 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6c0d6fef60cso2756761a34.1
        for <linux-i2c@vger.kernel.org>; Sat, 23 Sep 2023 18:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1695517339; x=1696122139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X73lBW8dYp//48BBb52n2l32mOLJg99MbHSqLw+5gsg=;
        b=wFJx7o4tUl4/n/IMKEhKUCd4OUv0LRxnWsKwJp0PJ6Q324JZs4DL15T0zmbyZkC2+d
         Nmuqw2JsXDFbFG6fZBoLmfBlfnYfQvy8b+GGomvbHHuCwERyRUBzKyZdPsndq03gGyDy
         RnNkqjZn9w6Imv4nS0WaCJ/aTBcZv82bZyiWHUvWYpAQk+c/nVcTvbn5NA/tO+TwgqQA
         j+Ng7GpngfgSPDeItke/mLSAuaIwjhSasw9yIHcm1qdfA281HjOs9FnBgcaUMQlrwaE9
         ace7afluryHB3UUoSGNnDCRCwcVuRuKARqrwixp3LmefVvEvbtEIMX8nSYm3GiYNJiwd
         uqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695517339; x=1696122139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X73lBW8dYp//48BBb52n2l32mOLJg99MbHSqLw+5gsg=;
        b=jch4U6yfCH3hnJt0jlHpFSAI/1dUO0zt37V/0yvCwkhIffh5Xh98egyyZnswy7KOoW
         xpxK45ACa/wcOKMnFwCTpAMoEIE/xMtvNT6el4UM57H2CRHLA3YSUxgCj2rlxLiK4KUi
         CQXKrVjstEnMpewOu+oXEYU70ljFC1D8+DvKrCCZtlPBwvwfNWF9SgHR6IyqiV5XcR4u
         KGgd8uuHyh3t+5EjTYpPyRKSpLyRypxv+DdQh+jur0Jbisa7jX4Ol7f9PsOi5VtViRvk
         O6ACtSyONkxYh+UBnLQtgQsonEhzozvlZIddEfpBWaKP9wGdIyVlfD4UCtNbujjOAfKa
         X+tg==
X-Gm-Message-State: AOJu0YwIALkmG1aK181HmpAbL903gIUCMnTE0ytlMcYGz0IF7lSCFiJ4
        HIE+RyikWJ5GUAqe47xjML9A7v1qqTjSA1FI0KcPAQ==
X-Google-Smtp-Source: AGHT+IEHCUq8tKH+V3+QkWwMwP5hmPglWU/SHOlNBefQAgMc1vl7Isp7xNsJgSzP1G/v0dpQoxLBiQ==
X-Received: by 2002:a05:6808:4d4:b0:3a7:35af:bbc0 with SMTP id a20-20020a05680804d400b003a735afbbc0mr4087968oie.54.1695517339619;
        Sat, 23 Sep 2023 18:02:19 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2620:15c:2a3:200:fa82:e505:60ca:9f9f])
        by smtp.gmail.com with ESMTPSA id c8-20020a170903234800b001b8b07bc600sm5922016plh.186.2023.09.23.18.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 18:02:19 -0700 (PDT)
From:   "William A. Kennington III" <william@wkennington.com>
To:     tmaimon77@gmail.com, tali.perry1@gmail.com, avifishman70@gmail.com,
        wsa@kernel.org, joel@jms.id.au
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "William A. Kennington III" <william@wkennington.com>
Subject: [PATCH] i2c: npcm7xx: Fix callback completion ordering
Date:   Sat, 23 Sep 2023 18:02:14 -0700
Message-ID: <20230924010214.3700150-1-william@wkennington.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sometimes, our completions race with new master transfers and override
the bus->operation and bus->master_or_slave variables. This causes
transactions to timeout and kernel crashes less frequently.

To remedy this, we re-order all completions to the very end of the
function.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 495a8b5f6a2b..ae4bae63ad4f 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -694,6 +694,7 @@ static void npcm_i2c_callback(struct npcm_i2c *bus,
 {
 	struct i2c_msg *msgs;
 	int msgs_num;
+	bool do_complete = false;
 
 	msgs = bus->msgs;
 	msgs_num = bus->msgs_num;
@@ -722,23 +723,17 @@ static void npcm_i2c_callback(struct npcm_i2c *bus,
 				 msgs[1].flags & I2C_M_RD)
 				msgs[1].len = info;
 		}
-		if (completion_done(&bus->cmd_complete) == false)
-			complete(&bus->cmd_complete);
-	break;
-
+		do_complete = true;
+		break;
 	case I2C_NACK_IND:
 		/* MASTER transmit got a NACK before tx all bytes */
 		bus->cmd_err = -ENXIO;
-		if (bus->master_or_slave == I2C_MASTER)
-			complete(&bus->cmd_complete);
-
+		do_complete = true;
 		break;
 	case I2C_BUS_ERR_IND:
 		/* Bus error */
 		bus->cmd_err = -EAGAIN;
-		if (bus->master_or_slave == I2C_MASTER)
-			complete(&bus->cmd_complete);
-
+		do_complete = true;
 		break;
 	case I2C_WAKE_UP_IND:
 		/* I2C wake up */
@@ -752,6 +747,8 @@ static void npcm_i2c_callback(struct npcm_i2c *bus,
 	if (bus->slave)
 		bus->master_or_slave = I2C_SLAVE;
 #endif
+	if (do_complete)
+		complete(&bus->cmd_complete);
 }
 
 static u8 npcm_i2c_fifo_usage(struct npcm_i2c *bus)
-- 
2.42.0.515.g380fc7ccd1-goog

