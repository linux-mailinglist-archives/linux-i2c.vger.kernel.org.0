Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5B0123993
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 16:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390252AbfETONH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 10:13:07 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36098 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389877AbfETONG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 10:13:06 -0400
Received: by mail-pl1-f196.google.com with SMTP id d21so6801700plr.3
        for <linux-i2c@vger.kernel.org>; Mon, 20 May 2019 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KECfzIlIxEDfVdyErNUrjun4OGvSgTJTFJXl1TIJwHg=;
        b=Io8Djg5IajMWP4jrjZz+XJT0xkaQiY/xIrp3FP/B/kghGek0Q/EEW9Itb8Ti2zjMmi
         nOu3fLxeW0Rdqh/vA/JlG1/RiCGKxBs7n4aNh5O2rR+/mADH0YJCAYkBtkzS1D2Oiefl
         gPUWRIvc/LWxfW/8yRG745QLWWOKS5RRINiqT+q/JbAuSsb56bIeGRdStsNYnsQFK/AJ
         xnzH2cMLcr9HkXuP1i0yfFu4Yk0d5vGu9tlZ2IJIxxvAnfzffcF4njZHkljSccFgIsuB
         6jDqZaI25gW5Co/g2Z6S6uhig1ZxS/TtkwJTIH125L0NmvtvkHeSvRvW+ZNq7hHdNrKN
         CtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KECfzIlIxEDfVdyErNUrjun4OGvSgTJTFJXl1TIJwHg=;
        b=ejiyCCFW1Bey0/VG1kaPIp9DdmeScTpKN1HFe6IYCnCQ829KcAaDBSKB9wvVKBBfoN
         r9gqkZ+k96gsxUMnYycKbhHdMqX5Bs6HcE96d/pBm5QkMh7ebvXbD2sjVgc+YUa+usb7
         azd/m9pNYMkChhIYsIlU0ciG2pPoT/YCNoQe3AO6geon+6W1jfLoUgGtBxWvGjYwMao+
         5YWmEd7eaWmfQgW1NR+OS+MvAtYcTEqwt5PwAAiX91wpsW/WVeWdVbv83LM6BvwdFTpY
         DmQw3mF7uiwuCe0hbVZAlpWZGDc6+HofG0cgdYf7Xi20lFkjlHekawadlc5GuLS7hAZv
         P8GA==
X-Gm-Message-State: APjAAAXrpQugCVZ8EB4Psd+WKC+GKu3m16bBYPEei5WQo/PmxzAsn9CU
        VBswpczjqGkCJnQwZ5YXWGu6Zw==
X-Google-Smtp-Source: APXvYqzr5Do1Q2Uusd8GpZ+9iK5oqKiy872Tx3Ms8RWbPMtHje6T82nYT6m4tFsbLCdVefsHrX6nNQ==
X-Received: by 2002:a17:902:3283:: with SMTP id z3mr49834232plb.278.1558361586328;
        Mon, 20 May 2019 07:13:06 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id a9sm26388248pgw.72.2019.05.20.07.13.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 07:13:05 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] i2c-ocores: sifive: add polling mode workaround for FU540-C000 SoC.
Date:   Mon, 20 May 2019 19:41:18 +0530
Message-Id: <1558361478-4381-4-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558361478-4381-1-git-send-email-sagar.kadam@sifive.com>
References: <1558361478-4381-1-git-send-email-sagar.kadam@sifive.com>
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
 drivers/i2c/busses/i2c-ocores.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index aee1d86..c3bc97d 100644
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
 
@@ -601,6 +611,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 {
 	struct ocores_i2c *i2c;
 	struct ocores_i2c_platform_data *pdata;
+	const struct of_device_id *match;
 	struct resource *res;
 	int irq;
 	int ret;
@@ -683,6 +694,13 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq == -ENXIO) {
 		i2c->flags |= OCORES_FLAG_POLL;
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

