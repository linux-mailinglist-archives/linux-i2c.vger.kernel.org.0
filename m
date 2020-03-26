Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A62F9194A0B
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 22:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgCZVKI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 17:10:08 -0400
Received: from sauhun.de ([88.99.104.3]:54466 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727913AbgCZVKH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 17:10:07 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id 7C74C2C1F87;
        Thu, 26 Mar 2020 22:10:06 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] drm/gma500: convert to use i2c_new_client_device()
Date:   Thu, 26 Mar 2020 22:10:00 +0100
Message-Id: <20200326211005.13301-3-wsa+renesas@sang-engineering.com>
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
 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c b/drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c
index 9e8224456ea2..71574063c63e 100644
--- a/drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c
+++ b/drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c
@@ -747,11 +747,11 @@ static int cmi_lcd_hack_create_device(void)
 		return -EINVAL;
 	}
 
-	client = i2c_new_device(adapter, &info);
-	if (!client) {
-		pr_err("%s: i2c_new_device() failed\n", __func__);
+	client = i2c_new_client_device(adapter, &info);
+	if (IS_ERR(client)) {
+		pr_err("%s: creating I2C device failed\n", __func__);
 		i2c_put_adapter(adapter);
-		return -EINVAL;
+		return PTR_ERR(client);
 	}
 
 	return 0;
-- 
2.20.1

