Return-Path: <linux-i2c+bounces-10725-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F469AA64D6
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 22:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E17C39A6CC8
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 20:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DFA2505D2;
	Thu,  1 May 2025 20:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="In+dGAYF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9101F3FE2;
	Thu,  1 May 2025 20:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746132015; cv=none; b=a5xJyhkeLHZcajtw6y/TC+wdlnMSCsUdUcOW8FobLa1lf+mflE72bzTiwoithi9a4WGOFtKTgXWyoa9R3htAlB9AfJkZ/IlTgpU422m6owAHmf75wawJIyRkl9SGRLyubUZ1B9OozAoBfgWhGlLJCub6I2XureU8mJo0Dp9/4IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746132015; c=relaxed/simple;
	bh=mpngZCwtqJFf9YonHiFbMeeI6hPHrVb3HHhdqWpxPxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qlgk9lGAOqheafDKVHk9M/nbJxLIxQYYs5RPu1LLwqpCBReHZ3I8vjFJUZgj++QVX4ZtGklTZ+83Wm0V26lkJZu6YILY6wVMKe9f+SCPGYxpdmrnxs1iD1DikcpqtgXeFkYaD8NeNX8QKGCuGh7DXFtIMSJIOFllk6BwWU5e0IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=In+dGAYF; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39efc1365e4so555185f8f.1;
        Thu, 01 May 2025 13:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746132012; x=1746736812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YROZyOkE+RaFyNeUnTjXvKAzg9wijNdW4xywU98p6mo=;
        b=In+dGAYFSBMWGX+KdkntcaxFBPFLzdEFv9Vx7kvPC3Eozb6RYyAJrkkQNGZEwS+LYK
         la/W5a8BeLY+eLqnkHVweqbrVu5KcCTbjvNE42Eke4TGsmxSjF3fZ+Tx9G9ZfycNIVsp
         Nk7Pdbg51ujW/mTNs1nQKgB9OPDNs0JjbcXOxQEjgEaZhWyRgfytE9/Wfyh+0GHCgga1
         sH+6t7yOe4vpMDbmQ4R3XUoSr5lUcuxdK1SgnP0to5Pa/w095vOd8pw9nJpW/SVxj3iQ
         O9f0MTCDrXwYxGpJI0Tr1ygM/lrz+COElH5shEPErWbV2VgJ9kMx6I5LfiRBcNsvV7sm
         y02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746132012; x=1746736812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YROZyOkE+RaFyNeUnTjXvKAzg9wijNdW4xywU98p6mo=;
        b=fZ500FsF6VW1naAfwG6tItssp64/Ne8H80ZqhKUBGTenpnoSYfW+xa2vzWDL1cbOTT
         +pwuELhdpdHOlpclnDLbZoBNC/SL+9i+M+LObaHcMT1iWhb51SPEj9KDJWKWD23xvniG
         aSvfcOs6DOyDLF8uciylzCyMpEI0XnlSpVCVGhw3srFmOzsxdRqIczpUqEfuWzGKOKxn
         CugfpMdYwuEVkKvIo3A9CCVAjRRToUt1BF5nRiGkULTkxSSPupS6Z9f9wEQsGoQB/PZl
         qcCuRZ5pWvI2nz91oc2mvd91Rx1MX8tO0L8wkBNjIV7u705Z+gswVssmYbC04r370lxS
         nuLA==
X-Forwarded-Encrypted: i=1; AJvYcCUBJEKdJyGGIPSuIugzddk3MDq6RKUL4VmLT8jZpfrZto2cJfMObuuleFgSfOQkBvKEwoLZtCadrO4iL7s1@vger.kernel.org, AJvYcCUNtsvUb6a7NKhz/ib+2goGlZ0lKv5SE70NIOc1PDgUwBJ629ab/4Tn07MUBpA98qhqJH8U76NuRKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPst2xHNijvOiUztmO/MTTxAnILvmMFuiKfRMkRfS24MzItKXi
	H+pk2+1T6/V8o6hTAEWCPivgPhFXpMaehGkoYIoVAWLHuexCGmAT
X-Gm-Gg: ASbGnctxEmxz8nggftg6tQCv71oByqA0rFwQEAuwswnH9CPgpySGifoCC+Pe2Vvu543
	3YQjhT1KH3htfU5Ek0uaozTv3GRamghbkVl+UmD/t0Snjhkz0ZEjRpLNQt8t+xDo1V9oOUwEkJA
	rUV4yFBPWM544WRnWX6Gue31H2Cyr5imtTmwGbYJKPI9/GODNd+dlN4f/rdeqcEHoYEg5EjVdMp
	Cba1XBmZ8OZGuKaKZbIxtlw0s9f421Cx/7pOf6VvUhsCRz8W9U7/5VNKUEHIqf+9oD6BS2P/O/o
	/ICZ45Ejh30hboKeYCK2ccd4h1SBmExFJbr3jcyIvZ6aWZFkoJpVawheKhkAoOR/2gDiaLbPgeU
	=
X-Google-Smtp-Source: AGHT+IE1jA1xgxLG32fzSHaWs61R8osF+VteUCXk2DJOKdA15i6GvZN8NDX0nhqABiETFsYOK+eA7w==
X-Received: by 2002:a05:6000:1acd:b0:3a0:880a:144f with SMTP id ffacd0b85a97d-3a099ad1bc7mr168792f8f.6.1746132011680;
        Thu, 01 May 2025 13:40:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:f0e:4490:d947:2c92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b10013sm164588f8f.65.2025.05.01.13.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 13:40:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v10] i2c: riic: Implement bus recovery
Date: Thu,  1 May 2025 21:40:03 +0100
Message-ID: <20250501204003.141134-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Implement I2C bus recovery support for the RIIC controller by making use
of software-controlled SCL and SDA line manipulation. The controller allows
forcing SCL and SDA levels through control bits, which enables generation
of manual clock pulses and a stop condition to free a stuck bus.

This implementation wires up the bus recovery mechanism using
i2c_generic_scl_recovery and provides get/set operations for SCL and SDA.

This allows the RIIC driver to recover from bus hang scenarios where SDA
is held low by a slave.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
v9->v10:
- Fixed the order of defining ICCR1_SDAO and ICCR1_SCLO
- Added Reviewed-by and Tested-by tags

v8>->v9:
- Dropped Tested-by and Reviewed-by tags from patch 1/2
- Updated commit message

v7->v8:
- Included Acks from Andy and Fabrizio.

v6->v7:
- https://lore.kernel.org/all/20250203143511.629140-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v2->v6:
- Included RB and TB from Claudiu.

v1->v2:
- Used single register read to check SDA/SCL lines
---
 drivers/i2c/busses/i2c-riic.c | 53 +++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index d7dddd6c296a..23375f7fe3ad 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -52,6 +52,8 @@
 #define ICCR1_ICE	BIT(7)
 #define ICCR1_IICRST	BIT(6)
 #define ICCR1_SOWP	BIT(4)
+#define ICCR1_SCLO	BIT(3)
+#define ICCR1_SDAO	BIT(2)
 #define ICCR1_SCLI	BIT(1)
 #define ICCR1_SDAI	BIT(0)
 
@@ -151,11 +153,11 @@ static int riic_bus_barrier(struct riic_dev *riic)
 	ret = readb_poll_timeout(riic->base + riic->info->regs[RIIC_ICCR2], val,
 				 !(val & ICCR2_BBSY), 10, riic->adapter.timeout);
 	if (ret)
-		return ret;
+		return i2c_recover_bus(&riic->adapter);
 
 	if ((riic_readb(riic, RIIC_ICCR1) & (ICCR1_SDAI | ICCR1_SCLI)) !=
 	     (ICCR1_SDAI | ICCR1_SCLI))
-		return -EBUSY;
+		return i2c_recover_bus(&riic->adapter);
 
 	return 0;
 }
@@ -439,6 +441,52 @@ static int riic_init_hw(struct riic_dev *riic)
 	return 0;
 }
 
+static int riic_get_scl(struct i2c_adapter *adap)
+{
+	struct riic_dev *riic = i2c_get_adapdata(adap);
+
+	return !!(riic_readb(riic, RIIC_ICCR1) & ICCR1_SCLI);
+}
+
+static int riic_get_sda(struct i2c_adapter *adap)
+{
+	struct riic_dev *riic = i2c_get_adapdata(adap);
+
+	return !!(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI);
+}
+
+static void riic_set_scl(struct i2c_adapter *adap, int val)
+{
+	struct riic_dev *riic = i2c_get_adapdata(adap);
+
+	if (val)
+		riic_clear_set_bit(riic, ICCR1_SOWP, ICCR1_SCLO, RIIC_ICCR1);
+	else
+		riic_clear_set_bit(riic, ICCR1_SOWP | ICCR1_SCLO, 0, RIIC_ICCR1);
+
+	riic_clear_set_bit(riic, 0, ICCR1_SOWP, RIIC_ICCR1);
+}
+
+static void riic_set_sda(struct i2c_adapter *adap, int val)
+{
+	struct riic_dev *riic = i2c_get_adapdata(adap);
+
+	if (val)
+		riic_clear_set_bit(riic, ICCR1_SOWP, ICCR1_SDAO, RIIC_ICCR1);
+	else
+		riic_clear_set_bit(riic, ICCR1_SOWP | ICCR1_SDAO, 0, RIIC_ICCR1);
+
+	riic_clear_set_bit(riic, 0, ICCR1_SOWP, RIIC_ICCR1);
+}
+
+static struct i2c_bus_recovery_info riic_bri = {
+	.recover_bus = i2c_generic_scl_recovery,
+	.get_scl = riic_get_scl,
+	.set_scl = riic_set_scl,
+	.get_sda = riic_get_sda,
+	.set_sda = riic_set_sda,
+};
+
 static const struct riic_irq_desc riic_irqs[] = {
 	{ .res_num = 0, .isr = riic_tend_isr, .name = "riic-tend" },
 	{ .res_num = 1, .isr = riic_rdrf_isr, .name = "riic-rdrf" },
@@ -495,6 +543,7 @@ static int riic_i2c_probe(struct platform_device *pdev)
 	adap->algo = &riic_algo;
 	adap->dev.parent = dev;
 	adap->dev.of_node = dev->of_node;
+	adap->bus_recovery_info = &riic_bri;
 
 	init_completion(&riic->msg_done);
 
-- 
2.49.0


