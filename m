Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A86D497A62
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 09:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242168AbiAXIbq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 03:31:46 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]:53186 "EHLO
        codeconstruct.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbiAXIbp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jan 2022 03:31:45 -0500
Received: by codeconstruct.com.au (Postfix, from userid 10001)
        id 689142036E; Mon, 24 Jan 2022 16:31:39 +0800 (AWST)
From:   Matt Johnston <matt@codeconstruct.com.au>
Cc:     linux-i2c@vger.kernel.org, Daniel Stodden <dns@arista.com>,
        Jean Delvare <jdelvare@suse.de>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>
Subject: [PATCH v2 4/4] i2c: npcm7xx: Allow 255 byte block SMBus transfers
Date:   Mon, 24 Jan 2022 16:31:31 +0800
Message-Id: <20220124083131.417420-5-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124083131.417420-1-matt@codeconstruct.com.au>
References: <20220124083131.417420-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

255 byte support has been tested on a npcm750 board

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2ad166355ec9..01a1e96be4ba 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1399,7 +1399,7 @@ static void npcm_i2c_irq_master_handler_read(struct npcm_i2c *bus)
 		if (bus->read_block_use) {
 			/* first byte in block protocol is the size: */
 			data = npcm_i2c_rd_byte(bus);
-			data = clamp_val(data, 1, I2C_SMBUS_BLOCK_MAX);
+			data = clamp_val(data, 1, I2C_SMBUS3_BLOCK_MAX);
 			bus->rd_size = data + block_extra_bytes_size;
 			bus->rd_buf[bus->rd_ind++] = data;
 
@@ -2187,6 +2187,7 @@ static u32 npcm_i2c_functionality(struct i2c_adapter *adap)
 	       I2C_FUNC_SMBUS_EMUL |
 	       I2C_FUNC_SMBUS_BLOCK_DATA |
 	       I2C_FUNC_SMBUS_PEC |
+	       I2C_FUNC_SMBUS3_BLOCKSIZE |
 	       I2C_FUNC_SLAVE;
 }
 
-- 
2.32.0

