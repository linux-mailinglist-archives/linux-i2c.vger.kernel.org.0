Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974592C4F59
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Nov 2020 08:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388476AbgKZHXl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Nov 2020 02:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388475AbgKZHXl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Nov 2020 02:23:41 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D508CC0617A7
        for <linux-i2c@vger.kernel.org>; Wed, 25 Nov 2020 23:23:40 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kiBcw-0002cN-IE; Thu, 26 Nov 2020 08:23:38 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kiBcv-0003vj-B1; Thu, 26 Nov 2020 08:23:37 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
Subject: [PATCH 2/2] i2c: remove check that can never be true
Date:   Thu, 26 Nov 2020 08:23:31 +0100
Message-Id: <20201126072331.1737632-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126072331.1737632-1-u.kleine-koenig@pengutronix.de>
References: <20201126072331.1737632-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A driver remove callback is only called if the device was bound before.
So it's sure that both dev and dev->driver are valid and dev is an i2c
device. If the check fails something louder than "return 0" might be
appropriate because the problem is grave (something like memory
corruption), otherwise the check is useless.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/i2c-core-base.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 86e43016ff85..be995a95c4ac 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -549,12 +549,9 @@ static int i2c_device_probe(struct device *dev)
 
 static int i2c_device_remove(struct device *dev)
 {
-	struct i2c_client	*client = i2c_verify_client(dev);
+	struct i2c_client	*client = to_i2c_client(dev);
 	struct i2c_driver	*driver;
 
-	if (!client || !dev->driver)
-		return 0;
-
 	driver = to_i2c_driver(dev->driver);
 	if (driver->remove) {
 		int status = 0;
-- 
2.29.2

