Return-Path: <linux-i2c+bounces-4335-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6CF916734
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 14:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6479A1F2453D
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 12:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2873159209;
	Tue, 25 Jun 2024 12:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="endkamt9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78F9158A00
	for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 12:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719317670; cv=none; b=AxkXNeTlYgCXZSSiDvEhS8+tpiASoJm0BLwaU+pL1IbJv2Nz/LDDVEnAdMKV66v0BlMKBql6U5JSroHxnBMT3US8AJTGrn/P6o2MfMa9YWiO1H4d0uA12JoLmhPpP9jajD2QpaneUSKxgqHDK2TzslofNpZ646sQ2N5fz8sQMD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719317670; c=relaxed/simple;
	bh=828UGT6zhpaGNswO3hfQPfQnNxDFtEsdkXTLcG7yUMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qkB3mszHH8l3SmqIaj41abTfWDwPUu/fRfWYoNpQ0OaQHSgVu1gQVFt1lTPXYNCM+1/ovvdbRA+EQGrX5w3TcuvgmvhOy5MKzBYxembdPzus4TiwE8+YFgnTRHrPeq972VNINkM7pa+rD/uKRjbTfHXW2i4VWVVATVh++8Qs5mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=endkamt9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-363bbd51050so4309025f8f.0
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 05:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719317667; x=1719922467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rALKwMQZYGMYLdvqGe1Q48GEOVu0KYS1mAaod52Tej0=;
        b=endkamt9Lu401q94haRXg0t1QzGRHLsD2kyS8GmHotGZFg1Oy8+ko0YdpXbxu5jvEm
         SdgZq3+BxjRAgxcde7SrohHUosIH/5Wt99Cs3ULsnjXN5t8aKCHmjO/pWvVWP91xk+4d
         Gg9Jjh+WJrFejcTeh3jDFQP22lM4gEvAcsC1beTyQqm0DwfRb5V/QNgdZGBJwb7K1fJk
         yBcX6YgVoXtkqjTEdbue4cAsJbq5Lvkx0IzSaxCJ7AM4hAAidC74tRpt5MpMShU9M4N8
         QjgJ5BZwWN5RV8y0c6COW3VMTiz5t6jnfM9o9OgyNOGDdBE/nuASRHh6nnmEshRsSYN+
         +GBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719317667; x=1719922467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rALKwMQZYGMYLdvqGe1Q48GEOVu0KYS1mAaod52Tej0=;
        b=itJ6sj9ch9SrQN9gs+jN0t5Qy72GGGkmD985XqGe7y48t4azme/H10YiweurBjZhEK
         WMNo6+cm7SGKxgHHw+GrQj8s4NXfvex9bJwaRvsl8RzIWm4C6D6mn2sj1fS2jDFtfwf4
         BfE+zl+DiF18uh4kr5aAbAk33SNUEK6he34DYA83frEmWRJL1T/LhQwVZeqNwlDzYw8a
         e5my6cAiziI5M2EiWD67PCcjAg6xbEymGYQVxOhW2vl2v1zyQdxOhL+zJexP/PfcRv64
         uVtAh4XRznnjWiwX3fq+S179RZVGE5ftxI1J0TUh91jF7VRD1b7rx6OJ8BpebYn506QN
         /Vpg==
X-Forwarded-Encrypted: i=1; AJvYcCVJlzvM5pNhdpt1IodPAFR7Uc6A9aQGkAax2gM6FBC3hCM15bW9IHxikKTMzem6vSSLGZD3PIs3fuM4/WMUgThGsz2zGk1hT8+L
X-Gm-Message-State: AOJu0YyvjMThpaK5V7xe3eR2BLMcmIWv7KHlevaURGgUkLVi7f6MuJih
	7NO62nnIeLE1Y7//mu3TCWDpBi9zdQOx8pwoUIK1gMzCCx73saGnFuie+0xl4rA=
X-Google-Smtp-Source: AGHT+IGScbs50O3Ozp643JLI2AN2mHjwH2camaqLoFd/JY6fZABGocXFvofQtMKZTI+bOWqi4WqmVg==
X-Received: by 2002:a5d:4e8c:0:b0:360:8dba:af69 with SMTP id ffacd0b85a97d-366e4f0ce68mr4943484f8f.61.1719317667156;
        Tue, 25 Jun 2024 05:14:27 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8b32sm12798437f8f.92.2024.06.25.05.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:14:26 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Date: Tue, 25 Jun 2024 15:13:50 +0300
Message-Id: <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

pm_runtime_get_sync() may return with error. In case it returns with error
dev->power.usage_count needs to be decremented. pm_runtime_resume_and_get()
takes care of this. Thus use it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- delete i2c adapter all the time in remove

 drivers/i2c/busses/i2c-riic.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 83e4d5e14ab6..002b11b020fa 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -113,6 +113,8 @@ struct riic_irq_desc {
 	char *name;
 };
 
+static const char * const riic_rpm_err_msg = "Failed to runtime resume";
+
 static inline void riic_writeb(struct riic_dev *riic, u8 val, u8 offset)
 {
 	writeb(val, riic->base + riic->info->regs[offset]);
@@ -133,10 +135,14 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	struct riic_dev *riic = i2c_get_adapdata(adap);
 	struct device *dev = adap->dev.parent;
 	unsigned long time_left;
-	int i;
+	int i, ret;
 	u8 start_bit;
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err(dev, riic_rpm_err_msg);
+		return ret;
+	}
 
 	if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
 		riic->err = -EBUSY;
@@ -301,6 +307,7 @@ static const struct i2c_algorithm riic_algo = {
 
 static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 {
+	int ret;
 	unsigned long rate;
 	int total_ticks, cks, brl, brh;
 	struct device *dev = riic->adapter.dev.parent;
@@ -379,7 +386,11 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 		 t->scl_fall_ns / (1000000000 / rate),
 		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err(dev, riic_rpm_err_msg);
+		return ret;
+	}
 
 	/* Changing the order of accessing IICRST and ICE may break things! */
 	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1);
@@ -498,11 +509,18 @@ static void riic_i2c_remove(struct platform_device *pdev)
 {
 	struct riic_dev *riic = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
+	int ret;
 
-	pm_runtime_get_sync(dev);
-	riic_writeb(riic, 0, RIIC_ICIER);
-	pm_runtime_put(dev);
 	i2c_del_adapter(&riic->adapter);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err(dev, riic_rpm_err_msg);
+	} else {
+		riic_writeb(riic, 0, RIIC_ICIER);
+		pm_runtime_put(dev);
+	}
+
 	pm_runtime_disable(dev);
 }
 
-- 
2.39.2


