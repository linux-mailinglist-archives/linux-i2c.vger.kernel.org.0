Return-Path: <linux-i2c+bounces-2503-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7092886CFF
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91B8B281766
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0E25FB98;
	Fri, 22 Mar 2024 13:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lcw7pwGd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC2659B5F
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114013; cv=none; b=fzQVqK9EVH3Hy7juScAvhBe8Y+PoBEOf6MqUAEbUA3langVdC7ZNKlBf9EUa3dlPlmCeTRZQeHTMIC4+7V11k8FfBa9HcAWJYca37OkKeyr8QLl546Uefg6Me13qUnCSytdOY+QfV+r7DwwxPBgRsuqkoTXSfpXhckKUL403AW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114013; c=relaxed/simple;
	bh=hUFytOBaQzIkz4+MC+aL7QUUSke0EPUf9+Kdq/iJx08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/Wkv9RNtn3BAZQANam9KmqFMQrtDFC2aP2S/vqDDjFuaDtKeEC7fuNlnJIHjIiwTXIvlT/syxcqziDZBA5plx9xFbKcU4LgLtVsJRjr/YaWy06BT5mc2hLZy8QPQa+lnjk0BQMaaqpLLagfVjwMTXpkGVReWPR6mrD8dpjsPvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lcw7pwGd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=YFoX/7P6tBs5BWolxm81GzUi9hH6lpAklGphsTRZels=; b=lcw7pw
	Gd+1ni55mbb9KoOXkhHzN1idKU5Tmv2T0W1Mx2jpuz0uj7jM5LfGEGBZxiutZpVh
	Kniu3/+bpqjxaycG+/ZoUaHc4qQhzj9jHMxutkFCnD7mAXXAeX74cFAkedQAbevC
	wcg492XGli2ONu2r9NDAULdh7Du1noaUmB5hAUO3EonoJwXzXX+WwFwJXmSv5kWP
	n2kcUZp7jwqAaNssBC/HUYaRXl8jpWIzAm9iuUDrCAwumM7jTj3gmUvQy84/Okoi
	05c+y6yjjhs+DDfZ7Y7BIAXFyDQNUJwG4KEDSOYqDZUEe1hZWXnFq8KWJKYdfOsC
	G9BQioFvYZjPZqdQ==
Received: (qmail 3870451 invoked from network); 22 Mar 2024 14:26:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:35 +0100
X-UD-Smtp-Session: l3s3148p1@5+jVxT8U1OBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/64] i2c: dln2: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:10 +0100
Message-ID: <20240322132619.6389-18-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
specifications and replace "master/slave" with more appropriate terms.
They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target").

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-dln2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-dln2.c b/drivers/i2c/busses/i2c-dln2.c
index 631109c7a098..11ed055143d3 100644
--- a/drivers/i2c/busses/i2c-dln2.c
+++ b/drivers/i2c/busses/i2c-dln2.c
@@ -175,7 +175,7 @@ static u32 dln2_i2c_func(struct i2c_adapter *a)
 }
 
 static const struct i2c_algorithm dln2_i2c_usb_algorithm = {
-	.master_xfer = dln2_i2c_xfer,
+	.xfer = dln2_i2c_xfer,
 	.functionality = dln2_i2c_func,
 };
 
@@ -251,6 +251,6 @@ static struct platform_driver dln2_i2c_driver = {
 module_platform_driver(dln2_i2c_driver);
 
 MODULE_AUTHOR("Laurentiu Palcu <laurentiu.palcu@intel.com>");
-MODULE_DESCRIPTION("Driver for the Diolan DLN2 I2C master interface");
+MODULE_DESCRIPTION("Driver for the Diolan DLN2 I2C controller interface");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:dln2-i2c");
-- 
2.43.0


