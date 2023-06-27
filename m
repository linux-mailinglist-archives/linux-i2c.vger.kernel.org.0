Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 494B673F49D
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jun 2023 08:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjF0GjU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jun 2023 02:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbjF0GjT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jun 2023 02:39:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E8D9F
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jun 2023 23:39:17 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qE2M3-00052l-Ob; Tue, 27 Jun 2023 08:39:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qE2M2-00ANmP-Rh; Tue, 27 Jun 2023 08:39:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qE2M1-000AUq-UW; Tue, 27 Jun 2023 08:39:09 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH] i2c: Update documentation to use .probe() again
Date:   Tue, 27 Jun 2023 08:39:08 +0200
Message-Id: <20230627063908.592574-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1296; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=+0uUyJhoM8iRldnq4PjfgWiPj1VavyAIYKeE9XMnviU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkmoQLbnsT0UvPsctV/KsyHHZggPJ3hfdd/YS3p FXmo9maPq+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZJqECwAKCRCPgPtYfRL+ TrS0CAC3LlFGI+NZwjF2WIs8Cubu1Z239Y+HUinujiAlVTt+rrYCabWEk53c/cPd8rUyYC3lpkR oYo4tR9Bsz4MVIShNxsRpzfq6Am7kYIPSYmSuzauLXJUMAAtTmO5W5Rx9GZbTPCfh6gC1xphk1B /9VsOtmr7gEAteZOSUJiQ1sDOME2/QaMQMP2JwDwZEXwqb0teJ78LM73UoajSD4f5u9WzVVvnOM FITkNo69gFs90zULG/4zCvz6qYe06IFgXa8yMWja/sby5OUPNk2mJI6EKV3U0yo4nF/edHmMpM0 YzvA/HaX1rNGx7tzr5rUF7qY9abJGM/7pJNezWf5TmVHiTXH
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

Since commit 03c835f498b5 ("i2c: Switch .probe() to not take an id
parameter") .probe() is the recommended callback to implement (again).
Reflect this in the documentation and don't mention .probe_new() any
more.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this patch was part of a patch dropping .probe_new() before (see
https://lore.kernel.org/linux-i2c/20230626094548.559542-1-u.kleine-koenig@pengutronix.de).

However this change makes already sense without dropping .probe_new, so
here it comes as a separate patch.

The above mentioned patch already got Reviewed-by's from Javier and
Jean. I didn't apply these here.

Best regards
Uwe

 Documentation/i2c/writing-clients.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/i2c/writing-clients.rst b/Documentation/i2c/writing-clients.rst
index b7d3ae7458f8..c17afa3e218f 100644
--- a/Documentation/i2c/writing-clients.rst
+++ b/Documentation/i2c/writing-clients.rst
@@ -46,7 +46,7 @@ driver model device node, and its I2C address.
 	},
 
 	.id_table	= foo_idtable,
-	.probe_new	= foo_probe,
+	.probe	        = foo_probe,
 	.remove		= foo_remove,
 	/* if device autodetection is needed: */
 	.class		= I2C_CLASS_SOMETHING,
-- 
2.39.2

