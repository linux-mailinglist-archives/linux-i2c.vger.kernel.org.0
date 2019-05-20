Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D70ED23778
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 15:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731200AbfETMtk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 08:49:40 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46866 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388170AbfETMV3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 08:21:29 -0400
Received: by mail-pg1-f194.google.com with SMTP id t187so6710157pgb.13
        for <linux-i2c@vger.kernel.org>; Mon, 20 May 2019 05:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1F+KZPAPMFeFMbiX0oM9Kae2RtfpGXHWIoUQp9WZh+E=;
        b=KYgnyTbypH81lTw1Oa6iQ9HeadARRY8S9w9/UlRXArrgHKiBMGEYhKJeSuIpXXsbKk
         1qZu3Zqnta9hT8R573OIeIWVsOEPLz2aU43BJuXNw5mhHGQkVONdVxYdWeaQ95NCogss
         KSstGBKg2paFZomP0Hy42ULP2JLZdEPMPKW2/C/wFOGiik7AlEZ4Fx0hbVsNrmJCnV8U
         fNMhEhvJxtmnL1MCXD95m4kt+5So0hLJTn7bPmAa4qdVaNNSxRj205i0CfB0r/U4HSF1
         2vaBX0uxMYAjP8l1Ve6jfhnAuECoZ4SXoUGHPb/UkUTX7qlGvhNROIM3dKiKkt3oAn4W
         4Wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1F+KZPAPMFeFMbiX0oM9Kae2RtfpGXHWIoUQp9WZh+E=;
        b=pDWBSgxGYIsFYLI97ZB9AogzjlrTcSGL1xTYYgh49gs0Sgs5TdPmB5U09OUhfuSvKG
         bdF5pMprv2Cg+Y3yXCGYbO6jAtYPeS7AJpLVr1+0jgxdDb6MJzoW97ONqELXx49JDn12
         nIMYYlOW/2SPkZr+cfj0hH6mf3VPtCxFcp3mTPkz/3rHpLg1jo4PGDstyL8yU/qJO4pQ
         0s4+1FmXZk1/Xhl0K922/of8OgocoGWVNV9WFhAhmf2Bx74AZ2SJProKo/2bqjfEIjjk
         iUfVJwkJG4BDKKtJzUXFcn8Z9uD2gadyQMcMKOLB4xvicTcRHNwdyLh0SPXsIeVTVeT6
         lWfw==
X-Gm-Message-State: APjAAAWmtnwNyW7q/E25Sv4elMpj2w8iL8SgdGOGYs8qzRv5ySuaJuBy
        MzrREOTZ5KRoJHJUeoX/ehoeOA==
X-Google-Smtp-Source: APXvYqy6uHSJq2TpsRPL8u7EOfG1DUaVBd57X2uhsmPc7CQkmkrZZww5RFpC7rQaq+VRfsPBth4cyw==
X-Received: by 2002:a62:3085:: with SMTP id w127mr56962535pfw.170.1558354888733;
        Mon, 20 May 2019 05:21:28 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id n27sm38137077pfb.129.2019.05.20.05.21.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 05:21:28 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] i2c-ocores: sifive: add polling mode workaround for FU540-C000 SoC
Date:   Mon, 20 May 2019 17:50:17 +0530
Message-Id: <1558354817-12034-4-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558354817-12034-1-git-send-email-sagar.kadam@sifive.com>
References: <1558354817-12034-1-git-send-email-sagar.kadam@sifive.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c-ocore driver already has a polling mode interface.But it needs
a workaround for FU540 Chipset on HiFive unleashed board (RevA00).
There is an erratum in FU540 chip that prevents interrupt driven i2c
transfers from working, and also the I2C controller's interrupt bit
cannot be cleared if set, due to this the existing i2c polling mode
interface added in mainline earlier doesn't work, and CPU stall's
infinitely, when-ever i2c transfer is initiated.

Ref:previous polling mode support in mainline

	commit 69c8c0c0efa8 ("i2c: ocores: add polling interface")

The workaround / fix under OCORES_FLAG_BROKEN_IRQ is particularly for
FU540-COOO SoC.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/i2c/busses/i2c-ocores.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index aee1d86..e0d7f24 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -27,6 +27,7 @@
 #include <linux/jiffies.h>
 
 #define OCORES_FLAG_POLL BIT(0)
+#define OCORES_FLAG_BROKEN_IRQ BIT(1) /* Broken IRQ for FU540-C000 SoC */
 
 /*
  * 'process_lock' exists because ocores_process() and ocores_process_timeout()
@@ -239,9 +240,13 @@ static irqreturn_t ocores_isr(int irq, void *dev_id)
 	struct ocores_i2c *i2c = dev_id;
 	u8 stat = oc_getreg(i2c, OCI2C_STATUS);
 
-	if (!(stat & OCI2C_STAT_IF))
+	if (i2c->flags & OCORES_FLAG_BROKEN_IRQ) {
+		if (stat & OCI2C_STAT_IF)
+			if (!(stat & OCI2C_STAT_BUSY))
+				return IRQ_NONE;
+	} else if (!(stat & OCI2C_STAT_IF)) {
 		return IRQ_NONE;
-
+	}
 	ocores_process(i2c, stat);
 
 	return IRQ_HANDLED;
@@ -356,6 +361,11 @@ static void ocores_process_polling(struct ocores_i2c *i2c)
 		ret = ocores_isr(-1, i2c);
 		if (ret == IRQ_NONE)
 			break; /* all messages have been transferred */
+		else {
+			if (i2c->flags & OCORES_FLAG_BROKEN_IRQ)
+				if (i2c->state == STATE_DONE)
+					break;
+		}
 	}
 }
 
@@ -406,7 +416,7 @@ static int ocores_xfer(struct i2c_adapter *adap,
 {
 	struct ocores_i2c *i2c = i2c_get_adapdata(adap);
 
-	if (i2c->flags & OCORES_FLAG_POLL)
+	if ((i2c->flags & (OCORES_FLAG_POLL | OCORES_FLAG_BROKEN_IRQ)))
 		return ocores_xfer_polling(adap, msgs, num);
 	return ocores_xfer_core(i2c, msgs, num, false);
 }
@@ -601,6 +611,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 {
 	struct ocores_i2c *i2c;
 	struct ocores_i2c_platform_data *pdata;
+	const struct of_device_id *match;
 	struct resource *res;
 	int irq;
 	int ret;
@@ -682,13 +693,23 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq == -ENXIO) {
-		i2c->flags |= OCORES_FLAG_POLL;
+		/*
+		 * Set a OCORES_FLAG_BROKEN_IRQ to enable workaround for
+		 * FU540-C000 SoC in polling mode interface of i2c-ocore driver.
+		 * Else enable default polling mode interface for SIFIVE/OCORE
+		 * device types.
+		 */
+		match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
+		if (match && (long)match->data == TYPE_SIFIVE_REV0)
+			i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
+		else
+			i2c->flags |= OCORES_FLAG_POLL;
 	} else {
 		if (irq < 0)
 			return irq;
 	}
 
-	if (!(i2c->flags & OCORES_FLAG_POLL)) {
+	if (!(i2c->flags & (OCORES_FLAG_POLL | OCORES_FLAG_BROKEN_IRQ))) {
 		ret = devm_request_irq(&pdev->dev, irq, ocores_isr, 0,
 				       pdev->name, i2c);
 		if (ret) {
-- 
1.9.1

