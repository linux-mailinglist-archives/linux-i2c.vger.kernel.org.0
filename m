Return-Path: <linux-i2c+bounces-12638-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32495B43EEA
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB0041701EB
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696FA32BF26;
	Thu,  4 Sep 2025 14:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NhwPuX4a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEC331A558
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 14:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996300; cv=none; b=KiATn+W/ZWJk5/2fzWPX0b+fj8Q7Gyc7cUpyqrmNa3ZU7HaMXQe2qrn/k4JjCF7yQFDap38imatRLxq5/JsEuiQZyUBunDxNK2Uq81Y5l/50eBv/IhSa63ij2MInq5yia6DsUaxRNohbzJSuFNB4blzFlwIEuUkrU6Syaq92dKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996300; c=relaxed/simple;
	bh=csEcqHJunfwrhOJ4e22ofo/Jn7NbRBEUYmyri0oMaLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mSNDT9aPw6hxn2sCVWpYncgGLqthvczTru2hDRPjrglwkUg/v2zP04vaEjtagXi2+ukmG17XzB2CjHu62WZP3WVpuRlhrbZyCq9NGLRkBfFaEYgkvm6JHpXq7ua/Jf1UsvcTGE2o5AvrqwW72CceGvNZYdYUK0eJi464xq1eamM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NhwPuX4a; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DA2551A0DD7;
	Thu,  4 Sep 2025 14:31:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B3E31606BB;
	Thu,  4 Sep 2025 14:31:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E1131C22DADF;
	Thu,  4 Sep 2025 16:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756996290; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vu+Ix1zKR5LyAcdyZO+5Rs/jUAoFJLqIq9cbe0MM4YE=;
	b=NhwPuX4aRUsYJqO2+qtU585nhCgCXKLXj98e/cQprX48xOW6Lw6xxfnycmr8YUxmqfUjE9
	QSQRgcTPX+czBhP5HEOZyfXzQQHMfmS1SK1REYfIJV63DUnVr8dp/5NTJ4m4fbKbW9Nsfz
	zpE91AkIyzMVBNG/7R75OuyBMQfnqthALouoEtIFiMWo/hAVdB8oJug/ZTXziVaKRzrjzs
	GZBqZyAPyttaqlYHM9dYpqG7PcIv9gyv4k4n/IAFBZv242glbQuHxkjTWN187e5l12xVm1
	lVRl2dIS8V2a8Z7qaGmcynY8dR5h5QqIGv2G3eyo8ZdiBFlxE9+QhEz1VIBtoA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Thu, 04 Sep 2025 16:31:07 +0200
Subject: [PATCH v2 2/2] i2c: designware: use dev_err_probe() when probing
 platform device
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250904-i2c-dw-dev-err-probe-v2-2-e59da34815fa@bootlin.com>
References: <20250904-i2c-dw-dev-err-probe-v2-0-e59da34815fa@bootlin.com>
In-Reply-To: <20250904-i2c-dw-dev-err-probe-v2-0-e59da34815fa@bootlin.com>
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

Add calls to dev_err_probe() on error paths that can return
-EPROBE_DEFER when probing platform device. Namely when requesting the
reset controller, when probing for lock support and when requesting the
clocks.

PCI device probing already use dev_err_probe().

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index a35e4c64a1d46f43aa2d37c0d20fbbd4bc1ff600..be2f9533cef94e3d07cb52401528fe5c1985198b 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -238,7 +238,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	dev->rst = devm_reset_control_get_optional_exclusive(device, NULL);
 	if (IS_ERR(dev->rst))
-		return PTR_ERR(dev->rst);
+		return dev_err_probe(device, PTR_ERR(dev->rst), "failed to acquire reset\n");
 
 	reset_control_deassert(dev->rst);
 
@@ -247,21 +247,23 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 		goto exit_reset;
 
 	ret = i2c_dw_probe_lock_support(dev);
-	if (ret)
+	if (ret) {
+		ret = dev_err_probe(device, ret, "failed to probe lock support\n");
 		goto exit_reset;
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
 

-- 
2.51.0


