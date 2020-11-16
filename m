Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F002B496E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Nov 2020 16:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731224AbgKPPcu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Nov 2020 10:32:50 -0500
Received: from mga12.intel.com ([192.55.52.136]:35520 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730349AbgKPPct (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Nov 2020 10:32:49 -0500
IronPort-SDR: mT1gDAwEYewV54tcmXeID6evqOOHbLE4+IsiunhU1lxc7A06qrMHM5xy2CTl5kOmO2KySAnI7e
 XaGZpOKobbsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="150032168"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="150032168"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 07:32:49 -0800
IronPort-SDR: EIe2qb8t6ESM7+0iJOqtygxwJ2YVWpD9lw7omBJ+lY8Km1lBHqyEghh9X8l90pemXc0Ub38899
 y/iW4DKt2Jjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="367740176"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 16 Nov 2020 07:32:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 633F31F7; Mon, 16 Nov 2020 17:32:46 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Cc:     Mario Alejandro Posso Escobar <mario.posso.escobar@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] i2c: ismt: Adding support for I2C_SMBUS_BLOCK_PROC_CALL
Date:   Mon, 16 Nov 2020 17:32:45 +0200
Message-Id: <20201116153245.24083-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Mario Alejandro Posso Escobar <mario.posso.escobar@intel.com>

Expand the driver to support I2C_SMBUS_BLOCK_PROC_CALL since
HW supports it already.

Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mario Alejandro Posso Escobar <mario.posso.escobar@intel.com>
---
 drivers/i2c/busses/i2c-ismt.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
index a35a27c320e7..a6187cbec2c9 100644
--- a/drivers/i2c/busses/i2c-ismt.c
+++ b/drivers/i2c/busses/i2c-ismt.c
@@ -53,7 +53,7 @@
  *  Features supported by this driver:
  *  Hardware PEC                     yes
  *  Block buffer                     yes
- *  Block process call transaction   no
+ *  Block process call transaction   yes
  *  Slave mode                       no
  */
 
@@ -332,7 +332,8 @@ static int ismt_process_desc(const struct ismt_desc *desc,
 
 	if (desc->status & ISMT_DESC_SCS) {
 		if (read_write == I2C_SMBUS_WRITE &&
-		    size != I2C_SMBUS_PROC_CALL)
+		    size != I2C_SMBUS_PROC_CALL &&
+		    size != I2C_SMBUS_BLOCK_PROC_CALL)
 			return 0;
 
 		switch (size) {
@@ -345,6 +346,7 @@ static int ismt_process_desc(const struct ismt_desc *desc,
 			data->word = dma_buffer[0] | (dma_buffer[1] << 8);
 			break;
 		case I2C_SMBUS_BLOCK_DATA:
+		case I2C_SMBUS_BLOCK_PROC_CALL:
 			if (desc->rxbytes != dma_buffer[0] + 1)
 				return -EMSGSIZE;
 
@@ -518,6 +520,18 @@ static int ismt_access(struct i2c_adapter *adap, u16 addr,
 		}
 		break;
 
+	case I2C_SMBUS_BLOCK_PROC_CALL:
+		dev_dbg(dev, "I2C_SMBUS_BLOCK_PROC_CALL\n");
+		dma_size = I2C_SMBUS_BLOCK_MAX;
+		desc->tgtaddr_rw = ISMT_DESC_ADDR_RW(addr, 1);
+		desc->wr_len_cmd = data->block[0] + 1;
+		desc->rd_len = dma_size;
+		desc->control |= ISMT_DESC_BLK;
+		dma_direction = DMA_BIDIRECTIONAL;
+		dma_buffer[0] = command;
+		memcpy(&dma_buffer[1], &data->block[1], data->block[0]);
+		break;
+
 	case I2C_SMBUS_I2C_BLOCK_DATA:
 		/* Make sure the length is valid */
 		if (data->block[0] < 1)
@@ -624,6 +638,7 @@ static u32 ismt_func(struct i2c_adapter *adap)
 	       I2C_FUNC_SMBUS_BYTE_DATA		|
 	       I2C_FUNC_SMBUS_WORD_DATA		|
 	       I2C_FUNC_SMBUS_PROC_CALL		|
+	       I2C_FUNC_SMBUS_BLOCK_PROC_CALL	|
 	       I2C_FUNC_SMBUS_BLOCK_DATA	|
 	       I2C_FUNC_SMBUS_I2C_BLOCK		|
 	       I2C_FUNC_SMBUS_PEC;
-- 
2.28.0

