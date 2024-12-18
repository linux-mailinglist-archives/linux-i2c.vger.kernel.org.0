Return-Path: <linux-i2c+bounces-8589-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A88679F5B45
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 01:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FB1C1891F83
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 00:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECCC813D518;
	Wed, 18 Dec 2024 00:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rnlayz0T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AD81BDC3;
	Wed, 18 Dec 2024 00:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734481004; cv=none; b=ZCWFM2aQFR5Yxu6aFE/9Vyj/mbeuIjrNRRRl3S8ANbLzYQw3U+q4APG5jkeR1FTVoFffbQlgUjV3Khl9dWhoEqN/o8m8aATbvAjC70glp9XA4K9PxWiE/q1D41mqvXicip9McZ+9uHmPzZFib1lC0jXCl57XpOmQyRl6hbE6cso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734481004; c=relaxed/simple;
	bh=DgiiOozTR2Ns2as9XxnYghQ5OWP1bjSFARR0iQ4+cOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lJJCrcwG342Ln+rjvlPKvtg4DE181zvfaoG9ppfwMDYSlmT+iRFK3D0gbsLqSRoiHUK1xAmV+ZQDJikxBun3R+PrvDys4lwhyu6bxxG/EkL0fm+cyoxh54HEaOl3RNRKxFx/f7sECogOzdIuTRFkYQCt1Zc/KFfv5hoErees0Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rnlayz0T; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-382610c7116so3041419f8f.0;
        Tue, 17 Dec 2024 16:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734481001; x=1735085801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5HWS+/1/yNx246kpN3OwCxUSSCvlzQsqFE+TbYgREo=;
        b=Rnlayz0T7JFnrQ2/lvw/uq4eR+Bn7FwqVn0/cp157Qj+cEwxi0T6GgaXQiTDOkGguK
         hVvsAZlXZGS2mMp0Y4j6GHf+JlJpnWqy4A5JD9lHV56tTmVMhhmwS3q39FtRWbayV+h9
         UF+sxhPy/m+UQdcBehXcetYIowRNLyXGPxZE63TP0l86rMpamWDKpGAjY+5paAWRCH5C
         wT2dqBUo/OkAiVqoWcQe5o5Ih+iMEhga4TQsTvbUljAG71mrrWb+8CgE0ARC9DMRj3ci
         4lKl03IjpdGaYTO+mLRj7HGEqeOc5+vW4JXiDO8Vzyi3xSkUQ46YsDl46Lqfg3OCyXvj
         E1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734481001; x=1735085801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5HWS+/1/yNx246kpN3OwCxUSSCvlzQsqFE+TbYgREo=;
        b=NucE3kpGAFYovEc6dr09IapxHTv+VCpyRgvrbzTBPl9dzGvTUAIJaNzLp/8rjk3C4N
         /kN3h3gWgSRH8GvypfHnakiUjt/v7pFUOQXGyZTlbcMPAmzgUflXifbTGxeGQytgC0WN
         COYK1SqRGsuZ6CorsxQI67zA4IoN5CP6NeXDpP1MT2BjKLUdR3XZe6n+ZILYTHGbHiAz
         ogo93YA0goI+xMyBrwrWSj+PwZbv6l+NSQOMNr9D6AWeajzq5T9DzLo684c1fGkAO/up
         WHLYpZMNJ0Ttwo3OmhdT4IdscKIyGhQcHdejDoIimat87oWHCXNhF25zdT9ROsyFgw6V
         PWkw==
X-Forwarded-Encrypted: i=1; AJvYcCU/rOmEPpvHurJzUkrrNo/5CNffFqs1naGwMHmeJaNRFV1fIlDqMrX+qVhzkB55q2FgPkmHxkaonS0=@vger.kernel.org, AJvYcCUoSqMf0INei+Arp7e2tGeZVp2+jwhEw+YkkwJrOEsgtc8UzP2xfaltayHT+ZvznDidNY36P9f93MPJR5E0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0OEJ8H1i0l/w4fmpGFDasHsejzB+FD2lGYxNsZDcdLWZT0gCY
	IIfd5/zU9fnA6mJ+fj6TTiGtEGS33oFeDDcqNb3XcwNc1pwjYh+w4jlCGQ==
X-Gm-Gg: ASbGncueo4ZwPSn81O0IOJ9UBKKo0GND4qedTEskuHl9FIbAQS1QjpYsMVgeAvTe4ua
	16XXO20SQVO3DVU1Q8UNBlaccPR7OiwbczbqNWlZmFwk1dUiiFlez+jUkkX0W4WS9/mmUzFcs4g
	TStBF+TmPXTfBPTz+hTV5oQGK4Z+deqBJueRJOwkaPqTXq4GjqLJTe+jd80ZrN1hywwm0x6tsxG
	RNlDAnBFh9ODrelDPrsPNq6rBY/AxsaS6BVaOAxfjtdKAZj6HtfKq4PGHLkhxEMhv6YKS/g71o+
	RvXXFsjBdA==
X-Google-Smtp-Source: AGHT+IFXdoejpCqwZZa6wAHPN1wrhEv9r8FHGpbElFBnqM3y+UrdqwfDDeh57fW2hHAT+zLbFnnsUg==
X-Received: by 2002:a05:6000:4a1a:b0:385:df2c:91aa with SMTP id ffacd0b85a97d-388e4d2dd31mr694592f8f.7.1734481000860;
        Tue, 17 Dec 2024 16:16:40 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1f638sm2135495e9.37.2024.12.17.16.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:16:40 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 9/9] i2c: riic: Implement bus recovery
Date: Wed, 18 Dec 2024 00:16:18 +0000
Message-ID: <20241218001618.488946-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
v1->v2
- Used single register read to check SDA/SCL lines
---
 drivers/i2c/busses/i2c-riic.c | 100 ++++++++++++++++++++++++++++++----
 1 file changed, 90 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 586092454bb2..d93c371a22de 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -50,6 +50,7 @@
 
 #define ICCR1_ICE	BIT(7)
 #define ICCR1_IICRST	BIT(6)
+#define ICCR1_CLO	BIT(5)
 #define ICCR1_SOWP	BIT(4)
 #define ICCR1_SCLI	BIT(1)
 #define ICCR1_SDAI	BIT(0)
@@ -68,6 +69,7 @@
 #define ICMR3_ACKBT	BIT(3)
 
 #define ICFER_FMPE	BIT(7)
+#define ICFER_MALE	BIT(1)
 
 #define ICIER_TIE	BIT(7)
 #define ICIER_TEIE	BIT(6)
@@ -81,6 +83,8 @@
 
 #define RIIC_INIT_MSG	-1
 
+#define RIIC_RECOVERY_CLK_CNT	9
+
 enum riic_reg_list {
 	RIIC_ICCR1 = 0,
 	RIIC_ICCR2,
@@ -150,13 +154,16 @@ static int riic_bus_barrier(struct riic_dev *riic)
 	ret = readb_poll_timeout(riic->base + riic->info->regs[RIIC_ICCR2], val,
 				 !(val & ICCR2_BBSY), 10, riic->adapter.timeout);
 	if (ret)
-		return -EBUSY;
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
+		return -EINVAL;
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
@@ -491,6 +570,7 @@ static int riic_i2c_probe(struct platform_device *pdev)
 	strscpy(adap->name, "Renesas RIIC adapter", sizeof(adap->name));
 	adap->owner = THIS_MODULE;
 	adap->algo = &riic_algo;
+	adap->bus_recovery_info = &riic_bri;
 	adap->dev.parent = dev;
 	adap->dev.of_node = dev->of_node;
 
@@ -503,7 +583,7 @@ static int riic_i2c_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
-	ret = riic_init_hw(riic);
+	ret = riic_init_hw(riic, false);
 	if (ret)
 		goto out;
 
@@ -611,7 +691,7 @@ static int riic_i2c_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = riic_init_hw(riic);
+	ret = riic_init_hw(riic, false);
 	if (ret) {
 		/*
 		 * In case this happens there is no way to recover from this
-- 
2.43.0


