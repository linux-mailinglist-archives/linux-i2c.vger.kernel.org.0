Return-Path: <linux-i2c+bounces-12091-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A173AB166FA
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 21:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A98823B34CC
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 19:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393B41F4623;
	Wed, 30 Jul 2025 19:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Ms3j3oVx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-70.smtpout.orange.fr [80.12.242.70])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AE418E377;
	Wed, 30 Jul 2025 19:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753904304; cv=none; b=eOficCJyQ2uMxNz8hUF8OSpY7V/Mw2ZMWl17NI88z/I9XgSw+QBUVcgyAJu3K9iZ9rWP9S1/DRaX7vrrATsWoi7ds+BoTILlc7keUgKumzXxZ2ukvVWTJGbwOYDiYhhFXPPqrgSzLkHzgKUjigrpC6eROTpNiYp3mmIGCOvw3eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753904304; c=relaxed/simple;
	bh=1fsIa9hYSMs0i0hVB2ZUs2FIAuKGgxIfdoDFJTFGyS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LLfaHc5ztD4XZz8I0ZSrw2HnitS2+7vwYrvqAnJUD5xKm0Z++lq8+3anMlcMInWPoh8xGdIw7X2Em7j4BywB0Dkski5eS++l+lms3MjQ3KAiHCVyGVWMzJxwK+2DzvuRRwkvwOYBM/nPWL+EUhbfezLoUb8n/6fi7kQE+cTmsBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Ms3j3oVx; arc=none smtp.client-ip=80.12.242.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id hCctuZ6rY5DGfhCctu80HL; Wed, 30 Jul 2025 21:38:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1753904291;
	bh=BJvoYC1UYY8TgOpqx/zKK7xR/lVwzTBfB5KA1myGC+Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Ms3j3oVxFcMWAorBI9nqfbYY/ScuKMWFZ8VtEMvVFvQbX80UD/Dk4lBVUj5+ifiAv
	 ZFPmvTlrRmbapg/k1TJfF5Dz+TFe9Lf6bV+4nD6Ah6g7v5e2z4nM31vkv7Q46XAYGd
	 STkCjqjMPCT6ys1FkaRf8wy3Rldca16lYxW3Ga0y6/NfG2XKSoBiB5bJsAfu4lCYFv
	 S0lTIRr4VbMD0dCyK6aNBPI/1T/d3pzi2u4/85YZzAoKb03+2fenasnkUlWktR5IgX
	 kXFrZaHOESHFR84F3o3nseTPcs4piSW3LQUKvyMLrmoIEToyUx2pby5mtSMzfaJ0Cm
	 LwTcOSZqI57YQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 30 Jul 2025 21:38:11 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Peter Rosin <peda@axentia.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: muxes: mule: Fix an error handling path in mule_i2c_mux_probe()
Date: Wed, 30 Jul 2025 21:38:02 +0200
Message-ID: <354bf00a245ec3bac9cdd197a06138dddda2f009.1753904271.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs in the loop that creates the device adapters, then a
reference to 'dev' still needs to be released.

Use for_each_child_of_node_scoped() to both fix the issue and save one line
of code.

Fixes: d0f8e97866bf ("i2c: muxes: add support for tsd,mule-i2c multiplexer")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/i2c/muxes/i2c-mux-mule.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-mule.c b/drivers/i2c/muxes/i2c-mux-mule.c
index 284ff4afeeac..d3b32b794172 100644
--- a/drivers/i2c/muxes/i2c-mux-mule.c
+++ b/drivers/i2c/muxes/i2c-mux-mule.c
@@ -47,7 +47,6 @@ static int mule_i2c_mux_probe(struct platform_device *pdev)
 	struct mule_i2c_reg_mux *priv;
 	struct i2c_client *client;
 	struct i2c_mux_core *muxc;
-	struct device_node *dev;
 	unsigned int readback;
 	int ndev, ret;
 	bool old_fw;
@@ -95,7 +94,7 @@ static int mule_i2c_mux_probe(struct platform_device *pdev)
 				     "Failed to register mux remove\n");
 
 	/* Create device adapters */
-	for_each_child_of_node(mux_dev->of_node, dev) {
+	for_each_child_of_node_scoped(mux_dev->of_node, dev) {
 		u32 reg;
 
 		ret = of_property_read_u32(dev, "reg", &reg);
-- 
2.50.1


