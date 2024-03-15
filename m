Return-Path: <linux-i2c+bounces-2362-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2578387CB75
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 11:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D09921F21B5F
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 10:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E191B814;
	Fri, 15 Mar 2024 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJTNTv4k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091A91B275;
	Fri, 15 Mar 2024 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710498697; cv=none; b=oqOPPE0u3oY0ALTTMv9XGvlQ0Y0t50ZYD8YAGD7i5OBwJN8X3mcXuQ+JptJiFXF1g/DlvsXsp5rqG0mus30/eN+Or36EQbXX3zEsMLiFYZc00rYhPjzHBoUwY46L6U1iSiQRJ7OiisD09DRPaJFOTR4cRK+bf+rnlAyBdw+6+Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710498697; c=relaxed/simple;
	bh=9ZaYynsaCjU76O3Z51pWLQRwLV311S8QrPtofxK97f0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K3TomNcpT2AphsP0RnwoEM/gyZT9ATss8s/EkTnTwRNGUPNfxIZYHOu61lxBf1A92okA/AkYtiL674Tgw0O1Qmc2WYacGzXYH9VARUt+QG0kPVjoC+IWMgpgNAZaCIjhj9vjVJ9EtEqVsvzYZK+YeVKf1x+CEcX4t8Ic4v+53w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJTNTv4k; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41324a16c9eso12228835e9.0;
        Fri, 15 Mar 2024 03:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710498694; x=1711103494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuhvpDK8oZ+Fu96smtWi//ks5eVckNXcaN8Zvrrlm7A=;
        b=HJTNTv4kKQXbfFg8lBgkveETJodUyV0UAa46iTrl0YPJxFXEoV4yVmSq0XJu4nA6di
         OLOym3AAjb1/5EMW9kQZluwoP+z03fnXsWaW7Q9UBI5PKTslr0N8eKyUfPODazDt5bfk
         aPVAZcORlPRHQvCVpYeYRUzxSESRju/KGYXCX8+j8yHKitgF0VK+WeSCFydFqO/3MUJ4
         1rcBSRV1OLRT3jCDnaHqbw5m7mB4CJAYf6x5FB7CjtCEkzCiQhS3U0YWkVyXJJ240XnA
         EbuhbZT9rij0Wm9SdqS4ouCDAbHUSodn19BJ770kIX5ABWoZ24npvYSA5WJpTVdNn30Q
         ywAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710498694; x=1711103494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuhvpDK8oZ+Fu96smtWi//ks5eVckNXcaN8Zvrrlm7A=;
        b=R0TwHpvGWw0adJ/stAH/BvRh9uv5bF9xN2d2FXn3RsUjtH5ZwgD0xat/gkCUBDTjqO
         VcZKE89aDr302zqIWDBBRY/DGKwSv0riqfnqmI1atXO32HV/RQz7MLqsMwqMVSP7aJ2p
         JmiwuONiEQ42imYj3em4ZlFoVJrpRBpcxDo8pOcJetwEY1YuHau2qOlSsYf1mVmInzXV
         EMNwNwVLMibh+xS0gBxXAa/Le9DKPw0VXMhn5Yx/0fSDxIt/CIB7pw0jzcZxdKctWwR1
         srolBYUfCJSlSw6hj3N/f5vO8aurxAeJsLAnURW+HKyDIPMlNVaaQRZ3VesmL7cluo+q
         Rg+A==
X-Forwarded-Encrypted: i=1; AJvYcCXDR7zMVEeIZJL3FW9lGCrRET/L//2k2wip9ZcHqv6LjIzelhH58U8l1ZdpstFIvujVaMdOXKG9JiUhKmRrNKBDQ5/Lo4/daF52XqxXssvA07j3qbAizve0Sx4pe/kmyXm6kakbgHP/uPoQkitpQZ4cluE0ls9PV6Ea9rJQGIeuaB1Wgg==
X-Gm-Message-State: AOJu0YzVo/VxPgGHCug8TqR+9PBPpnvkyBwDssukQYQwgs021//rmpXd
	j4JRuGVv2dGVrAusMNSj6XAEkUAEFvR+wS1N8O0sATW++GlPETcr
X-Google-Smtp-Source: AGHT+IGIoXXZYmYXNu4w56ZmaBywNx018d+0XN7X5GOY1kEAfQHTdwD5iZXKsOexcAo3l685XFCZcQ==
X-Received: by 2002:a05:600c:5187:b0:413:f1d7:eec9 with SMTP id fa7-20020a05600c518700b00413f1d7eec9mr3735593wmb.31.1710498694373;
        Fri, 15 Mar 2024 03:31:34 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:ae92:6adf:5cb6:274c])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b004130378fb77sm8676549wmq.6.2024.03.15.03.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:31:33 -0700 (PDT)
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
Subject: [PATCH v2 3/4] i2c: riic: Pass register offsets and chip details as OF data
Date: Fri, 15 Mar 2024 10:30:32 +0000
Message-Id: <20240315103033.141226-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

With an increasing number of SoCs reusing this driver, each with slight
variations in the RIIC IP, it becomes necessary to support passing these
details as OF data. This approach simplifies the extension of the driver
for other SoCs.

This patch lays the groundwork for adding support for the Renesas RZ/V2H
SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Dropped family from struct riic_of_data
- Included RIIC_REG_END in enum list as flexible array member
  in a struct with no named members is not allowed
---
 drivers/i2c/busses/i2c-riic.c | 56 +++++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 5eb25ef3abc4..3ae2d5c2f85a 100644
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
@@ -87,6 +75,25 @@
 
 #define RIIC_INIT_MSG	-1
 
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
+	RIIC_REG_END,
+};
+
+struct riic_of_data {
+	u8 regs[RIIC_REG_END];
+};
+
 struct riic_dev {
 	void __iomem *base;
 	u8 *buf;
@@ -94,6 +101,7 @@ struct riic_dev {
 	int bytes_left;
 	int err;
 	int is_last;
+	const struct riic_of_data *info;
 	struct completion msg_done;
 	struct i2c_adapter adapter;
 	struct clk *clk;
@@ -107,12 +115,12 @@ struct riic_irq_desc {
 
 static inline void riic_writeb(struct riic_dev *riic, u8 offset, u8 val)
 {
-	writeb(val, riic->base + offset);
+	writeb(val, riic->base + riic->info->regs[offset]);
 }
 
 static inline u8 riic_readb(struct riic_dev *riic, u8 offset)
 {
-	return readb(riic->base + offset);
+	return readb(riic->base + riic->info->regs[offset]);
 }
 
 static inline void riic_clear_set_bit(struct riic_dev *riic, u8 clear, u8 set, u8 reg)
@@ -453,6 +461,8 @@ static int riic_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
+	riic->info = of_device_get_match_data(&pdev->dev);
+
 	adap = &riic->adapter;
 	i2c_set_adapdata(adap, riic);
 	strscpy(adap->name, "Renesas RIIC adapter", sizeof(adap->name));
@@ -497,8 +507,24 @@ static void riic_i2c_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static const struct riic_of_data riic_rz_a_info = {
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


