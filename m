Return-Path: <linux-i2c+bounces-12636-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04856B43EFD
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A9B71883332
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F1431DDB9;
	Thu,  4 Sep 2025 14:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E5IIHMlB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780FD313524
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996299; cv=none; b=JoMx2+wyx163f4PemVp5jk2swHNk1dvi6oBfqq9NdPHUUVubXqHp9X/EYBsZ6qlpPJwUyNx4qqxQ4aPcTlEE48QIFg4iokahuoewzDq+7iG8jpzqJhOlrvbigRCOefoIq67e2B7G/RjQl7J9V5wylQhx+1h9fLs11FXbFfAlb9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996299; c=relaxed/simple;
	bh=nwLYi6zctGIMk4q2OtT2tH7lh5luYuTLEFgbtEoCvOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QS4Ou9WNPoC5o8DnSZWeFcTKwbYF2ob8bx0LMdLzJDXBtabsiQRS+K1FP1Mt1V6heWzcK/orvHh53o2AOkDq2mo1E2JgHR2q1Fh1PpMu2HzgimCAU5WCzn48/t/BadSCQsAb7sEyH7XEm1XdsTBg6xtF21kNARAkqP0TkauiO2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E5IIHMlB; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 71F92C8F1D7;
	Thu,  4 Sep 2025 14:31:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A17B2606BB;
	Thu,  4 Sep 2025 14:31:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4052B1C22DAB3;
	Thu,  4 Sep 2025 16:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756996289; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=s+yxZdeDAhu9FKjinvskFo+q7px/xp6qZp7QLopDXl4=;
	b=E5IIHMlBo7PjEiIcHIDcsni2pTrPlGbwg08157Czx6z4R7keEt2Z2mH4mPe/AQxEkXJ8rA
	xbczihJeIHAVHLn/L9V0fEYBylw6DaNrz+1BPEkslbqsqQs/D9fjC2p3SjQH+XT58d50a9
	mPue5IaSrhFpuq7KVvJ51llXfZK92nzDRbwDhPAv1YQ4BkfxCpPoJs5Tgwu87MXLPhAonx
	MXRqN/ULc6e2t1bIabJ9M2n7hVH5X0QOgTmrPlJuVLwaAMSp6wGVCC0sq1baYjMsXYZEIs
	v1b16hRRQBAUd2RjBUoOQwr+UyY9T9gTOz0PICaZyMDXSedpXDpsfO5tslyYJg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Thu, 04 Sep 2025 16:31:06 +0200
Subject: [PATCH v2 1/2] i2c: designware: convert to dev_err_probe() on
 request IRQ error
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250904-i2c-dw-dev-err-probe-v2-1-e59da34815fa@bootlin.com>
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

Simplify the error handling of devm_request_irq() in
i2c_dw_probe_master() and i2c_dw_probe_slave() by converting to:

    return dev_err_probe();

instead of calling:

    dev_err();
    return ret;

This also handle deferred probe error without spamming the log.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 9 ++++-----
 drivers/i2c/busses/i2c-designware-slave.c  | 9 ++++-----
 2 files changed, 8 insertions(+), 10 deletions(-)

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

-- 
2.51.0


