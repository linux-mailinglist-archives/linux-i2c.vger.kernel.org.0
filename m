Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 226685FCD1A
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Oct 2022 23:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbiJLVZ4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Oct 2022 17:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiJLVZw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Oct 2022 17:25:52 -0400
X-Greylist: delayed 4199 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 12 Oct 2022 14:25:49 PDT
Received: from 2.mo550.mail-out.ovh.net (2.mo550.mail-out.ovh.net [178.32.119.250])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0769AC34D4
        for <linux-i2c@vger.kernel.org>; Wed, 12 Oct 2022 14:25:47 -0700 (PDT)
Received: from player791.ha.ovh.net (unknown [10.110.103.41])
        by mo550.mail-out.ovh.net (Postfix) with ESMTP id D1DC1221E0
        for <linux-i2c@vger.kernel.org>; Wed, 12 Oct 2022 16:37:03 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player791.ha.ovh.net (Postfix) with ESMTPSA id CF17F2F8C633A;
        Wed, 12 Oct 2022 16:36:57 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-99G0034e94a6aa-b5e1-453f-a575-418187936090,
                    75377E6B882747309559AE06BD3DFEEF97A89409) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Wolfram Sang <wsa@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Peter Rosin <peda@axentia.se>
Cc:     Stephen Kitt <steve@sk2.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/i2c: use simple i2c probe
Date:   Wed, 12 Oct 2022 18:36:47 +0200
Message-Id: <20221012163647.3930565-1-steve@sk2.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17090879111357302491
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejkedguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeelgeetueejffejfeejvefhtddufeejgfetleegtddukeelieelvddvteduveejtdenucfkphepuddvjedrtddrtddruddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshhtvghvvgesshhkvddrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

All these drivers have an i2c probe function which doesn't use the
"struct i2c_device_id *id" parameter, so they can trivially be
converted to the "probe_new" style of probe with a single argument.

This is part of an ongoing transition to single-argument i2c probe
functions. Old-style probe functions involve a call to i2c_match_id:
in drivers/i2c/i2c-core-base.c,

         /*
          * When there are no more users of probe(),
          * rename probe_new to probe.
          */
         if (driver->probe_new)
                 status = driver->probe_new(client);
         else if (driver->probe)
                 status = driver->probe(client,
                                        i2c_match_id(driver->id_table, client));
         else
                 status = -EINVAL;

Drivers which don't need the second parameter can be declared using
probe_new instead, avoiding the call to i2c_match_id. Drivers which do
can still be converted to probe_new-style, calling i2c_match_id
themselves (as is done currently for of_match_id).

This change was done using the following Coccinelle script, and fixed
up for whitespace changes:

@ rule1 @
identifier fn;
identifier client, id;
@@

- static int fn(struct i2c_client *client, const struct i2c_device_id *id)
+ static int fn(struct i2c_client *client)
{
...when != id
}

@ rule2 depends on rule1 @
identifier rule1.fn;
identifier driver;
@@

struct i2c_driver driver = {
-       .probe
+       .probe_new
                =
(
                   fn
|
-                  &fn
+                  fn
)
                ,
};

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 drivers/i2c/i2c-core-base.c         | 5 ++---
 drivers/i2c/i2c-smbus.c             | 5 ++---
 drivers/i2c/muxes/i2c-mux-pca9541.c | 5 ++---
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 8c7e3494ca5f..ff64ba2abb6d 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1013,15 +1013,14 @@ static const struct i2c_device_id dummy_id[] = {
 	{ },
 };
 
-static int dummy_probe(struct i2c_client *client,
-		       const struct i2c_device_id *id)
+static int dummy_probe(struct i2c_client *client)
 {
 	return 0;
 }
 
 static struct i2c_driver dummy_driver = {
 	.driver.name	= "dummy",
-	.probe		= dummy_probe,
+	.probe_new	= dummy_probe,
 	.id_table	= dummy_id,
 };
 
diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 07c92c8495a3..f4c74b9135b3 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -112,8 +112,7 @@ static void smbalert_work(struct work_struct *work)
 }
 
 /* Setup SMBALERT# infrastructure */
-static int smbalert_probe(struct i2c_client *ara,
-			  const struct i2c_device_id *id)
+static int smbalert_probe(struct i2c_client *ara)
 {
 	struct i2c_smbus_alert_setup *setup = dev_get_platdata(&ara->dev);
 	struct i2c_smbus_alert *alert;
@@ -170,7 +169,7 @@ static struct i2c_driver smbalert_driver = {
 	.driver = {
 		.name	= "smbus_alert",
 	},
-	.probe		= smbalert_probe,
+	.probe_new	= smbalert_probe,
 	.remove		= smbalert_remove,
 	.id_table	= smbalert_ids,
 };
diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
index ea83de78f52d..09d1d9e67e31 100644
--- a/drivers/i2c/muxes/i2c-mux-pca9541.c
+++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
@@ -283,8 +283,7 @@ static int pca9541_release_chan(struct i2c_mux_core *muxc, u32 chan)
 /*
  * I2C init/probing/exit functions
  */
-static int pca9541_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int pca9541_probe(struct i2c_client *client)
 {
 	struct i2c_adapter *adap = client->adapter;
 	struct i2c_mux_core *muxc;
@@ -337,7 +336,7 @@ static struct i2c_driver pca9541_driver = {
 		   .name = "pca9541",
 		   .of_match_table = of_match_ptr(pca9541_of_match),
 		   },
-	.probe = pca9541_probe,
+	.probe_new = pca9541_probe,
 	.remove = pca9541_remove,
 	.id_table = pca9541_id,
 };

base-commit: 833477fce7a14d43ae4c07f8ddc32fa5119471a2
-- 
2.30.2

