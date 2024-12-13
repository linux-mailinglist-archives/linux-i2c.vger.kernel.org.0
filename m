Return-Path: <linux-i2c+bounces-8503-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE989F1494
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 19:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFEE716AB6B
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 18:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D684F1F03F9;
	Fri, 13 Dec 2024 17:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNQ2Z8Oo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DBF1F03FB;
	Fri, 13 Dec 2024 17:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734112728; cv=none; b=g7ayr46N5jSew43kw8uFzV5mlglp0joaz3clXrfQS7DpLoPMZQFN/I3+UzvpNkuxw8TlwAnPS51UgnKzi5HBj4+w5qsG68JLQ0WcFdn27wpkrMdMItIaBlMi5zCDe/6uC/PxjSYwSktdqBrTHqLFW7PwOWJffMtjfE8LoXQxYWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734112728; c=relaxed/simple;
	bh=lriouYN7gltsmvsMjKZ43H1+bGtuTffBvCHZIZdPPTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgRGeaYIYL463uT8nVgxu4BRlJeGYxnxEJCBnP6H1dO0GpaiTzaFYfdCoMchhmsolGmsyTM0FavlE4etSTRaZ0Z3JFPI1isO3LFriAzsi/WsNVfuOrfHVKMvKIAGVmzHvWMdh8pG+SfCZmTIGAI5wBVtLU6TtY7itmLnEytDRJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNQ2Z8Oo; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385de9f789cso1562396f8f.2;
        Fri, 13 Dec 2024 09:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734112725; x=1734717525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2uJf1DDqCWGIBEcHQR60EdB4n+QJNrWV4tvY6UExko=;
        b=kNQ2Z8Oo8kOFJ68hdbRRIdqBZai34guxV2Ol8eWI7zvHmgiPyf0FCvXssgxM/8hJFl
         HACVlerdmS7yiU+BvORragKznf6UibZSO4Wwi+W6Ub3fRcHeNsB2elzW7fO91Ta6ZH0l
         gXitNohC7JWACjZJEEewzQIBcrnkHgtHUaMW6jpQ59C/KaGqspFevj4r7E8CK7NKZePj
         3dcs7UqiywVLAA4kvnLMxPtOrjl0vbaIWp36hH2cOshZNXDQQ8RAVL96dzJ6pMEd0O+d
         txi/w/tkZqp/RuunHxyTKUXfRBk+QzZy3eksBZPpcpfQGSbmG9eelMmpghwuOxmLidFo
         BY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734112725; x=1734717525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2uJf1DDqCWGIBEcHQR60EdB4n+QJNrWV4tvY6UExko=;
        b=wraiAaTM8FIErwrYvuwmKWHUOidJ3FQw+vD3SdsNICiRqxa51ja5D+5+m48GV1GLtQ
         gY6cTICVwNgaWKf3dAinv1YV+8Fg+Q5yzR3DnBDn+rtgpQwFwHSrVBHWd/9GnvuZ6bex
         eNsNSvVysK9xs6YgnkqRCtrSY9rcCryrs5TIrPqlnOVsIuSM3Q4vLPodx1ov+u0i2ivf
         Zb358bLOFn+yMhSvKzmDEtSK+pWq1Nx95hKb9eha8dD9wdcGCD6AL35g8Dep0Ue57Fmh
         W1IMq5fmFDoIRzpjEvltxEO7yksLgQNb/72g0yo7dNlbprgZmZEc2PYFfrkKAkG9NR3x
         s4PQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0CfcHNGaUb5H4N5N7TqFc+8h6P9kmNFm2oFXJNgCQzTL0Bo9yYWNp2pMnhRaPcslELnzmp+72EmE=@vger.kernel.org, AJvYcCWT1QWq7SJoIwGYDaDpUJKD13msoSLNuGeyihkPAxLNOMNNSMyc5pYIQrh3DIl5swnjnXHmhI+Yl5FNkdr8@vger.kernel.org
X-Gm-Message-State: AOJu0YyRQlJaMptmjH6bozP7BEXq3aSWLDtpDmYgz6bWbN9qc+IMko7E
	owUN/1jQy/eja53yoNzTrovSiFfwsz5WkzclBZcJId24vZuqZeMP
X-Gm-Gg: ASbGncvFmxm0KUKKWOCpgoNyJwfG3wl0jFHwQsPMyaoxd23IUwmFIAGFqtkP3KI7aO1
	hZylSKZfpuZWUMCPFjz03C6xydvaNrJes6dmffG9OgoR6NvBrUhJGT8KWGt/19tusPIAAHRDDoN
	V9mvxzmBTPD4kPNpTGaCyVbt+Whk+Jap2eLTkzT+fpao8bBqbLpd/MHnzUNjeD8KwNCxXBMV+2Z
	87teVqkRkyd0xhDAkZdHoZlls+HJ/Y7WrW3Vs3jryRy8LTs8AJ36WI/KKXvi+ugQhB0JfrCxpV7
	wVWx/TrjoQ==
X-Google-Smtp-Source: AGHT+IEHsqN73p8/xBHRcyjY2csNfBRQd3dXrr5hc7WC3ejmqCtWnK1A5/5hAs6MXLMpxEy5ii3hkw==
X-Received: by 2002:a05:6000:2a6:b0:385:f527:be6d with SMTP id ffacd0b85a97d-3888e0f4763mr2698209f8f.36.1734112725051;
        Fri, 13 Dec 2024 09:58:45 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:4eec:e99c:89a6:d7a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c804d573sm119088f8f.64.2024.12.13.09.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 09:58:44 -0800 (PST)
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
Subject: [PATCH 9/9] i2c: riic: Implement bus recovery
Date: Fri, 13 Dec 2024 17:58:28 +0000
Message-ID: <20241213175828.909987-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/i2c/busses/i2c-riic.c | 100 ++++++++++++++++++++++++++++++----
 1 file changed, 90 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 919da1bdcce5..cfb57e1de01b 100644
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
 
 	if (!(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI) ||
 	    !(riic_readb(riic, RIIC_ICCR1) & ICCR1_SCLI))
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
+	if (!(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI) &&
+	    (riic_readb(riic, RIIC_ICCR1) & ICCR1_SCLI)) {
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
+	if (!(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI) ||
+	    !(riic_readb(riic, RIIC_ICCR1) & ICCR1_SCLI))
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


