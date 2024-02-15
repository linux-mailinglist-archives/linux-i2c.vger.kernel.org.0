Return-Path: <linux-i2c+bounces-1722-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DC185670F
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 282232834B5
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBFB132C29;
	Thu, 15 Feb 2024 15:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GWEL8kMT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB610132487;
	Thu, 15 Feb 2024 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010287; cv=none; b=j2eBLS0KkUbkBTeWyqm9m42dze9O7fblglvVacsYF+8ktL9j1chzgzR5P2J5JdT7FDFsvgz35Y/ULo5x0LK4+Qh4vP+fUbUiGcPMMP74uQv2lOhV3D5q07ovdyyhvfAFM5LHqkmLLgpzV+yFBW/WSCkAPan5j7khbtNRWsczVm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010287; c=relaxed/simple;
	bh=NUH30x/9mKIikGBACPkPdrVWLNqgjqGCxMYohiQhXpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q6L1cHqihZvWk4RJsuLyXEAwn8+QrwX/56+O860n7pgq0t7+k3Z9oRyzBbdqVfsWTRknEHhhYPgW67QrPK5ha04Cz1+QVcb2yl2i3JYTDPKFUzRe3NVhsrIlVyStBABGCDi43T7B6Qf3kdIV/Bm6vMSAdMQ340ieE4Df423pBWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GWEL8kMT; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C540724000A;
	Thu, 15 Feb 2024 15:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708010281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6YtYEPkWQliDBXfdSpeuMo61P38HreYk7GRFYqtXkw=;
	b=GWEL8kMTuyWm7ECMBeYelFKt5Q6vwC0YFhuakiRf3NgJ4SBetjufDuAbCa4NJNSLtfIKWV
	ImLFqNcgDQYVLO3cbQuuw8NIoN4nnrh1b64RWoi0gQpI/vawF3LZXPoK/rifPfVg+uCD00
	ilFkwuYn3JROW1CkcDFCvPNZuKBGle+6lYipptiewaLr8MT5IfZV28OhCL/K6W76efhLm+
	unZdb1L2x+xQKZi4yw0LsR140IPSbJJI9VzZIhTmPRZjP2t+4mu8zR8X8dSdu3sDpvSLGb
	U3g7hket/T2SQvbAjCO7mVpT/AY81IVeWS6NM4U7DA1px1hAhBQcCZZESczqlg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 15 Feb 2024 16:17:47 +0100
Subject: [PATCH v3 02/18] pinctrl: pinctrl-single: remove dead code in
 suspend() and resume() callbacks
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v3-2-5c2e4a3fac1f@bootlin.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com, 
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

No need to check the pointer returned by platform_get_drvdata(), as
platform_set_drvdata() is called during the probe.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pinctrl/pinctrl-single.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 19cc0db771a5..02eabd28d46e 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1693,11 +1693,7 @@ static void pcs_restore_context(struct pcs_device *pcs)
 static int pinctrl_single_suspend(struct platform_device *pdev,
 					pm_message_t state)
 {
-	struct pcs_device *pcs;
-
-	pcs = platform_get_drvdata(pdev);
-	if (!pcs)
-		return -EINVAL;
+	struct pcs_device *pcs = platform_get_drvdata(pdev);
 
 	if (pcs->flags & PCS_CONTEXT_LOSS_OFF) {
 		int ret;
@@ -1712,11 +1708,7 @@ static int pinctrl_single_suspend(struct platform_device *pdev,
 
 static int pinctrl_single_resume(struct platform_device *pdev)
 {
-	struct pcs_device *pcs;
-
-	pcs = platform_get_drvdata(pdev);
-	if (!pcs)
-		return -EINVAL;
+	struct pcs_device *pcs = platform_get_drvdata(pdev);
 
 	if (pcs->flags & PCS_CONTEXT_LOSS_OFF)
 		pcs_restore_context(pcs);

-- 
2.39.2


