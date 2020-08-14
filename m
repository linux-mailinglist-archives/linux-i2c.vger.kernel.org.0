Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96C28244CBF
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Aug 2020 18:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgHNQbs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Aug 2020 12:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgHNQbs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Aug 2020 12:31:48 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE240C061384
        for <linux-i2c@vger.kernel.org>; Fri, 14 Aug 2020 09:31:47 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id d14so8847833qke.13
        for <linux-i2c@vger.kernel.org>; Fri, 14 Aug 2020 09:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oUJOSSXkZu6rhTyUzF97MDojJgtr4trzkE2rD0x1joI=;
        b=BTwTsMv0zIK9h/Mk3yimMjEPvOuxf3d8FBwLztyeexCIHDTHl5LIyCdzHzztSPPXav
         pL/VUrALSmRoUyeRIDlcQ2gJmW2aXjSMsGwLt443pRu1zbb/sMD9Sk+RIm5jxIFzVYG7
         urkGL3WgbLxYUlU8n4AZa/3xO6y+MrN3bfersNF2uAl6t5Vrzxm4YN30lFkfLkPocQRI
         3qMZtv1UlsBIRkzmhRUwRFKHicKDHRWXS0O1+/2z2cKDp5Qg2Vt5ixTotRd+tA6W+YmY
         i1sIjHcTaVQkLvjB7CEWk91kAXKy2jEn/JITj9JluzOZaBZEQmv2zlgVPdKTYA+4NXwo
         5GWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oUJOSSXkZu6rhTyUzF97MDojJgtr4trzkE2rD0x1joI=;
        b=svkZSACwZkCeppcjmMilOPZYnjoA9pK9Z8/9SM7Gkl8L7FR0GzJeC0ADGQ2evdgJsw
         yHDaHM+szgh9xPtOGzsAYQrNwDP5s8gAj9EmXLeyXMmhef4NyzAkRsxCnHR4TsRwQWN6
         XJMTHu8EleBW112AajcF7nXuPoolWZC2Gxr7GPfSt1nWtPnnx3HsRK17Edzs4XUi2bA6
         QD9FOEm3L8bgFwLcHyORkW8VE4A1C+7Bhji66eIvoZaGi0ISUW2OJjD2OBASDg/DTbVV
         F1ngHvA153s70dUqCGDd9z4WQPAVO1t6juDMW2Uep68aT6r+oKzhZHGvfuc2StGzK4Si
         4ZjA==
X-Gm-Message-State: AOAM532tHNaEmvPFFPSQmboFMdcz4kq2YcrDT4w9Q8TfpORyeFG0b6Dq
        ZBiLUzag9baTICfCfqgVGKvwYA==
X-Google-Smtp-Source: ABdhPJzhSllp7WTdB2L+p+5GEqAGxL0cL00EJPDvSPLaI8MzGbxJc3xG1MOCx5pzzuU2FW0WaMAwQg==
X-Received: by 2002:a37:d83:: with SMTP id 125mr2766560qkn.430.1597422706608;
        Fri, 14 Aug 2020 09:31:46 -0700 (PDT)
Received: from localhost.localdomain (ool-45752a48.dyn.optonline.net. [69.117.42.72])
        by smtp.googlemail.com with ESMTPSA id f39sm11649843qta.59.2020.08.14.09.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 09:31:46 -0700 (PDT)
From:   Mohammed Billoo <mab@mab-labs.com>
Cc:     Mohammed Billoo <mab@mab-labs.com>, peter@korsgaard.com,
        andrew@lunn.ch, linux-i2c@vger.kernel.org
Subject: [PATCH 2/2] i2c: ocores: add be/le support for gaisler
Date:   Fri, 14 Aug 2020 12:31:34 -0400
Message-Id: <20200814163134.29493-2-mab@mab-labs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200814163134.29493-1-mab@mab-labs.com>
References: <20200814163134.29493-1-mab@mab-labs.com>
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add be/le accessors for grlib (as is done for the standard ocore
accessors).

Signed-off-by: Mohammed Billoo <mab@mab-labs.com>
---
 arch/arm/configs/socfpga_defconfig |  1 +
 drivers/i2c/busses/i2c-ocores.c    | 55 ++++++++++++++++++++++++++----
 2 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
index e73c97b0f5b0..55bf9cfcf75c 100644
--- a/arch/arm/configs/socfpga_defconfig
+++ b/arch/arm/configs/socfpga_defconfig
@@ -162,3 +162,4 @@ CONFIG_DETECT_HUNG_TASK=y
 # CONFIG_SCHED_DEBUG is not set
 CONFIG_FUNCTION_TRACER=y
 CONFIG_DEBUG_USER=y
+CONFIG_I2C_OCORES=y
diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 0975f6797069..a5f9e6cb4814 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -492,7 +492,7 @@ MODULE_DEVICE_TABLE(of, ocores_i2c_match);
  * 32-bit big endian and the PRELOW and PREHIGH registers are merged into one
  * register. The subsequent registers have their offsets decreased accordingly.
  */
-static u8 oc_getreg_grlib(struct ocores_i2c *i2c, int reg)
+static u8 oc_getreg_grlib_be(struct ocores_i2c *i2c, int reg)
 {
 	u32 rd;
 	int rreg = reg;
@@ -506,7 +506,7 @@ static u8 oc_getreg_grlib(struct ocores_i2c *i2c, int reg)
 		return (u8)rd;
 }
 
-static void oc_setreg_grlib(struct ocores_i2c *i2c, int reg, u8 value)
+static void oc_setreg_grlib_be(struct ocores_i2c *i2c, int reg, u8 value)
 {
 	u32 curr, wr;
 	int rreg = reg;
@@ -525,6 +525,39 @@ static void oc_setreg_grlib(struct ocores_i2c *i2c, int reg, u8 value)
 	iowrite32be(wr, i2c->base + (rreg << i2c->reg_shift));
 }
 
+static u8 oc_getreg_grlib_le(struct ocores_i2c *i2c, int reg)
+{
+	u32 rd;
+	int rreg = reg;
+
+	if (reg != OCI2C_PRELOW)
+		rreg--;
+	rd = ioread32(i2c->base + (rreg << i2c->reg_shift));
+	if (reg == OCI2C_PREHIGH)
+		return (u8)(rd >> 8);
+	else
+		return (u8)rd;
+}
+
+static void oc_setreg_grlib_le(struct ocores_i2c *i2c, int reg, u8 value)
+{
+	u32 curr, wr;
+	int rreg = reg;
+
+	if (reg != OCI2C_PRELOW)
+		rreg--;
+	if (reg == OCI2C_PRELOW || reg == OCI2C_PREHIGH) {
+		curr = ioread32(i2c->base + (rreg << i2c->reg_shift));
+		if (reg == OCI2C_PRELOW)
+			wr = (curr & 0xff00) | value;
+		else
+			wr = (((u32)value) << 8) | (curr & 0xff);
+	} else {
+		wr = value;
+	}
+	iowrite32(wr, i2c->base + (rreg << i2c->reg_shift));
+}
+
 static int ocores_i2c_of_probe(struct platform_device *pdev,
 				struct ocores_i2c *i2c)
 {
@@ -592,8 +625,13 @@ static int ocores_i2c_of_probe(struct platform_device *pdev,
 	match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
 	if (match && (long)match->data == TYPE_GRLIB) {
 		dev_dbg(&pdev->dev, "GRLIB variant of i2c-ocores\n");
-		i2c->setreg = oc_setreg_grlib;
-		i2c->getreg = oc_getreg_grlib;
+		if (of_device_is_big_endian(pdev->dev.of_node)) {
+			i2c->setreg = oc_setreg_grlib_be;
+			i2c->getreg = oc_getreg_grlib_be;
+		} else {
+			i2c->setreg = oc_setreg_grlib_le;
+			i2c->getreg = oc_getreg_grlib_le;
+		}
 	}
 
 	return 0;
@@ -648,8 +686,13 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 		else
 			i2c->bus_clock_khz = 100;
 		if (pdata->gaisler) {
-			i2c->setreg = oc_setreg_grlib;
-			i2c->getreg = oc_getreg_grlib;
+			if (pdata->big_endian) {
+				i2c->setreg = oc_setreg_grlib_be;
+				i2c->getreg = oc_getreg_grlib_be;
+			} else {
+				i2c->setreg = oc_setreg_grlib_le;
+				i2c->getreg = oc_getreg_grlib_le;
+			}
 		}
 	} else {
 		ret = ocores_i2c_of_probe(pdev, i2c);
-- 
2.17.1

