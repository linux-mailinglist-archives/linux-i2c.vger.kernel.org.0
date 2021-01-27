Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDC5305894
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Jan 2021 11:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbhA0Kgr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Jan 2021 05:36:47 -0500
Received: from www.zeus03.de ([194.117.254.33]:35950 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236008AbhA0Keo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 Jan 2021 05:34:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=IkCc9/Qqu1UTg57a2wVwA7B7o72
        ErswRZruyvfrpbnk=; b=mlwktjANA/vlN0zNSJT1ftpZncHkCd3WhBrND346uyQ
        kOG/GHofJdbOJRsG1uL2nKifKMEFPVe4K5CHMdYdNZ41R5ohrUroief2cAYn4cEV
        Sf7WjmHWx5dXruE4362y57+cnck8FdmslrnnpWQK1iIF3EEV0aTdkT1gi2PlUeQA
        =
Received: (qmail 4025000 invoked from network); 27 Jan 2021 11:34:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jan 2021 11:34:00 +0100
X-UD-Smtp-Session: l3s3148p1@stomT9+5br0gAwDPXyX1AEdA8SGgn5QT
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] media: i2c: adv7511: remove open coded version of SMBus block read
Date:   Wed, 27 Jan 2021 11:33:57 +0100
Message-Id: <20210127103357.5045-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The open coded version differs from the one in the core in one way: the
buffer will be always copied back, even when the transfer failed. Be
more robust: use the block read from the I2C core and propagate a
potential errno further to the sanity checks.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* respect 'err' in more code paths
* updated comment

 drivers/media/i2c/adv7511-v4l2.c | 58 ++++++++++++++------------------
 1 file changed, 26 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index a3161d709015..9183003ae22d 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -214,36 +214,25 @@ static inline void adv7511_wr_and_or(struct v4l2_subdev *sd, u8 reg, u8 clr_mask
 	adv7511_wr(sd, reg, (adv7511_rd(sd, reg) & clr_mask) | val_mask);
 }
 
-static int adv_smbus_read_i2c_block_data(struct i2c_client *client,
-					 u8 command, unsigned length, u8 *values)
-{
-	union i2c_smbus_data data;
-	int ret;
-
-	if (length > I2C_SMBUS_BLOCK_MAX)
-		length = I2C_SMBUS_BLOCK_MAX;
-	data.block[0] = length;
-
-	ret = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-			     I2C_SMBUS_READ, command,
-			     I2C_SMBUS_I2C_BLOCK_DATA, &data);
-	memcpy(values, data.block + 1, length);
-	return ret;
-}
-
-static void adv7511_edid_rd(struct v4l2_subdev *sd, uint16_t len, uint8_t *buf)
+static int adv7511_edid_rd(struct v4l2_subdev *sd, uint16_t len, uint8_t *buf)
 {
 	struct adv7511_state *state = get_adv7511_state(sd);
 	int i;
-	int err = 0;
 
 	v4l2_dbg(1, debug, sd, "%s:\n", __func__);
 
-	for (i = 0; !err && i < len; i += I2C_SMBUS_BLOCK_MAX)
-		err = adv_smbus_read_i2c_block_data(state->i2c_edid, i,
+	for (i = 0; i < len; i += I2C_SMBUS_BLOCK_MAX) {
+		s32 ret;
+
+		ret = i2c_smbus_read_i2c_block_data(state->i2c_edid, i,
 						    I2C_SMBUS_BLOCK_MAX, buf + i);
-	if (err)
-		v4l2_err(sd, "%s: i2c read error\n", __func__);
+		if (ret < 0) {
+			v4l2_err(sd, "%s: i2c read error\n", __func__);
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 static inline int adv7511_cec_read(struct v4l2_subdev *sd, u8 reg)
@@ -1668,22 +1657,27 @@ static bool adv7511_check_edid_status(struct v4l2_subdev *sd)
 	if (edidRdy & MASK_ADV7511_EDID_RDY) {
 		int segment = adv7511_rd(sd, 0xc4);
 		struct adv7511_edid_detect ed;
+		int err;
 
 		if (segment >= EDID_MAX_SEGM) {
 			v4l2_err(sd, "edid segment number too big\n");
 			return false;
 		}
 		v4l2_dbg(1, debug, sd, "%s: got segment %d\n", __func__, segment);
-		adv7511_edid_rd(sd, 256, &state->edid.data[segment * 256]);
-		adv7511_dbg_dump_edid(2, debug, sd, segment, &state->edid.data[segment * 256]);
-		if (segment == 0) {
-			state->edid.blocks = state->edid.data[0x7e] + 1;
-			v4l2_dbg(1, debug, sd, "%s: %d blocks in total\n", __func__, state->edid.blocks);
+		err = adv7511_edid_rd(sd, 256, &state->edid.data[segment * 256]);
+		if (!err) {
+			adv7511_dbg_dump_edid(2, debug, sd, segment, &state->edid.data[segment * 256]);
+			if (segment == 0) {
+				state->edid.blocks = state->edid.data[0x7e] + 1;
+				v4l2_dbg(1, debug, sd, "%s: %d blocks in total\n",
+					 __func__, state->edid.blocks);
+			}
 		}
-		if (!edid_verify_crc(sd, segment) ||
-		    !edid_verify_header(sd, segment)) {
-			/* edid crc error, force reread of edid segment */
-			v4l2_err(sd, "%s: edid crc or header error\n", __func__);
+
+		if (err || !edid_verify_crc(sd, segment) || !edid_verify_header(sd, segment)) {
+			/* Couldn't read EDID or EDID is invalid. Force retry! */
+			if (!err)
+				v4l2_err(sd, "%s: edid crc or header error\n", __func__);
 			state->have_monitor = false;
 			adv7511_s_power(sd, false);
 			adv7511_s_power(sd, true);
-- 
2.28.0

