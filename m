Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33F3F4BCC0D
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Feb 2022 05:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243119AbiBTD5h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Feb 2022 22:57:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243228AbiBTD5e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Feb 2022 22:57:34 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 577B240E6C;
        Sat, 19 Feb 2022 19:57:12 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id j10-20020a17090a94ca00b001bc2a9596f6so327169pjw.5;
        Sat, 19 Feb 2022 19:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=krxrJMNBibw4X2UMTZ790HAtT7R38NRGiHkdwGL9/6g=;
        b=bGb9MWeN7FHpDg495KS7+TlI5vXRFpbTrMLEJgSZe4PPIM6j6SzmKanme//Ljiyz9b
         eBxJeuJS9danM9QTLRgdIO3Cs1HY+BZoQbZNLP/MCn3iEf4j1vatNsFUIQEa4ez5yvnm
         a3CB3ivcTQFmYVpy9Ndd+cRsC7MrlraShax+mznAT8iukN6jsyLuLMNmGeuecRITXO81
         GmzG6T2WhbYpmEmqgm30w4qYdsj82u46mwgS2lk9HLpxtFZvz4iQKFjNa3LiVHm9Y1ou
         Xwh4OWVP9FLoBjCSSwv06q+Bmfk72EFCHTv6/Tg/RWd2E2lbNQfoc9uegkfpNPvx5RZX
         uCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=krxrJMNBibw4X2UMTZ790HAtT7R38NRGiHkdwGL9/6g=;
        b=7nlCH0nonpqMvTlLExtNkFyz0xR9/tcoBKIMYyX1uxGxiNe0CSSU70sPbn4++SBJvV
         sOPR79dxbNZ9r4vefzDQ17yPejtkmZeUtH0kvYReZhmI8R6xOKoi5ExrIfY9PAZDcULH
         DcbOUxpx6x893IAxcOMxov1Xk6ddDds93kvMVRkRpebzL1vEYxojPO4hXuwbyEkuOLKQ
         JNYtDAe8kN1dIfp1ljksB9BVmy1LHrI2BHcK08dVXUTjFkAT4IEofkRNP327VKoztT/2
         /ghWmkGTyfGt8IVOZcjPSBUHlAQVoHmSAv+qE+hsAqDw7tPoxWOTDDtVbVppqBe0LVqd
         X/SQ==
X-Gm-Message-State: AOAM531MZc7Fj+CLtc/Crh+sNr6J9nZSrTb5D8q+FlrpxyMoQ2uvjQWq
        UftQ5kHOzakAJqeZVgiwhw==
X-Google-Smtp-Source: ABdhPJz0iTAw94T1v7Qcn6hNjEMYPSkdyjVPAD0/ep2NaSYe4xQQG1d7d7cAsfdLf/buXrOQuLownA==
X-Received: by 2002:a17:902:8509:b0:14e:f9b7:6cab with SMTP id bj9-20020a170902850900b0014ef9b76cabmr13964607plb.162.1645329431733;
        Sat, 19 Feb 2022 19:57:11 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
        by smtp.gmail.com with ESMTPSA id m17-20020a17090a859100b001bc20ddcc67sm753354pjn.34.2022.02.19.19.57.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Feb 2022 19:57:11 -0800 (PST)
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
Subject: [PATCH v2 05/11] i2c: npcm: Remove unused clock node
Date:   Sun, 20 Feb 2022 11:53:15 +0800
Message-Id: <20220220035321.3870-6-warp5tw@gmail.com>
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

Remove unused npcm750-clk node.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index a51db3f50274..9ccb9958945e 100644
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
@@ -2256,10 +2255,6 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
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

