Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADDFB4CB8EF
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 09:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbiCCIcs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 03:32:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbiCCIcq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 03:32:46 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E723172890;
        Thu,  3 Mar 2022 00:31:58 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id i1so3900822plr.2;
        Thu, 03 Mar 2022 00:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uLpL759Hbmm5qMBXDqRYgb9jZJR2BhAEaMh2uUGe3dE=;
        b=e+CC4awVZmKTGdEfnWJgf52O0bvQhKqqgQjPr4o69Bux8vgwHbb5ZvJ0X5CBVZD611
         lhM+A2BPkr0ogxuXMcsse6gn6bi3SPbJbVQsFTfcbMZP2FZ90SkKoHtpdDwQ1UzO8RRW
         XiLTgQ90SVBniY0bB4eVuph9Po7QO4yomoI6LItgdo93v6bSU/yZa8/I0Z+9W+u1o6uZ
         z0mTwZwQW85rHoV8rG/kPINDSUrpcdU5NeGrM4KeXyguN8hM1d21acAbL9HAKhs79X+/
         E6ICQiAK7ncTE3ye1Nij7doXsjSsnP3mOMZarK7Acau+S3z24lzd9za2ShuM4UgliPOY
         rNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uLpL759Hbmm5qMBXDqRYgb9jZJR2BhAEaMh2uUGe3dE=;
        b=Al0PRtpSc1auXXqrTOuHz0OP5Nh3BZ8pkl82juIvd44Zk36telMelrhjR/hdwiqhvI
         WQCOdrNIIVKAbHLqoStwUuvE4eFAKFcIndQCW+NzLq2jdbvmUk1hYyL1qChHs6oK4zYs
         UsU7UYE9vQBVIK+Qr+jlWlgfMjHghec/EMCbiIsKdvvMaCFr9cw3Xp4HjNTGVi4vV2bu
         Ew6KosRZJjSmoEmWISNSAMCnZ7jozHgObC4T8GIyV0LSE4T+qgJS28kizprJjWUqIvWN
         aBC+IH0fnTzcaLMQPZKXg6MVYAjX5c4him+S1857SMcw+5vWoM1NF+hbdBAgwrACPCzV
         GTBg==
X-Gm-Message-State: AOAM530sn+CWNwHgoMI+75QTFhsewKEXN6UQwQ91Y6oTUP7lX4HE4/gX
        aLf5Mh6VAffJ6W2j8B6ZzA==
X-Google-Smtp-Source: ABdhPJzfa0A1UQ85/RXmOfLN5Y8Yrwrkjut7cMcn/zZb/mRUhLjS0gIGh6KrPzS3/O5S6TblIeWmLw==
X-Received: by 2002:a17:902:6b04:b0:14f:2cc0:fa98 with SMTP id o4-20020a1709026b0400b0014f2cc0fa98mr35126027plk.44.1646296317415;
        Thu, 03 Mar 2022 00:31:57 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
        by smtp.gmail.com with ESMTPSA id v21-20020a056a00149500b004e15a113300sm1754956pfu.198.2022.03.03.00.31.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 00:31:57 -0800 (PST)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/11] i2c: npcm: Change the way of getting GCR regmap
Date:   Thu,  3 Mar 2022 16:31:34 +0800
Message-Id: <20220303083141.8742-5-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083141.8742-1-warp5tw@gmail.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tali Perry <tali.perry1@gmail.com>

Change the way of getting NPCM system manager reigster (GCR)
and still maintain the old mechanism as a fallback if getting
nuvoton,sys-mgr fails while working with the legacy devicetree
file.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 4c225e1a058f..fa12212b2428 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2236,6 +2236,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 	static struct regmap *clk_regmap;
 	int irq;
 	int ret;
+	struct device_node *np = pdev->dev.of_node;
 
 	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
 	if (!bus)
@@ -2250,7 +2251,10 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 		return PTR_ERR(i2c_clk);
 	bus->apb_clk = clk_get_rate(i2c_clk);
 
-	gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
+	gcr_regmap = syscon_regmap_lookup_by_phandle(np, "nuvoton,sys-mgr");
+	if (IS_ERR(gcr_regmap))
+		gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
+
 	if (IS_ERR(gcr_regmap))
 		return PTR_ERR(gcr_regmap);
 	regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL);
-- 
2.17.1

