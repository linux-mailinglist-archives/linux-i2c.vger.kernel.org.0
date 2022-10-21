Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4E1607148
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 09:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiJUHjw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 03:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiJUHjt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 03:39:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9602CDC1
        for <linux-i2c@vger.kernel.org>; Fri, 21 Oct 2022 00:39:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd7-0006N3-3x; Fri, 21 Oct 2022 09:39:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd3-000TRd-W3; Fri, 21 Oct 2022 09:39:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd5-009WBM-AE; Fri, 21 Oct 2022 09:39:43 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v1 5/5] i2c: mux: pca954x: Convert to .probe_new()
Date:   Fri, 21 Oct 2022 09:39:35 +0200
Message-Id: <20221021073935.165158-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021073935.165158-1-u.kleine-koenig@pengutronix.de>
References: <20221021073935.165158-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=2/S+o0Sl0yZNxkzwr+3h++9nLDPxw+SF5fq4qF584BM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUkyumYpd5mbAelPGRz0uYBXR38uXgMktTAWaxDx1 +3c7MROJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1JMrgAKCRDB/BR4rcrsCbzoB/ 97v36v2lfUHg9jaCLIvWBmDmDM5bM6WBeGWY+fPIV9Wq3qxNPcdRAp4aMJ1OkWgqf5v0zUOu2gl8yr b00YDtGA9ea35stAClT5mvnrUapURL9M5ASCXPX85nckaIzhlc8m0dwW3o1toqLMNV6teV4Ar9ArzT /oP47LaPTZtPTzM+OrDFYoirb2wwduJ1r56H9U8lLZ7kd6XdwZkgJQw4PgR7uGyZH3R9DdEWGHidIo 8P8OT1D3Jz5Kvds0XUnUWmZfGyjIo5jM0BvhuIPVllFCmaW3U8+JvZPdF5dn9uurcZ75KMs0WVao1W d4ICOMcUaaDnHjrpKOVWpt3NNT9s5S
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

.probe_new() doesn't get the i2c_device_id * parameter, so determine
that explicitly in .probe().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index a5f458b635df..7345032633ee 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -411,9 +411,9 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
 /*
  * I2C init/probing/exit functions
  */
-static int pca954x_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int pca954x_probe(struct i2c_client *client)
 {
+	const struct i2c_device_id *id = i2c_match_id(pca954x_id, client);
 	struct i2c_adapter *adap = client->adapter;
 	struct device *dev = &client->dev;
 	struct gpio_desc *gpio;
@@ -554,7 +554,7 @@ static struct i2c_driver pca954x_driver = {
 		.pm	= &pca954x_pm,
 		.of_match_table = pca954x_of_match,
 	},
-	.probe		= pca954x_probe,
+	.probe_new	= pca954x_probe,
 	.remove		= pca954x_remove,
 	.id_table	= pca954x_id,
 };
-- 
2.37.2

