Return-Path: <linux-i2c+bounces-2408-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C08A387FEC9
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 14:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37ED9B256F7
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 13:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573EB80C1E;
	Tue, 19 Mar 2024 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNZCOC3j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D00D80622;
	Tue, 19 Mar 2024 13:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854775; cv=none; b=f2UouepgiLNFnzYgzFzBfJAg39W/PdlRgWrYWjyWSRCvVw40D4OaQ8vgfKQpcPcekb2ZYC517vPjKYUpWuTK7KEwhfP4QhthOiY7ZjXE9IgqxqBGyxc1P8suFI2bYtJ65g6AMz89hGs0kxdfmBDuWFuFdBn6HQ+YAO/fowQLVdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854775; c=relaxed/simple;
	bh=6yA0hcq4RzH3lD4x4m2PhMp40glly0iCkT4eX1gekaY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bBcMTtmrP070vZoOm2ZbEcQPnhK6n+qrrrcqu+0+TCPDNFjlPdo6NQLqV5Tb1fo7GzK2fMkZhpMK++lyJ6mL97ncujU2oLuO/SFzOCva9us0gSbA9kXbOoqtTNT0L5oNHVRb5Sgn76NFt5SRoLhV3kdQsSzUzfix00+yUnDai/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNZCOC3j; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33e1878e357so2269961f8f.3;
        Tue, 19 Mar 2024 06:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710854772; x=1711459572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Bis6tzXKxCRUGN+TmYPd/QOJDo38W17nENtxQhYz7g=;
        b=LNZCOC3j/iaYxdGjSMMgTumVk4raYLdVClKhFZ/xFv33+lFmdb4LCwRLfu31ivTfPI
         SpD24NZAwO+rJPH3ozH1xVWpnO4EKCMRTe+EMRWWc1CzPUtQwdrVwZHDSmergs907XZi
         7LLtrG7D4ZyQvgKm7lqnof8psJdaNwGK8hubI56HbIr8R78/WtM9n4I8ooPAvsqo+FrV
         c+TvkEWbbs+JffYoIaTwPoX2ijxAkggcOZkCW1BwopigkOvlaBMVAfpg4oF5k+16qcru
         YWe2mkZ9v7YV6mBoyghKkwlnthosXo4ko9rhi2nCSDWgwz56qa0+whPZGRdz2peAKUas
         ZNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854772; x=1711459572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Bis6tzXKxCRUGN+TmYPd/QOJDo38W17nENtxQhYz7g=;
        b=YrHFdEHBx5SvRXE41KdoU1lnYrUIyxcFQFeYYtF2N+F5QjyC8KIfVRTyV9QhyPjOtz
         RiHW0wdoaoBgYD9LWVDl3M43wjBGi1jV3jBYu8BcgzcW6fZIJyH2grVkoyxzvEsXev4g
         HdCMoOW/AEquU/okbzrHHwLnZxu++9DRdbAhIveYug5nWvQ2aADb6VVp4sm4nGD+l/87
         pkkncxQJ1N9Gfk79HZfHSfYmal/hrMF0hcoakrlC7OjoAdL2ltetP5mVobbbfrA5sFSG
         lmllm5IK6FiMduRPV3f8S36ic21ireF/bPOMc2Sv1Oj4qLftg1C+bDCn/3AMB/MqvnA6
         uInw==
X-Forwarded-Encrypted: i=1; AJvYcCUMnz1s5nrqIhJvU48ERUPtLP4P9JdQ2jYf0yX73McofRdQwsBLCl2oJ2ggUVy5LknP3g2FrSHm5TKPKHDqVcCWqBy5yOkWEdpQ1KwyigCe6z5eD+amHsV7vaUZV6mW4i09q5AU0Emjq+3zpW18/35jF2IWsbuguemkgEerj4cVTabbdQ==
X-Gm-Message-State: AOJu0YxMcvxi+TiWbBjIW2vexYlO0QwGiu3/u3FBCWow6g513WFYqv97
	306bGYR/VMvIXrOkvY4RNGid1+tm7WBudFAHc2Cr1F4/v/lgrv5D
X-Google-Smtp-Source: AGHT+IHdlPbl1ZRPu3ahi7f3Tin5v5arhIhjynpFGJnSqjwT2k1Y8nqRRsPwEW0S+ReQFi+dUlbN3A==
X-Received: by 2002:adf:f649:0:b0:341:7864:b31e with SMTP id x9-20020adff649000000b003417864b31emr1624885wrp.68.1710854771699;
        Tue, 19 Mar 2024 06:26:11 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c11:2c6f:3ba9:bab])
        by smtp.gmail.com with ESMTPSA id g4-20020adfe404000000b0033dd2a7167fsm12370020wrm.29.2024.03.19.06.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 06:26:11 -0700 (PDT)
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
Subject: [PATCH v3 3/4] i2c: riic: Pass register offsets and chip details as OF data
Date: Tue, 19 Mar 2024 13:25:02 +0000
Message-Id: <20240319132503.80628-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240319132503.80628-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240319132503.80628-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
- Included RB tag from Geert

v1->v2
- Dropped family from struct riic_of_data
- Included RIIC_REG_END in enum list as flexible array member
  in a struct with no named members is not allowed
---
 drivers/i2c/busses/i2c-riic.c | 56 +++++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index ef35e67839fa..3cd5033286ca 100644
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
 
 static inline void riic_writeb(struct riic_dev *riic, u8 val, u8 offset)
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


