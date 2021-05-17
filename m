Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13039382305
	for <lists+linux-i2c@lfdr.de>; Mon, 17 May 2021 05:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbhEQDVb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 16 May 2021 23:21:31 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]:41424 "EHLO
        codeconstruct.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231744AbhEQDVJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 16 May 2021 23:21:09 -0400
X-Greylist: delayed 483 seconds by postgrey-1.27 at vger.kernel.org; Sun, 16 May 2021 23:21:08 EDT
Received: by codeconstruct.com.au (Postfix, from userid 10001)
        id 86A9021997; Mon, 17 May 2021 11:11:48 +0800 (AWST)
From:   Matt Johnston <matt@codeconstruct.com.au>
To:     linux-i2c@vger.kernel.org
Cc:     Jeremy Kerr <jk@codeconstruct.com.au>
Subject: [PATCH] i2c: core: export i2c_smbus_pec()
Date:   Mon, 17 May 2021 11:11:38 +0800
Message-Id: <20210517031138.133934-1-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I2C slave interface drivers have to calculate the PEC themselves
in the i2c slave event handler. This will be used for an in-progress
driver for MCTP I2C transport.

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
---
 drivers/i2c/i2c-core-smbus.c | 3 ++-
 include/linux/i2c.h          | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index d2d32c0fd8c3..27a06b80decb 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -38,7 +38,7 @@ static u8 crc8(u16 data)
 }
 
 /* Incremental CRC8 over count bytes in the array pointed to by p */
-static u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count)
+u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count)
 {
 	int i;
 
@@ -46,6 +46,7 @@ static u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count)
 		crc = crc8((crc ^ p[i]) << 8);
 	return crc;
 }
+EXPORT_SYMBOL_GPL(i2c_smbus_pec);
 
 /* Assume a 7-bit address, which is reasonable for SMBus */
 static u8 i2c_smbus_msg_pec(u8 pec, struct i2c_msg *msg)
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index e8f2ac8c9c3d..9e5e5e8192c3 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -186,6 +186,8 @@ s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
 					      u8 *values);
 int i2c_get_device_id(const struct i2c_client *client,
 		      struct i2c_device_identity *id);
+
+u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count);
 #endif /* I2C */
 
 /**
-- 
2.30.2

