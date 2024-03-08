Return-Path: <linux-i2c+bounces-2295-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBE38769E4
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 18:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25EDC1F21E4A
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 17:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650CF5A7AB;
	Fri,  8 Mar 2024 17:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPxwE51A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7340B58ACD;
	Fri,  8 Mar 2024 17:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709918899; cv=none; b=ROxUDcW0tnNlZPV2/Jk4k4LLbQ1oVUn3+Ciu4f1Rrmem50i+ilN/mync9hDgWGipgnWW2IltFx9VF71j/I2r0wSMgO/lIyY+eXOMGwvTIVDym3Op+9+ZpUwornsFTjFUpViVwFiabH98pE0vM1BX4hcBpOCO5jKmFstJSgHfqkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709918899; c=relaxed/simple;
	bh=VPUXj8lUVBV77ku3j8NnkMTcjvT8xw3EyO5Zcbm4HSI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bWGC/QIULSeWVf6KWlntDG/+3R9sfEaXxdzvxne44mL4MvO30Xs/brFFXF3faG+ia6YiiSKG4uFIupupKOtLkAt2vpzaQ6okkJJb5p6XqyxX65vf3F+Zov/Ja55tEiZtQ0Drvcn6aFbEP3awBKNzkLKMohL1nBHmS4M09+mdpkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPxwE51A; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41312c3ab40so8451505e9.3;
        Fri, 08 Mar 2024 09:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709918896; x=1710523696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HELb3zjw5jb9Ic+GGtg7OU5GPKfa8XgzqXk9WLQP09A=;
        b=KPxwE51AiLLYcBVQrHQzX5Dg3FwgWbS42bI8V797QANz/aFg54pIy8buXLKxyXKkwe
         nUamQ/mPHyO85wWDSFvEUgAf8ftzFqLFHR1eBvRsPbVfFzV0D+D36kdP92fjcrvKGCk+
         PHuzCeMaeHz5jtqrGxBJHuDvB+8KEZTYZrf/hRBjrxeBf7uI693oRny41ukKaHJxwh4P
         JbBkwRRlk5bu2zipjVtB1UFM/06UL2NH4nSanTuxk2QwvnHxzmJmMEMOKEhdRpGdJkRb
         oLs47m43oRMFm5Sy8OglV152W3wzoJyUQkfNgJyMB7ftMKR3NaHrJ8CdO1ddfXf+CJf2
         YspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709918896; x=1710523696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HELb3zjw5jb9Ic+GGtg7OU5GPKfa8XgzqXk9WLQP09A=;
        b=wFAOMCmvbKcJHA1Gu5Oao3HrrgYe2tNo80dugj4BXv4Ewe7ICd0ytFQhKnvBpBqnyg
         zHZCs3nMyih6/lfRt3Y8ypTgyjXsSXUIySRpBQUOxOaGFdtUUUdCsgk5UR1evIHYzn3V
         zawqOkTiWhHK37JNjzjCxNNP2AVgOfyJ52p4bwVPQiSRmuuj1V4lOcOoJwh4wtecxHyK
         Prd1jqUwFF6gaF41/vLH7/UL9F+MWwaWr1uT6qp4vqdjRXKtNfdN6kMZRyZhtXDNmEIK
         qfv+LcPphM5iYvSPB25Ak40c3ozXkOcmQxYTDwm0O5SATdNFtG64Gne8DCcN33UbKbBq
         qSGg==
X-Forwarded-Encrypted: i=1; AJvYcCXCtZjjxCQbsNJsEuOWwSvIhAKY0odJYcpSK8eENwfijygYDEbiiTQeF7BceIF67jl+4iqKUoarJCAzA87aog622GwbL8XskKPch7hUoXcmAR080GlLqpy66bnNDLBy9b2xlOBgTDhlqR2zj2CNNI/Fwlqd5wzYmZC53dH1C6HiU3CVVA==
X-Gm-Message-State: AOJu0YzGW0zE/A39Sx18O+WEpplTt2p71z32Lu68hWz6qa/+8AySrc3K
	vyxrjGveBwLxUKwvjgMtOOgITjkL0dBjp3zBZ9IuppZP2skf9Qar
X-Google-Smtp-Source: AGHT+IHWKwkSK1ytiAW1r2Ov5xRhiZaGIAHS2Hpi1bSuABqHSin/KKYSUQ9lqorzsn903tMnQwJgPA==
X-Received: by 2002:a05:600c:3109:b0:412:f007:639d with SMTP id g9-20020a05600c310900b00412f007639dmr7399171wmo.23.1709918895600;
        Fri, 08 Mar 2024 09:28:15 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c2e:cd45:f50f:f083])
        by smtp.gmail.com with ESMTPSA id jh3-20020a05600ca08300b0041304100fa9sm6445317wmb.45.2024.03.08.09.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 09:28:14 -0800 (PST)
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
Subject: [PATCH 4/5] i2c: riic: Pass register offsets and chip details as OF data
Date: Fri,  8 Mar 2024 17:27:25 +0000
Message-Id: <20240308172726.225357-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

With an increasing number of SoCs reusing this driver, each with slight
variations in the RIIC IP, it becomes necessary to support passing these
details as OF data. This approach simplifies the extension of the driver
for other SoCs.

This patch lays the groundwork for adding support for the Renesas RZ/V2H
SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 59 ++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 49a12f1ecdf9..3398d639b754 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -46,18 +46,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
-#define RIIC_ICCR1	0x00
-#define RIIC_ICCR2	0x04
-#define RIIC_ICMR1	0x08
-#define RIIC_ICMR3	0x10
-#define RIIC_ICSER	0x18
-#define RIIC_ICIER	0x1c
-#define RIIC_ICSR2	0x24
-#define RIIC_ICBRL	0x34
-#define RIIC_ICBRH	0x38
-#define RIIC_ICDRT	0x3c
-#define RIIC_ICDRR	0x40
-
 #define ICCR1_ICE	0x80
 #define ICCR1_IICRST	0x40
 #define ICCR1_SOWP	0x10
@@ -87,6 +75,13 @@
 
 #define RIIC_INIT_MSG	-1
 
+#define RIIC_RZ_A_TYPE	0
+
+struct riic_of_data {
+	u8 family;
+	u8 regs[];
+};
+
 struct riic_dev {
 	void __iomem *base;
 	u8 *buf;
@@ -94,6 +89,7 @@ struct riic_dev {
 	int bytes_left;
 	int err;
 	int is_last;
+	const struct riic_of_data *info;
 	struct completion msg_done;
 	struct i2c_adapter adapter;
 	struct clk *clk;
@@ -105,14 +101,28 @@ struct riic_irq_desc {
 	char *name;
 };
 
+enum riic_reg_list {
+	RIIC_ICCR1 = 0,
+	RIIC_ICCR2,
+	RIIC_ICMR1,
+	RIIC_ICMR3,
+	RIIC_ICSER,
+	RIIC_ICIER,
+	RIIC_ICSR2,
+	RIIC_ICBRL,
+	RIIC_ICBRH,
+	RIIC_ICDRT,
+	RIIC_ICDRR,
+};
+
 static inline void riic_writeb_reg(u8 val, struct riic_dev *riic, u8 offset)
 {
-	writeb(val, riic->base + offset);
+	writeb(val, riic->base + riic->info->regs[offset]);
 }
 
 static inline u8 riic_readb_reg(struct riic_dev *riic, u8 offset)
 {
-	return readb(riic->base + offset);
+	return readb(riic->base + riic->info->regs[offset]);
 }
 
 static inline void riic_clear_set_bit(struct riic_dev *riic, u8 clear, u8 set, u8 reg)
@@ -453,6 +463,8 @@ static int riic_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
+	riic->info = of_device_get_match_data(&pdev->dev);
+
 	adap = &riic->adapter;
 	i2c_set_adapdata(adap, riic);
 	strscpy(adap->name, "Renesas RIIC adapter", sizeof(adap->name));
@@ -497,8 +509,25 @@ static void riic_i2c_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static const struct riic_of_data riic_rz_a_info = {
+	.family = RIIC_RZ_A_TYPE,
+	.regs = {
+		[RIIC_ICCR1] = 0x00,
+		[RIIC_ICCR2] = 0x04,
+		[RIIC_ICMR1] = 0x08,
+		[RIIC_ICMR3] = 0x10,
+		[RIIC_ICSER] = 0x18,
+		[RIIC_ICIER] = 0x1c,
+		[RIIC_ICSR2] = 0x24,
+		[RIIC_ICBRL] = 0x34,
+		[RIIC_ICBRH] = 0x38,
+		[RIIC_ICDRT] = 0x3c,
+		[RIIC_ICDRR] = 0x40,
+	},
+};
+
 static const struct of_device_id riic_i2c_dt_ids[] = {
-	{ .compatible = "renesas,riic-rz", },
+	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
 	{ /* Sentinel */ },
 };
 
-- 
2.34.1


