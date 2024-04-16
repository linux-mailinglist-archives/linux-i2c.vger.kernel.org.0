Return-Path: <linux-i2c+bounces-2973-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E02468A6C83
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 15:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D6F4B22814
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 13:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662FA131E4B;
	Tue, 16 Apr 2024 13:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BsnVe4V9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7371F131732;
	Tue, 16 Apr 2024 13:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713274232; cv=none; b=rSBqOif0siCcBGGDzDmZY/CnLWqUhEjYuYwAKdr6sPwGgwoDwL6rQQMeh19n6C2Nl/s57Mh8XZdB8L468Gt62lx7w906rCb1/DYs3v8k8h3/MMYJS00P8FuOU+2nWRegqPlr1i3Rvqel1rBuxhekzZ1KUcth/xo29Td4fCGOLgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713274232; c=relaxed/simple;
	bh=SKxnqxqQTOu0V80tOrHg0VWiV3r/5d05UFM/bBwvo2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmiFRe6uJqoOJErDymbuor4MiXx+dQR9apHMKLMloqFhq90Bgk+vp4xyEfWXV9Su5olPuxVa4pdEM6KTB6OE5wIF4Dur9RDjwsiDBi2rRqmm+fOktrod5ZSBVOItm0pTyQv7LBLkd5uS8wjw78t1uogFkedzC2jWAXiTu2J6M/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BsnVe4V9; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D9BA40006;
	Tue, 16 Apr 2024 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713274228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lu3hCWyQRXgdKfpiur37ixVeu1808uQZIfDP+sU8AMA=;
	b=BsnVe4V9Z/9QIlrhv+rS6yFcQLThF6H6hGelARmzGr7HYZEFfNtCqqSmOhHwaNnb2kU/71
	H9rfm/oBP+rkoe71xpXN9QLWPz56a2IadENKCMOCvITkxebMaqCNYELoZlllf5RTy9gqx3
	wUVyV/I+bRfRazZFYDa4g11WZktB7PxXIlruvYKgYQ//1gsq/Fy1s2PbFxnGAFz0OdL1wm
	Ux2FQGJbavl8lDOqta1in+VxGO00xqfVNm85tTsef4Qh7Q91O+ZPtzhCsVakmB9mQoMKi9
	zOL8N2XvN9++PnpND4QLmcNhimd5RQoALAwy7gs19eS1rATmC4O9UXxR+seiaw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 16 Apr 2024 15:29:59 +0200
Subject: [PATCH v5 10/11] PCI: j721e: Use T_PERST_CLK_US macro
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v5-10-4b8c46711ded@bootlin.com>
References: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
 thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

Use the T_PERST_CLK_US macro, and the fsleep() function instead of
usleep_range().

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pci/controller/cadence/pci-j721e.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 9af4fd64c1f9..967a5bf38e26 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -539,7 +539,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 		 * after 100 us.
 		 */
 		if (gpiod) {
-			usleep_range(100, 200);
+			fsleep(PCIE_T_PERST_CLK_US);
 			gpiod_set_value_cansleep(gpiod, 1);
 		}
 

-- 
2.39.2


