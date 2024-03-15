Return-Path: <linux-i2c+bounces-2361-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5820487CB71
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 11:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C73EE1F21825
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 10:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B867B1B5B1;
	Fri, 15 Mar 2024 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkYAtukQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6974199B0;
	Fri, 15 Mar 2024 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710498696; cv=none; b=iTZucrxg+UOSJz1B6wdv+M9qPk2JBWKhDaA1K4Oi1xCFGrass/yHvLf393BG/95XhYdH7BxY7lDQG91XmD4AV6gFinQDLcAd+FTiuOlBjqK3EiXrKcoLPIZvC0kL1Pv8NJXkWLuZC3KIN+5ZW6cF+MKTd07xF1GWv5bNFxRVpvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710498696; c=relaxed/simple;
	bh=xZD68RrjRgyuQtZF2fr+1DbEDpvBl8R2+TdDuvK0VSA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KLnF4ZRs1DNt7MhE5qo0D/8NWPfTM3FQZMFD/YMUJ8P6dU137qIpYyM8hkfa0uJGPnp1bjORYbHhhnnjy8RvE7ywJti4DBPuSge8hKZFPlUpPwWo/EGt+gOsNRkDwGqa6c7kiivE/NapYFyq4dtQljQQ7MGuTsD6Acb4LLW48Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkYAtukQ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-413fff1dacfso3708575e9.2;
        Fri, 15 Mar 2024 03:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710498693; x=1711103493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+1se06mIEfqihG0q0TzaQqEvHL03XCt7GY9b7jj+so=;
        b=UkYAtukQ+JuNbmzj7du0PDJvMVL4X4vkkU5uxw8RJILCYztP9kWJu+/IvoxPaPi3cC
         udTJTg6pe0tXyJHE0JelPWO0JjGSWmLSIY3JT3ec2ayqP8KE98Ay/9ifey4TVOgr//rl
         OIATBB3DrDEwsCh5kPDD9BnWrEvSOQ8OqaaONxjI4XL8v5QOjRQb4aPEjKRrzhP6Bkzm
         x5/pYu5foYUvGghJ7QEgP2A9uHPnx7Ei6bSlLDrs+4gXEvs6rZYvCzJCCwcaOJLpC7oj
         +dm9WS00ed8C3xMWM9nn8PUT7KNeD5ut/Zfnnwzs9GVUcz/HgV2ApGFOyqARd7Vuygq2
         9p4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710498693; x=1711103493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+1se06mIEfqihG0q0TzaQqEvHL03XCt7GY9b7jj+so=;
        b=WM7zBMGQMVWXz1uwto/q0xFX/1SsB9WK74pJutFgoxgWyTAm0iUjIwr5DNUHvHyRR8
         BVwDJU2MLVUHvyYIux8Kl0srUYkRwbSFJbJxhDyyKRLPoTal4Ta+lE8vxy0QL0mOUWMW
         GCTZyiKUOooBZ87dX3zZz7JfQuhCgim0CrCygBkuNTSZwKmeB3i6FBpLDRiCz7xBH1m8
         jGZO5ryxZz5SVg0Pez59x57P5wozMygsxIt79aYXZs6OQaMDyYFdQKfjnomlrxpczz91
         3cD11CMfy57fIkg9DiQYzsgWe9h55WXmfZx1lVmjWxlZ4YE5dImKqU6Z9elatHVz89lP
         2yEg==
X-Forwarded-Encrypted: i=1; AJvYcCXX5odU0DBAwveP+FAHUm9T6ijedna4DBHTa7OTq1OjSizDla8CsYd0QvjQbKTozX5TaF5kIOC9HUppIao2dk98/NnP8jdELhxiMNPTU/92RKtMx+N8te/f7xj+N2W+Yb2fElC2qb+UUBxDaWEbQw9QP8Cs2BR76cntP00jDY41fGCfkQ==
X-Gm-Message-State: AOJu0Yw4MRVAq8TzXMVZrbFTCR4sA3W9/oLgRXqcpGpLBNhl2Yx4qfF6
	8j8S97o5wUlpwC3Oyei6aMvknmpjU7C9Pr3DqGp8smz4czaXUObK
X-Google-Smtp-Source: AGHT+IFI9utthlpZ5UUGSYEqz0PCHZYtlADr7SJoWMQgulMeM5b+BnethBqzN+ZOWRmIlKxXVVFgHg==
X-Received: by 2002:a05:600c:524a:b0:413:f50f:b5b3 with SMTP id fc10-20020a05600c524a00b00413f50fb5b3mr1875908wmb.10.1710498692800;
        Fri, 15 Mar 2024 03:31:32 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:ae92:6adf:5cb6:274c])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b004130378fb77sm8676549wmq.6.2024.03.15.03.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:31:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/4] i2c: riic: Introduce helper functions for I2C read/write operations
Date: Fri, 15 Mar 2024 10:30:31 +0000
Message-Id: <20240315103033.141226-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315103033.141226-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240315103033.141226-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce helper functions for performing I2C read and write operations
in the RIIC driver.

These helper functions lay the groundwork for adding support for the
RZ/V2H SoC. This is essential because the register offsets for the RZ/V2H
SoC differ from those of the RZ/A SoC. By abstracting the read and write
operations, we can seamlessly adapt the driver to support different SoC
variants without extensive modifications.

This patch is part of the preparation process for integrating support for
the RZ/V2H SoC into the RIIC driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Renamed i2c read/write to riic_readb/riic_writeb
- Made riic as first parameter for riic_writeb
---
 drivers/i2c/busses/i2c-riic.c | 56 +++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index e43ff483c56e..5eb25ef3abc4 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -105,9 +105,19 @@ struct riic_irq_desc {
 	char *name;
 };
 
+static inline void riic_writeb(struct riic_dev *riic, u8 offset, u8 val)
+{
+	writeb(val, riic->base + offset);
+}
+
+static inline u8 riic_readb(struct riic_dev *riic, u8 offset)
+{
+	return readb(riic->base + offset);
+}
+
 static inline void riic_clear_set_bit(struct riic_dev *riic, u8 clear, u8 set, u8 reg)
 {
-	writeb((readb(riic->base + reg) & ~clear) | set, riic->base + reg);
+	riic_writeb(riic, reg, (riic_readb(riic, reg) & ~clear) | set);
 }
 
 static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
@@ -119,7 +129,7 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	pm_runtime_get_sync(adap->dev.parent);
 
-	if (readb(riic->base + RIIC_ICCR2) & ICCR2_BBSY) {
+	if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
 		riic->err = -EBUSY;
 		goto out;
 	}
@@ -127,7 +137,7 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	reinit_completion(&riic->msg_done);
 	riic->err = 0;
 
-	writeb(0, riic->base + RIIC_ICSR2);
+	riic_writeb(riic, RIIC_ICSR2, 0);
 
 	for (i = 0, start_bit = ICCR2_ST; i < num; i++) {
 		riic->bytes_left = RIIC_INIT_MSG;
@@ -135,9 +145,9 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 		riic->msg = &msgs[i];
 		riic->is_last = (i == num - 1);
 
-		writeb(ICIER_NAKIE | ICIER_TIE, riic->base + RIIC_ICIER);
+		riic_writeb(riic, RIIC_ICIER, ICIER_NAKIE | ICIER_TIE);
 
-		writeb(start_bit, riic->base + RIIC_ICCR2);
+		riic_writeb(riic, RIIC_ICCR2, start_bit);
 
 		time_left = wait_for_completion_timeout(&riic->msg_done, riic->adapter.timeout);
 		if (time_left == 0)
@@ -191,7 +201,7 @@ static irqreturn_t riic_tdre_isr(int irq, void *data)
 	 * value could be moved to the shadow shift register right away. So
 	 * this must be after updates to ICIER (where we want to disable TIE)!
 	 */
-	writeb(val, riic->base + RIIC_ICDRT);
+	riic_writeb(riic, RIIC_ICDRT, val);
 
 	return IRQ_HANDLED;
 }
@@ -200,9 +210,9 @@ static irqreturn_t riic_tend_isr(int irq, void *data)
 {
 	struct riic_dev *riic = data;
 
-	if (readb(riic->base + RIIC_ICSR2) & ICSR2_NACKF) {
+	if (riic_readb(riic, RIIC_ICSR2) & ICSR2_NACKF) {
 		/* We got a NACKIE */
-		readb(riic->base + RIIC_ICDRR);	/* dummy read */
+		riic_readb(riic, RIIC_ICDRR);	/* dummy read */
 		riic_clear_set_bit(riic, ICSR2_NACKF, 0, RIIC_ICSR2);
 		riic->err = -ENXIO;
 	} else if (riic->bytes_left) {
@@ -211,7 +221,7 @@ static irqreturn_t riic_tend_isr(int irq, void *data)
 
 	if (riic->is_last || riic->err) {
 		riic_clear_set_bit(riic, ICIER_TEIE, ICIER_SPIE, RIIC_ICIER);
-		writeb(ICCR2_SP, riic->base + RIIC_ICCR2);
+		riic_writeb(riic, RIIC_ICCR2, ICCR2_SP);
 	} else {
 		/* Transfer is complete, but do not send STOP */
 		riic_clear_set_bit(riic, ICIER_TEIE, 0, RIIC_ICIER);
@@ -230,7 +240,7 @@ static irqreturn_t riic_rdrf_isr(int irq, void *data)
 
 	if (riic->bytes_left == RIIC_INIT_MSG) {
 		riic->bytes_left = riic->msg->len;
-		readb(riic->base + RIIC_ICDRR);	/* dummy read */
+		riic_readb(riic, RIIC_ICDRR);	/* dummy read */
 		return IRQ_HANDLED;
 	}
 
@@ -238,7 +248,7 @@ static irqreturn_t riic_rdrf_isr(int irq, void *data)
 		/* STOP must come before we set ACKBT! */
 		if (riic->is_last) {
 			riic_clear_set_bit(riic, 0, ICIER_SPIE, RIIC_ICIER);
-			writeb(ICCR2_SP, riic->base + RIIC_ICCR2);
+			riic_writeb(riic, RIIC_ICCR2, ICCR2_SP);
 		}
 
 		riic_clear_set_bit(riic, 0, ICMR3_ACKBT, RIIC_ICMR3);
@@ -248,7 +258,7 @@ static irqreturn_t riic_rdrf_isr(int irq, void *data)
 	}
 
 	/* Reading acks the RIE interrupt */
-	*riic->buf = readb(riic->base + RIIC_ICDRR);
+	*riic->buf = riic_readb(riic, RIIC_ICDRR);
 	riic->buf++;
 	riic->bytes_left--;
 
@@ -260,10 +270,10 @@ static irqreturn_t riic_stop_isr(int irq, void *data)
 	struct riic_dev *riic = data;
 
 	/* read back registers to confirm writes have fully propagated */
-	writeb(0, riic->base + RIIC_ICSR2);
-	readb(riic->base + RIIC_ICSR2);
-	writeb(0, riic->base + RIIC_ICIER);
-	readb(riic->base + RIIC_ICIER);
+	riic_writeb(riic, RIIC_ICSR2, 0);
+	riic_readb(riic, RIIC_ICSR2);
+	riic_writeb(riic, RIIC_ICIER, 0);
+	riic_readb(riic, RIIC_ICIER);
 
 	complete(&riic->msg_done);
 
@@ -365,15 +375,15 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
 
 	/* Changing the order of accessing IICRST and ICE may break things! */
-	writeb(ICCR1_IICRST | ICCR1_SOWP, riic->base + RIIC_ICCR1);
+	riic_writeb(riic, RIIC_ICCR1, ICCR1_IICRST | ICCR1_SOWP);
 	riic_clear_set_bit(riic, 0, ICCR1_ICE, RIIC_ICCR1);
 
-	writeb(ICMR1_CKS(cks), riic->base + RIIC_ICMR1);
-	writeb(brh | ICBR_RESERVED, riic->base + RIIC_ICBRH);
-	writeb(brl | ICBR_RESERVED, riic->base + RIIC_ICBRL);
+	riic_writeb(riic, RIIC_ICMR1, ICMR1_CKS(cks));
+	riic_writeb(riic, RIIC_ICBRH, brh | ICBR_RESERVED);
+	riic_writeb(riic, RIIC_ICBRL, brl | ICBR_RESERVED);
 
-	writeb(0, riic->base + RIIC_ICSER);
-	writeb(ICMR3_ACKWP | ICMR3_RDRFS, riic->base + RIIC_ICMR3);
+	riic_writeb(riic, RIIC_ICSER, 0);
+	riic_writeb(riic, RIIC_ICMR3, ICMR3_ACKWP | ICMR3_RDRFS);
 
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
@@ -481,7 +491,7 @@ static void riic_i2c_remove(struct platform_device *pdev)
 	struct riic_dev *riic = platform_get_drvdata(pdev);
 
 	pm_runtime_get_sync(&pdev->dev);
-	writeb(0, riic->base + RIIC_ICIER);
+	riic_writeb(riic, RIIC_ICIER, 0);
 	pm_runtime_put(&pdev->dev);
 	i2c_del_adapter(&riic->adapter);
 	pm_runtime_disable(&pdev->dev);
-- 
2.34.1


