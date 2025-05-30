Return-Path: <linux-i2c+bounces-11172-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3373DAC91A9
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 163E23A71C7
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 14:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658862367CA;
	Fri, 30 May 2025 14:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LinNm8JZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC4A236454;
	Fri, 30 May 2025 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615518; cv=none; b=uEGEsbz5NF9TbuMU88D6eqxZmMRjFU9u4KadSThm4NUteC9r0lVslF9x8dAcUrLc7wIDiqIapx3sMKWc652EFNfmKsjCCmi061G0m4DbOCW7m0mYn4GHBGkzb+x6B5W8UuwpdTi0kz3beCeOEdSGVunQ4KMMA9DDd7LacDKzkf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615518; c=relaxed/simple;
	bh=SHVWfOFzez/r3t+YZNzb6OlwBQLYIbKSlI5V6QF1JBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MzS+t1zc/kElj/e6HL6YTscSRPJiAVzkGAe+jRYbK4S+2kdnyr9R2ZxFTzO7QUiPzEr2RsN8sv6iQAjCoezK1ovN7Fts89y8Uhi/N50DAsnCXFnYTexuxUAV3RvnNlS6EG1I1QOciiiWXW8lsJDzkWdDr5VboqaeiAb9FKtCVsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LinNm8JZ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4f89c6e61so400656f8f.3;
        Fri, 30 May 2025 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748615514; x=1749220314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMTZNM7RV4GYzAfJ0LEXnIpoUIjCHt62QoMg9WGOUE0=;
        b=LinNm8JZtWi4WNDq2sPR7sp7+Ze0xkmyaIefM4KiIMY6x1lgX7lJ+SXBfkTu3oDmx4
         nkqwjMG+ZaQeijtf3DYdk5orYmboUvp9Jo8C7BctzXZZCTpSDRX7Jq4VNX1fguaKXl1P
         rjS7YzSnJO9b9lh6IDe69iPEXSuhKyNrS6dpznosuotgDBwnGXlfe2oV5iRIuRLnFJUL
         1bbvkxjDPCV3WDPUZxI32LyPqNqOJOtEHJ4F9ERjM0QEK8LDcFPgN6spug8VxBh7q/4T
         hajROLv7xfHsdstzU/t+ZAn/i/8apO62rgs/2DXjD4f3e7hh2O/1C3Xuw+FuSavxAufJ
         52yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748615514; x=1749220314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMTZNM7RV4GYzAfJ0LEXnIpoUIjCHt62QoMg9WGOUE0=;
        b=Ai9DpNgvkRu0bRUnEisr0Z35JKTeWQBUqtP4fXPnxJycOxpF6mJCZHla+IfrdnQLuw
         03GuNCdVg9A/Pr626P1TrEUeOrr+bcorJzWYdXBPgeApZDzIFGly7aCM8Kz5Tx4Lk9pq
         ghnDqPpHA1oVRJJXJ8iwqnFSbO98WGhZp5JYJOGziqQmw9g5GnVHKBLu4Cf3WzSw2hQV
         9U0PWnwyzaIlLyDYyXBkG+bkSSSRYgfgtFAwUOUGL4PHaM8+CIMWwUm8lDJkh7FtEI2W
         ZUN1dIUj6bPX2/e+gBYp8usHJEWCn0BfZvyJfqdrUIjMvgmtW+2cwQZofCYY//NoMcf+
         qJ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUunxZkdKceNeGwCqDYivj0qW+1qSZbHEKx4bBPaIkwjwoAaywLdseM/XDCkC4VhwZrXWI+HBo1gKGZ@vger.kernel.org, AJvYcCWqEB4FeMtNgeNrcmB0rr49OOtE3UPgcYU+dJwWF6kpFl9NEtdBi5hMyXJoaMtbiFfAcuc1lUinKO4sq3BF@vger.kernel.org, AJvYcCXwJp0hSLckVlFrsZ2Sv7n3DO/lFpeXvJHys5kUqd4+h2ngnrOKtVTzSwzWj8AEdaFZ57jhrk8Oe6Dc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3EnB1UVoE9MELKg1Q8hGQFsNbI5hOCEk5PQGokPGRTFuPJQoH
	DaS12TZ298KjKB3lYfqVV9KCOEK57HD0EZoPDjjge5lGtV6PUtz6AE6P
X-Gm-Gg: ASbGncs5Lw80KMewIxyfKd6bEdJ4MQhNk85M/R8BoOHdeo8KbHGfsUQBbvTwSOQPHcy
	1AoLeBwoBxmu9JhoqTyZg8dq+plJn1yGuuIaYunq7EL/DxZBkWkn9nIPhBOQvoNm4tBq+Bkr+Hh
	QdMHRZZjNod+2mY4y7Nem3G372D29x2YHb7BCpfaSjMfhkBOqJI0tw5tMln90HXQNNJdu3h4zuX
	P/gK3YFqmzTyJgnZCiGi5vwnfLd1uPqMLaBDvpeI63ZUb7xm5fLkrpj3EHcTh018wues5QeEfxC
	8Ux25E3AfjwswDQ4/l4SgnQOHWi449fF6NwISg8AwEHF7iegMCbc/jlh54YmlnIEgQauZIZyUzi
	NGCFEnYvCQw==
X-Google-Smtp-Source: AGHT+IGGbSiGQwWJU/79/VikeFbMiFb6RhEIOeOFGzuDzfOk7MmoehjJKw/wuKqGUjRg80g/iQvI6w==
X-Received: by 2002:a05:6000:144e:b0:3a4:ef00:a7ac with SMTP id ffacd0b85a97d-3a4f7aa6727mr2863103f8f.45.1748615514427;
        Fri, 30 May 2025 07:31:54 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f194sm20107445e9.4.2025.05.30.07.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:31:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 6/6] i2c: riic: Add support for RZ/T2H SoC
Date: Fri, 30 May 2025 15:31:35 +0100
Message-ID: <20250530143135.366417-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the Renesas RZ/T2H (R9A09G077) SoC, which features a
different interrupt layout for the RIIC controller. Unlike other SoCs
with individual error interrupts, RZ/T2H uses a combined error interrupt
(EEI).

Introduce a new IRQ descriptor table for RZ/T2H, along with a custom
ISR (`riic_eei_isr`) to handle STOP and NACK detection from the shared
interrupt.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index a4df00cb470c..1f9299f5effa 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -79,6 +79,7 @@
 #define ICIER_SPIE	BIT(3)
 
 #define ICSR2_NACKF	BIT(4)
+#define ICSR2_STOP	BIT(3)
 
 #define ICBR_RESERVED	GENMASK(7, 5) /* Should be 1 on writes */
 
@@ -326,6 +327,19 @@ static irqreturn_t riic_stop_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t riic_eei_isr(int irq, void *data)
+{
+	u8 icsr2 = riic_readb(data, RIIC_ICSR2);
+
+	if (icsr2 & ICSR2_NACKF)
+		return riic_tend_isr(irq, data);
+
+	if (icsr2 & ICSR2_STOP)
+		return riic_stop_isr(irq, data);
+
+	return IRQ_NONE;
+}
+
 static u32 riic_func(struct i2c_adapter *adap)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
@@ -497,6 +511,13 @@ static const struct riic_irq_desc riic_irqs[] = {
 	{ .res_num = 5, .isr = riic_tend_isr, .name = "riic-nack" },
 };
 
+static const struct riic_irq_desc riic_rzt2h_irqs[] = {
+	{ .res_num = 0, .isr = riic_tend_isr, .name = "riic-tend" },
+	{ .res_num = 1, .isr = riic_rdrf_isr, .name = "riic-rdrf" },
+	{ .res_num = 2, .isr = riic_tdre_isr, .name = "riic-tdre" },
+	{ .res_num = 3, .isr = riic_eei_isr,  .name = "riic-eei" },
+};
+
 static int riic_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -643,6 +664,12 @@ static const struct riic_of_data riic_rz_v2h_info = {
 	.num_irqs = ARRAY_SIZE(riic_irqs),
 };
 
+static const struct riic_of_data riic_rz_t2h_info = {
+	.regs = riic_rz_v2h_regs,
+	.irqs = riic_rzt2h_irqs,
+	.num_irqs = ARRAY_SIZE(riic_rzt2h_irqs),
+};
+
 static int riic_i2c_suspend(struct device *dev)
 {
 	struct riic_dev *riic = dev_get_drvdata(dev);
@@ -695,6 +722,7 @@ static const struct dev_pm_ops riic_i2c_pm_ops = {
 static const struct of_device_id riic_i2c_dt_ids[] = {
 	{ .compatible = "renesas,riic-r7s72100", .data =  &riic_rz_a1h_info, },
 	{ .compatible = "renesas,riic-r9a09g057", .data = &riic_rz_v2h_info },
+	{ .compatible = "renesas,riic-r9a09g077", .data = &riic_rz_t2h_info },
 	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
 	{ /* Sentinel */ }
 };
-- 
2.49.0


