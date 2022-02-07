Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 844EE4AB54A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 07:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237919AbiBGG4P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 01:56:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241904AbiBGGeC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 01:34:02 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB4CC043184;
        Sun,  6 Feb 2022 22:34:02 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id y5so10387700pfe.4;
        Sun, 06 Feb 2022 22:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mhJRr6Ju7YTAqWP+NHZiUEBspRCG8tPgABYtYdOV4pU=;
        b=kgv9qIxcOAl00fJbBE36HCUZIex7mzcHlsxsDC4PI0wk0AxU79tg/Oz/hMwL/J9DSo
         Z/rL7sJIm75pwHpfZ3y7CYxmhVLwBrKKDbKhcZFGJX4SsC+5o0zmNbsWb3Hj90+liiJi
         lu6kFMsi1om2bS6Ff/z+HQ0+OiXmUXVa42q/j28HEWD1asLat4xY2r6jd5v1+7lSB7lp
         wBT/s0AbcMLDG+oxQXSPEghinlicKL35vdg3evTgK1MVK1I4KtNmepIZuRWatnaGlEe5
         u07RCM3VApz4wjMzMKhWFiE2ErShnwzPA7+kXIQVLyCMNRGCHz9fCTMQm0gBz3BJiHuZ
         GJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mhJRr6Ju7YTAqWP+NHZiUEBspRCG8tPgABYtYdOV4pU=;
        b=MXsTssc1P4sYXs+AuorwFmIU6CZN+Y71WabOP9AqGLPgbXEUhY1SXwhu2hG8H+e4/R
         7BJgFlL6LWssUSetK8nP+7rSctFtvdW+VsJzGDv9jnFpoh/5IftMw6rV6DWrqjJDpNvf
         tVWbtUdxM0BPj+Y0NXqHiXph+ClV527CSGq8QULRqcGy9o+a9FcOIMI/hMBRlx4L1WxF
         MTfemMc0sQADW5rKvA4CXH7lNT6DCe7auHS+nwfe6nMoAAzvORLiDsCkzRjXnbuqBWOr
         fkqksVd1z5ODbnZVewiy7HePhRBK5XwnGvBBEGxcRq0Df9kS2PkDXRGW7hi7tblnlGFR
         /Jjw==
X-Gm-Message-State: AOAM532Z81v7pZgnQjTeJESkvPLKYOHvbg6PbVlfuB7sfRQ+gNUDO9wK
        t6hSnCAdnLMsWaTRa9t8ZA==
X-Google-Smtp-Source: ABdhPJz6k1PrV83uFSGzfl5ns0STtTqZJNu/qmyGba9TES0tLiKROkRMHkZJ/jKpSYvMiKf9q9DPzQ==
X-Received: by 2002:aa7:8582:: with SMTP id w2mr14514042pfn.3.1644215641791;
        Sun, 06 Feb 2022 22:34:01 -0800 (PST)
Received: from localhost ([2401:e180:8894:9737:7848:1ec7:b697:7d50])
        by smtp.gmail.com with ESMTPSA id u11sm10827033pfg.171.2022.02.06.22.34.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Feb 2022 22:34:01 -0800 (PST)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/6] i2c: npcm: Support NPCM845
Date:   Mon,  7 Feb 2022 14:33:38 +0800
Message-Id: <20220207063338.6570-7-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220207063338.6570-1-warp5tw@gmail.com>
References: <20220207063338.6570-1-warp5tw@gmail.com>
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

NPCM8XX uses a similar i2c module as NPCM7XX.
The only difference is that the internal HW FIFO
is larger.

Related Makefile and Kconfig files are modified
to support as well.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/Kconfig       |  8 ++++----
 drivers/i2c/busses/Makefile      |  2 +-
 drivers/i2c/busses/i2c-npcm7xx.c | 29 +++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 42da31c1ab70..ab9ee2de5e00 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -817,13 +817,13 @@ config I2C_NOMADIK
 	  I2C interface from ST-Ericsson's Nomadik and Ux500 architectures,
 	  as well as the STA2X11 PCIe I/O HUB.
 
-config I2C_NPCM7XX
+config I2C_NPCM
 	tristate "Nuvoton I2C Controller"
-	depends on ARCH_NPCM7XX || COMPILE_TEST
+	depends on ARCH_NPCM || COMPILE_TEST
 	help
 	  If you say yes to this option, support will be included for the
-	  Nuvoton I2C controller, which is available on the NPCM7xx BMC
-	  controller.
+	  Nuvoton I2C controller, which is available on the NPCM BMC
+	  controllers.
 	  Driver can also support slave mode (select I2C_SLAVE).
 
 config I2C_OCORES
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 1d00dce77098..01fdf74a5565 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -80,7 +80,7 @@ obj-$(CONFIG_I2C_MT7621)	+= i2c-mt7621.o
 obj-$(CONFIG_I2C_MV64XXX)	+= i2c-mv64xxx.o
 obj-$(CONFIG_I2C_MXS)		+= i2c-mxs.o
 obj-$(CONFIG_I2C_NOMADIK)	+= i2c-nomadik.o
-obj-$(CONFIG_I2C_NPCM7XX)	+= i2c-npcm7xx.o
+obj-$(CONFIG_I2C_NPCM)		+= i2c-npcm7xx.o
 obj-$(CONFIG_I2C_OCORES)	+= i2c-ocores.o
 obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
 obj-$(CONFIG_I2C_OWL)		+= i2c-owl.o
diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 0af97f179af2..4e0148ccc215 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -91,7 +91,11 @@ enum i2c_addr {
 
 /* init register and default value required to enable module */
 #define NPCM_I2CSEGCTL			0xE4
+#ifdef CONFIG_ARCH_NPCM7XX
 #define NPCM_I2CSEGCTL_INIT_VAL		0x0333F000
+#else
+#define NPCM_I2CSEGCTL_INIT_VAL		0x9333F000
+#endif
 
 /* Common regs */
 #define NPCM_I2CSDA			0x00
@@ -229,7 +233,11 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
 #define NPCM_I2CFIF_CTS_SLVRSTR		BIT(7)
 
 /* NPCM_I2CTXF_CTL reg fields */
+#ifdef CONFIG_ARCH_NPCM7XX
 #define NPCM_I2CTXF_CTL_TX_THR		GENMASK(4, 0)
+#else
+#define NPCM_I2CTXF_CTL_TX_THR		GENMASK(5, 0)
+#endif /*CONFIG_ARCH_NPCM7XX*/
 #define NPCM_I2CTXF_CTL_THR_TXIE	BIT(6)
 
 /* NPCM_I2CT_OUT reg fields */
@@ -238,22 +246,42 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
 #define NPCM_I2CT_OUT_T_OUTST		BIT(7)
 
 /* NPCM_I2CTXF_STS reg fields */
+#ifdef CONFIG_ARCH_NPCM7XX
 #define NPCM_I2CTXF_STS_TX_BYTES	GENMASK(4, 0)
+#else
+#define NPCM_I2CTXF_STS_TX_BYTES	GENMASK(5, 0)
+#endif /*CONFIG_ARCH_NPCM7XX*/
 #define NPCM_I2CTXF_STS_TX_THST		BIT(6)
 
 /* NPCM_I2CRXF_STS reg fields */
+#ifdef CONFIG_ARCH_NPCM7XX
 #define NPCM_I2CRXF_STS_RX_BYTES	GENMASK(4, 0)
+#else
+#define NPCM_I2CRXF_STS_RX_BYTES	GENMASK(5, 0)
+#endif /*CONFIG_ARCH_NPCM7XX*/
 #define NPCM_I2CRXF_STS_RX_THST		BIT(6)
 
 /* NPCM_I2CFIF_CTL reg fields */
 #define NPCM_I2CFIF_CTL_FIFO_EN		BIT(4)
 
 /* NPCM_I2CRXF_CTL reg fields */
+#ifdef CONFIG_ARCH_NPCM7XX
 #define NPCM_I2CRXF_CTL_RX_THR		GENMASK(4, 0)
+#else
+#define NPCM_I2CRXF_CTL_RX_THR		GENMASK(5, 0)
+#endif /*CONFIG_ARCH_NPCM7XX*/
+#ifdef CONFIG_ARCH_NPCM7XX
 #define NPCM_I2CRXF_CTL_LAST_PEC	BIT(5)
+#else
+#define NPCM_I2CRXF_CTL_LAST_PEC	BIT(7)
+#endif /*CONFIG_ARCH_NPCM7XX*/
 #define NPCM_I2CRXF_CTL_THR_RXIE	BIT(6)
 
+#ifdef CONFIG_ARCH_NPCM7XX
 #define I2C_HW_FIFO_SIZE		16
+#else
+#define I2C_HW_FIFO_SIZE		32
+#endif /* CONFIG_ARCH_NPCM7XX */
 
 /* I2C_VER reg fields */
 #define I2C_VER_VERSION			GENMASK(6, 0)
@@ -2356,6 +2384,7 @@ static int npcm_i2c_remove_bus(struct platform_device *pdev)
 
 static const struct of_device_id npcm_i2c_bus_of_table[] = {
 	{ .compatible = "nuvoton,npcm750-i2c", },
+	{ .compatible = "nuvoton,npcm845-i2c", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);
-- 
2.17.1

