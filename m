Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364392F3601
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 17:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388261AbhALQm1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 11:42:27 -0500
Received: from www.zeus03.de ([194.117.254.33]:37366 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388063AbhALQmS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Jan 2021 11:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=COjMPOqL7pc0uU
        qyCZQPJcPRT2njX4Q7Fmh8pYBGCis=; b=rHNbVfps7GYEDFKCUfmJpwPhcP2KYa
        CyWNs7zo5IUlJPU6VZxnekx8BKAxCsb9/nBJIgugnnI3oF8XXk4fNXvqESLHZYyT
        kyMP6+wa4UUGgRHbE/rEkBG5saS/D4+vrSj7Kt5XMHvw7quOmiQrWiaFtG6b5/Jz
        Zg4gV8QmguKK8=
Received: (qmail 2812461 invoked from network); 12 Jan 2021 17:41:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jan 2021 17:41:36 +0100
X-UD-Smtp-Session: l3s3148p1@gPcmsra4StEgAwDPXwxzAHrEwO71dOp2
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 2/3] media: i2c: adv7842: remove open coded version of SMBus block read
Date:   Tue, 12 Jan 2021 17:41:28 +0100
Message-Id: <20210112164130.47895-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112164130.47895-1-wsa+renesas@sang-engineering.com>
References: <20210112164130.47895-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The open coded version differs from the one in the core in one way: the
buffer will be always copied back, even when the transfer failed. It
looks like it is expected that the sanity check for a correct CRC and
header will bail out later.

Use the block read from the I2C core and propagate a potential errno
further to the sanity check.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Note: we could now make the error checking even stronger by checking if
the number of received bytes is I2C_SMBUS_BLOCK_MAX. But to avoid
regressions, I kept the logic as is, i.e. only check for errno.

 drivers/media/i2c/adv7511-v4l2.c | 40 +++++++++++---------------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index a3161d709015..0150f76dc6a6 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -214,36 +214,24 @@ static inline void adv7511_wr_and_or(struct v4l2_subdev *sd, u8 reg, u8 clr_mask
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
+	s32 len;
 	int i;
-	int err = 0;
 
 	v4l2_dbg(1, debug, sd, "%s:\n", __func__);
 
-	for (i = 0; !err && i < len; i += I2C_SMBUS_BLOCK_MAX)
-		err = adv_smbus_read_i2c_block_data(state->i2c_edid, i,
+	for (i = 0; i < len; i += I2C_SMBUS_BLOCK_MAX) {
+		len = i2c_smbus_read_i2c_block_data(state->i2c_edid, i,
 						    I2C_SMBUS_BLOCK_MAX, buf + i);
-	if (err)
-		v4l2_err(sd, "%s: i2c read error\n", __func__);
+		if (len < 0) {
+			v4l2_err(sd, "%s: i2c read error\n", __func__);
+			return len;
+		}
+	}
+
+	return 0;
 }
 
 static inline int adv7511_cec_read(struct v4l2_subdev *sd, u8 reg)
@@ -1668,20 +1656,20 @@ static bool adv7511_check_edid_status(struct v4l2_subdev *sd)
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
+		err = adv7511_edid_rd(sd, 256, &state->edid.data[segment * 256]);
 		adv7511_dbg_dump_edid(2, debug, sd, segment, &state->edid.data[segment * 256]);
 		if (segment == 0) {
 			state->edid.blocks = state->edid.data[0x7e] + 1;
 			v4l2_dbg(1, debug, sd, "%s: %d blocks in total\n", __func__, state->edid.blocks);
 		}
-		if (!edid_verify_crc(sd, segment) ||
-		    !edid_verify_header(sd, segment)) {
+		if (err < 0 || !edid_verify_crc(sd, segment) || !edid_verify_header(sd, segment)) {
 			/* edid crc error, force reread of edid segment */
 			v4l2_err(sd, "%s: edid crc or header error\n", __func__);
 			state->have_monitor = false;
-- 
2.29.2

