Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0497C529F01
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 12:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343711AbiEQKNH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 May 2022 06:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343767AbiEQKMo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 May 2022 06:12:44 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554891C92C;
        Tue, 17 May 2022 03:12:01 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id a191so16538074pge.2;
        Tue, 17 May 2022 03:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z+v7OeDU19Dx5OqvJml/LWDpfKUkpKDzMruV+njhM6U=;
        b=BFLBvUFdFjhCmJ5PZQyLahqwcrEeVsJb8I2uszKR2JGRTbHVGU484f+Exmvt8pR8aA
         r0/HSIuQ+pDcBeQt3nOxWqUnXgUXDwwWFjQlU9Ex23B5cjQzUrmmWn9jtTtKWrK7Xehs
         OCg5LB5iCu7aGmidRUaZWww+ZJRYDKxfvXnXOqoD3jwXU9W6AMZ7iWLfwN3tsBEMMWZx
         cNqEnq+TKjaAdtV32WvdnOqEWPqXMTAhaLi0mH1VnevbTngCe0O+mxEyMuqiQZ1uDX4i
         IsuyUvPtbt/1n4W1rTsk9o2rk0P+fLafpHKP31DEGBGk4PdffXw093rlfuLhhYEizbfK
         yu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z+v7OeDU19Dx5OqvJml/LWDpfKUkpKDzMruV+njhM6U=;
        b=oGZ1jsiHFAcnKLo0dotX4UzzL7XdRrrTiaskXjt5lNwDrST07T5Mb/taXx/yiOXRMi
         88Kz+69x321aPvCy0cNrzrVOlr4thxCz0o1Saf4YYGJGRolVcaQmF9VH9+2uol516coE
         QSD6P9VD1HNaTThY+tJXqjteU7sPE8pgSsXRaVobVrf0bFScSDdevEKwPxnvZPaX5VlZ
         bQL1HWM7MPwpqzJveQkwDgsbfiOnKHqCij29G213sCvwnI6d4ja4G0Iox8lZpI4QGkl5
         pZVjuOUt1/55iKKO3erceULExmi8/b/ufuLRhuwFk28JbSyIndALWYy8tACCT+BHlxdR
         WY5Q==
X-Gm-Message-State: AOAM533+vFMxRYZec2Jf2tRg97DFCGk5ohBlIs0zf6ETRbE8BsZ8dTEW
        XvLEg41V/b1asIE2jrlyqw==
X-Google-Smtp-Source: ABdhPJy4CbT2fr0u0NJFcGxWZtYo/tMJgWqT7K5+lEA2ttjksht9DWTaHEpJJEJocxnzFfxwEutZPQ==
X-Received: by 2002:a05:6a00:1c5c:b0:505:7469:134a with SMTP id s28-20020a056a001c5c00b005057469134amr21921186pfw.16.1652782321136;
        Tue, 17 May 2022 03:12:01 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net. [220.133.130.217])
        by smtp.gmail.com with ESMTPSA id t12-20020a1709027fcc00b0015e8d4eb234sm8598283plb.126.2022.05.17.03.12.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 May 2022 03:12:00 -0700 (PDT)
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
Subject: [PATCH v5 03/10] i2c: npcm: Remove unused variable clk_regmap
Date:   Tue, 17 May 2022 18:11:35 +0800
Message-Id: <20220517101142.28421-4-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517101142.28421-1-warp5tw@gmail.com>
References: <20220517101142.28421-1-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Remove unused variable clk_regmap.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index de4e5f2f3e5a..550e4a4d1e01 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2231,7 +2231,6 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	static struct regmap *gcr_regmap;
-	static struct regmap *clk_regmap;
 	struct i2c_adapter *adap;
 	struct npcm_i2c *bus;
 	struct clk *i2c_clk;
@@ -2259,10 +2258,6 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 		return PTR_ERR(gcr_regmap);
 	regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL);
 
-	clk_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-clk");
-	if (IS_ERR(clk_regmap))
-		return PTR_ERR(clk_regmap);
-
 	bus->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bus->reg))
 		return PTR_ERR(bus->reg);
-- 
2.17.1

