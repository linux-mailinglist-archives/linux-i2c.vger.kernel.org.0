Return-Path: <linux-i2c+bounces-9348-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9785FA2CC58
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 20:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36E4B167CAA
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 19:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD9018FDC9;
	Fri,  7 Feb 2025 19:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="IQb1rN4W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A894923C8B4;
	Fri,  7 Feb 2025 19:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738955622; cv=none; b=k53qA61or2KjcD4Mh+pi+CwnnvGGSBAQWC8LwfeVJkkgpBD05BVB23bVq4yYQwpBGHLxfMxkGuerq9sVcVDn8HDMwkGoUHTgJuBfG+Gn+JV+E1DFHyEHqtni+88YP7X0kuUeEB3+IApaYrUW/hbjTGoLQixt8j1ZtdUs68gYUVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738955622; c=relaxed/simple;
	bh=J4yryIaByWP8KIZwe+z/0r7YkxqehmJF+7Ro82u0zfU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fTiQyTWj7l1O0Qm20zHWJpXPDNUCWllyto3TqWZl2TtyYX7mY2KJ3IIUvUFnixAMkFiq72aytkrWhy7W4FmQvphCir+PeAsHPcrl1uEFTOfDApUenpZgCqqUzfSM4V0AB+oWiRQC8dcPB9Js0J22rC2pvsfIjO7cYL3KFABdVtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=IQb1rN4W; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=v+ctddmnQF2PlnEUYBVoF2cTShrkIZzsUJyQpI/HFCw=; b=IQb1rN4WJs5E5/0kCQGVwBnM+W
	GcDOfoxuhBkrbJI1Bzv8knilAnNadiG3ohQHhgUV+lBa1tOJc1P3vbSSpLfcwWiIZHHNtrofgXr6H
	yevXNIW0bDcv0jThr14mIE5ZvmJAfI6TsBxUuxxNM8HUiXTiSW0/XkNMB+Lt7LB79vnFn1Vw2RyNX
	r45CBxDlkqX/ZPl1JSUZ2WD3ANYYP5w/pxTG7+LXedgL2Go7DluwEBW9+s/HXu2c+Qjfsu8Takmvb
	Vn2HDoezgwxJnxTjFrjyCrWiTW8rdTS63OH6OmAFk3nSlLVhAHVxCDURs5EsIQ9DEORITG02zmqCT
	A6jmPXgw==;
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
Subject: [PATCH] i2c: omap: fix IRQ storms
Date: Fri,  7 Feb 2025 19:54:35 +0100
Message-Id: <20250207185435.751878-1-andreas@kemnade.info>
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

So revert
commit c770657bd261 ("i2c: omap: Fix standard mode false ACK readings").

The offending commit was used to reduce the false detections in
i2cdetect. i2cdetect warns for confusing the I2C bus, so having some
rare false detections (I have never seen such on my systems) is the
lesser devil than having basically the system hanging completely.

No more details came to light in the corresponding email thread since
several months:
https://lore.kernel.org/linux-omap/20230426194956.689756-1-reidt@ti.com/
so no better fix to solve both problems can be developed right now.

Fixes: c770657bd261 ("i2c: omap: Fix standard mode false ACK readings").
CC: <stable@kernel.org>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/i2c/busses/i2c-omap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 92faf03d64cf..b54d4120899f 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1057,7 +1057,7 @@ omap_i2c_isr(int irq, void *dev_id)
 	u16 stat;
 
 	stat = omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG);
-	mask = omap_i2c_read_reg(omap, OMAP_I2C_IE_REG) & ~OMAP_I2C_STAT_NACK;
+	mask = omap_i2c_read_reg(omap, OMAP_I2C_IE_REG);
 
 	if (stat & mask)
 		ret = IRQ_WAKE_THREAD;
-- 
2.39.5


