Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B54E1F8304
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jun 2020 12:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgFMKsq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Jun 2020 06:48:46 -0400
Received: from unicorn.mansr.com ([81.2.72.234]:54318 "EHLO unicorn.mansr.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbgFMKsp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 13 Jun 2020 06:48:45 -0400
X-Greylist: delayed 416 seconds by postgrey-1.27 at vger.kernel.org; Sat, 13 Jun 2020 06:48:45 EDT
Received: by unicorn.mansr.com (Postfix, from userid 51770)
        id D4C3D15360; Sat, 13 Jun 2020 11:41:46 +0100 (BST)
From:   Mans Rullgard <mans@mansr.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: core: check returned size of emulated smbus block read
Date:   Sat, 13 Jun 2020 11:41:09 +0100
Message-Id: <20200613104109.2989-1-mans@mansr.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If the i2c bus driver ignores the I2C_M_RECV_LEN flag (as some of
them do), it is possible for an I2C_SMBUS_BLOCK_DATA read issued
on some random device to return an arbitrary value in the first
byte (and nothing else).  When this happens, i2c_smbus_xfer_emulated()
will happily write past the end of the supplied data buffer, thus
causing Bad Things to happen.  To prevent this, check the size
before copying the data block and return an error if it is too large.

Fixes: 209d27c3b167 ("i2c: Emulate SMBus block read over I2C")
Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 drivers/i2c/i2c-core-smbus.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index 3ac426a8ab5a..a719c26b98ac 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -495,6 +495,13 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 			break;
 		case I2C_SMBUS_BLOCK_DATA:
 		case I2C_SMBUS_BLOCK_PROC_CALL:
+			if (msg[1].buf[0] > I2C_SMBUS_BLOCK_MAX) {
+				dev_err(&adapter->dev,
+					"Invalid block size returned: %d\n",
+					msg[1].buf[0]);
+				status = -EINVAL;
+				goto cleanup;
+			}
 			for (i = 0; i < msg[1].buf[0] + 1; i++)
 				data->block[i] = msg[1].buf[i];
 			break;
-- 
2.27.0

