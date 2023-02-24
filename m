Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 866FA6A1BCE
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Feb 2023 13:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbjBXMGR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Feb 2023 07:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjBXMGP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Feb 2023 07:06:15 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 822CF65332
        for <linux-i2c@vger.kernel.org>; Fri, 24 Feb 2023 04:06:14 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVWq4-0000eJ-RL; Fri, 24 Feb 2023 13:06:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVWq2-007B02-SE; Fri, 24 Feb 2023 13:06:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVWq2-006EZ6-R5; Fri, 24 Feb 2023 13:06:10 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 7/9] i2c: Switch .probe() to not take an id parameter
Date:   Fri, 24 Feb 2023 13:05:58 +0100
Message-Id: <20230224120600.1681685-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224120600.1681685-1-u.kleine-koenig@pengutronix.de>
References: <20230224120600.1681685-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=+71wz5skFwCbbBFUgxFsdJ/u5S/S5H9btbK8684v6tg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj+KgbOSV8eecJXtOE/I8vpmKMer7YYUfbvTfuh 4KIf3VbH3CJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/ioGwAKCRDB/BR4rcrs Cd/hB/0QzSnaB2XApeqnwGVmjBbn1JKEt8p2M1ZjndmWBEcd6p9MNhUpiTNnfFu4F0hI+E/2Kz/ jdIypObLyi6RXzZFRQkCrVCMd+4v2cLcgzFDbsH3ATwLcDsuSR5qv2gJp8WOnpNlSS3RDem5sUr 0H07bF0xOdXztWWbaWhsJOX1YzNnk74lel98uHQ7RhRk62AAfO2BZ7TvaLImJQ63HvTlmEQ8Jht lomnKcSA+nFKH/PxTX9laKHiCJFS608+fUeEJVfn1xDVFpcajsrWkHlPjfCM5k2KcEjEax3uhFg pvdawi8s275N/SCAav1LQKCmOIzAyXmHG3dNpp8VXNdlzZce
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back
type") introduced a new probe callback to convert i2c init routines to
not take an i2c_device_id parameter. Now that all in-tree drivers are
converted to the temporary .probe_new() callback, .probe() can be
modified to match the desired prototype.

Now that .probe() and .probe_new() have the same semantic, they can be
defined as members of an anonymous union to save some memory and
simplify the core code a bit.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/i2c-core-base.c | 11 ++---------
 include/linux/i2c.h         | 14 +++++++++-----
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 087e480b624c..1fbe16221085 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -558,15 +558,8 @@ static int i2c_device_probe(struct device *dev)
 		goto err_detach_pm_domain;
 	}
 
-	/*
-	 * When there are no more users of probe(),
-	 * rename probe_new to probe.
-	 */
-	if (driver->probe_new)
-		status = driver->probe_new(client);
-	else if (driver->probe)
-		status = driver->probe(client,
-				       i2c_match_id(driver->id_table, client));
+	if (driver->probe)
+		status = driver->probe(client);
 	else
 		status = -EINVAL;
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index d84e0e99f084..c3e022d53182 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -272,14 +272,18 @@ enum i2c_driver_flags {
 struct i2c_driver {
 	unsigned int class;
 
+	union {
 	/* Standard driver model interfaces */
-	int (*probe)(struct i2c_client *client, const struct i2c_device_id *id);
+		int (*probe)(struct i2c_client *client);
+		/*
+		 * Legacy callback that was part of a conversion of .probe().
+		 * Today it has the same semantic as .probe(). Don't use for new
+		 * code.
+		 */
+		int (*probe_new)(struct i2c_client *client);
+	};
 	void (*remove)(struct i2c_client *client);
 
-	/* New driver model interface to aid the seamless removal of the
-	 * current probe()'s, more commonly unused than used second parameter.
-	 */
-	int (*probe_new)(struct i2c_client *client);
 
 	/* driver model interfaces that don't relate to enumeration  */
 	void (*shutdown)(struct i2c_client *client);
-- 
2.39.1

