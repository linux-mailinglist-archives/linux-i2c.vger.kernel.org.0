Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB4744BCC0F
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Feb 2022 05:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242177AbiBTD5b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Feb 2022 22:57:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241843AbiBTD5b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Feb 2022 22:57:31 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A7B41FB2;
        Sat, 19 Feb 2022 19:57:10 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id q1so1676590plx.4;
        Sat, 19 Feb 2022 19:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6OWdv0iTU9zwpkJfCRiYIgMFcDrBo3I6CJI4Ww7QsUU=;
        b=K/girzw3/yJMxUsozqmoYanuTJpQeOLAarIMpENGa3TVJmspQTSdWJfAFIfMqDJQ33
         q07/ypJChfXtpEuUamGO30kq21ct45CY7Z0RRjIRUD3pP0O5DhqWZpqCqUVjJ1iP8RQE
         YUp4K/QCUzyRp80XNdVd2z3OQ869bogSSPoPlW26nBtrdmQauzcTeRw5Zm3FbsrgGVyg
         OemJDfnGtkNS5G98DygmQZo9e+SQhrp8C7a7Xn5kYvgPI5MQfiNvNEqHhw1vsyqnAPEP
         DHw5Q4TZ+qx6asZl3PCpiGz7c7/9WAB/HSnSBUsQn1aO9AvZfpZebl0+CAjQ5cmTtzJi
         MZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6OWdv0iTU9zwpkJfCRiYIgMFcDrBo3I6CJI4Ww7QsUU=;
        b=FNa8JciWb5YfeEj9LYm6Fa4aoArZUI+KJuFVAjCdy0++wx0ALUroT3v4fBwEAPvlwD
         nJyRlNnsRQtMj4Y28UQV9KJKKB9fZgWX7Y5PgfS9KLQJrI7RCYI6N9qALib+v3EL8KfI
         B6GtUmdNJ14ee8qTtmE1q0Xh5mFhP0FEvxj2VyLn37NesInFS5m1BVqN/mdPqP2vCfFK
         hV92tA7QKeLp085J1r1tePORXsa0JXM0dxbNvNEYov0fp4guJm2tspI6z8ySaFwNQ0GD
         WsTfG2vXAmXg8LelVhxpuXiFH1tt/g5L0y1xKFS0fdohBsyb/cBSh9HnT3BM/1uPTI1b
         FOOQ==
X-Gm-Message-State: AOAM532ncijHtmWr4Ca/NPaSzikTAWrDHDGe6fBc6h4pMVW6uIzcm7rp
        revSAsh/hfqKdc86Q9ZvzA==
X-Google-Smtp-Source: ABdhPJx2Ff4tkjFNCMcVV7FssfPSCfrNVPNVZ3brD9/O5YmQhAVy1rFfIs2tCTMqjIoUXL/Gsf+mpQ==
X-Received: by 2002:a17:902:ead1:b0:14f:95e1:86fe with SMTP id p17-20020a170902ead100b0014f95e186femr4073071pld.21.1645329429028;
        Sat, 19 Feb 2022 19:57:09 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
        by smtp.gmail.com with ESMTPSA id g5sm7862590pfv.22.2022.02.19.19.57.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Feb 2022 19:57:08 -0800 (PST)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, christophe.leroy@csgroup.eu,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        digetx@gmail.com, andriy.shevchenko@linux.intel.com,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/11] i2c: npcm: Update gcr property name
Date:   Sun, 20 Feb 2022 11:53:14 +0800
Message-Id: <20220220035321.3870-5-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220220035321.3870-1-warp5tw@gmail.com>
References: <20220220035321.3870-1-warp5tw@gmail.com>
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

Use a generic name for NPCM system manager reigster.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 4c225e1a058f..a51db3f50274 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2236,6 +2236,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 	static struct regmap *clk_regmap;
 	int irq;
 	int ret;
+	struct device_node *np = pdev->dev.of_node;
 
 	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
 	if (!bus)
@@ -2250,7 +2251,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 		return PTR_ERR(i2c_clk);
 	bus->apb_clk = clk_get_rate(i2c_clk);
 
-	gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
+	gcr_regmap = syscon_regmap_lookup_by_phandle(np, "nuvoton,sys-mgr");
 	if (IS_ERR(gcr_regmap))
 		return PTR_ERR(gcr_regmap);
 	regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL);
-- 
2.17.1

