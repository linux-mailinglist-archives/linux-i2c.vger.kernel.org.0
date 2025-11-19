Return-Path: <linux-i2c+bounces-14168-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E0143C6F993
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 16:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E6172381333
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 15:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642C936921D;
	Wed, 19 Nov 2025 15:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qAk4mt8c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743AF299931;
	Wed, 19 Nov 2025 15:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564753; cv=none; b=TmyXVKYfT4QyC55Wdm4tjJzG6Ile88bpupFz0k4pghTVO5qMVCLd0FfZ521VyXrIO+ECiqtVtQr/DVTOs3oJuOALIrI4z4E8WQUMx/muQ9JxKj5hvT29nTyOMyUGPkpyVpWrg0eDYrg+nZe4HAL3ZrkKuSrDZuScC63K1weaqsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564753; c=relaxed/simple;
	bh=WKh+pejM9hfHa2BSnJjsrQaHkPrQsIOlT7b7pTmVq2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EjS/6Kvilzti0+N2eBe7GbhdjM9hE3DzLttqwCAZ6PMevgkmL8E5bJwsopQN+HvZ4Z3LV/tuJrUj7z2+Rzy1Iy2OrZWGaVImbqpzOY64z59PVmB74oL13TtIDdomUPk6CswvqxKrjxStaSIwLs1RxpHYlU2WBEYw5h7I4DTrHIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qAk4mt8c; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1DFD71A1BE0;
	Wed, 19 Nov 2025 15:05:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6ACA60699;
	Wed, 19 Nov 2025 15:05:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A430B10371A79;
	Wed, 19 Nov 2025 16:05:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763564748; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KEDzDzfEfee6+CFpZ6uK6nefkuW8cBA73Z7esFgKm9I=;
	b=qAk4mt8cXTcl53hszfw619krrvzBKq7zO7yxlzsBsWZtcSpDhnBKLckH15XrMozi0CJzrI
	rS7q6knt8+xU6qDpPqHuUFel/XKw0ZCI4cft3flbnPCQrEKHB3NtgtMjffpJN5EoHWSOsK
	+9xLGNylNgNcFLz4R17rdw4opAjOayGZjHYf0CX7nzBiK/2wSuBuwTFXfdFLc3MB3F/+eg
	i4ErorLo+1CWXdbcGGBUKqtYgs1xEGHC9oLI8g4wfk4jsImtmHNi13VcSHaQPAvPBC5kzZ
	V56dQoTFiGDCMsaQzpkNtP8yoQm6B2FnhGYbwK72FPn/rwk7OQpmzQNVQRq4zQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 19 Nov 2025 16:05:31 +0100
Subject: [PATCH v3 2/7] i2c: designware: Optimize flag reading in
 i2c_dw_read()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251119-i2c-dw-v3-2-bc4bc2a2cbac@bootlin.com>
References: <20251119-i2c-dw-v3-0-bc4bc2a2cbac@bootlin.com>
In-Reply-To: <20251119-i2c-dw-v3-0-bc4bc2a2cbac@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Dmitry Guzman <dmitry.guzman@mobileye.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Optimize the i2c_dw_read() function by reading the message flags only
once per message, rather than for every byte.

The message flags are accessed both in the outer loop and the inner loop,
so move the declaration of the local flags variable to the outer loop.

The message index is only modified by the outer loop, so reading the
flags in the inner loop was always getting the same value.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 41e9b5ecad20..ec4fc2708d03 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -586,11 +586,12 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 	unsigned int rx_valid;
 
 	for (; dev->msg_read_idx < dev->msgs_num; dev->msg_read_idx++) {
+		u32 flags = msgs[dev->msg_read_idx].flags;
 		unsigned int tmp;
 		u32 len;
 		u8 *buf;
 
-		if (!(msgs[dev->msg_read_idx].flags & I2C_M_RD))
+		if (!(flags & I2C_M_RD))
 			continue;
 
 		if (!(dev->status & STATUS_READ_IN_PROGRESS)) {
@@ -604,8 +605,6 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 		regmap_read(dev->map, DW_IC_RXFLR, &rx_valid);
 
 		for (; len > 0 && rx_valid > 0; len--, rx_valid--) {
-			u32 flags = msgs[dev->msg_read_idx].flags;
-
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
 			tmp &= DW_IC_DATA_CMD_DAT;
 			/* Ensure length byte is a valid value */

-- 
2.51.1


