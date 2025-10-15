Return-Path: <linux-i2c+bounces-13537-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDA5BDE2F0
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 13:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD9F4502966
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 11:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3111C31CA50;
	Wed, 15 Oct 2025 11:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="iGXhNnQh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay159-hz1.antispameurope.com (mx-relay159-hz1.antispameurope.com [94.100.133.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9359A31B83A
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 11:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.198
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760526306; cv=pass; b=VamW0TNC1atZr1l6ar4r5QCP5P97hfPSxqBdZeCNu6zY6KKPMJi9h7YiSrPZS+ldO8Nlw2oCXbJgOaKmtmUIzOSuP13xM6RmSz7uGVp7Ac1om7bodxCes37j0Wuf7azBJl7hAWDxOxrlHjBZqnffzZ2FrsKuGDbDA955coIYZe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760526306; c=relaxed/simple;
	bh=Ex8BMT3ow9gM/Q+g7vsqnxriF2M6q3c9xdUbaU+Ee+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EyqAH9vHYL0iPmc7YrqV8deCMM9yCruSfAIvIDYgMvxAIeKzDhpSQsHcgtx3b+qPPpTQZ7B9XaVJQ7HLQgMVJQ1saXl/Rd9ju+2v4/qCnTs41A8JzsiNUblziigCqSw1ouDsxkJR+XxVDRMd2LaJdzyq4SamX5B3/ltq2a5Hro0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=iGXhNnQh; arc=pass smtp.client-ip=94.100.133.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate159-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=1kk6xYtM9QKNb+MYQgCibH5JG8izX6pLn1C5uPaM1zo=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760526256;
 b=Tqx3OCmSxQNw9VJTlP+2I6SIwcoxa1nRDa8pc+GUbc9lnQCJdrrHuviG2aJ3lT20kdiXt2ia
 Qwi8TBd65OKn/1oUP40uuMuottcnSKuD94DUAn9MSbBv6D0WBJoI+7VDrA0/2sFdoHbYqF0s/CR
 Iy2nktlmdt7Vb4Ytv44eqe56OQ0SVpKhLzQtNPPBc59stO/9toSkeXXUNPhM4DsILTHxTlEuTx8
 Hw0exDP2t4ULdCoMiiWVgLQOQ1P0CCAAkmXCKAw5FQaM2d3bHVUMTx8q6R4FeqeurxNl39h2o6S
 hTrj6SgXfGOQ3TKVYSxJvK1NDyZ5Ppp0lYL3AANyKxZSA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760526256;
 b=tRnxAz64R433k99mQnDpZnhcvBQcm7KeeKDUeiFx9nf0Mr1VoZkYKCXvwcWH8XpbxYQrcZ6B
 gzFEZNgEREvKqydwqnI7s+hmR269N82j4OOeb+YoP1+DIj28tgFnkfCCwxR8LnW+hR2HHh7nN+f
 rhq7vfINGwLxyGLuOiwDQYnhhyudiKMGDFI0nW4+6EXnm/3nQvXsz+mG0vt9pOAIMa7TjB2IFs5
 a3Cb1cTnRnIE2kszVmm4vWkhuHFDxpTLIxQv20F9gCrX6oYQtwzXtIfsYMRxaTObvfMDzCAcyhx
 QiiTznMhhffjwIXbF7CbwAEy0jB88smz4LMovFuGNiAMw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay159-hz1.antispameurope.com;
 Wed, 15 Oct 2025 13:04:16 +0200
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 4A4B7CC0E59;
	Wed, 15 Oct 2025 13:04:04 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 4/4] mfd: tqmx86: add detection for secondary I2C controller
Date: Wed, 15 Oct 2025 13:03:09 +0200
Message-ID: <7975988b26074b9417db3009e70de97bc0a24ab6.1760525985.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <9e00b0ff4e90e4fb31c3012bd7a753d06ae21b45.1760525985.git.matthias.schiffer@ew.tq-group.com>
References: <9e00b0ff4e90e4fb31c3012bd7a753d06ae21b45.1760525985.git.matthias.schiffer@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay159-hz1.antispameurope.com with 4cmp9w4jDCzgbMF
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:34e472ab150a674b0c3c5d0d646ede8c
X-cloud-security:scantime:3.242
DKIM-Signature: a=rsa-sha256;
 bh=1kk6xYtM9QKNb+MYQgCibH5JG8izX6pLn1C5uPaM1zo=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760526255; v=1;
 b=iGXhNnQhpoCL3tENkwyMcF54R+4Hp7mgw2DNQFxoXTnh29W3XY9x4bkQneB2n2/fHlDX2QKN
 su1oiIm3dd1h62oncS7MjVGuCV4O76iEktsR/snN6pRXMQ0C7k5UsECvPi4sP4X7tVRO6gDKrWi
 DU510cJUaxhiUAUXWfPmtCvYe+j1r99DaVzLqU4Bqatf8LUlyuFKrMTRCSKsMa9wev4jiPkZpTN
 /Sn8h4ka/Go74Wwi2bgo/+ajO0dTMQvSV+4HjAYzg/w42A1UY2jmcumm9aPVBJnY5IvdJGJw49x
 SgXpubhby9mCynCnp9RuD9fZNHhqAM3Opv3ubiLfaxriA==

Many TQMx86 PLDs contain 2 I2C controllers. Add support for the second
one.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
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


