Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE0170744
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfGVR3d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:29:33 -0400
Received: from sauhun.de ([88.99.104.3]:42128 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731317AbfGVR0I (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:08 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id B2BAD4A148F;
        Mon, 22 Jul 2019 19:26:07 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] media: i2c: adv7180: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:00 +0200
Message-Id: <20190722172604.3572-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722172604.3572-1-wsa+renesas@sang-engineering.com>
References: <20190722172604.3572-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
ERRPTR which we use in error handling.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Generated with coccinelle. Build tested by me and buildbot. Not tested on HW.

 drivers/media/i2c/adv7180.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 6f3dc8862622..e780969cc2f2 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1329,17 +1329,17 @@ static int adv7180_probe(struct i2c_client *client,
 	}
 
 	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
-		state->csi_client = i2c_new_dummy(client->adapter,
+		state->csi_client = i2c_new_dummy_device(client->adapter,
 				ADV7180_DEFAULT_CSI_I2C_ADDR);
-		if (!state->csi_client)
-			return -ENOMEM;
+		if (IS_ERR(state->csi_client))
+			return PTR_ERR(state->csi_client);
 	}
 
 	if (state->chip_info->flags & ADV7180_FLAG_I2P) {
-		state->vpp_client = i2c_new_dummy(client->adapter,
+		state->vpp_client = i2c_new_dummy_device(client->adapter,
 				ADV7180_DEFAULT_VPP_I2C_ADDR);
-		if (!state->vpp_client) {
-			ret = -ENOMEM;
+		if (IS_ERR(state->vpp_client)) {
+			ret = PTR_ERR(state->vpp_client);
 			goto err_unregister_csi_client;
 		}
 	}
-- 
2.20.1

