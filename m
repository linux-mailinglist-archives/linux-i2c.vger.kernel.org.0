Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E76C886641
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 17:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730768AbfHHPxl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Aug 2019 11:53:41 -0400
Received: from sauhun.de ([88.99.104.3]:56596 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728380AbfHHPxl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Aug 2019 11:53:41 -0400
Received: from localhost (p5486CA1C.dip0.t-ipconnect.de [84.134.202.28])
        by pokefinder.org (Postfix) with ESMTPSA id 212A92C3112;
        Thu,  8 Aug 2019 17:53:39 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3] media: ir-kbd-i2c: convert to i2c_new_dummy_device()
Date:   Thu,  8 Aug 2019 17:53:28 +0200
Message-Id: <20190808155328.5376-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert this driver to use the new i2c_new_dummy_device() call and bail
out if the dummy device cannot be registered to make failure more
visible to the user.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v2: move away from devm per Mauro's suggestion

Note: i2c_unregister_device() is NULL pointer aware so we can skip the
if in the last block.

 drivers/media/i2c/ir-kbd-i2c.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2c.c
index 96932779ca37..e8119ad0bc71 100644
--- a/drivers/media/i2c/ir-kbd-i2c.c
+++ b/drivers/media/i2c/ir-kbd-i2c.c
@@ -885,9 +885,11 @@ static int ir_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	INIT_DELAYED_WORK(&ir->work, ir_work);
 
 	if (probe_tx) {
-		ir->tx_c = i2c_new_dummy(client->adapter, 0x70);
-		if (!ir->tx_c) {
+		ir->tx_c = i2c_new_dummy_device(client->adapter, 0x70);
+		if (IS_ERR(ir->tx_c)) {
 			dev_err(&client->dev, "failed to setup tx i2c address");
+			err = PTR_ERR(ir->tx_c);
+			goto err_out_free;
 		} else if (!zilog_init(ir)) {
 			ir->carrier = 38000;
 			ir->duty_cycle = 40;
@@ -904,7 +906,7 @@ static int ir_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	return 0;
 
  err_out_free:
-	if (ir->tx_c)
+	if (!IS_ERR(ir->tx_c))
 		i2c_unregister_device(ir->tx_c);
 
 	/* Only frees rc if it were allocated internally */
@@ -918,8 +920,7 @@ static int ir_remove(struct i2c_client *client)
 
 	cancel_delayed_work_sync(&ir->work);
 
-	if (ir->tx_c)
-		i2c_unregister_device(ir->tx_c);
+	i2c_unregister_device(ir->tx_c);
 
 	rc_unregister_device(ir->rc);
 
-- 
2.20.1

