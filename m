Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5637D4BCC07
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Feb 2022 05:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243447AbiBTD5n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Feb 2022 22:57:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243449AbiBTD5k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Feb 2022 22:57:40 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46BD441FAC;
        Sat, 19 Feb 2022 19:57:19 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id q11-20020a17090a304b00b001b94d25eaecso12139754pjl.4;
        Sat, 19 Feb 2022 19:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2tmnTcD52LG4gJnvsrOpevEsC/cYqDPXBT54iZq1tqA=;
        b=Qg59jRUN1ABRuiUYE6VpQvBs5j+vkngwJBnJF8KWwKzqY60FoVK/SbwpAIsuiv/OXj
         6PnQMp8j7rraXPa4QPJKarJBtfjv25eJWGcowwK4eotvlwoO439cQoLX0wurXCE2VsFO
         784p3rZFnNYRir3H9DeWwn5aWKX9TjUhSq6YOxdRTVQlzv546miPMbVnbCIqADElqywq
         2ZP1IVP1CvOjCrq1iPO5WlHTj2E0cnXnTZ8IPJFqKgWBRUGLdO4x2q+v3s8gfdTselgR
         LnTOtO/NL6u8HfpDeikXvjbReZ9JWHqt7W/7vDDZW2xPF9iSUAGZXVq+If1OFWcRrnM+
         P+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2tmnTcD52LG4gJnvsrOpevEsC/cYqDPXBT54iZq1tqA=;
        b=cd/AiHDIU2DOLIl75qnioZM0eonk/Ww6g0JODlsrQ3rbFMbziQfEXI3qfMySAOajN3
         yWjXKOkizg1SbnedKIXdzlJfBcUlBuVWn6Vlp4M5adEbjSLQ0xtA61BH1wqhNhsFFFdt
         uZTSgnjnJsRBBMTB5AyTglic9WgKhAXGozBEu1Kex6uPRIlIg/W/23EUzLDIiSHnH08+
         GsfxALiYSNvo1438yiZ/20XA1Ar13zY/6wQNxdeBkivd3ZaJNnKYwV9y25R3HlF0bAqi
         hYJ41xwVsvkuTtjloS4ab/8lNITAB3lWBc6pkUDKXxb7M5H8rFomKTWKO7VlU1MzWBbo
         9Qjg==
X-Gm-Message-State: AOAM533Qm9ir5VUUuJgvuIV7U5Vpzrmr8TpgT+JxlM9AQsj1eMnMMrzo
        y1JRNsvvXF92mOhwuK135w==
X-Google-Smtp-Source: ABdhPJzFdJh2f7Pk+vzmchfosK0MBtO3bXVZVtmCM2acPgLBEajbVl3dTSX3Vb8WrxcqvT/Ng0Oo7Q==
X-Received: by 2002:a17:90b:1e11:b0:1b9:d23:bc3c with SMTP id pg17-20020a17090b1e1100b001b90d23bc3cmr19556274pjb.77.1645329438739;
        Sat, 19 Feb 2022 19:57:18 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
        by smtp.gmail.com with ESMTPSA id q1sm7678024pfs.112.2022.02.19.19.57.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Feb 2022 19:57:18 -0800 (PST)
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
Subject: [PATCH v2 08/11] i2c: npcm: Correct register access width
Date:   Sun, 20 Feb 2022 11:53:18 +0800
Message-Id: <20220220035321.3870-9-warp5tw@gmail.com>
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

From: Tyrone Ting <kfting@nuvoton.com>

Use ioread8 instead of ioread32 to access the SMBnCTL3 register since
the register is only 8-bit wide.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index ee4757eff4b3..4715afcf9ac4 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -360,14 +360,14 @@ static int npcm_i2c_get_SCL(struct i2c_adapter *_adap)
 {
 	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
 
-	return !!(I2CCTL3_SCL_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
+	return !!(I2CCTL3_SCL_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
 }
 
 static int npcm_i2c_get_SDA(struct i2c_adapter *_adap)
 {
 	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
 
-	return !!(I2CCTL3_SDA_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
+	return !!(I2CCTL3_SDA_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
 }
 
 static inline u16 npcm_i2c_get_index(struct npcm_i2c *bus)
-- 
2.17.1

