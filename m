Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E59FF1949FD
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 22:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbgCZVKJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 17:10:09 -0400
Received: from sauhun.de ([88.99.104.3]:54366 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727919AbgCZVKI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 17:10:08 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id 140B02C1F96;
        Thu, 26 Mar 2020 22:10:07 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] drm/i2c/sil164: convert to use i2c_new_client_device()
Date:   Thu, 26 Mar 2020 22:10:01 +0100
Message-Id: <20200326211005.13301-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
References: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move away from the deprecated API and return the shiny new ERRPTR where
useful.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpu/drm/i2c/sil164_drv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i2c/sil164_drv.c b/drivers/gpu/drm/i2c/sil164_drv.c
index a839f78a4c8a..741886b54419 100644
--- a/drivers/gpu/drm/i2c/sil164_drv.c
+++ b/drivers/gpu/drm/i2c/sil164_drv.c
@@ -393,7 +393,7 @@ sil164_detect_slave(struct i2c_client *client)
 		return NULL;
 	}
 
-	return i2c_new_device(adap, &info);
+	return i2c_new_client_device(adap, &info);
 }
 
 static int
@@ -402,6 +402,7 @@ sil164_encoder_init(struct i2c_client *client,
 		    struct drm_encoder_slave *encoder)
 {
 	struct sil164_priv *priv;
+	struct i2c_client *slave_client;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -410,7 +411,9 @@ sil164_encoder_init(struct i2c_client *client,
 	encoder->slave_priv = priv;
 	encoder->slave_funcs = &sil164_encoder_funcs;
 
-	priv->duallink_slave = sil164_detect_slave(client);
+	slave_client = sil164_detect_slave(client);
+	if (!IS_ERR(slave_client))
+		priv->duallink_slave = slave_client;
 
 	return 0;
 }
-- 
2.20.1

