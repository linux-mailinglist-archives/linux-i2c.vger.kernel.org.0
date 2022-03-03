Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5DE4CB8F1
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 09:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbiCCIct (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 03:32:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbiCCIcr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 03:32:47 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20C017288C;
        Thu,  3 Mar 2022 00:32:00 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id ay5so3903926plb.1;
        Thu, 03 Mar 2022 00:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gemv/m3fy5mH7vN3z4SfVeW61ie6+SbsNCmd1e66iDM=;
        b=qOb/GhQmaW5qzuMbeq6CVTbF0XKcUkXoSq4Tw0lrE9tI0NC8uGOjn1c2iX8uEZQvTh
         pifD0Ac3NjO/Dpy2XMMqyAJAL3c6WU0M2xfF6aU9ZF5efYgwxsseDauE5znM44M+W3M1
         hDcyd/jmAaWOXymcIryXBoYtA3W4GRoWQ/JgyYDMhaWLPcYzsHErv4KFWX/VfSvW/ygz
         tLxOB5FNrgLsCC8EQjMeLi5UiimRZ6Be87GJEwkQMJqUm3O7G0A35Ym8SxidfWLynZrs
         08sQL0ddLlyjD5SOw3ggGouUNXxhL23ibonAsWxuLLXb9dZankXlQdLjphwOxhv23ODC
         4zYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gemv/m3fy5mH7vN3z4SfVeW61ie6+SbsNCmd1e66iDM=;
        b=m7+egBQED2rZXQ9VXzWy6O194PPih4LWfSvDocxZ+UnXun+QPWTCg8s+vDWfhqUb29
         +vVcAzXsqbFIY8abtVTfMtX1jjda2Xs2FpgnRxE3IsXaOupiXVTpSvJSnqT5D9tI/A7K
         AfY/iTazQnQPuMP6xtVIxS0uICPTFaXoZwBFBGHGqL7aPEDZAYAj3j4Epr0MWUGprj8R
         duumt0ubUgLn90Om0DfdiXlMf5069e1mvsfsPbq3PZZ7dPpH57NHzJZNTqvbjQ2ggvQL
         bqLnzn7o0nFUq/tZYiC5SnR1TEahcuSyofn2UVKjahmNsLgpkQ+lXuSPZoveJSsfnIVv
         yCWw==
X-Gm-Message-State: AOAM532pTmwynhsPzaW6BbbszjXn5zH8cYBO+JkQdzAZ3/z7NGzvnh/p
        z2T+ZqDP+k6Nr9fRBZqm7A==
X-Google-Smtp-Source: ABdhPJw7csZ9mmUKOrvkTmQLtl79hsqW2wKR7aaJgSWlydcfx7rL96BlJq+OKUTqLzAq+G0r+Yq5Yw==
X-Received: by 2002:a17:90a:ba8e:b0:1bc:202b:8657 with SMTP id t14-20020a17090aba8e00b001bc202b8657mr4190100pjr.16.1646296320231;
        Thu, 03 Mar 2022 00:32:00 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
        by smtp.gmail.com with ESMTPSA id t5-20020a17090ae50500b001bc4ec15949sm7330431pjy.2.2022.03.03.00.31.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 00:31:59 -0800 (PST)
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
Subject: [PATCH v3 05/11] i2c: npcm: Remove unused variable clk_regmap
Date:   Thu,  3 Mar 2022 16:31:35 +0800
Message-Id: <20220303083141.8742-6-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083141.8742-1-warp5tw@gmail.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
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
index fa12212b2428..c41de3afcf38 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2233,7 +2233,6 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 	struct i2c_adapter *adap;
 	struct clk *i2c_clk;
 	static struct regmap *gcr_regmap;
-	static struct regmap *clk_regmap;
 	int irq;
 	int ret;
 	struct device_node *np = pdev->dev.of_node;
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

