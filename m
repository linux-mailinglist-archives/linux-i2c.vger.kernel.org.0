Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013CB244F6F
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Aug 2020 23:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgHNVCH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Aug 2020 17:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgHNVCH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Aug 2020 17:02:07 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AF0C061385
        for <linux-i2c@vger.kernel.org>; Fri, 14 Aug 2020 14:02:06 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id t23so7997459qto.3
        for <linux-i2c@vger.kernel.org>; Fri, 14 Aug 2020 14:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ph26EcQ//gQfbD8SrjP9OM9uTkX+iGNX3XWz0JYL2/o=;
        b=WC826glkRhniMPZMBKY6fs9uyQvpomhD7O1JRdFesjXSr+Sc6SslSYxWTKokpAGmP/
         HNXmuC0Mt4hSGZJg6jE/IbBWzndFgn/GEl7TmxLx6rruWdrHiEwE+Cpm46t0Ju6afiRq
         tjleyAV4TTfuT/NEMzK2SxWqEO/8nk6c+hEmEGcWCdzbRyyBHDeNc0chFjOLPzkE0yRU
         L5h3PGxvGYJ6+gk5t//IFUqIReYUcEQo9Uqq3a+E0NO8N52bF5rlJeuYMnNtCT8F5+g2
         8LP+iQJcI6UUEVVS4MByQaWu61aNJIfNaDo8Jr5Nq/VOHUcIXKvij7WVsIlMzPWH4PHj
         au/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ph26EcQ//gQfbD8SrjP9OM9uTkX+iGNX3XWz0JYL2/o=;
        b=SQRHUtI0ZrKEhzFQTvgdUEb9pgJe7UFb/gIFoCneKdLFQhmNlweLMGVhpJezM+qChc
         g7DJ/d0bIThDfPdjlwH5RBuutvqPcdrxUZnh75y34ey5jYXf/bE2pRvgKh5w0/g9ZNzT
         IFlL5awS93Jyx05L4zfeswTxYN1MKTlsF6vGF3mJ95K80TWsPEuPLEwuj6tScE6sp1eh
         /dLTIjQmA2OrsqvuCBaTY1YSHf3mHTYRSx9ylFSB1JaF2x3ECArY8130O09E+CffehMO
         /FwidW/bHc60y8NzzS5Gs5DPz+F3teseKKaNZdV4fuy5qtQ/yjAJdHjjq5EVlJlazn/+
         /zvA==
X-Gm-Message-State: AOAM530M9szD4vemFbje3h4xmW9gqMVxlZQXdFAytRsLX5yCrhhsYJLT
        OlQlqhVsP/BXW/FQFntjB1631tmqDHpEoBIc
X-Google-Smtp-Source: ABdhPJxQdCR1oVJiWFK32GY6f4uSl8WMxNS2jMF8j0C+rNc87glV70YuzTGnicDHsPIt9THZzoOXOA==
X-Received: by 2002:ac8:6c5d:: with SMTP id z29mr3792754qtu.244.1597438925762;
        Fri, 14 Aug 2020 14:02:05 -0700 (PDT)
Received: from localhost.localdomain (ool-45752a48.dyn.optonline.net. [69.117.42.72])
        by smtp.googlemail.com with ESMTPSA id g11sm9957389qke.128.2020.08.14.14.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 14:02:05 -0700 (PDT)
From:   Mohammed Billoo <mab@mab-labs.com>
Cc:     Mohammed Billoo <mab@mab-labs.com>, peter@korsgaard.com,
        andrew@lunn.ch, linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: ocores: Allow endian-specific grlib accessors
Date:   Fri, 14 Aug 2020 17:01:54 -0400
Message-Id: <20200814210154.14402-1-mab@mab-labs.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Due to inconsistent/broken HW, SW may need to set the appropriate
endianess of the grlib accessors (instead of defaulting to big endian).
This patch adds such a capability.

Signed-off-by: Mohammed Billoo <mab@mab-labs.com>
---
 drivers/i2c/busses/i2c-ocores.c | 55 +++++++++++++++++++++++++++++----
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index f5fc75b65a19..2ef735f8c71f 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -488,11 +488,12 @@ MODULE_DEVICE_TABLE(of, ocores_i2c_match);
 
 #ifdef CONFIG_OF
 /*
- * Read and write functions for the GRLIB port of the controller. Registers are
- * 32-bit big endian and the PRELOW and PREHIGH registers are merged into one
+ * Read and write functions for the GRLIB port of the controller. Unfortunately,
+ * do to some broken/inconsistent HW, SW may need to account for different
+ * endianess of GRLIB. PRELOW and PREHIGH registers are merged into one
  * register. The subsequent registers have their offsets decreased accordingly.
  */
-static u8 oc_getreg_grlib(struct ocores_i2c *i2c, int reg)
+static u8 oc_getreg_grlib_be(struct ocores_i2c *i2c, int reg)
 {
 	u32 rd;
 	int rreg = reg;
@@ -506,7 +507,21 @@ static u8 oc_getreg_grlib(struct ocores_i2c *i2c, int reg)
 		return (u8)rd;
 }
 
-static void oc_setreg_grlib(struct ocores_i2c *i2c, int reg, u8 value)
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
+static void oc_setreg_grlib_be(struct ocores_i2c *i2c, int reg, u8 value)
 {
 	u32 curr, wr;
 	int rreg = reg;
@@ -525,6 +540,25 @@ static void oc_setreg_grlib(struct ocores_i2c *i2c, int reg, u8 value)
 	iowrite32be(wr, i2c->base + (rreg << i2c->reg_shift));
 }
 
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
@@ -592,8 +626,17 @@ static int ocores_i2c_of_probe(struct platform_device *pdev,
 	match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
 	if (match && (long)match->data == TYPE_GRLIB) {
 		dev_dbg(&pdev->dev, "GRLIB variant of i2c-ocores\n");
-		i2c->setreg = oc_setreg_grlib;
-		i2c->getreg = oc_getreg_grlib;
+		/*
+		 * This is a workaround for inconsistent/broken HW,
+		 * where SW has to set the appropriate endianess
+		 */
+		if (of_device_is_big_endian(pdev->dev.of_node)) {
+			i2c->setreg = oc_setreg_grlib_be;
+			i2c->getreg = oc_getreg_grlib_be;
+		} else {
+			i2c->setreg = oc_setreg_grlib_le;
+			i2c->getreg = oc_getreg_grlib_le;
+		}
 	}
 
 	return 0;
-- 
2.17.1

