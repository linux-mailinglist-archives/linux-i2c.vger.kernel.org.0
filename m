Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 150022FC3BA
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 23:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387752AbhASOge (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 09:36:34 -0500
Received: from www.zeus03.de ([194.117.254.33]:55088 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387693AbhASJkZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Jan 2021 04:40:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=1V+YeFI2dhLbdh
        a8QK5vAA8wcMmioJd9L4yOtd0w7DM=; b=naTxYIkcHy5MTF5FF23ZZtZ2GNSaz7
        FU/dFDRK5W7nrpy9bqD73erJkovVPKFVm5YKxWSo9H/yd4W/D+l98CjQ49Gxv8j6
        YH8clt89jPe+vpkwgyuvD33ZVDERQ76plV4HrsqIGCMhOg2J4F4Cv3HEPOJy7Gc9
        amsu90IrAVsVk=
Received: (qmail 1003486 invoked from network); 19 Jan 2021 10:39:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Jan 2021 10:39:20 +0100
X-UD-Smtp-Session: l3s3148p1@pSHinD257tkgAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: i2c: adv7842: remove open coded version of SMBus block write
Date:   Tue, 19 Jan 2021 10:39:08 +0100
Message-Id: <20210119093912.1838-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119093912.1838-1-wsa+renesas@sang-engineering.com>
References: <20210119093912.1838-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The version here is identical to the one in the I2C core, so use the
latter version directly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since RFC:
* skip define, use i2c_smbus_write_i2c_block_data directly

 drivers/media/i2c/adv7842.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 0855f648416d..e0629d5ef17b 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -343,20 +343,6 @@ static void adv_smbus_write_byte_no_check(struct i2c_client *client,
 		       I2C_SMBUS_BYTE_DATA, &data);
 }
 
-static s32 adv_smbus_write_i2c_block_data(struct i2c_client *client,
-				  u8 command, unsigned length, const u8 *values)
-{
-	union i2c_smbus_data data;
-
-	if (length > I2C_SMBUS_BLOCK_MAX)
-		length = I2C_SMBUS_BLOCK_MAX;
-	data.block[0] = length;
-	memcpy(data.block + 1, values, length);
-	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-			      I2C_SMBUS_WRITE, command,
-			      I2C_SMBUS_I2C_BLOCK_DATA, &data);
-}
-
 /* ----------------------------------------------------------------------- */
 
 static inline int io_read(struct v4l2_subdev *sd, u8 reg)
@@ -741,7 +727,7 @@ static int edid_write_vga_segment(struct v4l2_subdev *sd)
 	rep_write_and_or(sd, 0x77, 0xef, 0x10);
 
 	for (i = 0; !err && i < 256; i += I2C_SMBUS_BLOCK_MAX)
-		err = adv_smbus_write_i2c_block_data(state->i2c_edid, i,
+		err = i2c_smbus_write_i2c_block_data(state->i2c_edid, i,
 					     I2C_SMBUS_BLOCK_MAX, val + i);
 	if (err)
 		return err;
@@ -807,7 +793,7 @@ static int edid_write_hdmi_segment(struct v4l2_subdev *sd, u8 port)
 	rep_write_and_or(sd, 0x77, 0xef, 0x00);
 
 	for (i = 0; !err && i < 256; i += I2C_SMBUS_BLOCK_MAX)
-		err = adv_smbus_write_i2c_block_data(state->i2c_edid, i,
+		err = i2c_smbus_write_i2c_block_data(state->i2c_edid, i,
 						     I2C_SMBUS_BLOCK_MAX, edid + i);
 	if (err)
 		return err;
@@ -1079,7 +1065,7 @@ static void configure_custom_video_timings(struct v4l2_subdev *sd,
 		/* Should only be set in auto-graphics mode [REF_02, p. 91-92] */
 		/* setup PLL_DIV_MAN_EN and PLL_DIV_RATIO */
 		/* IO-map reg. 0x16 and 0x17 should be written in sequence */
-		if (adv_smbus_write_i2c_block_data(client, 0x16, 2, pll)) {
+		if (i2c_smbus_write_i2c_block_data(client, 0x16, 2, pll)) {
 			v4l2_err(sd, "writing to reg 0x16 and 0x17 failed\n");
 			break;
 		}
@@ -1135,7 +1121,7 @@ static void adv7842_set_offset(struct v4l2_subdev *sd, bool auto_offset, u16 off
 	offset_buf[3] = offset_c & 0x0ff;
 
 	/* Registers must be written in this order with no i2c access in between */
-	if (adv_smbus_write_i2c_block_data(state->i2c_cp, 0x77, 4, offset_buf))
+	if (i2c_smbus_write_i2c_block_data(state->i2c_cp, 0x77, 4, offset_buf))
 		v4l2_err(sd, "%s: i2c error writing to CP reg 0x77, 0x78, 0x79, 0x7a\n", __func__);
 }
 
@@ -1164,7 +1150,7 @@ static void adv7842_set_gain(struct v4l2_subdev *sd, bool auto_gain, u16 gain_a,
 	gain_buf[3] = ((gain_c & 0x0ff));
 
 	/* Registers must be written in this order with no i2c access in between */
-	if (adv_smbus_write_i2c_block_data(state->i2c_cp, 0x73, 4, gain_buf))
+	if (i2c_smbus_write_i2c_block_data(state->i2c_cp, 0x73, 4, gain_buf))
 		v4l2_err(sd, "%s: i2c error writing to CP reg 0x73, 0x74, 0x75, 0x76\n", __func__);
 }
 
-- 
2.29.2

