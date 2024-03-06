Return-Path: <linux-i2c+bounces-2232-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F7A873E35
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 19:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10E181F25FF0
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 18:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F8614036D;
	Wed,  6 Mar 2024 18:02:53 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D27613B2BC
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 18:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709748173; cv=none; b=LwlJF9ObdFpz2YlXIDbFyhcnxwGBOe/vp5NUe19K5tJVSL8fMbP/U3JTlOKOAGeynr4Q+z57rB5nt/GL2YtX2ooER83cj+czV4kvgXd8R+07/+eMbM38IIXw5xCIp4RMD+44mMSmJoH/R+P1cTN8tfR/b7RBDAzYUM5V4fqhElw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709748173; c=relaxed/simple;
	bh=WgWS4eEmH0zFrpkfCtyjnY5VxJXoMdRhFRgjFG2YafY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eZIDCQBgtXD3qxC01OMKvbIVFXGD5+7LiO0jWme6j/Tnxyigmz3Qu4WW7XDbG0Ut+k9qXDYJJ7215xMRPZadRPxTbRdeEi1r47OvfejIbQMhfu/rZn6LgTDkfHLrK0lLt7vszNP+621b4nEIvELgtWqgvdZKZlAV0INOJnOtSxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhvbJ-0005kc-Os; Wed, 06 Mar 2024 19:02:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhvbH-004n7h-HI; Wed, 06 Mar 2024 19:02:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhvbH-000oFC-1R;
	Wed, 06 Mar 2024 19:02:43 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-i2c@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] i2c: sprd: Convert to platform remove callback returning void
Date: Wed,  6 Mar 2024 19:02:41 +0100
Message-ID: <20240306180241.83327-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1949; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=WgWS4eEmH0zFrpkfCtyjnY5VxJXoMdRhFRgjFG2YafY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl6K/BnJZUN6hw1rYQPOKwB/raZqggIkHH6CWUm MRH2qG/U7iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZeivwQAKCRCPgPtYfRL+ Tq7iCAClxMxy+dE5lYUnTOGkvy9m0Jo1UVrgAiME+5MyLbISfMSJbNcpThspG8ukH/dCO8XGRYk UF07UCEq+ZuxdSa8gMyb5Cns8wQ9ol9vhpOe6jp6sbB4GDX3VQD7RM0ixukllpEK/Ab2rArBF0I mVw0nTWnaCGS4MEgKSDefCbsshjINa0Ja/L1ihm5oisyhrgucjSoQHq3d35U5Srv5JlBfO87m37 Y/XWf1gw9WHw7Jh1N+QXSYVtZ//qeOjofz3edKfBOzvb6R4ual7cNOtd6WlNwv+okN6Yfqv/zMQ 3C1ij7naPC7QDIyzsJSEzPI3U474TpySQ42swT7+/k3WsKgU
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/busses/i2c-sprd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index c52d1bec60b4..28c88901d9bc 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -570,7 +570,7 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sprd_i2c_remove(struct platform_device *pdev)
+static void sprd_i2c_remove(struct platform_device *pdev)
 {
 	struct sprd_i2c *i2c_dev = platform_get_drvdata(pdev);
 	int ret;
@@ -586,8 +586,6 @@ static int sprd_i2c_remove(struct platform_device *pdev)
 
 	pm_runtime_put_noidle(i2c_dev->dev);
 	pm_runtime_disable(i2c_dev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused sprd_i2c_suspend_noirq(struct device *dev)
@@ -645,7 +643,7 @@ MODULE_DEVICE_TABLE(of, sprd_i2c_of_match);
 
 static struct platform_driver sprd_i2c_driver = {
 	.probe = sprd_i2c_probe,
-	.remove = sprd_i2c_remove,
+	.remove_new = sprd_i2c_remove,
 	.driver = {
 		   .name = "sprd-i2c",
 		   .of_match_table = sprd_i2c_of_match,

base-commit: 11afac187274a6177a7ac82997f8691c0f469e41
-- 
2.43.0


