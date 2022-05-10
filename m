Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9222D52108D
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 11:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238593AbiEJJVp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 05:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238581AbiEJJVn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 05:21:43 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C79E720CD9C;
        Tue, 10 May 2022 02:17:46 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id cq17-20020a17090af99100b001dc0386cd8fso1622483pjb.5;
        Tue, 10 May 2022 02:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YU+ACQq6gQmiv69eWKJ1cs7k5gUUfV2jP2s9r+r1/GM=;
        b=DJjHmuLtCJJJzNAObnAvbt4EVn2tV1C6HyPbkTNkBkt+u7YzRJWmp+9GkzK+s59HoC
         EkIuWZF78rmXclmWI+XSTsapLvSGVjtd2Pb5wumz0fMlNRrUMaehVBVDGB64cA3ycNtn
         RDmzWRi5no2zOxWpkSrc11oogx70fwsvpY/rbPLi+FhLgf8vMaQQ0cJN+GiQaO5yHhMM
         O1LriYKBTYjLfqlftgL9VZBUJoXUf2GnANNLB/SSsTduJPFJHZlXCRk44Bwf9Jg73os+
         CNU26YD0pG51mRoegeS7lAk5X2LW16H4OgRBppkzJlZFI3BmB64jN5BCAz6w0QMf9K6z
         nIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YU+ACQq6gQmiv69eWKJ1cs7k5gUUfV2jP2s9r+r1/GM=;
        b=xFiD6t/RWTR1/HXZ8vFwNb5RLZCEfsHQBD2a7Qyojsdb3Wxr6z3JGIe93A+I47vQ63
         4zA9rY+4kzH6nBtr2QXbq9h8LZhHnrW/FV2I4wfmN4LGkvCSOobafzM48iMCFXJJcI6k
         zUK0UYicaQFWJi4tEXhwxNCVyVs2fD0ZcFlL6DI3ZwGi20kqMKeVolhm6Ykpsi+jJL2/
         T5POYfFsd8ffosvNeQmTPg1D05U3LgAy+7u6Qsauyctv9Sjbe1eKOmtgqWkFsU0mrhoX
         myS0XNwdoWY+qItXNqE7nsmqC6RPFgDf78ck45NyKZsLMos4Umu7uPXBMO8BHvIrL4xL
         8FIA==
X-Gm-Message-State: AOAM5326JTZnMg0bOg+2wG7ySTWtS/KhSlonsTaw2jY2+7sIpO8FG1tc
        OMNMFJoBPe4RSL96QVczlg==
X-Google-Smtp-Source: ABdhPJzB9SEZuXBMXDcNqBhEfmRz9mLjvbyU+A0vGOfxeAzh8AZFNe2CLpz9utPPdMNMIMwJ+BAB/A==
X-Received: by 2002:a17:902:d3cb:b0:15b:a002:d80c with SMTP id w11-20020a170902d3cb00b0015ba002d80cmr19822236plb.108.1652174266261;
        Tue, 10 May 2022 02:17:46 -0700 (PDT)
Received: from localhost (2001-b011-7010-358e-c990-a8c9-85a7-1d3e.dynamic-ip6.hinet.net. [2001:b011:7010:358e:c990:a8c9:85a7:1d3e])
        by smtp.gmail.com with ESMTPSA id ls6-20020a17090b350600b001dcf9fe5cddsm1317715pjb.38.2022.05.10.02.17.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 May 2022 02:17:45 -0700 (PDT)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org,
        sven@svenpeter.dev, jie.deng@intel.com, jsd@semihalf.com,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/9] i2c: npcm: Remove unused variable clk_regmap
Date:   Tue, 10 May 2022 17:16:48 +0800
Message-Id: <20220510091654.8498-4-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510091654.8498-1-warp5tw@gmail.com>
References: <20220510091654.8498-1-warp5tw@gmail.com>
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
Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index e6ae11ed2d82..1f92c84317e4 100644
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

