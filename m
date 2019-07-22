Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E12BD7073E
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbfGVR3d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:29:33 -0400
Received: from sauhun.de ([88.99.104.3]:42124 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731310AbfGVR0I (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:08 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id 2948B4A1494;
        Mon, 22 Jul 2019 19:26:07 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] media: i2c: ad9389b: convert to i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:25:59 +0200
Message-Id: <20190722172604.3572-6-wsa+renesas@sang-engineering.com>
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

 drivers/media/i2c/ad9389b.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ad9389b.c b/drivers/media/i2c/ad9389b.c
index aa8b04cfed0f..1b92048a4a67 100644
--- a/drivers/media/i2c/ad9389b.c
+++ b/drivers/media/i2c/ad9389b.c
@@ -1148,10 +1148,10 @@ static int ad9389b_probe(struct i2c_client *client, const struct i2c_device_id *
 	v4l2_dbg(1, debug, sd, "reg 0x41 0x%x, chip version (reg 0x00) 0x%x\n",
 		 ad9389b_rd(sd, 0x41), state->chip_revision);
 
-	state->edid_i2c_client = i2c_new_dummy(client->adapter, (0x7e>>1));
-	if (state->edid_i2c_client == NULL) {
+	state->edid_i2c_client = i2c_new_dummy_device(client->adapter, (0x7e >> 1));
+	if (IS_ERR(state->edid_i2c_client)) {
 		v4l2_err(sd, "failed to register edid i2c client\n");
-		err = -ENOMEM;
+		err = PTR_ERR(state->edid_i2c_client);
 		goto err_entity;
 	}
 
-- 
2.20.1

