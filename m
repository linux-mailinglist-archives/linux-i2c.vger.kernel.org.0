Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 453684DB95
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 22:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbfFTUss (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 16:48:48 -0400
Received: from sauhun.de ([88.99.104.3]:45474 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbfFTUsr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jun 2019 16:48:47 -0400
Received: from localhost (p5486CFDE.dip0.t-ipconnect.de [84.134.207.222])
        by pokefinder.org (Postfix) with ESMTPSA id E04712C376D;
        Thu, 20 Jun 2019 22:48:45 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Wolfram Sang <wsa@the-dreams.de>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [RFC/RFT PATCH RESEND] i2c: replace i2c_new_secondary_device with an ERR_PTR variant
Date:   Thu, 20 Jun 2019 22:48:34 +0200
Message-Id: <20190620204834.1575-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In the general move to have i2c_new_*_device functions which return
ERR_PTR instead of NULL, this patch converts i2c_new_secondary_device().

There are only few users, so this patch converts the I2C core and all
users in one go. The function gets renamed to i2c_new_ancillary_device()
so out-of-tree users will get a build failure to understand they need to
adapt their error checking code.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Sorry for the resend. I missed to add quite some relevant ppl to cc.

This patch is RFC for now because:

* there is one FIXME blob which I can only remove after a missing
  header update which I will try to get into v5.2-rc6

* I wanted to check if media-maintainers agree to let me apply
  this via the I2C tree?

* maybe someone with ADV HW is willing to test this?

The patch is based on v5.2-rc5 and tested with a Renesas Lager board
(R-Car H2) and a tweaked DA9063 driver. I don't have any of these ADV
devices properly set up so the code is only build tested.

If this is acceptable, I likely will add a patch adding a devm_ variant
of this new function to the patch stack and convert the users, too.

I think this new i2c_new_ancillary_device() should replace
i2c_new_dummy() in quite some places later. But we will see...

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 18 +++++++++---------
 drivers/i2c/i2c-core-base.c                  | 10 +++++-----
 drivers/media/i2c/adv748x/adv748x-core.c     |  6 +++---
 drivers/media/i2c/adv7604.c                  | 12 ++++++++----
 include/linux/i2c.h                          |  2 +-
 5 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index f6d2681f6927..9e13e466e72c 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -981,10 +981,10 @@ static int adv7511_init_cec_regmap(struct adv7511 *adv)
 {
 	int ret;
 
-	adv->i2c_cec = i2c_new_secondary_device(adv->i2c_main, "cec",
+	adv->i2c_cec = i2c_new_ancillary_device(adv->i2c_main, "cec",
 						ADV7511_CEC_I2C_ADDR_DEFAULT);
-	if (!adv->i2c_cec)
-		return -EINVAL;
+	if (IS_ERR(adv->i2c_cec))
+		return PTR_ERR(adv->i2c_cec);
 	i2c_set_clientdata(adv->i2c_cec, adv);
 
 	adv->regmap_cec = devm_regmap_init_i2c(adv->i2c_cec,
@@ -1165,20 +1165,20 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 
 	adv7511_packet_disable(adv7511, 0xffff);
 
-	adv7511->i2c_edid = i2c_new_secondary_device(i2c, "edid",
+	adv7511->i2c_edid = i2c_new_ancillary_device(i2c, "edid",
 					ADV7511_EDID_I2C_ADDR_DEFAULT);
-	if (!adv7511->i2c_edid) {
-		ret = -EINVAL;
+	if (IS_ERR(adv7511->i2c_edid)) {
+		ret = PTR_ERR(adv7511->i2c_edid);
 		goto uninit_regulators;
 	}
 
 	regmap_write(adv7511->regmap, ADV7511_REG_EDID_I2C_ADDR,
 		     adv7511->i2c_edid->addr << 1);
 
-	adv7511->i2c_packet = i2c_new_secondary_device(i2c, "packet",
+	adv7511->i2c_packet = i2c_new_ancillary_device(i2c, "packet",
 					ADV7511_PACKET_I2C_ADDR_DEFAULT);
-	if (!adv7511->i2c_packet) {
-		ret = -EINVAL;
+	if (IS_ERR(adv7511->i2c_packet)) {
+		ret = PTR_ERR(adv7511->i2c_packet);
 		goto err_i2c_unregister_edid;
 	}
 
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index e77bab2fb467..8b7855f3a199 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -965,7 +965,7 @@ struct i2c_client *devm_i2c_new_dummy_device(struct device *dev,
 EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
 
 /**
- * i2c_new_secondary_device - Helper to get the instantiated secondary address
+ * i2c_new_ancillary_device - Helper to get the instantiated secondary address
  * and create the associated device
  * @client: Handle to the primary client
  * @name: Handle to specify which secondary address to get
@@ -984,9 +984,9 @@ EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
  * cell whose "reg-names" value matches the slave name.
  *
  * This returns the new i2c client, which should be saved for later use with
- * i2c_unregister_device(); or NULL to indicate an error.
+ * i2c_unregister_device(); or an ERR_PTR to describe the error.
  */
-struct i2c_client *i2c_new_secondary_device(struct i2c_client *client,
+struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
 						const char *name,
 						u16 default_addr)
 {
@@ -1001,9 +1001,9 @@ struct i2c_client *i2c_new_secondary_device(struct i2c_client *client,
 	}
 
 	dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, addr);
-	return i2c_new_dummy(client->adapter, addr);
+	return i2c_new_dummy_device(client->adapter, addr);
 }
-EXPORT_SYMBOL_GPL(i2c_new_secondary_device);
+EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);
 
 /* ------------------------------------------------------------------------- */
 
diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index f57cd77a32fa..2567de2b0037 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -183,14 +183,14 @@ static int adv748x_initialise_clients(struct adv748x_state *state)
 	int ret;
 
 	for (i = ADV748X_PAGE_DPLL; i < ADV748X_PAGE_MAX; ++i) {
-		state->i2c_clients[i] = i2c_new_secondary_device(
+		state->i2c_clients[i] = i2c_new_ancillary_device(
 				state->client,
 				adv748x_default_addresses[i].name,
 				adv748x_default_addresses[i].default_addr);
 
-		if (state->i2c_clients[i] == NULL) {
+		if (IS_ERR(state->i2c_clients[i])) {
 			adv_err(state, "failed to create i2c client %u\n", i);
-			return -ENOMEM;
+			return PTR_ERR(state->i2c_clients[i]);
 		}
 
 		ret = adv748x_configure_regmap(state, i);
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 28a84bf9f8a9..ad68f24a369f 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -2881,11 +2881,15 @@ static struct i2c_client *adv76xx_dummy_client(struct v4l2_subdev *sd,
 		new_client = i2c_new_dummy(client->adapter,
 					   pdata->i2c_addresses[page]);
 	else
-		new_client = i2c_new_secondary_device(client,
+		new_client = i2c_new_ancillary_device(client,
 				adv76xx_default_addresses[page].name,
 				adv76xx_default_addresses[page].default_addr);
 
-	if (new_client)
+	/* FIXME: can be removed once i2c_new_dummy_device hits upstream */
+	if (!new_client)
+		new_client = ERR_PTR(-ENOENT);
+
+	if (!IS_ERR(new_client))
 		io_write(sd, io_reg, new_client->addr << 1);
 
 	return new_client;
@@ -3520,8 +3524,8 @@ static int adv76xx_probe(struct i2c_client *client,
 			continue;
 
 		state->i2c_clients[i] = adv76xx_dummy_client(sd, i);
-		if (!state->i2c_clients[i]) {
-			err = -EINVAL;
+		if (IS_ERR(state->i2c_clients[i])) {
+			err = PTR_ERR(state->i2c_clients[i]);
 			v4l2_err(sd, "failed to create i2c client %u\n", i);
 			goto err_i2c;
 		}
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fa5552c2307b..ebbe024dd9e0 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -473,7 +473,7 @@ extern struct i2c_client *
 devm_i2c_new_dummy_device(struct device *dev, struct i2c_adapter *adap, u16 address);
 
 extern struct i2c_client *
-i2c_new_secondary_device(struct i2c_client *client,
+i2c_new_ancillary_device(struct i2c_client *client,
 				const char *name,
 				u16 default_addr);
 
-- 
2.20.1

