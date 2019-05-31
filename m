Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF28314C2
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2019 20:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbfEaSbC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 May 2019 14:31:02 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44012 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727263AbfEaSbC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 May 2019 14:31:02 -0400
Received: by mail-pl1-f194.google.com with SMTP id gn7so4319598plb.10
        for <linux-i2c@vger.kernel.org>; Fri, 31 May 2019 11:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=whBZJgDQut0XKEcOrEe3q4EVDB0/j/1raxaKSkgTkIQ=;
        b=nwbfzQmas96LhvDr5O5HvoAqagDRGZlB+/BlxIs73G3oJilQQLrCr4IiyIXUOCH3u7
         1iZxmpqEhT5IAz5O5aJ8lyNUR5PHpnRqm6ErjDxs7MRGgD7SFkpTWcZURVtZHKEMzy3G
         7FbEdnK9HKblFbqwPkBrinD84mZOifDlVBaFxAlwzfNlKffTDJldVKz5XYVYl9PV8uEV
         g8+fj5VbDioJOirXOqXiUWMjZrdgpYkqdaZEIH4Bv4OM2PAaA7ZjhWVLArYKoVhWbTSg
         it0PYfi/9lppba3qqqliPiWbDv/4Tks39fd6dcXW0Wiohy1KzRLU+JpTGW3eEAwvReUn
         pUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=whBZJgDQut0XKEcOrEe3q4EVDB0/j/1raxaKSkgTkIQ=;
        b=eA1FrwSK06O6eeNsBFI3LgZIP1Nepo0VkZNoFUInDykqqBMML+nz8oRr2kPqGgTt1U
         eY/4R0yVJ78fbNTP36kJcows4H1eEuxGrtKbObDtax4J/lSGVhWrpqkX6b91ulEOZP/7
         hw2k01EajWSgMDoAT3q1mNAMTYAwADWv3hoU5U5vqTy+DDQ+H7r7NXiFavuwNN9mjdJn
         jh7B+c5m7fTqCHbc2qcfZF6v7+a79NEJ/lhc3b1kMCK+ao6pDmoO7ZdysCeo4FP1n5LR
         lNtFBYDtnrLebwSU5r9grJuk/9znkNqTAyeSzPCgY6sZoDrm8VQzrjxxjVvxtwZ3C/qf
         etDQ==
X-Gm-Message-State: APjAAAUEVl3ghDjuPGB2c1nQjTsPSA/d/byrUsWucSG6FGMCW5hN6JSO
        +N3PYvEafVir+BTs0OMqx84qaQ==
X-Google-Smtp-Source: APXvYqx+z1e3YowcKE9vn2XNRlgARXpjtN0AZYMFHq35o1JJHhvOMtn8aVNm/DxqR8rIOb3auNXDTw==
X-Received: by 2002:a17:902:7883:: with SMTP id q3mr11245795pll.89.1559327461413;
        Fri, 31 May 2019 11:31:01 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id 85sm10039511pgb.52.2019.05.31.11.30.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 31 May 2019 11:31:00 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH REPOST v8 3/3] i2c-ocores: sifive: add polling mode workaround for FU540-C000 SoC.
Date:   Sat,  1 Jun 2019 00:00:23 +0530
Message-Id: <1559327423-13001-4-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559327423-13001-1-git-send-email-sagar.kadam@sifive.com>
References: <1559327423-13001-1-git-send-email-sagar.kadam@sifive.com>
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
Acked-by: Andrew Lunn <andrew@lunn.ch>
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

