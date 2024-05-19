Return-Path: <linux-i2c+bounces-3594-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F278C956B
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 19:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38F4E1C20AD1
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 17:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A16487BE;
	Sun, 19 May 2024 17:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=freemail.hu header.i=@freemail.hu header.b="PcgcU1SF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out.freemail.hu (fmfe28.freemail.hu [46.107.16.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7713A1E867;
	Sun, 19 May 2024 17:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.107.16.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716138150; cv=none; b=ic6KbYNZdATdr3afDmDC2vExXn9NKJ2gly8ZWDDaqwbQact+St2LA5PB94erMegwd/HV7+DVg2h0RNFxAxWDNZrg8ZadcFdf13BKZcZrLXbSpdCsdlqJ6HeRdOd1EfThpA+cx/Arkn+7tKNSq6ErYCkmkBSR6S+hkjrIr9fO37M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716138150; c=relaxed/simple;
	bh=z0HEpwuxgZUJe2+XFOQ3mW/AL7YeIiVbzyFq4gc3vbE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ESd5Nat8pyPArAHn8omObx3VpQL6EhKZap2oi7J5SaLcPih/260EXaT+Au7fkUbYVFTwqZMH5QKj0Qkz9lwyePtlIacWtUzFBFd1vJNvNRMGmkWLWYk9oxc89awbypTezz4VcVZ5ppJp0ioxF67ylJMCkt9RJVub/Uxos/71+nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freemail.hu; spf=pass smtp.mailfrom=freemail.hu; dkim=fail (2048-bit key) header.d=freemail.hu header.i=@freemail.hu header.b=PcgcU1SF reason="signature verification failed"; arc=none smtp.client-ip=46.107.16.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freemail.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freemail.hu
Received: from fizweb.elte.hu (fizweb.elte.hu [157.181.183.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.freemail.hu (Postfix) with ESMTPSA id 4Vj6JH3s6Lz4dp;
	Sun, 19 May 2024 18:55:11 +0200 (CEST)
From: egyszeregy@freemail.hu
To: wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Benjamin=20Sz=C5=91ke?= <egyszeregy@freemail.hu>
Subject: [PATCH] i2c-dev: Introduce "linux,i2c-dev-name" property for device tree of I2C controller.
Date: Sun, 19 May 2024 18:55:04 +0200
Message-Id: <20240519165504.19627-1-egyszeregy@freemail.hu>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1716137712;
	s=20181004; d=freemail.hu;
	h=From:To:Cc:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
	l=1506; bh=SpZ0hi7sZoilYx08Os0iQ7zMl6chRN/0TUPqVc9082s=;
	b=PcgcU1SF4t47qJMHd47C/PTdJAf+Z0cHl4+46HozeIKSY16BYsXFtOjdPhcOQP++
	uc3KwZqMX992JtvPfoC2C/HaB1OnKU2gjVQdU0Kpg0nl+QZy2lGftFVsu38ssEzPW/Q
	9zX9ep+t84aa2WQJjO7l/YEHwJcTAcE4u/qnrqgiqn6TfIJDp36Qm+PJjUY8UGpKX+7
	DRCW56Rf09VQj9wtuH+WQSenE01qHsneU+fpUUuJOztA/I9PIADrkrmaIsdmVbK/o39
	GjMG8aRzVDDc0TG5kqRM+NDUNFv60ABOJPxrheeIegW29Nrcdx5oOx8ZZj8Ih9Wr5z5
	xxV756CF9w==

From: Benjamin Szőke <egyszeregy@freemail.hu>

Optionally, an I2C controller may have a "linux,i2c-dev-name" property.
This is a string which is defining a custom suffix name for I2C device
in /dev/i2c-<name> format. It helps to improve software portability between
various SoCs and reduce complexities of hardware related codes in SWs.

Signed-off-by: Benjamin Szőke <egyszeregy@freemail.hu>
---
 drivers/i2c/i2c-dev.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index 8b7e599f1674..df4cec88ea59 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -651,6 +651,7 @@ static void i2cdev_dev_release(struct device *dev)
 
 static int i2cdev_attach_adapter(struct device *dev)
 {
+	const char *name;
 	struct i2c_adapter *adap;
 	struct i2c_dev *i2c_dev;
 	int res;
@@ -672,7 +673,16 @@ static int i2cdev_attach_adapter(struct device *dev)
 	i2c_dev->dev.parent = &adap->dev;
 	i2c_dev->dev.release = i2cdev_dev_release;
 
-	res = dev_set_name(&i2c_dev->dev, "i2c-%d", adap->nr);
+	/*
+	 * If "linux,i2c-dev-name" is specified in device tree, use /dev/i2c-<name>
+	 * in Linux userspace, otherwise use /dev/i2c-<nr>.
+	 */
+	res = device_property_read_string(&adap->dev, "linux,i2c-dev-name", &name);
+	if (res < 0)
+		res = dev_set_name(&i2c_dev->dev, "i2c-%d", adap->nr);
+	else
+		res = dev_set_name(&i2c_dev->dev, "i2c-%s", name);
+
 	if (res)
 		goto err_put_i2c_dev;
 
-- 
2.39.3


