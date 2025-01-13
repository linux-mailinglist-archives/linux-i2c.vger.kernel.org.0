Return-Path: <linux-i2c+bounces-9053-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC931A0B6F3
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 13:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8418F1635ED
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 12:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA92023ED50;
	Mon, 13 Jan 2025 12:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4eUjoPV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C972222F16E;
	Mon, 13 Jan 2025 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771228; cv=none; b=M12au43CXtYqUfLv3wTAlRnItfnYwvaGjckuf22y88HdXwt4lxFKuY0DvTsxPdnk8mTMO9McW/ZOXNHYN+Bf5y/R6te195mQYlSR0PL/JzHupgHpSRXEjfnwMYcykHCzP16cT478BuvL9JwiWvkrnkX/YowqyrYbbriroN//zm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771228; c=relaxed/simple;
	bh=/Lyj8zeajSffVRPgPE60R+/Zg9mopkTcD9qHBwfxMGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gp7BesPHSLJbVzSj+U+a2cXE5H7rTarkdnMYzm44s5J+2NBPUarmzm+WvD49yQq6S0LnJXobC3zcn7KuzhArFV6GryROVEMX46cEytMeHGODMD1EIFuFO3NgFFFUVCA6rtI9reFEFQIMu+olMi++FK8R2RPcqeEyAZc9JA7Qm4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4eUjoPV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38a88ba968aso3513668f8f.3;
        Mon, 13 Jan 2025 04:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736771225; x=1737376025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eu4ESOBvVBzaEzRYnyWj2Jpuu4zqLWmBIIf9AvIQNX0=;
        b=W4eUjoPVVW/ht/uvZr1oIoqrQa3WioYv4+lpXQSId448/WwtAphAjGEOo6k3z8DkjX
         DkaoHdWlIIOIJ2GNK8WWeO+6sJrLeWzZ6nQZTFEnebCDYPy8BsLy2Ixrs1x4SaaXx+l6
         krRn7htY4t/i7QDckLEUW4/nfg9PiQl03X69Ck/kZ8XDT+3H+sYR9O+QUGqN6JJ6QWcI
         JDiE5iO0SDVVQprF3AjqpcrQvOJfM0VNI+/flTokkJx3MZ+k9SekxXnCnkK3PLtdz7iI
         DkchcudbwB3nCtDWVYFebLx2fX1/Ik2ZDrruwgpJBQ3S5AkVpe31wxyg+XhIvhrtyl5k
         Dywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736771225; x=1737376025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eu4ESOBvVBzaEzRYnyWj2Jpuu4zqLWmBIIf9AvIQNX0=;
        b=Cuc9h4zG6Ux1ZWAHAk+XHEwQfqa4he2BQUxE08Amd5o/g7w439fcxFuW5lrmXi+9Ma
         d0JTWy1+irthq1x4goq4+aPckJUc8RjwR7ySa+QNzsQS/nH3SckSoaABpJJwdMtc2BXx
         BANjlKeUVuDUW2LRBXS+fImIgVVU8PExDvdueyIbY4UNlgisQBdZjCnxTiBm3ULEtWZB
         HiCZTcXKYYRwRpn1+VtgVTQUB0SksY1vRrBTxNsWuQ2QPpUtAMFnpzDzrJ7XNBbnKvXj
         NnGbuVCTRoLAbP055nBPVtBppIK3L9LbEg2QYQPFFK9lfGNx5Ypzk44jX1ndq1TZtXER
         3pqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrOXTGridfJk0Qge8IZ1mGcMyICyyGCgVUeN9oue6gc4WXSNzT8mwzTu9MmJvh+zGkvRCJMzBBjtGcvNCh@vger.kernel.org, AJvYcCVTzTyY8de1DbQoRQOZh3LoNO06CiGN0RRrOZe+DYHcVUey6FyRNZxg0/oVJmWMDSpNQDM6RKWh2g4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfxSc7BolhmMb106U8+3d/iJkmOo9c4DblphWv972JctWALfRC
	Q0Q0efLhW3RkjOeywr1F3PPRU+S00j1rIypgcwKZ+PNqomSM9iKt
X-Gm-Gg: ASbGnctgWQds71r0WhcmyK/duKJh77XwuTkESL4GxBT+279oaqG2uttqe6Q5VNAHpBP
	HEuEpiDfcsqnMzIH8zvTHBnhH2uNLn99Usa7Fu+hb/9BFDscnOVcSGygPJ9nT3gMzvKGb+Hg0xs
	5LN8uiRASA2gUM3QJ4yzc9xJzcAyEDDZg8Al7Z/t/baUBgYMyyQXk1L4W3Amp7rP5azeCSUNveD
	W0+MU5VzvM6ZYI1lVgtMSMzn2wE44yqBrgkf1Sn9cYy+c0MthmB0sYD6Xmke0+y4mqC3LJ8ZpUG
	/FzKl8TA8w==
X-Google-Smtp-Source: AGHT+IH++7Mt7kMI0ZNxMuFx6bJy0gxGzyTry5sGR7HsNR9hj6Q2VncFV4yRvdodzlJLS5SawD8f4g==
X-Received: by 2002:a5d:5f51:0:b0:38a:8e2e:9fe3 with SMTP id ffacd0b85a97d-38a8e2ea20cmr13470048f8f.24.1736771225041;
        Mon, 13 Jan 2025 04:27:05 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c23dcsm11812720f8f.101.2025.01.13.04.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:27:04 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 10/10] i2c: riic: Implement bus recovery
Date: Mon, 13 Jan 2025 12:26:43 +0000
Message-ID: <20250113122643.819379-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Hi Wolfram,

I have inlcuded bus recovery patch as part of v6 as I am seeing issues
while using generic I2C algorithm for bus recovery as mentioned in the
below thread.

[0] https://lore.kernel.org/all/CA+V-a8s4-g9vxyfYMgnKMK=Oej9kDBwWsWehWLYTkxw-06w-2g@mail.gmail.com/

Cheers,
Prabhakar

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


