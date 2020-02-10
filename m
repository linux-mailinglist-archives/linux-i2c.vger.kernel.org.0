Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06239158044
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Feb 2020 17:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbgBJQ4Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Feb 2020 11:56:25 -0500
Received: from sauhun.de ([88.99.104.3]:43618 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727499AbgBJQ4Z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Feb 2020 11:56:25 -0500
Received: from localhost (p54B33161.dip0.t-ipconnect.de [84.179.49.97])
        by pokefinder.org (Postfix) with ESMTPSA id 524EE2C07F3;
        Mon, 10 Feb 2020 17:56:23 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH V2 RESEND] media: v4l2-core: convert to new API with ERRPTR
Date:   Mon, 10 Feb 2020 17:56:21 +0100
Message-Id: <20200210165621.5189-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the new APIs instead of the deprecated ones.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Resent from proper email address. Sorry for the confusion!

 drivers/media/v4l2-core/v4l2-i2c.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-i2c.c b/drivers/media/v4l2-core/v4l2-i2c.c
index 5bf99e7c0c09..b4acca75644b 100644
--- a/drivers/media/v4l2-core/v4l2-i2c.c
+++ b/drivers/media/v4l2-core/v4l2-i2c.c
@@ -74,10 +74,10 @@ struct v4l2_subdev
 
 	/* Create the i2c client */
 	if (info->addr == 0 && probe_addrs)
-		client = i2c_new_probed_device(adapter, info, probe_addrs,
-					       NULL);
+		client = i2c_new_scanned_device(adapter, info, probe_addrs,
+						NULL);
 	else
-		client = i2c_new_device(adapter, info);
+		client = i2c_new_client_device(adapter, info);
 
 	/*
 	 * Note: by loading the module first we are certain that c->driver
@@ -88,7 +88,7 @@ struct v4l2_subdev
 	 * want to use the i2c device, so explicitly loading the module
 	 * is the best alternative.
 	 */
-	if (!client || !client->dev.driver)
+	if (!i2c_client_has_driver(client))
 		goto error;
 
 	/* Lock the module so we can safely get the v4l2_subdev pointer */
@@ -110,7 +110,7 @@ struct v4l2_subdev
 	 * If we have a client but no subdev, then something went wrong and
 	 * we must unregister the client.
 	 */
-	if (client && !sd)
+	if (!IS_ERR(client) && !sd)
 		i2c_unregister_device(client);
 	return sd;
 }
-- 
2.20.1

