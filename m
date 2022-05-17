Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1713F529F06
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 12:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235136AbiEQKNL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 May 2022 06:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343887AbiEQKMm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 May 2022 06:12:42 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABD91C133;
        Tue, 17 May 2022 03:12:00 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id l14so6025960pjk.2;
        Tue, 17 May 2022 03:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oBrUS4cUnYCukBR9QE9N3XBr+fjKNffpl/fgC0cqOiw=;
        b=U4TUEDQdH7GITaysYyldEdGwlpv6UEzDB5eXkMk+C/CuL4/H0IMXqID1CQghmGhXBZ
         tOhdwuPM5FuRUGd+cwETTJA+HuuxxWheGPzqkyaJwnS9H1Q6MGLiJ6kw0ZP0u/sB/HcF
         AmmzSNBe8g5HcxIMtyUlVg7KSamG2zQ03qfiJtGm0e334EOm8zpR/h4gS86mu1hv7ptG
         6TtY0+LM2jXYoidXplKAAx49o7iVt2clz2lghoiLmyBbgN0+JBawh/IzdcsunMu7cHaH
         vsJ7aPM64E1rtimGzMqWCO1dkVMMIin+FyiumV5iQppsXcIeFeoauf+M9iHDrE4WDOkT
         7fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oBrUS4cUnYCukBR9QE9N3XBr+fjKNffpl/fgC0cqOiw=;
        b=VHuyIhOzoomAQAnn3Ziuyz6/V0JHt1uRalowZqa5JQuSQJZh6XOc+lAuX1g0bIrVCM
         ZMo360YpNPUQfWEOyGTl3pNKrKaVOCENI//duyFAKR2zF7ULe34HkaLi+q2aefRYc1zf
         4khU4P2wI8XISBVi9mXBkg9Hf1DwPGxQfKTtvoeqTwZQsvhAqIs8A5YIl//oG42+w+FX
         q6jqlHnb1HZy96D8xeN+laIetmbSsM8hKBYQrUTYNO70Y8XQjJJ9yXtQCG50C+/YmeIT
         GxZtFoWzT+ZlVTgSE7cvhtLzKmRUxWZBoMAatk08oyGkf6U1+SdEs8EFwVG+KqGDGC2K
         Z51A==
X-Gm-Message-State: AOAM531YUh53ra28kJoPkyaqnFwTte/wZ0DoBNF/MkJxAVuqC72h42rk
        y27F7+Uaow4mhoFDo8M+xQ==
X-Google-Smtp-Source: ABdhPJwyHdOXXr1USDm5VHABkdGunFN0dkddP7cfCZyjpdaZzp/TBVc6dDq5QHZCZLtB6IsZoWphwA==
X-Received: by 2002:a17:902:cf0a:b0:156:39c9:4c44 with SMTP id i10-20020a170902cf0a00b0015639c94c44mr21528650plg.124.1652782319470;
        Tue, 17 May 2022 03:11:59 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net. [220.133.130.217])
        by smtp.gmail.com with ESMTPSA id 193-20020a6214ca000000b0050dc76281ecsm902465pfu.198.2022.05.17.03.11.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 May 2022 03:11:59 -0700 (PDT)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org,
        rafal@milecki.pl, sven@svenpeter.dev, jsd@semihalf.com,
        jie.deng@intel.com, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, warp5tw@gmail.com, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/10] i2c: npcm: Change the way of getting GCR regmap
Date:   Tue, 17 May 2022 18:11:34 +0800
Message-Id: <20220517101142.28421-3-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517101142.28421-1-warp5tw@gmail.com>
References: <20220517101142.28421-1-warp5tw@gmail.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 71aad029425d..de4e5f2f3e5a 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2229,11 +2229,12 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 
 static int npcm_i2c_probe_bus(struct platform_device *pdev)
 {
-	struct npcm_i2c *bus;
-	struct i2c_adapter *adap;
-	struct clk *i2c_clk;
+	struct device_node *np = pdev->dev.of_node;
 	static struct regmap *gcr_regmap;
 	static struct regmap *clk_regmap;
+	struct i2c_adapter *adap;
+	struct npcm_i2c *bus;
+	struct clk *i2c_clk;
 	int irq;
 	int ret;
 
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

