Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE4B70735
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730740AbfGVR0M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:26:12 -0400
Received: from sauhun.de ([88.99.104.3]:42138 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731319AbfGVR0K (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:10 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id 468A84A1490;
        Mon, 22 Jul 2019 19:26:08 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] media: i2c: adv7511-v4l2: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:01 +0200
Message-Id: <20190722172604.3572-8-wsa+renesas@sang-engineering.com>
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

 drivers/media/i2c/adv7511-v4l2.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 2ad6bdf1a9fc..7db94267bcab 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -1872,11 +1872,11 @@ static int adv7511_probe(struct i2c_client *client, const struct i2c_device_id *
 		goto err_entity;
 	}
 
-	state->i2c_edid = i2c_new_dummy(client->adapter,
+	state->i2c_edid = i2c_new_dummy_device(client->adapter,
 					state->i2c_edid_addr >> 1);
-	if (state->i2c_edid == NULL) {
+	if (IS_ERR(state->i2c_edid)) {
 		v4l2_err(sd, "failed to register edid i2c client\n");
-		err = -ENOMEM;
+		err = PTR_ERR(state->i2c_edid);
 		goto err_entity;
 	}
 
@@ -1889,11 +1889,11 @@ static int adv7511_probe(struct i2c_client *client, const struct i2c_device_id *
 	}
 
 	if (state->pdata.cec_clk) {
-		state->i2c_cec = i2c_new_dummy(client->adapter,
+		state->i2c_cec = i2c_new_dummy_device(client->adapter,
 					       state->i2c_cec_addr >> 1);
-		if (state->i2c_cec == NULL) {
+		if (IS_ERR(state->i2c_cec)) {
 			v4l2_err(sd, "failed to register cec i2c client\n");
-			err = -ENOMEM;
+			err = PTR_ERR(state->i2c_cec);
 			goto err_unreg_edid;
 		}
 		adv7511_wr(sd, 0xe2, 0x00); /* power up cec section */
@@ -1901,10 +1901,10 @@ static int adv7511_probe(struct i2c_client *client, const struct i2c_device_id *
 		adv7511_wr(sd, 0xe2, 0x01); /* power down cec section */
 	}
 
-	state->i2c_pktmem = i2c_new_dummy(client->adapter, state->i2c_pktmem_addr >> 1);
-	if (state->i2c_pktmem == NULL) {
+	state->i2c_pktmem = i2c_new_dummy_device(client->adapter, state->i2c_pktmem_addr >> 1);
+	if (IS_ERR(state->i2c_pktmem)) {
 		v4l2_err(sd, "failed to register pktmem i2c client\n");
-		err = -ENOMEM;
+		err = PTR_ERR(state->i2c_pktmem);
 		goto err_unreg_cec;
 	}
 
-- 
2.20.1

