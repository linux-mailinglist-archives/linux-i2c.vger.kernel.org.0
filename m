Return-Path: <linux-i2c+bounces-9645-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCBFA49B3C
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 15:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 028A77AA37F
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 14:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00ACA26D5D2;
	Fri, 28 Feb 2025 14:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="ng2VadjU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF0B25F984;
	Fri, 28 Feb 2025 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751482; cv=none; b=ZNmpy4IyFRqlugL5+y6Kq28aqDIxjWHx/Ag5MSeFCQu2OMMFJ3DHRy022P+VUVQF3QsY+nlmzf5I64RlwpAXhf8nmudKqkypoSdKsrD3yb/RwDTlaYm+bKppCyGzXCnCYdzIERqMFIi1ieMlBt5OGPpr1DJfwSWL202NmdpH6qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751482; c=relaxed/simple;
	bh=OyopVVtQjR6T1QykKvLbX64lhWAiOalFIIdWyRVwcKc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RDi5B4p/Us3EHwoFDvgPU5Re3jJa52Vn4QAyRvDb72jrUAV4l8MLri60V0kzBJPi81WdNqGHdTSGItuAHEsSLpbdcEgdKdZhURuTVGlHc7B/7cQ8Yyq71xaFp6DNpuUM0OnWeDUp5D4Q4eCMdniYp6MjORC9OSJsbChDJ0b9g4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=ng2VadjU; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=rV1ER6hoCH82akCLHnGCnJdZysL/ZASqkcfWYifR8jA=; b=ng2VadjUOk6BzueMZZSr7vtVvL
	1b1pEDWYVLriFa3lAfDtqIlhFE/pmN9ZD7NLH6QmWt4am7E6yFo9R6aN1urdP/xwGOpEio0ffF8Kf
	G9recA2dNkvr57m4Ohfa7yTJzQ6Jl2T3HsIszvde9yvKt65erGBGStbw8Y0LOePfR+s6EF26ZjlYD
	HZeSGhN3hvKEGwa7wVwGvUc6n7YCWgZQVThmk1u0FEgg0HD/IQUiQ2o5OcfnJXVcF/GYODcV8dAnF
	mkjqXjDp3tNkQYho9TPTKiRijjCBKI3L4pYFw63TlM8FAIuHKjLibH51NCTMkMLBUXkKuOBIYMMHx
	PQiLogFw==;
From: Andreas Kemnade <andreas@kemnade.info>
To: vigneshr@ti.com,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	andi.shyti@kernel.org,
	reidt@ti.com,
	wsa@kernel.org,
	linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@kernel.org
Subject: [PATCH v2] i2c: omap: fix IRQ storms
Date: Fri, 28 Feb 2025 15:04:20 +0100
Message-Id: <20250228140420.379498-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the GTA04A5 writing a reset command to the gyroscope causes IRQ
storms because NACK IRQs are enabled and therefore triggered but not
acked.

Sending a reset command to the gyroscope by
i2cset 1 0x69 0x14 0xb6
with an additional debug print in the ISR (not the thread) itself
causes

[ 363.353515] i2c i2c-1: ioctl, cmd=0x720, arg=0xbe801b00
[ 363.359039] omap_i2c 48072000.i2c: addr: 0x0069, len: 2, flags: 0x0, stop: 1
[ 363.366180] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x1110)
[ 363.371673] omap_i2c 48072000.i2c: IRQ (ISR = 0x0010)
[ 363.376892] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
[ 363.382263] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
[ 363.387664] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
repeating till infinity
[...]
(0x2 = NACK, 0x100 = Bus free, which is not enabled)
Apparently no other IRQ bit gets set, so this stalls.

Do not ignore enabled interrupts and make sure they are acked.
If the NACK IRQ is not needed, it should simply not enabled, but
according to the above log, caring about it is necessary unless
the Bus free IRQ is enabled and handled. The assumption that is
will always come with a ARDY IRQ, which was the idea behind
ignoring it, proves wrong.
It is true for simple reads from an unused address.

To still avoid the i2cdetect trouble which is the reason for
commit c770657bd261 ("i2c: omap: Fix standard mode false ACK readings"),
avoid doing much about NACK in omap_i2c_xfer_data() which is used
by both IRQ mode and polling mode, so also the false detection fix
is extended to polling usage and IRQ storms are avoided.

By changing this, the hardirq handler is not needed anymore to filter
stuff.

The mentioned gyro reset now just causes a -ETIMEDOUT instead of
hanging the system.

Fixes: c770657bd261 ("i2c: omap: Fix standard mode false ACK readings").
CC: <stable@kernel.org>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
This needs at least to be tested on systems where false acks were
detected.

 drivers/i2c/busses/i2c-omap.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 92faf03d64cf..f18c3e74b076 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1048,23 +1048,6 @@ static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes,
 	return 0;
 }
 
-static irqreturn_t
-omap_i2c_isr(int irq, void *dev_id)
-{
-	struct omap_i2c_dev *omap = dev_id;
-	irqreturn_t ret = IRQ_HANDLED;
-	u16 mask;
-	u16 stat;
-
-	stat = omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG);
-	mask = omap_i2c_read_reg(omap, OMAP_I2C_IE_REG) & ~OMAP_I2C_STAT_NACK;
-
-	if (stat & mask)
-		ret = IRQ_WAKE_THREAD;
-
-	return ret;
-}
-
 static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 {
 	u16 bits;
@@ -1095,8 +1078,13 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 		}
 
 		if (stat & OMAP_I2C_STAT_NACK) {
-			err |= OMAP_I2C_STAT_NACK;
+			omap->cmd_err |= OMAP_I2C_STAT_NACK;
 			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_NACK);
+
+			if (!(stat & ~OMAP_I2C_STAT_NACK)) {
+				err = -EAGAIN;
+				break;
+			}
 		}
 
 		if (stat & OMAP_I2C_STAT_AL) {
@@ -1472,7 +1460,7 @@ omap_i2c_probe(struct platform_device *pdev)
 				IRQF_NO_SUSPEND, pdev->name, omap);
 	else
 		r = devm_request_threaded_irq(&pdev->dev, omap->irq,
-				omap_i2c_isr, omap_i2c_isr_thread,
+				NULL, omap_i2c_isr_thread,
 				IRQF_NO_SUSPEND | IRQF_ONESHOT,
 				pdev->name, omap);
 
-- 
2.39.5


