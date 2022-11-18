Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 763366302CA
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235420AbiKRXQO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:16:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbiKRXPy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:15:54 -0500
X-Greylist: delayed 551 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 18 Nov 2022 14:58:53 PST
Received: from algol.kleine-koenig.org (algol.kleine-koenig.org [162.55.41.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45B038C486;
        Fri, 18 Nov 2022 14:58:53 -0800 (PST)
Received: by algol.kleine-koenig.org (Postfix, from userid 1000)
        id 7140168F8F6; Fri, 18 Nov 2022 23:48:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kleine-koenig.org;
        s=2022; t=1668811700;
        bh=auu/jJNDFmqvsBa6XqTdE07i+TqxWdW5DZkhYNgSbX0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LovzqvlfM+vRFD/6Vxs2We1j8mrGPgNB+mJb8s1nOxA26WkTY1JvkJke0+Lwag4iL
         DanqcQu7db/rcDuefEamPB8T4aP9OfpD8aaqT8/nZT6FzNNRUDnK2UET0z3Mb45yrN
         SUOdYCJ8XgizZarbo3AeYQo5YIzKHONdbJ/B0M4O2p0EHH31YJNosb0DszuO03WJS7
         bOXuBJRr2JD1Bo7MuK7SS8+A02HW57jpBtnly65Zr+Ome7qb3b1UTCzXjOHxY6+/mK
         7OFV/pn93t6I5cDfNNgyq3xj9Sw8zil0I0UF6gWGFS9wbWdSmi/sId0SGgVmtt3lJw
         HNe+Jnhv+x8XQ==
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
Subject: [PATCH 606/606] [DON'T APPLY] i2c: Switch .probe() to not take an id parameter
Date:   Fri, 18 Nov 2022 23:45:40 +0100
Message-Id: <20221118224540.619276-607-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

---
 drivers/i2c/i2c-core-base.c | 11 ++---------
 include/linux/i2c.h         | 12 +++++++-----
 2 files changed, 9 insertions(+), 14 deletions(-)

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
index d84e0e99f084..7414ec3ba858 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -272,14 +272,16 @@ enum i2c_driver_flags {
 struct i2c_driver {
 	unsigned int class;
 
+	union {
 	/* Standard driver model interfaces */
-	int (*probe)(struct i2c_client *client, const struct i2c_device_id *id);
+		int (*probe)(struct i2c_client *client);
+		/* New driver model interface to aid the seamless removal of the
+		 * current probe()'s, more commonly unused than used second parameter.
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
2.38.1

