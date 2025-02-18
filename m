Return-Path: <linux-i2c+bounces-9480-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AF5A39A18
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 12:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C0613A313B
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 11:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7D023BF88;
	Tue, 18 Feb 2025 11:11:48 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FCC23AE95;
	Tue, 18 Feb 2025 11:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739877108; cv=none; b=jZprKzwMdiTQiYJFfSnMETaSKPd+MDAnzyud5nfxYimO3rhGByVuJlsGOrQgQhnYLIXaf+Sugn0SleadP7qLODyR5ZKygxys1Z1hoxXDDTl7NLSC566nejKSblGvMEjGr7kjOmyFb4em80kKh6JgYMyo4yPCInBv92XXuZ093uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739877108; c=relaxed/simple;
	bh=EJ1POLjaf9X0nZXsquvy2hmvkrcXMe3L7bebjIAnCTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=koU3TpUoqwika1gTfqRDnu6TFptW9agDNrAdv+cVJyTEcGfvj6zPMmYPabyfKsqjHv/BVBpulZPoOdVUXIHHpXPui9MeaUiSnTczMdny1DLxbrDHMpiv4X9zru0ZmpF3y/B21y+HVS2Rm142zrXOI4ygWjzaOl6hEyAU5lAPkMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.156])
	by gateway (Coremail) with SMTP id _____8DxzOLoarRntsF5AA--.13836S3;
	Tue, 18 Feb 2025 19:11:36 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.156])
	by front1 (Coremail) with SMTP id qMiowMBxHcXnarRnNy8aAA--.30914S2;
	Tue, 18 Feb 2025 19:11:36 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	linux-i2c@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	stable@vger.kernel.org,
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: [PATCH] i2c: ls2x: Fix frequency division register access
Date: Tue, 18 Feb 2025 19:11:33 +0800
Message-ID: <20250218111133.3058590-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxHcXnarRnNy8aAA--.30914S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCr18Zw1kZw15ZF1xXr15KFX_yoW5Gw4xp3
	W7Cr95Gr4jyF4Iqw4DAa43uFy7X393JFW09F4jvws3W3Z3Cr1vqay3JFn0yr1kWFWkWay8
	Z3yDGrW5CFWYyrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUUUUU==

According to the chip manual, the I2C register access type of
Loongson-2K2000/LS7A is "B", so we can only access registers in byte
form (readb/writeb).

Although Loongson-2K0500/Loongson-2K1000 do not have similar
constraints, register accesses in byte form also behave correctly.

Also, in hardware, the frequency division registers are defined as two
separate registers (high 8-bit and low 8-bit), so we just access them
directly as bytes.

Cc: stable@vger.kernel.org
Fixes: 015e61f0bffd ("i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller")
Co-developed-by: Hongliang Wang <wanghongliang@loongson.cn>
Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/i2c/busses/i2c-ls2x.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ls2x.c b/drivers/i2c/busses/i2c-ls2x.c
index 8821cac3897b..a4dbbf4ca036 100644
--- a/drivers/i2c/busses/i2c-ls2x.c
+++ b/drivers/i2c/busses/i2c-ls2x.c
@@ -10,6 +10,7 @@
  * Rewritten for mainline by Binbin Zhou <zhoubinbin@loongson.cn>
  */
 
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/completion.h>
 #include <linux/device.h>
@@ -26,7 +27,8 @@
 #include <linux/units.h>
 
 /* I2C Registers */
-#define I2C_LS2X_PRER		0x0 /* Freq Division Register(16 bits) */
+#define I2C_LS2X_PRER_LO	0x0 /* Freq Division Low Byte Register */
+#define I2C_LS2X_PRER_HI	0x1 /* Freq Division High Byte Register */
 #define I2C_LS2X_CTR		0x2 /* Control Register */
 #define I2C_LS2X_TXR		0x3 /* Transport Data Register */
 #define I2C_LS2X_RXR		0x3 /* Receive Data Register */
@@ -93,6 +95,7 @@ static irqreturn_t ls2x_i2c_isr(int this_irq, void *dev_id)
  */
 static void ls2x_i2c_adjust_bus_speed(struct ls2x_i2c_priv *priv)
 {
+	u16 val;
 	struct i2c_timings *t = &priv->i2c_t;
 	struct device *dev = priv->adapter.dev.parent;
 	u32 acpi_speed = i2c_acpi_find_bus_speed(dev);
@@ -105,8 +108,9 @@ static void ls2x_i2c_adjust_bus_speed(struct ls2x_i2c_priv *priv)
 		t->bus_freq_hz = LS2X_I2C_FREQ_STD;
 
 	/* Calculate and set i2c frequency. */
-	writew(LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1,
-	       priv->base + I2C_LS2X_PRER);
+	val = LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1;
+	writeb(FIELD_GET(GENMASK(7, 0), val), priv->base + I2C_LS2X_PRER_LO);
+	writeb(FIELD_GET(GENMASK(15, 8), val), priv->base + I2C_LS2X_PRER_HI);
 }
 
 static void ls2x_i2c_init(struct ls2x_i2c_priv *priv)

base-commit: 7e45b505e699f4c80aa8bf79b4ea2a5f5a66bb51
-- 
2.47.1


