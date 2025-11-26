Return-Path: <linux-i2c+bounces-14275-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B1FC89615
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 11:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC9B13A7514
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 10:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3C431E0E6;
	Wed, 26 Nov 2025 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LaTC6rJx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7231F31B83D
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154013; cv=none; b=HldVcAR7R+gbkr1pf+GYx4fKQpEaInDv8HDmqeWIuoYmutczYoPzlNmI3YF1jCDw6pZz4hpI0rJ5Oj37efVy7LTWqsqQBIMM9ZTt3BKLzFNpKMmb08ZOGiQ07ERnm6EDFk9a3NzjM9C3I7BlpLjK4kWB2MU8n6lPdVrL74EKQSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154013; c=relaxed/simple;
	bh=60y3wscYu+FR1/Eo9esnvUOIDONBxy4TZK9bJ7oCWd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nre80yfRRHqaJ5FBD29yiD1tYPgbAmwTqSDdzrc99AIsg7vA2WDJRCjisXEQBPBj12O8CHaYDRFCAuvwNyTWaG4PwxAYdqYnM5JdaEzDoZo+ZNSW7B5CK2iOp+OsGFO41MSbuwa39hwGnHjA0emasXHcAZv7C9EYEzNxAdwIuv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LaTC6rJx; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E3A294E418E5;
	Wed, 26 Nov 2025 10:46:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9AFA60721;
	Wed, 26 Nov 2025 10:46:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDA87102F0828;
	Wed, 26 Nov 2025 11:46:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764154008; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=leYJuaPAZMswZ1nnRGUKqZ78MtonAZY7CX8PnUk/BgU=;
	b=LaTC6rJxiHGXoBSz1am1X4/GiD59WjsAcRpJrav+7gN3PPTksZp8lBz4qTxwh7b/CxM/ig
	5b6tw/qcu7cOHc27TAuccOWKiD23on/fWLOlcyKI80bzZsRNrQBsax7vq9O2yHb/7VXA50
	9kfCbEkXf0VWOuChtPB1fsaXwhdETk7CkSQPTftJUjilgRkZLBzF3JqrrUHldjNAtKDRA6
	Wt1vDxlRtaeuUe0vzcVOo2UCP7zCK2Z9CW0nl7kXLWST2xBmSJZFNrkl+HXTqeRBINEpo+
	K4EVgdT3mzCRS51Rq+EVTA1JZiKCNjMqoWVEZJzBQmI3ZrrFNICksfjpEenlaQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 26 Nov 2025 11:46:26 +0100
Subject: [PATCH v4 3/7] i2c: designware: Sort compatible strings in
 alphabetical order
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251126-i2c-dw-v4-3-b0654598e7c5@bootlin.com>
References: <20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com>
In-Reply-To: <20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, 
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
index 34d881572351..d7d764f7554d 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -345,9 +345,9 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
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


