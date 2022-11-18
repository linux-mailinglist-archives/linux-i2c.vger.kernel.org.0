Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 312A263007B
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 23:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbiKRWrG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 17:47:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232030AbiKRWqh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 17:46:37 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2113FA317C
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 14:46:31 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA7m-0007fQ-7F; Fri, 18 Nov 2022 23:46:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA7j-0058A9-6h; Fri, 18 Nov 2022 23:46:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA7h-00Hawb-65; Fri, 18 Nov 2022 23:46:13 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Martin Donnelly <martin.donnelly@ge.com>,
        Martyn Welch <martyn.welch@collabora.co.uk>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 026/606] drm/bridge: megachips: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:36:00 +0100
Message-Id: <20221118224540.619276-27-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 97359f807bfc..4ee4a825a936 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -336,8 +336,7 @@ static int ge_b850v3_register(void)
 			"ge-b850v3-lvds-dp", ge_b850v3_lvds_ptr);
 }
 
-static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
-				       const struct i2c_device_id *id)
+static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c)
 {
 	struct device *dev = &stdp4028_i2c->dev;
 	int ret;
@@ -376,7 +375,7 @@ MODULE_DEVICE_TABLE(of, stdp4028_ge_b850v3_fw_match);
 
 static struct i2c_driver stdp4028_ge_b850v3_fw_driver = {
 	.id_table	= stdp4028_ge_b850v3_fw_i2c_table,
-	.probe		= stdp4028_ge_b850v3_fw_probe,
+	.probe_new	= stdp4028_ge_b850v3_fw_probe,
 	.remove		= stdp4028_ge_b850v3_fw_remove,
 	.driver		= {
 		.name		= "stdp4028-ge-b850v3-fw",
@@ -384,8 +383,7 @@ static struct i2c_driver stdp4028_ge_b850v3_fw_driver = {
 	},
 };
 
-static int stdp2690_ge_b850v3_fw_probe(struct i2c_client *stdp2690_i2c,
-				       const struct i2c_device_id *id)
+static int stdp2690_ge_b850v3_fw_probe(struct i2c_client *stdp2690_i2c)
 {
 	struct device *dev = &stdp2690_i2c->dev;
 	int ret;
@@ -424,7 +422,7 @@ MODULE_DEVICE_TABLE(of, stdp2690_ge_b850v3_fw_match);
 
 static struct i2c_driver stdp2690_ge_b850v3_fw_driver = {
 	.id_table	= stdp2690_ge_b850v3_fw_i2c_table,
-	.probe		= stdp2690_ge_b850v3_fw_probe,
+	.probe_new	= stdp2690_ge_b850v3_fw_probe,
 	.remove		= stdp2690_ge_b850v3_fw_remove,
 	.driver		= {
 		.name		= "stdp2690-ge-b850v3-fw",
-- 
2.38.1

