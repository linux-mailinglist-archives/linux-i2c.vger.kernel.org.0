Return-Path: <linux-i2c+bounces-2851-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A5289F095
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 244CF2845ED
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 11:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A961E15920A;
	Wed, 10 Apr 2024 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XqNqXHKq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AC21598F2
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 11:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748310; cv=none; b=LRXwdAtlZ+xK2Lqr5hC2mCpanauIH3pYJ8PP+BgLUMefP+KxK3CxGikTcMr50j8Qjtlk7HJiMYzdQpBsnofx3R23sGWsLyfRfZC/pYnI+O0OuaN+DXKfpNje9k6OqjP7YFl5oBTpCqmMjQ7iPAl0b2Q275/gog1s5MpcL18e0QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748310; c=relaxed/simple;
	bh=n9EZeQuSQmBJRMMjz9lb1sRhifEA7wA3wrruEYieoeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=esix7janLMoOCLXALlZodTn7e4DSSMl+NdkO9+0kdBa51ji9y4wybCD7fdMKWF5tZu+h4NdO30KIe17u06sDBjzZGRMgBaYfCnK1vFXjosvAppnESm+O1s5AZ9ke/eKXKCznVBxVYibJ4YOmH3AZQ1r9a4kpZGQGZ1vnxhlbSak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XqNqXHKq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=g8alMqK48I9QhL3+4HvdPnnuLkdA4QOsMgnkT/Ultao=; b=XqNqXH
	KqxLFkogTA3zf784DTUGVZrJlnFkcqAUey3BtoR4FoF1KSdkHhZ/fN7CC7qITyCK
	rb8djWae4TKmyCwY3w2ke627cmkh498XKMmAgOQu9AXKKh1K8ya5KHAteYwkNy7s
	Klkbcw90ixoO4u4/1F+qe2bc/WVhG46/6reYmEzcQW37FTboAnMiMmq/eKLFhsFL
	kr5hGRO6oOSY24T7/cJAOLQe5lceLjq7zL+qBliz++NcB4Fgf8mzv0cvVoDZ0K0i
	gyiQ4yHrN1a5YNz9FOQ1Ohq6qfVSRFsJXPeu2WXg/HoSBSZBO50UNIcTsSsWfCxu
	kGQTFW7qICIiiotA==
Received: (qmail 521337 invoked from network); 10 Apr 2024 13:24:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:24:59 +0200
X-UD-Smtp-Session: l3s3148p1@dNDtSbwVhm5tKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/18] i2c: at91-master: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:15 +0200
Message-ID: <20240410112418.6400-21-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C and SMBus timeouts are not something the user needs to be informed
about on controller level. The client driver may know if that really is
a problem and give more detailed information to the user. The controller
should just pass this information upwards. Remove the printout.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-at91-master.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index d311981d3e60..ee3b469ddfb9 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -591,7 +591,6 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
 					      dev->adapter.timeout);
 	if (time_left == 0) {
 		dev->transfer_status |= at91_twi_read(dev, AT91_TWI_SR);
-		dev_err(dev->dev, "controller timed out\n");
 		at91_init_twi_bus(dev);
 		ret = -ETIMEDOUT;
 		goto error;
-- 
2.43.0


