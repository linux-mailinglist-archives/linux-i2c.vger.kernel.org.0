Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 697E17B0F2
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jul 2019 19:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387518AbfG3R4M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jul 2019 13:56:12 -0400
Received: from sauhun.de ([88.99.104.3]:55986 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727029AbfG3R4L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Jul 2019 13:56:11 -0400
Received: from localhost (p54B33338.dip0.t-ipconnect.de [84.179.51.56])
        by pokefinder.org (Postfix) with ESMTPSA id EC5422E408C;
        Tue, 30 Jul 2019 19:56:09 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] media: ir-kbd-i2c: convert to i2c_new_dummy_device()
Date:   Tue, 30 Jul 2019 19:55:54 +0200
Message-Id: <20190730175555.14098-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190730175555.14098-1-wsa+renesas@sang-engineering.com>
References: <20190730175555.14098-1-wsa+renesas@sang-engineering.com>
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

Change since v1:

* reworded commit message because there was no NULL ptr access

 drivers/media/i2c/ir-kbd-i2c.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2c.c
index 876d7587a1da..f46717052efc 100644
--- a/drivers/media/i2c/ir-kbd-i2c.c
+++ b/drivers/media/i2c/ir-kbd-i2c.c
@@ -885,9 +885,12 @@ static int ir_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	INIT_DELAYED_WORK(&ir->work, ir_work);
 
 	if (probe_tx) {
-		ir->tx_c = i2c_new_dummy(client->adapter, 0x70);
-		if (!ir->tx_c) {
+		ir->tx_c = devm_i2c_new_dummy_device(&client->dev,
+						     client->adapter, 0x70);
+		if (IS_ERR(ir->tx_c)) {
 			dev_err(&client->dev, "failed to setup tx i2c address");
+			err = PTR_ERR(ir->tx_c);
+			goto err_out_free;
 		} else if (!zilog_init(ir)) {
 			ir->carrier = 38000;
 			ir->duty_cycle = 40;
@@ -904,9 +907,6 @@ static int ir_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	return 0;
 
  err_out_free:
-	if (ir->tx_c)
-		i2c_unregister_device(ir->tx_c);
-
 	/* Only frees rc if it were allocated internally */
 	rc_free_device(rc);
 	return err;
@@ -919,9 +919,6 @@ static int ir_remove(struct i2c_client *client)
 	/* kill outstanding polls */
 	cancel_delayed_work_sync(&ir->work);
 
-	if (ir->tx_c)
-		i2c_unregister_device(ir->tx_c);
-
 	/* unregister device */
 	rc_unregister_device(ir->rc);
 
-- 
2.20.1

