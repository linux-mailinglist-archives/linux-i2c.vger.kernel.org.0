Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 702952D4B1
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2019 06:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbfE2E0l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 May 2019 00:26:41 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38846 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfE2E0l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 May 2019 00:26:41 -0400
Received: by mail-pg1-f195.google.com with SMTP id v11so548956pgl.5
        for <linux-i2c@vger.kernel.org>; Tue, 28 May 2019 21:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id;
        bh=5JJ5fP/lDTAT9lV7xByh9EU/tkZg+0nZnzbUrujyoZg=;
        b=kTq5oKCOvb2JCjaJ13ybujn6O92eJItL/ZZRxZzq2f9s59vvAI5lkJSqmOB3CjQ0qD
         9u8MEgtx6tPOCi9fXdf0/Y4JGYAYxJ+IPb9C78+I2QwQOi0yGpa5pvWqLZ/FORR/RyY6
         63x5WeSHMoeExX+r6oIGbbIUmVsY9BdH3zSIsm5nO+9MEAncg1hT+CvrebHklrUYoIKm
         sP2GcxXbyzLkJdGqbOS1TJjrqYtqBNNC6VZPF3ELlMPG1sGxRnHdv4BYVn3rGPs3x+jf
         YW/3iMocgkhTd1hkEHr8Xky56S8fE1llF5tbygiELsel0yI2uN497rAQW8dpWZm8ACgI
         4kWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=5JJ5fP/lDTAT9lV7xByh9EU/tkZg+0nZnzbUrujyoZg=;
        b=J3iNSaBKckSLbl2nPDOmPy0SSCoHkrE2vGlDMmhXOSzo+dGUom7swyo8Ljfujm4U8a
         NvalyGdZnVRDEzMIcibhecq4P6uEJyojsI/whylUOq2qZZOGClU+oFlSxxZ64pR3sV1x
         5Ww4pL1+AQ1csy3QZvSY5EjH7BJeygXpyJgpfGXvbjLp1qKjQQbfYt97oOg8USEcpHLB
         TxHXeSSyL+PHSpi3HAV3mKojEQY4bBIUOqNKrQn0a9+dpfb+cJuNlOqxtUqX34A9M+qM
         i0y7NSbGd7hzcTw3OBzAgBKB6tbaWcpHTHHoPYNA+i7fUwHTjldfTNk9lacmwFW/EK1V
         MbdQ==
X-Gm-Message-State: APjAAAXdIuOVP2WLguFpv3d+3jgNJQDclJiOmuAQHII66Cw75sH8HcMb
        8gtRsx4Pxskw7bAKqs5PzKtETg==
X-Google-Smtp-Source: APXvYqz8+KopayMYqNIAnYzjwkQi92y0EfTJXP+WbfUiu3G6DyTGAMkJzIynLIfakB8aLVEH3oY7WA==
X-Received: by 2002:a65:56cc:: with SMTP id w12mr3084328pgs.415.1559104000681;
        Tue, 28 May 2019 21:26:40 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id 128sm9217350pff.16.2019.05.28.21.26.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 28 May 2019 21:26:39 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/3] i2c-ocores: sifive: add polling mode workaround for FU540-C000 SoC.
Date:   Wed, 29 May 2019 09:56:18 +0530
Message-Id: <1559103978-13852-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
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

Ref:
	commit dd7dbf0eb090 ("i2c: ocores: refactor setup for polling")

The workaround / fix under OCORES_FLAG_BROKEN_IRQ is particularly for
FU540-COOO SoC.

The polling function identifies a SiFive device based on the device node
and enables the workaround.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/i2c/busses/i2c-ocores.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index b334fa2..4117f1a 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -35,6 +35,7 @@ struct ocores_i2c {
 	int iobase;
 	u32 reg_shift;
 	u32 reg_io_width;
+	unsigned long flags;
 	wait_queue_head_t wait;
 	struct i2c_adapter adap;
 	struct i2c_msg *msg;
@@ -84,6 +85,8 @@ struct ocores_i2c {
 #define TYPE_GRLIB		1
 #define TYPE_SIFIVE_REV0	2
 
+#define OCORES_FLAG_BROKEN_IRQ BIT(1) /* Broken IRQ for FU540-C000 SoC */
+
 static void oc_setreg_8(struct ocores_i2c *i2c, int reg, u8 value)
 {
 	iowrite8(value, i2c->base + (reg << i2c->reg_shift));
@@ -236,9 +239,12 @@ static irqreturn_t ocores_isr(int irq, void *dev_id)
 	struct ocores_i2c *i2c = dev_id;
 	u8 stat = oc_getreg(i2c, OCI2C_STATUS);
 
-	if (!(stat & OCI2C_STAT_IF))
+	if (i2c->flags & OCORES_FLAG_BROKEN_IRQ) {
+		if ((stat & OCI2C_STAT_IF) && !(stat & OCI2C_STAT_BUSY))
+			return IRQ_NONE;
+	} else if (!(stat & OCI2C_STAT_IF)) {
 		return IRQ_NONE;
-
+	}
 	ocores_process(i2c, stat);
 
 	return IRQ_HANDLED;
@@ -353,6 +359,11 @@ static void ocores_process_polling(struct ocores_i2c *i2c)
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
 
@@ -595,6 +606,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 {
 	struct ocores_i2c *i2c;
 	struct ocores_i2c_platform_data *pdata;
+	const struct of_device_id *match;
 	struct resource *res;
 	int irq;
 	int ret;
@@ -677,6 +689,14 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq == -ENXIO) {
 		ocores_algorithm.master_xfer = ocores_xfer_polling;
+
+		/*
+		 * Set in OCORES_FLAG_BROKEN_IRQ to enable workaround for
+		 * FU540-C000 SoC in polling mode.
+		 */
+		match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
+		if (match && (long)match->data == TYPE_SIFIVE_REV0)
+			i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
 	} else {
 		if (irq < 0)
 			return irq;
-- 
1.9.1

