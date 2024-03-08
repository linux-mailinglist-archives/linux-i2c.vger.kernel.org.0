Return-Path: <linux-i2c+bounces-2294-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B428769E1
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 18:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CE7E2833E7
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 17:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF6F59B5E;
	Fri,  8 Mar 2024 17:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGTzEk4/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1B157336;
	Fri,  8 Mar 2024 17:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709918898; cv=none; b=lScy7ZdB80r1UHKjiFgdXxx+2fbMZg8DLoWRKh0IcsNen1QBrkf2XDZr2IZItxCs4UI2qcXMJu+z0lNcEg+UUgLeUe/bqFO4f2sz23q5d//sb/Lr60S4VnjAiknu/qqGndmkkAuCVRKs92Mqk+0SJdYK3VdQTpJ7yGedK1stYsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709918898; c=relaxed/simple;
	bh=Pht7E0DhC6qlBxoiNrZ2ax48AgGAs6UlSMBS8H9oE3Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vEBrN1lgGLoxXzul4dBtZAmJWiuQOhT7fjeWzWTT0aXgy6FP79MkeG1qia/quC165ynifik5HeX4LJjrpg865TwiKdv815aEzYtBTMABSOjoR6rKqwTH/e29tu3zxzNdGBtJUTjE+sESCwXkWFq1e9r5fg+aj/uTufBXUnleNEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGTzEk4/; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5131316693cso2984176e87.0;
        Fri, 08 Mar 2024 09:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709918894; x=1710523694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EETxBX6gd6azB5EobpuUqQWG5+8tb2ohej+sR8fJFc=;
        b=FGTzEk4/4VUv+iBqbGj+rxVgZUuN61PL6Bxfr0uITFfGgAb8+qzzk9xAWJ8PdY0XIr
         dwVCCvWc1aDhmkP/Dxn1gMzVjfNrxr8L5gjmMtPvyohFGTuUczeEz29+4ALZeAStkX58
         +J5oXJvWwZZSmzCV38yJ4GlzX2sqmwgC1w7Mz13rxQGCDUZS+T5/STtEcwMaQTUoUSnj
         W1I7PoiKvcMsbrNRhOkmgwGzyYrPn8y0fMocOiLNuoOT9qOD4KRGx9JmAlx/KWeZnO3g
         Acbm9EQ2tIXfeNa6ib9aWUBxf1uFVjX7vCoBNGPh7NxTe+xp9egfWUTWWVk6SZvoSL1l
         YrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709918894; x=1710523694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EETxBX6gd6azB5EobpuUqQWG5+8tb2ohej+sR8fJFc=;
        b=beZ2mFuArbD8AAr0KvV3bJAmWI6yKrN59n0jw0AtF33ich9FpoEq4SBjvpPrm6eiUb
         fzjgp7xaASBqOLIQJPvKMl/5Xwzf6OQ9gRn9Wdb4Va9ZJveVqsXmueebSynAW79J6vKk
         jm+JSZsoQwGIIMCXNztlXHN4JORO4il9C+6/HYz1t11k6DBuIsmrjhl21m93Wurl0CaG
         EdqZ5Qn7N7SpiCB++eK+7RgJm8lZBL14JHo0vZ+R1yWG4BXp9bvUodfIJ29R7huo3xUG
         6IRPmyXUHU2DFW1IBDYljeP62QRV86kcr3iSLBm6W/PyWzrv2niBmBUbI5ZrW5zHgKMl
         2Rvg==
X-Forwarded-Encrypted: i=1; AJvYcCX5SOUVtxKOoEj5JiwrH9ii3iyloPPUPIoz9iFw7+v0o7IggciEZFSuFfjYlJHFiLHnHL2r9VC+9zyP5HCMJpOxtQsF2cIs+GRDov4CtO+J6qX5ZaDRQZj646uo2QnFD6qmwtElBQ3cvT7X27F14fHLFW9zfzr7+A5PVsIAZ7VtcLxpEw==
X-Gm-Message-State: AOJu0YwXThde06NncJ2XDd9p/uZAP7LFQtIHUd3kYTofmmlwHj5tE+sQ
	YIdYhTVVp3Kl8AT0LGfQk95EgRXM5NL2vCBuGX0rJkmYShKC/mNyXPdjiyrN
X-Google-Smtp-Source: AGHT+IHuwSYYhl8CDQ5vJdqRCx985el4ByCrxULN7HKbxC4Fr0hx2D4V4hbMbbiw/lLXhtTjK1Q7Fw==
X-Received: by 2002:a05:6512:4892:b0:513:426e:618 with SMTP id eq18-20020a056512489200b00513426e0618mr3894414lfb.48.1709918894007;
        Fri, 08 Mar 2024 09:28:14 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c2e:cd45:f50f:f083])
        by smtp.gmail.com with ESMTPSA id jh3-20020a05600ca08300b0041304100fa9sm6445317wmb.45.2024.03.08.09.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 09:28:12 -0800 (PST)
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
Subject: [PATCH 3/5] i2c: riic: Introduce helper functions for I2C read/write operations
Date: Fri,  8 Mar 2024 17:27:24 +0000
Message-Id: <20240308172726.225357-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 56 +++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index e43ff483c56e..49a12f1ecdf9 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -105,9 +105,19 @@ struct riic_irq_desc {
 	char *name;
 };
 
+static inline void riic_writeb_reg(u8 val, struct riic_dev *riic, u8 offset)
+{
+	writeb(val, riic->base + offset);
+}
+
+static inline u8 riic_readb_reg(struct riic_dev *riic, u8 offset)
+{
+	return readb(riic->base + offset);
+}
+
 static inline void riic_clear_set_bit(struct riic_dev *riic, u8 clear, u8 set, u8 reg)
 {
-	writeb((readb(riic->base + reg) & ~clear) | set, riic->base + reg);
+	riic_writeb_reg((riic_readb_reg(riic, reg) & ~clear) | set, riic, reg);
 }
 
 static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
@@ -119,7 +129,7 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	pm_runtime_get_sync(adap->dev.parent);
 
-	if (readb(riic->base + RIIC_ICCR2) & ICCR2_BBSY) {
+	if (riic_readb_reg(riic, RIIC_ICCR2) & ICCR2_BBSY) {
 		riic->err = -EBUSY;
 		goto out;
 	}
@@ -127,7 +137,7 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	reinit_completion(&riic->msg_done);
 	riic->err = 0;
 
-	writeb(0, riic->base + RIIC_ICSR2);
+	riic_writeb_reg(0, riic, RIIC_ICSR2);
 
 	for (i = 0, start_bit = ICCR2_ST; i < num; i++) {
 		riic->bytes_left = RIIC_INIT_MSG;
@@ -135,9 +145,9 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 		riic->msg = &msgs[i];
 		riic->is_last = (i == num - 1);
 
-		writeb(ICIER_NAKIE | ICIER_TIE, riic->base + RIIC_ICIER);
+		riic_writeb_reg(ICIER_NAKIE | ICIER_TIE, riic, RIIC_ICIER);
 
-		writeb(start_bit, riic->base + RIIC_ICCR2);
+		riic_writeb_reg(start_bit, riic, RIIC_ICCR2);
 
 		time_left = wait_for_completion_timeout(&riic->msg_done, riic->adapter.timeout);
 		if (time_left == 0)
@@ -191,7 +201,7 @@ static irqreturn_t riic_tdre_isr(int irq, void *data)
 	 * value could be moved to the shadow shift register right away. So
 	 * this must be after updates to ICIER (where we want to disable TIE)!
 	 */
-	writeb(val, riic->base + RIIC_ICDRT);
+	riic_writeb_reg(val, riic, RIIC_ICDRT);
 
 	return IRQ_HANDLED;
 }
@@ -200,9 +210,9 @@ static irqreturn_t riic_tend_isr(int irq, void *data)
 {
 	struct riic_dev *riic = data;
 
-	if (readb(riic->base + RIIC_ICSR2) & ICSR2_NACKF) {
+	if (riic_readb_reg(riic, RIIC_ICSR2) & ICSR2_NACKF) {
 		/* We got a NACKIE */
-		readb(riic->base + RIIC_ICDRR);	/* dummy read */
+		riic_readb_reg(riic, RIIC_ICDRR);	/* dummy read */
 		riic_clear_set_bit(riic, ICSR2_NACKF, 0, RIIC_ICSR2);
 		riic->err = -ENXIO;
 	} else if (riic->bytes_left) {
@@ -211,7 +221,7 @@ static irqreturn_t riic_tend_isr(int irq, void *data)
 
 	if (riic->is_last || riic->err) {
 		riic_clear_set_bit(riic, ICIER_TEIE, ICIER_SPIE, RIIC_ICIER);
-		writeb(ICCR2_SP, riic->base + RIIC_ICCR2);
+		riic_writeb_reg(ICCR2_SP, riic, RIIC_ICCR2);
 	} else {
 		/* Transfer is complete, but do not send STOP */
 		riic_clear_set_bit(riic, ICIER_TEIE, 0, RIIC_ICIER);
@@ -230,7 +240,7 @@ static irqreturn_t riic_rdrf_isr(int irq, void *data)
 
 	if (riic->bytes_left == RIIC_INIT_MSG) {
 		riic->bytes_left = riic->msg->len;
-		readb(riic->base + RIIC_ICDRR);	/* dummy read */
+		riic_readb_reg(riic, RIIC_ICDRR);	/* dummy read */
 		return IRQ_HANDLED;
 	}
 
@@ -238,7 +248,7 @@ static irqreturn_t riic_rdrf_isr(int irq, void *data)
 		/* STOP must come before we set ACKBT! */
 		if (riic->is_last) {
 			riic_clear_set_bit(riic, 0, ICIER_SPIE, RIIC_ICIER);
-			writeb(ICCR2_SP, riic->base + RIIC_ICCR2);
+			riic_writeb_reg(ICCR2_SP, riic, RIIC_ICCR2);
 		}
 
 		riic_clear_set_bit(riic, 0, ICMR3_ACKBT, RIIC_ICMR3);
@@ -248,7 +258,7 @@ static irqreturn_t riic_rdrf_isr(int irq, void *data)
 	}
 
 	/* Reading acks the RIE interrupt */
-	*riic->buf = readb(riic->base + RIIC_ICDRR);
+	*riic->buf = riic_readb_reg(riic, RIIC_ICDRR);
 	riic->buf++;
 	riic->bytes_left--;
 
@@ -260,10 +270,10 @@ static irqreturn_t riic_stop_isr(int irq, void *data)
 	struct riic_dev *riic = data;
 
 	/* read back registers to confirm writes have fully propagated */
-	writeb(0, riic->base + RIIC_ICSR2);
-	readb(riic->base + RIIC_ICSR2);
-	writeb(0, riic->base + RIIC_ICIER);
-	readb(riic->base + RIIC_ICIER);
+	riic_writeb_reg(0, riic, RIIC_ICSR2);
+	riic_readb_reg(riic, RIIC_ICSR2);
+	riic_writeb_reg(0, riic, RIIC_ICIER);
+	riic_readb_reg(riic, RIIC_ICIER);
 
 	complete(&riic->msg_done);
 
@@ -365,15 +375,15 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
 
 	/* Changing the order of accessing IICRST and ICE may break things! */
-	writeb(ICCR1_IICRST | ICCR1_SOWP, riic->base + RIIC_ICCR1);
+	riic_writeb_reg(ICCR1_IICRST | ICCR1_SOWP, riic, RIIC_ICCR1);
 	riic_clear_set_bit(riic, 0, ICCR1_ICE, RIIC_ICCR1);
 
-	writeb(ICMR1_CKS(cks), riic->base + RIIC_ICMR1);
-	writeb(brh | ICBR_RESERVED, riic->base + RIIC_ICBRH);
-	writeb(brl | ICBR_RESERVED, riic->base + RIIC_ICBRL);
+	riic_writeb_reg(ICMR1_CKS(cks), riic, RIIC_ICMR1);
+	riic_writeb_reg(brh | ICBR_RESERVED, riic, RIIC_ICBRH);
+	riic_writeb_reg(brl | ICBR_RESERVED, riic, RIIC_ICBRL);
 
-	writeb(0, riic->base + RIIC_ICSER);
-	writeb(ICMR3_ACKWP | ICMR3_RDRFS, riic->base + RIIC_ICMR3);
+	riic_writeb_reg(0, riic, RIIC_ICSER);
+	riic_writeb_reg(ICMR3_ACKWP | ICMR3_RDRFS, riic, RIIC_ICMR3);
 
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
@@ -481,7 +491,7 @@ static void riic_i2c_remove(struct platform_device *pdev)
 	struct riic_dev *riic = platform_get_drvdata(pdev);
 
 	pm_runtime_get_sync(&pdev->dev);
-	writeb(0, riic->base + RIIC_ICIER);
+	riic_writeb_reg(0, riic, RIIC_ICIER);
 	pm_runtime_put(&pdev->dev);
 	i2c_del_adapter(&riic->adapter);
 	pm_runtime_disable(&pdev->dev);
-- 
2.34.1


