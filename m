Return-Path: <linux-i2c+bounces-4699-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 113F7929310
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D56BB21263
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DAC5157460;
	Sat,  6 Jul 2024 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ROV2pcBa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379A0155310
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264923; cv=none; b=fp+Q6Qtk/TUb2Tb+0ZQq2/c8LZLAoQoRRLbo7lEBXzNHIgdlWxb3q/QtYFN4kYtDL1Jb/HX2YEejcgOIFxwZ6DDkmIW8j5CZDOTHMr6Hpf3P3RFpxX2guw+5n/IAYdy6lYAUCMvIM/5QyS6+wRjblu/66aVC6CDFmMa10g7R9Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264923; c=relaxed/simple;
	bh=uASGBnRIOAUunsBu4PC5+W+eVdqyB+P6JqFrF86wJMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PqjfdBdIHzL1Hxs+z0ozOxuQK25tIJHk+Ocx9VSpm4pAdK940au/bUw0vxVUb9985lqgmVvkfBpfWXBQc1UGIWRsCBnspJSilrAcrPyXD5ZCr2FHdPjEgi4XFvMRA1152EzZ/p/ie8EPVO8XYAD1bocPu9hFkaC842WUOYjDuOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ROV2pcBa; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=V5hj0O5AUmD5ufh1dIsleSmlRFxggB91JNffQLCPKFw=; b=ROV2pc
	Ba428bheivtFBYD/QwxY/9Kvx7XxiagtsvF6mukI71+L7d+D9IO2mZ8P8h/Rephw
	BtNaV4HMC2sX90EmjNu7etGSNic774+haT93E9uIrEc+Kv2BPXKP15aCSBUKmgHU
	QLK5vlBmNX9HkeL9dKtZYFi+iV1/hzuNcB0oigv/8nszVpoSkRelEVraIRtvRN6D
	IaCEi8rNlYfyM9siyztZTMqAphmilqzWiTq3OIVbXsFXScm6yFtqYvgzbS/qc6cC
	OoUFyz2EP7GPy0kFx06SqtDo6GtAFb2rOnQoGZ3HdQBh0uMLehO/g5EWr84BvwE2
	kDzLL6Pdj1RyaEpQ==
Received: (qmail 3810456 invoked from network); 6 Jul 2024 13:21:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:45 +0200
X-UD-Smtp-Session: l3s3148p1@HzibYpIc/sFQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 33/60] i2c: ocores: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:33 +0200
Message-ID: <20240706112116.24543-34-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-ocores.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 4ad670a80a63..482b37c8a129 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -444,8 +444,8 @@ static u32 ocores_func(struct i2c_adapter *adap)
 }
 
 static struct i2c_algorithm ocores_algorithm = {
-	.master_xfer = ocores_xfer,
-	.master_xfer_atomic = ocores_xfer_polling,
+	.xfer = ocores_xfer,
+	.xfer_atomic = ocores_xfer_polling,
 	.functionality = ocores_func,
 };
 
@@ -682,13 +682,13 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 	}
 
 	if (irq == -ENXIO) {
-		ocores_algorithm.master_xfer = ocores_xfer_polling;
+		ocores_algorithm.xfer = ocores_xfer_polling;
 	} else {
 		if (irq < 0)
 			return irq;
 	}
 
-	if (ocores_algorithm.master_xfer != ocores_xfer_polling) {
+	if (ocores_algorithm.xfer != ocores_xfer_polling) {
 		ret = devm_request_any_context_irq(&pdev->dev, irq,
 						   ocores_isr, 0,
 						   pdev->name, i2c);
-- 
2.43.0


