Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B57573DBAC
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jun 2023 11:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjFZJqA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jun 2023 05:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjFZJp7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jun 2023 05:45:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 324ED9F
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jun 2023 02:45:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qDinA-0004mD-I2; Mon, 26 Jun 2023 11:45:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qDin8-00AAfx-Sy; Mon, 26 Jun 2023 11:45:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qDin7-00HVSs-TM; Mon, 26 Jun 2023 11:45:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pavel Machek <pavel@ucw.cz>, Jean Delvare <jdelvare@suse.com>
Subject: [PATCH] i2c: Drop legacy callback .probe_new()
Date:   Mon, 26 Jun 2023 11:45:48 +0200
Message-Id: <20230626094548.559542-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5997; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=tdXduNGrLUHXF3a+N/HuE7zyOZjpBKyOSokKiEd97X0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkmV5J+tsSAYqtRnjdxnXafi67wOslBp4VrBECI pPtzxjKbwiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZJleSQAKCRCPgPtYfRL+ ThZ9B/9Dls/XxA/HEp3AWcxpv+Frq6D2PaYvuDrzfsvJOKULEhKAF/wpi6S7k3Z2bLhEZ3fBel1 cJaxS0ILEWVzgxpRxEGlzjXgwB92O7qzNfZMLWqvqfYsjTWAGoGGNCuWRawyhxJDf7F9qKRqL/K cwA+ZtXqH0nuWFku2QMs8yh6L/dI9KtsZyVLLSMzaJxxbs0c+d/g5bESkPHY9JH3IMQqUliZhpb i4oKz3PeU3kT4uSQsWpAD4xGrhr3bp3BVMGfUu+6gZDT9GaRW1q5jK//EG1X+N2jg5SOLk6aqb9 LcNSfZO8JtGlCQjTzyvoaBuNWXFVxZgmwB7V2qhpC80Gz34M
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Now that all drivers are converted to the (new) .probe() callback, the
temporary .probe_new() can go away. \o/

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

I was planning to send out this patch for inclusion into next after
v6.5-rc1 as I thought there were only three drivers left to be converted
before (on top of today's next/master). While preparing to submit this
patch I noticed that a few more .probe_new were introduced in next even
after commit 03c835f498b5 ("i2c: Switch .probe() to not take an id
parameter"). I just sent out patches for all drivers in next that are
still using .probe_new. These are:

 - w1: ds2482: Switch back to use struct i2c_driver's .probe()
   https://lore.kernel.org/lkml/20230612072807.839689-1-u.kleine-koenig@pengutronix.de
   Krzysztof Kozlowski already signaled this won't go into 6.5-rc via
   his tree, and he's ok if it goes in via i2c then.

 - drm/i2c: Switch i2c drivers back to use .probe()
   https://lore.kernel.org/dri-devel/20230611202740.826120-1-u.kleine-koenig@pengutronix.de
   Currently applied to

	https://anongit.freedesktop.org/git/drm/drm-misc.git drm-misc-next

   as d13b5d2b2b45. This won't make it onto v6.5-rc1 either.

 - watchdog: ziirave_wdt: Switch i2c driver back to use .probe()
   https://lore.kernel.org/linux-watchdog/20230525210837.735447-1-u.kleine-koenig@pengutronix.de
   Given that the merge window is open now, I doubt this will make it
   into v6.5-rc1.

 - c4cfa2436ff6 hwmon: max31827: Switch back to use struct i2c_driver::probe
   https://lore.kernel.org/linux-hwmon/20230626085145.554616-1-u.kleine-koenig@pengutronix.de

 - leds: aw200xx: Switch back to use struct i2c_driver::probe
   https://lore.kernel.org/linux-leds/20230626090254.556206-1-u.kleine-koenig@pengutronix.de

 - media: i2c: ov01a10: Switch back to use struct i2c_driver::probe
   https://lore.kernel.org/linux-media/20230626090533.556406-1-u.kleine-koenig@pengutronix.de

 - usb: typec: nb7vpq904m: Switch back to use struct i2c_driver::probe
   https://lore.kernel.org/linux-usb/20230626091314.557122-1-u.kleine-koenig@pengutronix.de

 - regulator: raa215300: Switch back to use struct i2c_driver::probe
   https://lore.kernel.org/lkml/20230626091544.557403-1-u.kleine-koenig@pengutronix.de

 - mfd: Switch two more drivers back to use struct i2c_driver::probe
   https://lore.kernel.org/lkml/20230626091941.557733-1-u.kleine-koenig@pengutronix.de

The last six were only sent today, so I guess we have to wait another
development cycle and then get this patch into next after v6.6-rc1
(together with the patches from above list that will have failed to get
into v6.6-rc1).

Until we're there, feel free to already look at this patch. I was unsure
if I should split of the change to Documentation/hwmon/pmbus.rst. As
.probe() already works in v6.3-rc2 this hunk could go in already
earlier, e.g. via the hwmon tree. While thinking about that, the hunk
for Documentation/i2c/writing-clients.rst could go in before, too.
So tell me your thoughts, then I can split as desired.

Best regards
Uwe

 Documentation/hwmon/pmbus.rst         |  2 +-
 Documentation/i2c/writing-clients.rst |  2 +-
 include/linux/i2c.h                   | 11 +----------
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/Documentation/hwmon/pmbus.rst b/Documentation/hwmon/pmbus.rst
index 7ecfec6ca2db..eb1569bfa676 100644
--- a/Documentation/hwmon/pmbus.rst
+++ b/Documentation/hwmon/pmbus.rst
@@ -163,7 +163,7 @@ Emerson DS1200 power modules might look as follows::
 	.driver = {
 		   .name = "ds1200",
 		   },
-	.probe_new = ds1200_probe,
+	.probe = ds1200_probe,
 	.id_table = ds1200_id,
   };
 
diff --git a/Documentation/i2c/writing-clients.rst b/Documentation/i2c/writing-clients.rst
index b7d3ae7458f8..41ddc10f1ac7 100644
--- a/Documentation/i2c/writing-clients.rst
+++ b/Documentation/i2c/writing-clients.rst
@@ -46,7 +46,7 @@ driver model device node, and its I2C address.
 	},
 
 	.id_table	= foo_idtable,
-	.probe_new	= foo_probe,
+	.probe		= foo_probe,
 	.remove		= foo_remove,
 	/* if device autodetection is needed: */
 	.class		= I2C_CLASS_SOMETHING,
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 3430cc2b05a6..0dae9db27538 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -237,7 +237,6 @@ enum i2c_driver_flags {
  * struct i2c_driver - represent an I2C device driver
  * @class: What kind of i2c device we instantiate (for detect)
  * @probe: Callback for device binding
- * @probe_new: Transitional callback for device binding - do not use
  * @remove: Callback for device unbinding
  * @shutdown: Callback for device shutdown
  * @alert: Alert callback, for example for the SMBus alert protocol
@@ -272,16 +271,8 @@ enum i2c_driver_flags {
 struct i2c_driver {
 	unsigned int class;
 
-	union {
 	/* Standard driver model interfaces */
-		int (*probe)(struct i2c_client *client);
-		/*
-		 * Legacy callback that was part of a conversion of .probe().
-		 * Today it has the same semantic as .probe(). Don't use for new
-		 * code.
-		 */
-		int (*probe_new)(struct i2c_client *client);
-	};
+	int (*probe)(struct i2c_client *client);
 	void (*remove)(struct i2c_client *client);
 
 

base-commit: 60e7c4a25da68cd826719b685babbd23e73b85b0
prerequisite-patch-id: de032545ff736a636861fd7d974651c218eb1fb8
prerequisite-patch-id: 2de580c8f961b1d9e3cbf6d8266a6c9e5f0baee3
prerequisite-patch-id: 641b4a15fb6d48fa5609d999405d822a3dca77a0
prerequisite-patch-id: 45fecb72727ea532fbc8ed22b90d12dfbdc6eebc
prerequisite-patch-id: 5a40319dc9ddac96d9c18d8e806ca7b28e1b5552
prerequisite-patch-id: e5e889e4ebbd02acd2698cace289270fce7bf4e6
prerequisite-patch-id: 0b906be4310a9818dc757c197e6536a10efe4b38
prerequisite-patch-id: 4d001a874ac51d3c00caed382b370b3238f8bf8e
prerequisite-patch-id: 8fbcfbcc6ba45bb5e5c4e21d6480bc7ce585fc4f

-- 
2.39.2

