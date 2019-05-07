Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1251666C
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2019 17:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfEGPPy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 May 2019 11:15:54 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:47098 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbfEGPPy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 May 2019 11:15:54 -0400
Received: by mail-pf1-f196.google.com with SMTP id j11so8801606pff.13
        for <linux-i2c@vger.kernel.org>; Tue, 07 May 2019 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:from:to:subject:date:message-id:in-reply-to:references;
        bh=NeGCH6Ojpl3AA6/me/ugRjP09HRY36CIdEMgVXER1bQ=;
        b=XJgB9Jd7ccJyv9kiW7k2QXrYBcT8dX5La4RUFXpWfVCz/E6/DIzy1bwrjzCukKzhzF
         NEtDEM82tXYdvtrCJUIaPmgm8Wluf/WSzrmJ6R65qMNGb1J8e+hZmMvE3xvzuIixZZcF
         Azyjx+PRPcgLJqhwORgx/fx2wCq2ntEnIaGMdW0nfi97IjM+/xZaCh+bE17UMq4dIsh3
         ZzQEVjtYEUhk0+n+vYnbtVd8pO12PBoKAMT0SDXrKPPkeTVW4yMF0F9vzFO3i6so3QSa
         H30hifc+eK7EaETys9IACDKvLynpwYFGz0mHLDL56S5LVZ9wPSdrgRfp76OSeY4hiuzL
         3IBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references;
        bh=NeGCH6Ojpl3AA6/me/ugRjP09HRY36CIdEMgVXER1bQ=;
        b=IkuCUHzA8XMVSrXFV93f2s6qB1bmBVRnmEdLns6PEp+PAFpUpvny5WEm5YhUD6KAAm
         jGfFJP3BJhp0E+nVyu5+S3/WMOM6/nVlMLFS3dgif4BWPl5RsIQWaiODEehIAeR+aful
         7IUcvyWgHxqaMbuOoVLOA9pCTCIaROEiz+3SHpSUvno6rLOeu8S/XgfB6DQJXALpB3od
         qK1Tjm72yDFgYjUsVzr9lMipOD9eI3kttTCJ0KYKmZXUZUgZP5f7T/3USol5K3ltQVUK
         4N6E54Qy6DHdbh2cFl9AD43YaAQqDvQRAypuh04se5WEQuSgkTFlIvwLs00m9pTvd4/X
         W45Q==
MIME-Version: 1.0
X-Gm-Message-State: APjAAAVQzDIRA/fc1fyjbkNZJ4YYqq9Y5yg8BfTZ4oT8nwjkCUB/yW3R
        v9eKIR65VVnyoLe/MEXWPwhxGbWixexkCG8faOOSWsSA0MWSYDUYEJFYrC2BZq61UokTv4+ObW6
        YxZewu9K3VtV0fQ==
X-Google-Smtp-Source: APXvYqyhH2XogAEsyizfeHFYjaUYlPV1pmjmeUbGXYW9GlHqvMYgmgG9TsheYDohBKvxE8n5+9VMpg==
X-Received: by 2002:a63:cf0d:: with SMTP id j13mr10201967pgg.433.1557242153566;
        Tue, 07 May 2019 08:15:53 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id 2sm5397398pgc.49.2019.05.07.08.15.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 07 May 2019 08:15:53 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 v2 3/3] i2c-ocores: sifive: add polling mode workaround for FU540-C000 SoC.
Date:   Tue,  7 May 2019 20:45:08 +0530
Message-Id: <1557242108-13580-4-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557242108-13580-1-git-send-email-sagar.kadam@sifive.com>
References: <1557242108-13580-1-git-send-email-sagar.kadam@sifive.com>
Content-Type: text/plain; charset="US-ASCII"
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

	commit 69c8c0c0efa8 ("i2c: ocores: add polling interface")

The workaround / fix under OCORES_FLAG_BROKEN_IRQ is particularly for
FU540-COOO SoC.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/i2c/busses/i2c-ocores.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 7bf7b0c..8b994b4 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -27,6 +27,7 @@
 #include <linux/jiffies.h>
 
 #define OCORES_FLAG_POLL BIT(0)
+#define OCORES_FLAG_BROKEN_IRQ BIT(1)
 
 /*
  * 'process_lock' exists because ocores_process() and ocores_process_timeout()
@@ -239,8 +240,13 @@ static irqreturn_t ocores_isr(int irq, void *dev_id)
 	struct ocores_i2c *i2c = dev_id;
 	u8 stat = oc_getreg(i2c, OCI2C_STATUS);
 
-	if (!(stat & OCI2C_STAT_IF))
+	if (i2c->flags & OCORES_FLAG_BROKEN_IRQ) {
+		if (stat & OCI2C_STAT_IF)
+			if (!(stat & OCI2C_STAT_BUSY))
+				return IRQ_NONE;
+	} else if (!(stat & OCI2C_STAT_IF)) {
 		return IRQ_NONE;
+	}
 
 	ocores_process(i2c, stat);
 
@@ -356,6 +362,11 @@ static void ocores_process_polling(struct ocores_i2c *i2c)
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
 
@@ -406,7 +417,7 @@ static int ocores_xfer(struct i2c_adapter *adap,
 {
 	struct ocores_i2c *i2c = i2c_get_adapdata(adap);
 
-	if (i2c->flags & OCORES_FLAG_POLL)
+	if ((i2c->flags & (OCORES_FLAG_POLL | OCORES_FLAG_BROKEN_IRQ)))
 		return ocores_xfer_polling(adap, msgs, num);
 	return ocores_xfer_core(i2c, msgs, num, false);
 }
@@ -597,6 +608,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 {
 	struct ocores_i2c *i2c;
 	struct ocores_i2c_platform_data *pdata;
+	const struct of_device_id *match;
 	struct resource *res;
 	int irq;
 	int ret;
@@ -678,13 +690,21 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq == -ENXIO) {
-		i2c->flags |= OCORES_FLAG_POLL;
+		/*
+		 * Set a OCORES_FLAG_BROKEN_IRQ to enable workaround for FU540
+		 * in polling mode interface of i2c-ocore driver.
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


-- 
The information transmitted is intended only for the person or entity to 
which it is addressed and may contain confidential and/or privileged 
material. If you are not the intended recipient of this message please do 
not read, copy, use or disclose this communication and notify the sender 
immediately. It should be noted that any review, retransmission, 
dissemination or other use of, or taking action or reliance upon, this 
information by persons or entities other than the intended recipient is 
prohibited.
