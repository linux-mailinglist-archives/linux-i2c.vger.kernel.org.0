Return-Path: <linux-i2c+bounces-12611-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA676B43669
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 10:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A40967C2001
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 08:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C892D1F44;
	Thu,  4 Sep 2025 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QxzxqLn3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1018A2D061E;
	Thu,  4 Sep 2025 08:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756976387; cv=none; b=NRswE/uhk8lkGQsIbx//UPeY5FvDiDr9h/gMiCcidb/9xyodg3IzAfh8NQ6HR5C5GzRjeaXZJVJh7bVrpCTdzplzgGwDaKE7rPjPX7dxW8WlFFwL2sg1pu/uwGGGuABKXn5CeYTT4pWalqciIIHElkBmfzE0uimA4/QYOJmTav8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756976387; c=relaxed/simple;
	bh=ga7tmV4L0ISGRZ0jJ6UfxKx8Es4klai04+hvgsgpbIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uPLbGZwHvRoXI0RUHMX4d7ILZt6VnCWLSYllLyUssrb18Hp9i+JmGS/gpiwgThDqgY9WJ0tqWzp1tFMvR/COqbrWZAWH+i0KyC931KrCmeZArrp/rIjbx2SN19fafJNH1KUjED0U2/YqEFwKIsJFSNCFEW4VVbz/TXou+MW26Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QxzxqLn3; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 322E01A0984;
	Thu,  4 Sep 2025 08:59:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 026D8606BB;
	Thu,  4 Sep 2025 08:59:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0200D1C22A241;
	Thu,  4 Sep 2025 10:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756976381; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=5oXliwhksVRoXJFSBUuq81uC4pWKGDKz3WEBub+fLxc=;
	b=QxzxqLn3jynq+8kdugI9MMK7psIjpv7iUv3DCmfxgo0jldRXoE6p5Hj3FFYwLs/bei5ijZ
	f3ubzOTOtWHHH2qdxWZqyl1qbxWt95aqa7+a2eXtDjJWtk8Id9/mnQCl9bcMMuWK/anNJZ
	4UBhN3EQkwVpMHfL3EsNl71W2rK3wQAqsasvg8C6PP4xNI6MaEkEFRMP57WWOin373VEQF
	4eUP+N6UQZf91yELZEdMQzDJ/Vgt1K28yJYrFs3WUNkXZHalbL2unaN7BugXfUC0kzy08e
	Vlz1PiiuNFQy/cx20hNTYiF1RCnEKr+kv+Maq50v3Q2QV2x2xDcMQzWbWHoWqg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Thu, 04 Sep 2025 10:59:24 +0200
Subject: [PATCH] i2c: designware: use dev_err_probe when probing platform
 device
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250904-i2c-dw-dev-err-probe-v1-1-acca6ffd122e@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOtUuWgC/x3MwQpAQBCH8VfRnE0xKLyKHNj9L3NBs4WSd7c5/
 g7f91CEKSL12UOGU6PuW0KZZ+TWaVvA6pNJCmmKVoRVHPuLPU6GGR+2z2BMoZsdKoTaUUoPQ9D
 73w7j+35s2pkSZgAAAA==
X-Change-ID: 20250822-i2c-dw-dev-err-probe-eaf9bce3ef4c
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

Add calls to dev_err_probe on error paths that can return -EPROBE_DEFER
when probing platform device. Namely when requesting the reset controller,
when probing for lock support and when requesting the clocks.

In i2c_dw_probe_master and i2c_dw_probe_slave, called by the platform
probe from i2c_dw_probe, replace the call to dev_err by dev_err_probe
when failing to acquire the IRQ.

PCI device probing already use dev_err_probe.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
I recently spend some time debugging a case where the i2c controller
never showed up. In the end it was caused by a missing reset controller
due to a typo in the device tree.

While this has nothing to do with the i2c designware driver, not having
any hint about why the device stays in deferred probe state does not
help.

The patch add dev_err_probe in the error paths that can return
-EPROBE_DEFER to aid in debugging such case.
---
 drivers/i2c/busses/i2c-designware-master.c  |  9 ++++-----
 drivers/i2c/busses/i2c-designware-platdrv.c | 11 ++++++-----
 drivers/i2c/busses/i2c-designware-slave.c   |  9 ++++-----
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index cbd88ffa561010ff2d29086836d9119da5b8885c..c7a72c28786c2b59a249a768d43a7954119bc018 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -1068,11 +1068,10 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	if (!(dev->flags & ACCESS_POLLING)) {
 		ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr,
 				       irq_flags, dev_name(dev->dev), dev);
-		if (ret) {
-			dev_err(dev->dev, "failure requesting irq %i: %d\n",
-				dev->irq, ret);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(dev->dev, ret,
+					     "failure requesting irq %i: %d\n",
+					     dev->irq, ret);
 	}
 
 	ret = i2c_dw_init_recovery_info(dev);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index a35e4c64a1d46f43aa2d37c0d20fbbd4bc1ff600..07efe4b529e29b52b9e4e439c4b154b467a24fda 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -238,7 +238,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	dev->rst = devm_reset_control_get_optional_exclusive(device, NULL);
 	if (IS_ERR(dev->rst))
-		return PTR_ERR(dev->rst);
+		return dev_err_probe(device, PTR_ERR(dev->rst), "failed to acquire reset\n");
 
 	reset_control_deassert(dev->rst);
 
@@ -247,21 +247,22 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 		goto exit_reset;
 
 	ret = i2c_dw_probe_lock_support(dev);
-	if (ret)
+	if (ret) {
+		ret = dev_err_probe(device, ret, "failed to probe lock support\n");
 		goto exit_reset;
-
+	}
 	i2c_dw_configure(dev);
 
 	/* Optional interface clock */
 	dev->pclk = devm_clk_get_optional(device, "pclk");
 	if (IS_ERR(dev->pclk)) {
-		ret = PTR_ERR(dev->pclk);
+		ret = dev_err_probe(device, PTR_ERR(dev->pclk), "failed to acquire pclk\n");
 		goto exit_reset;
 	}
 
 	dev->clk = devm_clk_get_optional(device, NULL);
 	if (IS_ERR(dev->clk)) {
-		ret = PTR_ERR(dev->clk);
+		ret = dev_err_probe(device, PTR_ERR(dev->clk), "failed to acquire clock\n");
 		goto exit_reset;
 	}
 
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index b936a240db0a9308f005148cdf4c4f9fd512be05..6eb16b7d75a6d059c7abcead609258f9d514d012 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -266,11 +266,10 @@ int i2c_dw_probe_slave(struct dw_i2c_dev *dev)
 
 	ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr_slave,
 			       IRQF_SHARED, dev_name(dev->dev), dev);
-	if (ret) {
-		dev_err(dev->dev, "failure requesting IRQ %i: %d\n",
-			dev->irq, ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev->dev, ret,
+				     "failure requesting IRQ %i: %d\n",
+				     dev->irq, ret);
 
 	ret = i2c_add_numbered_adapter(adap);
 	if (ret)

---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250822-i2c-dw-dev-err-probe-eaf9bce3ef4c

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


