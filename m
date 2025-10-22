Return-Path: <linux-i2c+bounces-13723-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA8BBFB099
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 11:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3335119C7D9E
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 09:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A1C311C24;
	Wed, 22 Oct 2025 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="BrguOJt9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay16-hz2.antispameurope.com (mx-relay16-hz2.antispameurope.com [83.246.65.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC6131076B
	for <linux-i2c@vger.kernel.org>; Wed, 22 Oct 2025 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.158
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761123726; cv=pass; b=jetTadHBBveb8BkRn2A5fdW2JBRiY9heLHcu/7vC0znFsSqvPAoKjluqVaClwa5r/ijJEqApwTyKS0GB4JYJ4RTCs8gDlFkf7/FDBB6BpXOHd1ARMvJzN024Wr2HNLI2oF52zjhLUHdIBffjdY4PFiryxbvEqjCRmgh65zztGi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761123726; c=relaxed/simple;
	bh=0fkg3DHVLOcn27lFo1b4YOX4rGUxBw4jMgCFoAM33wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iRo99MWA1e8Fi2aNuY2Q2EdGP8tCdESbL/TOC4DTzc/zKZ/b53hWeUPHh1D7NMKZJy6q92wjR2au9aVri7ftij10rgwLnNv0YQMybezEV2+Y3giw8NfxqVdGrq++geFapVZEo24rJNk8TmJnK5s7y08ahTTFvf6DxmyRfpRXhe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=BrguOJt9; arc=pass smtp.client-ip=83.246.65.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate16-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=CWEoKoLs1uka7zqpgXdocLVnWxfFIzcxvKoXmWWIDC4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761123705;
 b=VX8adQad194Ro0OvUJEjMOuTg2sJsZG8H9f4tKQR6yE6UDl7OdTm3CqPTd+lfmq+4C2NzmDS
 cvvk1QLDcjPh0lPlWWi3m0RbueViwZUaJjbKod9dvz2A9YEX2zP4ugqBD3Ww0U+NpuIbab1Yt3n
 Nr3xZtiPu6dF0+bCwG7MMGhk7CAlBSgFur1RYRhQYZySKX83Vepa7QtkNbza/AyKv1kExs6Puv0
 R8KFN/1vTeSskOhJxY73oqcg5uYT68tSWhVx5PcWyZHGlAqB0nYaPjSgIzyKqsELz9/WlGnMwV8
 eP4vtKl9bQ4k4xREiCL2Y9gepdWLukP0cXTacNwqH8lfw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761123705;
 b=CY47zF1/pfxUyg7j5puZ4yQltBF4Sf/cNMLv1zDgu6hDwhABokpLQXEOTEDLnmPSqJehXKSl
 FRQ5EVmVR+y/ixL5e1q8NP51xFaks3d/Zh8ToCC7lDAotjzOVoVXMmSvdnrdQTj2o3pUZ38q1K+
 WwraqjeIS75tM/2bDMjoz8K3Z3Ht9taTk34SmbO1+ON77/jesKuk4HNcE5/8NF70+Dseu4/syBx
 0frok+rfrcz9MvAOU3kwDxGLLd7Y104izZzqWRVJ2o32IPNq06qR51dRsbVXSXjb4ZUlR5hJA0m
 REND6/Y/sxtbmIgdKqIRWQAgjVQEe9vzJWNc9dyO6/pDg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay16-hz2.antispameurope.com;
 Wed, 22 Oct 2025 11:01:45 +0200
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A4A025A20AD;
	Wed, 22 Oct 2025 11:01:36 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v3 4/4] mfd: tqmx86: add detection for secondary I2C controller
Date: Wed, 22 Oct 2025 11:01:16 +0200
Message-ID: <52090a7a24995ad3acb72ec0f6d48d40e1f93e3a.1761123080.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <bc9ce42883d10d54bc0954024d7e2312ff45fdb6.1761123080.git.matthias.schiffer@ew.tq-group.com>
References: <bc9ce42883d10d54bc0954024d7e2312ff45fdb6.1761123080.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient:linux-i2c@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay16-hz2.antispameurope.com with 4cs37P1ghZz29y99
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:723875e2fc813b0cc21b6ba59ab3ab7d
X-cloud-security:scantime:1.635
DKIM-Signature: a=rsa-sha256;
 bh=CWEoKoLs1uka7zqpgXdocLVnWxfFIzcxvKoXmWWIDC4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761123705; v=1;
 b=BrguOJt9RHTR+ci5nDwYRnD6kVbQnc6WDgwhxG3iQmV+Zkjco1rOC7qLQ5ML2reycRy5RmH/
 hVfshW9TJalRjIR4g799+/EGa6R7H+XE2KWLpln9lYFEAiPo/2JKappZae+HPsWod30d1gvk6kn
 ZH0d+0cLL0r5ij74P5EFwzFq2eDdQFlP7xWAkakMZL4R8x9M1IMo++Pf5D9tkEfbe2+dVKyNdE4
 /oBL8DrnoTn3N6FTg6PyUDpkqRlOaXefCSpeUlI9qqDKjWCa91orR9XxODj+8J+gr/+jkFZpe4K
 XNA3ObokKA1P4mQdlw2UbynMBhBndK86EbJMACjBx8FNw==

Many TQMx86 PLDs contain 2 I2C controllers. Add support for the second
one.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: no changes
v3: no changes

 drivers/mfd/tqmx86.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index 6447406f5026f..a6f0a185904e9 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -20,6 +20,7 @@
 #define TQMX86_IOBASE	0x180
 #define TQMX86_IOSIZE	0x20
 #define TQMX86_IOBASE_I2C1	0x1a0
+#define TQMX86_IOBASE_I2C2	0x1aa
 #define TQMX86_IOSIZE_I2C	0xa
 #define TQMX86_IOBASE_WATCHDOG	0x18b
 #define TQMX86_IOSIZE_WATCHDOG	0x2
@@ -52,6 +53,7 @@
 #define TQMX86_REG_IO_EXT_INT_12		3
 #define TQMX86_REG_IO_EXT_INT_MASK		0x3
 #define TQMX86_REG_IO_EXT_INT_I2C1_SHIFT	0
+#define TQMX86_REG_IO_EXT_INT_I2C2_SHIFT	2
 #define TQMX86_REG_IO_EXT_INT_GPIO_SHIFT	4
 #define TQMX86_REG_SAUC		0x17
 
@@ -68,6 +70,10 @@ static uint i2c1_irq;
 module_param(i2c1_irq, uint, 0);
 MODULE_PARM_DESC(i2c1_irq, "I2C1 IRQ number (valid parameters: 7, 9, 12)");
 
+static uint i2c2_irq;
+module_param(i2c2_irq, uint, 0);
+MODULE_PARM_DESC(i2c2_irq, "I2C2 IRQ number (valid parameters: 7, 9, 12)");
+
 static const struct resource tqmx_watchdog_resources[] = {
 	DEFINE_RES_IO(TQMX86_IOBASE_WATCHDOG, TQMX86_IOSIZE_WATCHDOG),
 };
@@ -338,6 +344,11 @@ static int tqmx86_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	err = tqmx86_detect_i2c(dev, "I2C2", TQMX86_IOBASE_I2C2, clock_khz, i2c2_irq,
+				NULL, 0, io_base, TQMX86_REG_IO_EXT_INT_I2C2_SHIFT);
+	if (err)
+		return err;
+
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 				    tqmx86_devs,
 				    ARRAY_SIZE(tqmx86_devs),
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

