Return-Path: <linux-i2c+bounces-9271-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 895C3A25D4C
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 15:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C84216B869
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 14:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A3B2080F9;
	Mon,  3 Feb 2025 14:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHL/0zRC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB09205E32;
	Mon,  3 Feb 2025 14:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593321; cv=none; b=pOZoTMdrSf39OCSE3FiHk7Airw4daF/TFUT8xu7hmfnVVfziPwrRIjk44tQht9wI5etu3kCDmmJ5D/CalmBOupTrijnCcwEgqV/EmTHtK3eh+bzMZp3W7UGOVg8b/204xUj1CgK8g+uvuIvcJTuRtO0bqRv0G0Ivfv4MTx3KyBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593321; c=relaxed/simple;
	bh=zS3UIeRPJfp3kPaYC4qTWDFPitP0KcrMWf5JGk3//Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C06Fc7ZsURwzq4ALE+LvpNBpbd3HR26QwTJV+QffQ/BrMGIPIpk8FgdnjxeYeY2WkJfxvxutJYdYE89j9mh2O18J6+6GmF3eCfCFKz8LmgESGREQR83eTZbaXz8uaj6PnEJ98HzuYG6LmuvKK9e+kULEK+KUzpnanKYCCujisMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHL/0zRC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso31045515e9.0;
        Mon, 03 Feb 2025 06:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738593318; x=1739198118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YneFPgZdpkmHQjLzXmpP7gJsCnAh7wg4wW8Fsi2L000=;
        b=JHL/0zRCzmI/8kajTFBjzsNoZxdsdEV1HpZOukhPHwZVJH4pY82F7bozWVCo/fD8n5
         3GbuBJNla7SF1EJiII3oTjj9yXyZaETn0/tL0LKUaNi+NqMxK/dmmQ++Vlj5DedtAWF0
         rWCPWZ74fc0mio4vGjMNqk/SG9H+4a0U6GciOh0Rf0Vk2cAcrH79o5RpvLnVGXeb3AXI
         kIi7X4e4ME22c/y7uysZbgkPlcykkQ99W2T2mhH55XS4uPu2XFIEODFZq+B2AI1XyciK
         Y60JUKf97QHykEjeRnwg6yF0G4SYrE4jF740VYCvLhtUhfjpFU5Bf1clBgPAZvRpPact
         k3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738593318; x=1739198118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YneFPgZdpkmHQjLzXmpP7gJsCnAh7wg4wW8Fsi2L000=;
        b=KxD0MrbvcV1ZhaSIen2oQZDFMu0jY06tLu3aEsM79ChthyJIsXIpQEHyx9cJPA2qV+
         3HFuxfHMDsUgl5uJqOZCqeUf/9qJRi0s6Nez101f7mOPBvqtIoiJMTgNjw2S/ymaUcq3
         UJF0TKexG5vIldjUYGI04MBCkbNsTF2cG3987YTJs24ixTZmkCb4B993fVRw5NnHsE0r
         7lHyTOFRMklFZY1FLKNVnqyaOBqG1emihSXEpoXaQZI8rYSviWo9CqnLRdA7SXYvTMgK
         7VqULeUAF0v28EX/pMsDXLdakmDygr0753R36kcYA1HYfir7pc/Y0qBR0+8h2t6qw+Pg
         UqZw==
X-Forwarded-Encrypted: i=1; AJvYcCU6GkCsp425Nw6KCDtfL6qPAeLl5b/I9fxnz+amV0HNzrQz6Vh7J5jp4aStTFmMX+Xwz9iGEt2/I7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJSeJxKMQ2UOOWwXWgKqFCyzoCeb4HGzf0oIjZXmpte0GxoGb+
	jByQWaPHcssR2uRm8Jk36Oq8zsS03Ud7BfvXo7yG9Gc7uIFYc9aV
X-Gm-Gg: ASbGncsJPaD4a7R2OZKFzkV78LRtnOyxyeHxoBDoW5u+nhMjW0QiIbsHl5c8ltJHI+S
	AXuenjIH9ViteHq/dXae5FCPdGNSf7DGO1U4VaM7Ca+YxAs0MADotLSDx9CetrLa8bdPdX1u6HV
	tXQ3Yn+lIn997/L18lQa2FeaCqQHeC8ILrqp5Pur0cBxN9cs7+vIu8ErIhmvK4c5v0if+qYWoBV
	e4uIroN/X9F0Zn5byIaQQE1hQxZxJsiXXV0sW5Vrur366yI/rq0sjLdgpVWp3qOAVZ/oyDLeJhu
	OVz0Mf6yxAdiHWbkfy4MEwV/v9dTjbBXphfj9xkEKXt6
X-Google-Smtp-Source: AGHT+IFNUT9OgvwMdS8tx4odlBZ6H+1KFmS9Shjrlqa93FoZ7wMKSJXIjQk2kIVEXwHetqC0WdeMHw==
X-Received: by 2002:a05:600c:35c3:b0:434:a386:6ae with SMTP id 5b1f17b1804b1-438dc3c2372mr200429565e9.7.1738593317403;
        Mon, 03 Feb 2025 06:35:17 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:3d3f:f5d2:f4b2:fc45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1d0bbfsm13156635f8f.98.2025.02.03.06.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:35:16 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v7] i2c: riic: Implement bus recovery
Date: Mon,  3 Feb 2025 14:35:11 +0000
Message-ID: <20250203143511.629140-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Implement bus recovery by reinitializing the hardware to reset the bus
state and generating 9 clock cycles (and a stop condition) to release
the SDA line.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
Resending this patch which was part of v6 [0] series.

[0] https://lore.kernel.org/lkml/Z4ZCJYPgvS0Ke39g@shikoro/T/

Hi Wolfram,

Ive replied to your comments on v2 here [1] as to why the generic
recovery algorithm was not used.

[1] https://lore.kernel.org/all/CA+V-a8s4-g9vxyfYMgnKMK=Oej9kDBwWsWehWLYTkxw-06w-2g@mail.gmail.com/

Cheers,
Prabhakar

v6->v7
- None

v2->v6
- Included RB and TB from Claudiu.

v1->v2
- Used single register read to check SDA/SCL lines
---
 drivers/i2c/busses/i2c-riic.c | 100 ++++++++++++++++++++++++++++++----
 1 file changed, 90 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index d7dddd6c296a..888825423d94 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -51,6 +51,7 @@
 
 #define ICCR1_ICE	BIT(7)
 #define ICCR1_IICRST	BIT(6)
+#define ICCR1_CLO	BIT(5)
 #define ICCR1_SOWP	BIT(4)
 #define ICCR1_SCLI	BIT(1)
 #define ICCR1_SDAI	BIT(0)
@@ -69,6 +70,7 @@
 #define ICMR3_ACKBT	BIT(3)
 
 #define ICFER_FMPE	BIT(7)
+#define ICFER_MALE	BIT(1)
 
 #define ICIER_TIE	BIT(7)
 #define ICIER_TEIE	BIT(6)
@@ -82,6 +84,8 @@
 
 #define RIIC_INIT_MSG	-1
 
+#define RIIC_RECOVERY_CLK_CNT	9
+
 enum riic_reg_list {
 	RIIC_ICCR1 = 0,
 	RIIC_ICCR2,
@@ -151,13 +155,16 @@ static int riic_bus_barrier(struct riic_dev *riic)
 	ret = readb_poll_timeout(riic->base + riic->info->regs[RIIC_ICCR2], val,
 				 !(val & ICCR2_BBSY), 10, riic->adapter.timeout);
 	if (ret)
-		return ret;
+		goto i2c_recover;
 
 	if ((riic_readb(riic, RIIC_ICCR1) & (ICCR1_SDAI | ICCR1_SCLI)) !=
 	     (ICCR1_SDAI | ICCR1_SCLI))
-		return -EBUSY;
+		goto i2c_recover;
 
 	return 0;
+
+i2c_recover:
+	return i2c_recover_bus(&riic->adapter);
 }
 
 static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
@@ -332,7 +339,7 @@ static const struct i2c_algorithm riic_algo = {
 	.functionality = riic_func,
 };
 
-static int riic_init_hw(struct riic_dev *riic)
+static int riic_init_hw(struct riic_dev *riic, bool recover)
 {
 	int ret;
 	unsigned long rate;
@@ -414,9 +421,11 @@ static int riic_init_hw(struct riic_dev *riic)
 		 rate / total_ticks, ((brl + 3) * 100) / (brl + brh + 6),
 		 t->scl_fall_ns / ns_per_tick, t->scl_rise_ns / ns_per_tick, cks, brl, brh);
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		return ret;
+	if (!recover) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+	}
 
 	/* Changing the order of accessing IICRST and ICE may break things! */
 	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1);
@@ -434,8 +443,74 @@ static int riic_init_hw(struct riic_dev *riic)
 
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	if (!recover) {
+		pm_runtime_mark_last_busy(dev);
+		pm_runtime_put_autosuspend(dev);
+	}
+	return 0;
+}
+
+static int riic_recover_bus(struct i2c_adapter *adap)
+{
+	struct riic_dev *riic = i2c_get_adapdata(adap);
+	struct device *dev = riic->adapter.dev.parent;
+	int ret;
+	u8 val;
+
+	ret = riic_init_hw(riic, true);
+	if (ret)
+		return ret;
+
+	/* output extra SCL clock cycles with master arbitration-lost detection disabled */
+	riic_clear_set_bit(riic, ICFER_MALE, 0, RIIC_ICFER);
+
+	for (unsigned int i = 0; i < RIIC_RECOVERY_CLK_CNT; i++) {
+		riic_clear_set_bit(riic, 0, ICCR1_CLO, RIIC_ICCR1);
+		ret = readb_poll_timeout(riic->base + riic->info->regs[RIIC_ICCR1], val,
+					 !(val & ICCR1_CLO), 0, 100);
+		if (ret) {
+			dev_err(dev, "SCL clock cycle timeout\n");
+			return ret;
+		}
+	}
+
+	/*
+	 * The last clock cycle may have driven the SDA line high, so add a
+	 * short delay to allow the line to stabilize before checking the status.
+	 */
+	udelay(5);
+
+	/*
+	 * If an incomplete byte write occurs, the SDA line may remain low
+	 * even after 9 clock pulses, indicating the bus is not released.
+	 * To resolve this, send an additional clock pulse to simulate a STOP
+	 * condition and ensure proper bus release.
+	 */
+	if ((riic_readb(riic, RIIC_ICCR1) & (ICCR1_SDAI | ICCR1_SCLI)) !=
+	    (ICCR1_SDAI | ICCR1_SCLI)) {
+		riic_clear_set_bit(riic, 0, ICCR1_CLO, RIIC_ICCR1);
+		ret = readb_poll_timeout(riic->base + riic->info->regs[RIIC_ICCR1], val,
+					 !(val & ICCR1_CLO), 0, 100);
+		if (ret) {
+			dev_err(dev, "SCL clock cycle timeout occurred while issuing the STOP condition\n");
+			return ret;
+		}
+		/* delay to make sure SDA line goes back HIGH again */
+		udelay(5);
+	}
+
+	/* clear any flags set */
+	riic_writeb(riic, 0, RIIC_ICSR2);
+	/* read back register to confirm writes */
+	riic_readb(riic, RIIC_ICSR2);
+
+	/* restore back ICFER_MALE */
+	riic_clear_set_bit(riic, 0, ICFER_MALE, RIIC_ICFER);
+
+	if ((riic_readb(riic, RIIC_ICCR1) & (ICCR1_SDAI | ICCR1_SCLI)) !=
+	    (ICCR1_SDAI | ICCR1_SCLI))
+		return -EINVAL;
+
 	return 0;
 }
 
@@ -447,6 +522,10 @@ static const struct riic_irq_desc riic_irqs[] = {
 	{ .res_num = 5, .isr = riic_tend_isr, .name = "riic-nack" },
 };
 
+static struct i2c_bus_recovery_info riic_bri = {
+	.recover_bus = riic_recover_bus,
+};
+
 static int riic_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -493,6 +572,7 @@ static int riic_i2c_probe(struct platform_device *pdev)
 	strscpy(adap->name, "Renesas RIIC adapter", sizeof(adap->name));
 	adap->owner = THIS_MODULE;
 	adap->algo = &riic_algo;
+	adap->bus_recovery_info = &riic_bri;
 	adap->dev.parent = dev;
 	adap->dev.of_node = dev->of_node;
 
@@ -505,7 +585,7 @@ static int riic_i2c_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
-	ret = riic_init_hw(riic);
+	ret = riic_init_hw(riic, false);
 	if (ret)
 		goto out;
 
@@ -613,7 +693,7 @@ static int riic_i2c_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = riic_init_hw(riic);
+	ret = riic_init_hw(riic, false);
 	if (ret) {
 		/*
 		 * In case this happens there is no way to recover from this
-- 
2.43.0


