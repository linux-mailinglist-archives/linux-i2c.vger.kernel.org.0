Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEAA773F4C8
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jun 2023 08:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjF0Grw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jun 2023 02:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjF0GrG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jun 2023 02:47:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 214442949
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jun 2023 23:45:30 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qE2S4-0006C7-Vt; Tue, 27 Jun 2023 08:45:25 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qE2S3-00ANmp-TW; Tue, 27 Jun 2023 08:45:23 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qE2S3-000AVy-Bi; Tue, 27 Jun 2023 08:45:23 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     kernel@pengutronix.de,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
Subject: [PATCH v2] i2c: Update documentation to use .probe() again
Date:   Tue, 27 Jun 2023 08:45:22 +0200
Message-Id: <20230627064522.593332-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=hYxfEqG8jwrStt6OKg0QCctr4JyYTxZCkST3tMKMm9A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkmoWB9YWNiMfxAOd6GQjROMiOqbjZ44omdsi5u qtTQFrQ6TGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZJqFgQAKCRCPgPtYfRL+ Tl0ECACkYqb7rCmyFZBssJvvUjadtbRGUxJOhnRR16/ZoTpLonlFgWRrZxgE+1DLE3+OtX+O/dF ixAqo+drz6oI2uTf8wP6dwnBsDJLsqoUcFfaxYiOZwcGr/rU2adYyVgu+tHE+N0natOHLhGdMHV bzIJ+aE9cpiuUvotjikMh5goWG0wuwzq0C+S+Dfgc71e5/z4SWrIgPAY7+AFYLox7Dv01XiDExv T5vFeAwO9CXe+f8mk3YnvSfHE8XBkbYJ68aJPwa3wY0ZGRjzMN11KoYqFLEGgNT4B0XjU5SnbVj 0LvAwDtcIc6XcYArhxbB61T9ZDzDMOMOzLRkdhGlkEJv3teP
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

changes since (implicit) v1 sent a moment ago:

 - Fix whitespace. My editor seems to be configured to expand tabs to
   spaces in rst files, but that's inconsitent with the tab style used
   in that file.

Best regards
Uwe

 Documentation/i2c/writing-clients.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

base-commit: 6995e2de6891c724bfeb2db33d7b87775f913ad1
-- 
2.39.2

