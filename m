Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA1C54BCC1C
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Feb 2022 05:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243472AbiBTD5p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Feb 2022 22:57:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243433AbiBTD5i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Feb 2022 22:57:38 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AAD741FAD;
        Sat, 19 Feb 2022 19:57:16 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id a11-20020a17090a740b00b001b8b506c42fso15889057pjg.0;
        Sat, 19 Feb 2022 19:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tO9gUxk8ScG394Fv1F7MLR3Gf0mTFyKLln3kWcROujg=;
        b=YFsNLhOGDEWxYVO1KI8dOBszZn9ragwhXM72tBXopH5oO5WrTkbDhoPx4ViCfsBQoA
         kk0MWgjbt+T5j7MmgtbE/ICMJtl5ytH1iCa3p0dVTp0tNQgXu3c3MTtPse/ErAxxPxik
         0QL+zpv0Stdox96CTeTEpXDwwheA2R08Yeok1kz6f8O6+RW1tOusC3Js/2l2ugUVY/sc
         +H2eosuYZVau3+JqaR+/6CqBTZXhOj09Kpr847R1AkVQLpeRPa2HX5njkpmS6FFk5jrJ
         TejyIJ0kHTI+46tCBULxFGJcV/0FgA2sOgXI125GzRSlemYB3wdH10NaOVlNExt2D3yd
         hBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tO9gUxk8ScG394Fv1F7MLR3Gf0mTFyKLln3kWcROujg=;
        b=oLvJdcefb597145NV9GTl2v/Y2ZI8WWDWQ34vKge08fil7uIaFN+Kvkbs+6PZiv4vn
         GsDAoXK+5Nafz9RHEMJHAr1Q2pGf3HnYrQL9KJYdU0NcF0/7C3p5eKwPrDO6/Fno79Jd
         fJfUaSMJSFtTGkZaxcqHER69aubldqqrdoUcEXz1ZBRfWWf5XWfVVNKYgVsq9IHy4cju
         0ydhGaP//7PCzHPab1Tbh7NizZ8kdBzVbaMbC7oWL3lqpFmq3WDvuos1gH6KDwMi5UMY
         gNdhZw20vYHhPeI25ktmEZJUMbmcREwgIwgVqIKBDyADdjXIJ2fIitOHLegSIU1wHETu
         AMTw==
X-Gm-Message-State: AOAM531slkIcjyvBqir2/5dTPEloZW6Py2CPHQjmFNWjRFJghhavgxJQ
        vMwZOUOEiKLjxNaHr/RmOQ==
X-Google-Smtp-Source: ABdhPJyzNDl29XEZLKC0BF1F3I3EyAerQqcpv4UGlDkGWU+P5WDIdIwvWdSabKdi4LswRecqbam9JQ==
X-Received: by 2002:a17:902:f54b:b0:14d:6612:428c with SMTP id h11-20020a170902f54b00b0014d6612428cmr13947967plf.54.1645329436310;
        Sat, 19 Feb 2022 19:57:16 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
        by smtp.gmail.com with ESMTPSA id np11sm3457962pjb.25.2022.02.19.19.57.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Feb 2022 19:57:16 -0800 (PST)
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
Subject: [PATCH v2 07/11] i2c: npcm: Add tx complete counter
Date:   Sun, 20 Feb 2022 11:53:17 +0800
Message-Id: <20220220035321.3870-8-warp5tw@gmail.com>
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

tx_complete counter is used to indicate successful transaction
count.
Similar counters for failed tx were previously added.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 1e6e3f7f59a3..ee4757eff4b3 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -314,6 +314,7 @@ struct npcm_i2c {
 	u64 rec_fail_cnt;
 	u64 nack_cnt;
 	u64 timeout_cnt;
+	u64 tx_complete_cnt;
 };
 
 static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
@@ -684,6 +685,8 @@ static void npcm_i2c_callback(struct npcm_i2c *bus,
 	switch (op_status) {
 	case I2C_MASTER_DONE_IND:
 		bus->cmd_err = bus->msgs_num;
+		if (bus->tx_complete_cnt < ULLONG_MAX)
+			bus->tx_complete_cnt++;
 		fallthrough;
 	case I2C_BLOCK_BYTES_ERR_IND:
 		/* Master tx finished and all transmit bytes were sent */
@@ -2223,6 +2226,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 	debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
 	debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
 	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
+	debugfs_create_u64("tx_complete_cnt", 0444, d, &bus->tx_complete_cnt);
 
 	bus->debugfs = d;
 }
-- 
2.17.1

