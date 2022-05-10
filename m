Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2443A52108A
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 11:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238580AbiEJJVn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 05:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238592AbiEJJVl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 05:21:41 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61EC20AE60;
        Tue, 10 May 2022 02:17:44 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id q76so14127970pgq.10;
        Tue, 10 May 2022 02:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9gk3IW+c3IPl5Otspv5w0MqdcZ+ptAb9FBKSCbuzjHk=;
        b=RNKbzqLEDFelf84UbDt5sobvhqFBKPsJQbfqW/1LqNo4yggVWV4Vkr3eqfYWhp5UP3
         UFVlTP8ScKlEdYNs8E0dKQFpiWa5vnCxG5LymOave0xPFtYhVvAjlN05BN/Z+NMHYPNP
         m7VJGHL2SkvVQfjDwK3YEKNorA+yS2Ff4nqshEw2TVoh5h8W9lE579o4Uh7+10ytXh8Q
         nkBNSo/EfQbU2HossCgVoV19Pi6xyxnc0FWdE/P8lQGo7Aw8NtVEI9GPwwmtuBkucwKU
         P5CT6SPi7y2cch8ch7qIsIK0h3Zq109LeCIn8NELZJVUlcXSvbgFjcAjWnJptxsq4/X/
         hC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9gk3IW+c3IPl5Otspv5w0MqdcZ+ptAb9FBKSCbuzjHk=;
        b=W/ZHe3mByXFDnXVX9kTI6x4YcE0hQI0Nvc2rSoi7lgejlhSXFh+TGkHQg7qiwNi9ZP
         cM7stkzmU+tBchQStN7o8yE/oqJ6Yt4KYkSZ4lrUJQY2LTgvghj1bFmKBri3O3pc6Hek
         +z9OQfwKby7fKImIzUpkKZBloPdrza3XlqKgft4rZQyrA5mBLqqvLua/t2vcHTr10c+l
         0SZjiB7efwPT/L354ugxK0wIly5FgGrpl+obQbKIMaSLu2ZWVyAw9qX9Pn9iT01dD1yX
         3UqGBXxGQCAS2K7IMms9QhaThIKmnFhL0P/zoT2PnIh+jITtp5d0/Cnpc3Q9VrK/GzTc
         hy/w==
X-Gm-Message-State: AOAM53284uYkNo1LsKYrIgY5eSJUz3D4SOQRVOwQcXtKKYNhkIbu5Mo8
        yKsUt9fA8knLiGgmXIO9VQ==
X-Google-Smtp-Source: ABdhPJzgs5R0DrvZp7C3wbPRnuhZG2Iqc0ixMm9flxHp+6jMwavTIqt5jLmBPF/7lPe2ptjEhhbKhA==
X-Received: by 2002:a65:6c05:0:b0:3c6:e380:9088 with SMTP id y5-20020a656c05000000b003c6e3809088mr3687997pgu.429.1652174263972;
        Tue, 10 May 2022 02:17:43 -0700 (PDT)
Received: from localhost (2001-b011-7010-358e-c990-a8c9-85a7-1d3e.dynamic-ip6.hinet.net. [2001:b011:7010:358e:c990:a8c9:85a7:1d3e])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902bf4b00b0015e8d4eb21asm1469875pls.100.2022.05.10.02.17.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 May 2022 02:17:43 -0700 (PDT)
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
Subject: [PATCH v4 2/9] i2c: npcm: Change the way of getting GCR regmap
Date:   Tue, 10 May 2022 17:16:47 +0800
Message-Id: <20220510091654.8498-3-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510091654.8498-1-warp5tw@gmail.com>
References: <20220510091654.8498-1-warp5tw@gmail.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 71aad029425d..e6ae11ed2d82 100644
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

