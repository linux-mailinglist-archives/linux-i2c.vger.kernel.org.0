Return-Path: <linux-i2c+bounces-15282-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A4AD3C3FB
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 10:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 32F956C1CC4
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 09:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9773D6674;
	Tue, 20 Jan 2026 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Av//vgTm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175563D3303;
	Tue, 20 Jan 2026 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901305; cv=none; b=AHDlU+z41E4Y+i1RR8Hl8vcnloKJIvtFcJwIWRmhr5koeUyvgbI1/FUUxVV/VMz2J4J2VyQnXozqKhGuvUMYf1LaHNuw1ujnYKKfh8RYW3J41DfqZemOkFOdRlkmO7Y2nw0iU312DZMO4DUUDrpBx70MUWDT43v5stgS9vj78Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901305; c=relaxed/simple;
	bh=z5Ko/ExEh98qd7kZ1S+3qdSHtO2lq0STn0aXtdw+tmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J7wITJm5ODjaheGYA2MH02NlYnBD/hr91H8L/oVU2UHe3QkM7SNqRw8zBzocW67O6hd/iL16jWZ7JDnDi9X4NMNPc9iRKhTzmaZT+pPxNlc/LknMEe7Rn0fTKvxCsCIFITkGoYe5BKwv+Q9z5ahJeWAYURtvX24hwAIsn87Tecw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Av//vgTm; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8CFEA4E421A8;
	Tue, 20 Jan 2026 09:28:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61859606AB;
	Tue, 20 Jan 2026 09:28:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EED7F10B6B33E;
	Tue, 20 Jan 2026 10:28:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768901301; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MnieqBRze2TAjPgWGtxbjIVY/nC24DFNtyWoe7rx3/A=;
	b=Av//vgTmkyV9sg2PGTop1v7mdQW9NNVfQ+t3glLXgvx53PAyHppU9p+zBl1cx8JPMPofIW
	p5FQRuVcwtsPIxHJua5D+MsTHdDI8X5e7hkvYdlxN+ovRmBEdkLR0lldrZOr2YY+P/MVOi
	Mo93A7knjN5dV15grHH8ciYYYRj4U1Bzr6aSEQjVYn7qyASFMna4wRFywElQSaVoWNqzy0
	UI0eaQzEWco3vu49/R+YfD2pNw+jN8tJ1pxCvOtZLYViqRgAVk4mt+bNkEtwFa/bwK5xV0
	n72RIVPtI5Ykoov0go3WHdMb8mPJzTb8c7HBf6hSMnP0oi4Odqg9WUaGjiUEIA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 20 Jan 2026 10:28:02 +0100
Subject: [PATCH v5 2/6] i2c: designware: Sort compatible strings in
 alphabetical order
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260120-i2c-dw-v5-2-0e34d6d9455c@bootlin.com>
References: <20260120-i2c-dw-v5-0-0e34d6d9455c@bootlin.com>
In-Reply-To: <20260120-i2c-dw-v5-0-0e34d6d9455c@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, 
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
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Reorder the of_device_id structures so that they are in alphabetical
order. Also drop the unneeded inner trailing comma in the
"snps,designware-i2c" struct.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 7be99656a67d..077b34535ec7 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -334,9 +334,9 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dw_i2c_of_match[] = {
-	{ .compatible = "snps,designware-i2c", },
-	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
 	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
+	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
+	{ .compatible = "snps,designware-i2c" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dw_i2c_of_match);

-- 
2.52.0


