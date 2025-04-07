Return-Path: <linux-i2c+bounces-10138-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A759AA7DD89
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 14:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37F803AD142
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 12:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3D823BCED;
	Mon,  7 Apr 2025 12:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmHbDn4+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7619014A4C6;
	Mon,  7 Apr 2025 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744028349; cv=none; b=LBSSJvwWpZGjA7jjSucllmr1dbXr6BFha5ZH2nH4qMQMbbv8qS43vdVo9VPilQqiFJJuh3k4aNz4I1V5/iWJRW8psxnsDAuRwtfToy2GSu8fDGDjKprBqXOMmTlls/ngm7Gjuf+jLGhziB9VaGNNocyoSFZYVPHamlI6WyzQa5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744028349; c=relaxed/simple;
	bh=zceCTIAOvUX7pV0cHo9UcV46pLDQG6lr+hSDqZx2jXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e6kKBwUO8sXZ7+bcguMNHPgO12u2+IjGPkJWhqX4stVQwT2H+2EHRY1uBLxCC1mzfNIGFkipubAKHlKayRNy0mclNitpEqNjlPMQahau4UJlxikFjNBIIyimG+nTDpkYDDe2t2ZwPsbpPYfL/c9kK3DRNbSJJ/b0wSaPnyjLP1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmHbDn4+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so28832905e9.1;
        Mon, 07 Apr 2025 05:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744028345; x=1744633145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TOLEgMuTxD6y+Xh7epucBexEhDnmYD0IPTBWCattGBk=;
        b=EmHbDn4+UoPpCer8C9VEY9okcpZVjPVseni5AmTjZOfwuHw738XIIlYZhmFt/vxsaI
         qQLX8/A72KMYHOmQ09r6VAK87gJNDRLVhGyODeCDp7cOEWXoHWgFVR68GRAFiOzUgYi+
         afkC9WfMQW55i/agIKBnfj4+w2bCB6DWdx4QUJ7mdRsP5CajSW6rpWDbWd1yVkyIPLGJ
         ITIkwN80bjycEpECfjxcGhvk6Ggz7Ed52UZJqYv6Ee7ycZN7IuGoTGKerXHfA/EKZFxP
         2nE5YjNyKG07PI5gWoOuRd8qLHTiDyKqxbYK8sgZWaYkY3HrB3RmaP96H2bq8PuBUlT0
         IvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744028345; x=1744633145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOLEgMuTxD6y+Xh7epucBexEhDnmYD0IPTBWCattGBk=;
        b=atOklxwxHYxUSnrzTDcCnSlfcLhE04Ydj+kUkPXUl6E1G+rjMiEDhq10abXEXVI9KD
         GVue+zazi9lZWyLxojcuA93Z4op9z1iwX9VNL3TXTBVICArXbP4vtK9GDHPGRHcX7Hmt
         0MNI7JWW60jhPynCI4hHZUnvQl7J4Uj1bhJmo2gJJlQ340TkwHtSH11XitimCKa5mxxL
         o7VRnJfxj7zlfEcQpAlhsNm3R9VwmoyeFLJadOqU2qWO7iLu/jMon4tS7wyDttzjcx6j
         77yB4NkntzzVk46+9tqiITvJtg1hDcrZPbp4lFFxn4/YZCflHDB4L3YxG9BkDCS8n4Ym
         TWIA==
X-Forwarded-Encrypted: i=1; AJvYcCU+D1cNG3tOMrz3pxH+F0yrhoAK8GuJshD0MrqZwHRUI/+LF6at/NkpFulOxKQU/i8TbyQBJBCaZdx8jGQF@vger.kernel.org, AJvYcCX/jm2LUGsqBE61rknpWo73zprltBlYNsfZrBuHBcc5iMQLMFKzRWQKUTji3vCwFqt3hXpEy4lt5Z0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKDwHQtewBi6SWnmqGBZYz4YULDPS4il7ZreXF3KfpHamgD9pe
	o03Yqz89fImCvNAO7cis5kbImDW1m8SuBoTxuemrDXpmcCbsQRXI
X-Gm-Gg: ASbGncsQncvp/7snKmadJA6oNOWl4Se+r8xnFLAeM31NR/FmsELcT9k21TWUWeWlomd
	bLDB/5Ue+IX8B//Q/PuR/A2PjRBBgH1+bH5RmyJppFG8R7hM0bGHldWgnRHKEiEQY0biauI9CSn
	Si5s4uQ39iPCGVMH3U2lelM0vY7LeRM1wIYxq5c6LhM87AQHzliVv3fT3PCp+sIc4Q/ijTw1CXg
	Pvyatwis1WEBSWEGOtwPO9Pjj++ApT/ZsIj7l4DiEhE7luNKBHUv+xn5PL/6F+0a7qR9995+JB7
	oDmD2pj6QU/sPemYpr/r5x6Oxe1nUfOWi7VrbdaAbDVKqGcr4bvs7jcN97SHDSh4P9AN6Q==
X-Google-Smtp-Source: AGHT+IH0Td5/uv+zPsRJbD5kJyuy23VagyIn9vPBGge6iZPW00+v6A7Bfwy+n3IXqFGTQtoyberj7A==
X-Received: by 2002:a05:600c:34d3:b0:43d:609:b305 with SMTP id 5b1f17b1804b1-43ee0697e04mr95676515e9.17.1744028345426;
        Mon, 07 Apr 2025 05:19:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b8ae1sm12116112f8f.51.2025.04.07.05.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:19:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v8] i2c: riic: Implement bus recovery
Date: Mon,  7 Apr 2025 13:18:59 +0100
Message-ID: <20250407121859.131156-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
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
Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
v7->v8
- Included Acks from Andy and Fabrizio.

v6->v7
- https://lore.kernel.org/all/20250203143511.629140-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

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
2.49.0


