Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3F14319E0
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2019 08:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbfFAGLz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Jun 2019 02:11:55 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44640 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfFAGLz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Jun 2019 02:11:55 -0400
Received: by mail-pf1-f196.google.com with SMTP id x3so1960656pff.11
        for <linux-i2c@vger.kernel.org>; Fri, 31 May 2019 23:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=SOLuY/R/QS+l1W9FKWqgele10Viv9LvbKIwVAA0kNm8=;
        b=d+cvo2gIFq6hLOlcwYDfGirRUjDXJLuj5z61HgVDs72gYfgBpvUrHrxic6IdRyYNK6
         64sdFMaYgyrIM2I+55keFM26XVesvzBEkNS4lRyfEazbFN5tmkBNX4Sn+iAUsB/jlxou
         IbVPwJUO6aw4M9lkQj+5SJhH1n9mi86mK/afg8kY9OWezCV/Yqjxh8h1QKiDAoOJdwgP
         iiLDalPwwEIFUx3jdSrigiQSZuccIHWEe8o2hPC6WAd3m13lOpnUjCBMvuJPQr3nYARI
         Dv225GD/CMEyRl+ZchLqkU2PrF0q38vB7knwerfSNZEfPVmSk/R+Q6RBiMnEE0IEVIOY
         2pXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=SOLuY/R/QS+l1W9FKWqgele10Viv9LvbKIwVAA0kNm8=;
        b=j6cwKUvQZPhp0eQmI1e9NkeYYLrb5RrT8V0ct0VkYkbdvqMGgBZcV5PCiFgOw0oH/E
         3Q4WagVFP5mtCsd3EiUPzCbblmML2te+EVazbnksQOK8ptTtkAynYZJorVYm3bzisX0I
         liNJFVNfGTxFrSwGS/jedN4n8Ha8eG66gTTqKW+VQXQw/EXWWhzBIzSnOPRBUtmfYjhc
         bSbV6eusrmC0+cn5ahRyKZAq8SR2YjdNyvvgIivVmtgOyAyvfI6LgxVuXgEMrF8P59px
         BNTeLp8lmrHmnntX9izbiPf4GPTEXxPEKDR8vYHKr4JnHrxfTyWaKWz4UUf+hlklxW+h
         F6cQ==
X-Gm-Message-State: APjAAAUQlxzZkIKNpdr4O6+4F5Vb7DnbX3yaaO4RhVNCpZRaYKIvXO7N
        6MuqmBCPj8IIluUlVJYVnGdbQJ6MCJyaGg==
X-Google-Smtp-Source: APXvYqyaFP3RwpKW0rt3bz1dzY/B4BEYi8u/4Gpw4jzlPR9FDwU98CbU1B23zpMqMoCntWhYDmyfag==
X-Received: by 2002:a62:5f02:: with SMTP id t2mr15171599pfb.7.1559369514886;
        Fri, 31 May 2019 23:11:54 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id 2sm8935850pgl.40.2019.05.31.23.11.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 31 May 2019 23:11:54 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH REPOST v8 3/3] i2c-ocores: sifive: add polling mode workaround for FU540-C000 SoC.
Date:   Sat,  1 Jun 2019 11:41:15 +0530
Message-Id: <1559369475-15374-4-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559369475-15374-1-git-send-email-sagar.kadam@sifive.com>
References: <1559369475-15374-1-git-send-email-sagar.kadam@sifive.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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

