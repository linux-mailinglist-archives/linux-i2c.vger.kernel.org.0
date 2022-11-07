Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4E9161F492
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 14:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbiKGNnb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 08:43:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbiKGNna (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 08:43:30 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2185F2DC1
        for <linux-i2c@vger.kernel.org>; Mon,  7 Nov 2022 05:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667828609; x=1699364609;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lHsAZR8qKpie3D1eatfDdkHBqOKt2DVFz1pUeQ5Ty1M=;
  b=lTIZccGhQZHF3EoxQ6fqZBizrVixWY/Tzna+te5CcuV6iMaaRnDNbunV
   F4Prv3Tq2mhkg6dFvQtm6RycfRLBB/gUpv2vNOhNdGnxbiHJgD0t1a/a9
   XkZjwvCne3AQ+PxXLHObz3aX5PdPy4/ZaiqRm31eiSZQB1D/TWt4NMH2W
   aDM3z9uxCxV21cGaZjN2e7UVUhz7/RqRneWR1IoQ1ttw807gQ0wArlkW2
   uLLTZP+EGKrdHViyplHevHLiyASAAcm412SIVkI9NnBW11VTLPwB6TWrZ
   UB3va7VAYWM6aRlviPjcEqKUSouwGEeyaagfy2OPB1lPcSvhCVHSagFma
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372531159"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="372531159"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 05:43:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="586971973"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="586971973"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 05:43:26 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 11/12] i2c: designware: Align defines in i2c-designware-core.h
Date:   Mon,  7 Nov 2022 15:42:47 +0200
Message-Id: <20221107134248.864890-12-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221107134248.864890-1-jarkko.nikula@linux.intel.com>
References: <20221107134248.864890-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,UPPERCASE_50_75 autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Align all defines to the same column.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: Remove accidental "struct i2c_bus_recovery_info rinfo" align that
was done even wrongly.
---
 drivers/i2c/busses/i2c-designware-core.h | 230 +++++++++++------------
 1 file changed, 115 insertions(+), 115 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 49e5860b1665..0668888d557d 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -18,12 +18,12 @@
 #include <linux/regmap.h>
 #include <linux/types.h>
 
-#define DW_IC_DEFAULT_FUNCTIONALITY (I2C_FUNC_I2C |			\
-					I2C_FUNC_SMBUS_BYTE |		\
-					I2C_FUNC_SMBUS_BYTE_DATA |	\
-					I2C_FUNC_SMBUS_WORD_DATA |	\
-					I2C_FUNC_SMBUS_BLOCK_DATA |	\
-					I2C_FUNC_SMBUS_I2C_BLOCK)
+#define DW_IC_DEFAULT_FUNCTIONALITY		(I2C_FUNC_I2C | \
+						 I2C_FUNC_SMBUS_BYTE | \
+						 I2C_FUNC_SMBUS_BYTE_DATA | \
+						 I2C_FUNC_SMBUS_WORD_DATA | \
+						 I2C_FUNC_SMBUS_BLOCK_DATA | \
+						 I2C_FUNC_SMBUS_I2C_BLOCK)
 
 #define DW_IC_CON_MASTER			BIT(0)
 #define DW_IC_CON_SPEED_STD			(1 << 1)
@@ -43,81 +43,81 @@
 /*
  * Registers offset
  */
-#define DW_IC_CON		0x00
-#define DW_IC_TAR		0x04
-#define DW_IC_SAR		0x08
-#define DW_IC_DATA_CMD		0x10
-#define DW_IC_SS_SCL_HCNT	0x14
-#define DW_IC_SS_SCL_LCNT	0x18
-#define DW_IC_FS_SCL_HCNT	0x1c
-#define DW_IC_FS_SCL_LCNT	0x20
-#define DW_IC_HS_SCL_HCNT	0x24
-#define DW_IC_HS_SCL_LCNT	0x28
-#define DW_IC_INTR_STAT		0x2c
-#define DW_IC_INTR_MASK		0x30
-#define DW_IC_RAW_INTR_STAT	0x34
-#define DW_IC_RX_TL		0x38
-#define DW_IC_TX_TL		0x3c
-#define DW_IC_CLR_INTR		0x40
-#define DW_IC_CLR_RX_UNDER	0x44
-#define DW_IC_CLR_RX_OVER	0x48
-#define DW_IC_CLR_TX_OVER	0x4c
-#define DW_IC_CLR_RD_REQ	0x50
-#define DW_IC_CLR_TX_ABRT	0x54
-#define DW_IC_CLR_RX_DONE	0x58
-#define DW_IC_CLR_ACTIVITY	0x5c
-#define DW_IC_CLR_STOP_DET	0x60
-#define DW_IC_CLR_START_DET	0x64
-#define DW_IC_CLR_GEN_CALL	0x68
-#define DW_IC_ENABLE		0x6c
-#define DW_IC_STATUS		0x70
-#define DW_IC_TXFLR		0x74
-#define DW_IC_RXFLR		0x78
-#define DW_IC_SDA_HOLD		0x7c
-#define DW_IC_TX_ABRT_SOURCE	0x80
-#define DW_IC_ENABLE_STATUS	0x9c
-#define DW_IC_CLR_RESTART_DET	0xa8
-#define DW_IC_COMP_PARAM_1	0xf4
-#define DW_IC_COMP_VERSION	0xf8
-#define DW_IC_SDA_HOLD_MIN_VERS	0x3131312A
-#define DW_IC_COMP_TYPE		0xfc
-#define DW_IC_COMP_TYPE_VALUE	0x44570140
-
-#define DW_IC_INTR_RX_UNDER	BIT(0)
-#define DW_IC_INTR_RX_OVER	BIT(1)
-#define DW_IC_INTR_RX_FULL	BIT(2)
-#define DW_IC_INTR_TX_OVER	BIT(3)
-#define DW_IC_INTR_TX_EMPTY	BIT(4)
-#define DW_IC_INTR_RD_REQ	BIT(5)
-#define DW_IC_INTR_TX_ABRT	BIT(6)
-#define DW_IC_INTR_RX_DONE	BIT(7)
-#define DW_IC_INTR_ACTIVITY	BIT(8)
-#define DW_IC_INTR_STOP_DET	BIT(9)
-#define DW_IC_INTR_START_DET	BIT(10)
-#define DW_IC_INTR_GEN_CALL	BIT(11)
-#define DW_IC_INTR_RESTART_DET	BIT(12)
-
-#define DW_IC_INTR_DEFAULT_MASK		(DW_IC_INTR_RX_FULL | \
-					 DW_IC_INTR_TX_ABRT | \
-					 DW_IC_INTR_STOP_DET)
-#define DW_IC_INTR_MASTER_MASK		(DW_IC_INTR_DEFAULT_MASK | \
-					 DW_IC_INTR_TX_EMPTY)
-#define DW_IC_INTR_SLAVE_MASK		(DW_IC_INTR_DEFAULT_MASK | \
-					 DW_IC_INTR_RX_UNDER | \
-					 DW_IC_INTR_RD_REQ)
-
-#define DW_IC_STATUS_ACTIVITY		BIT(0)
-#define DW_IC_STATUS_TFE		BIT(2)
-#define DW_IC_STATUS_RFNE		BIT(3)
-#define DW_IC_STATUS_MASTER_ACTIVITY	BIT(5)
-#define DW_IC_STATUS_SLAVE_ACTIVITY	BIT(6)
-
-#define DW_IC_SDA_HOLD_RX_SHIFT		16
-#define DW_IC_SDA_HOLD_RX_MASK		GENMASK(23, 16)
-
-#define DW_IC_ERR_TX_ABRT	0x1
-
-#define DW_IC_TAR_10BITADDR_MASTER	BIT(12)
+#define DW_IC_CON				0x00
+#define DW_IC_TAR				0x04
+#define DW_IC_SAR				0x08
+#define DW_IC_DATA_CMD				0x10
+#define DW_IC_SS_SCL_HCNT			0x14
+#define DW_IC_SS_SCL_LCNT			0x18
+#define DW_IC_FS_SCL_HCNT			0x1c
+#define DW_IC_FS_SCL_LCNT			0x20
+#define DW_IC_HS_SCL_HCNT			0x24
+#define DW_IC_HS_SCL_LCNT			0x28
+#define DW_IC_INTR_STAT				0x2c
+#define DW_IC_INTR_MASK				0x30
+#define DW_IC_RAW_INTR_STAT			0x34
+#define DW_IC_RX_TL				0x38
+#define DW_IC_TX_TL				0x3c
+#define DW_IC_CLR_INTR				0x40
+#define DW_IC_CLR_RX_UNDER			0x44
+#define DW_IC_CLR_RX_OVER			0x48
+#define DW_IC_CLR_TX_OVER			0x4c
+#define DW_IC_CLR_RD_REQ			0x50
+#define DW_IC_CLR_TX_ABRT			0x54
+#define DW_IC_CLR_RX_DONE			0x58
+#define DW_IC_CLR_ACTIVITY			0x5c
+#define DW_IC_CLR_STOP_DET			0x60
+#define DW_IC_CLR_START_DET			0x64
+#define DW_IC_CLR_GEN_CALL			0x68
+#define DW_IC_ENABLE				0x6c
+#define DW_IC_STATUS				0x70
+#define DW_IC_TXFLR				0x74
+#define DW_IC_RXFLR				0x78
+#define DW_IC_SDA_HOLD				0x7c
+#define DW_IC_TX_ABRT_SOURCE			0x80
+#define DW_IC_ENABLE_STATUS			0x9c
+#define DW_IC_CLR_RESTART_DET			0xa8
+#define DW_IC_COMP_PARAM_1			0xf4
+#define DW_IC_COMP_VERSION			0xf8
+#define DW_IC_SDA_HOLD_MIN_VERS			0x3131312A
+#define DW_IC_COMP_TYPE				0xfc
+#define DW_IC_COMP_TYPE_VALUE			0x44570140
+
+#define DW_IC_INTR_RX_UNDER			BIT(0)
+#define DW_IC_INTR_RX_OVER			BIT(1)
+#define DW_IC_INTR_RX_FULL			BIT(2)
+#define DW_IC_INTR_TX_OVER			BIT(3)
+#define DW_IC_INTR_TX_EMPTY			BIT(4)
+#define DW_IC_INTR_RD_REQ			BIT(5)
+#define DW_IC_INTR_TX_ABRT			BIT(6)
+#define DW_IC_INTR_RX_DONE			BIT(7)
+#define DW_IC_INTR_ACTIVITY			BIT(8)
+#define DW_IC_INTR_STOP_DET			BIT(9)
+#define DW_IC_INTR_START_DET			BIT(10)
+#define DW_IC_INTR_GEN_CALL			BIT(11)
+#define DW_IC_INTR_RESTART_DET			BIT(12)
+
+#define DW_IC_INTR_DEFAULT_MASK			(DW_IC_INTR_RX_FULL | \
+						 DW_IC_INTR_TX_ABRT | \
+						 DW_IC_INTR_STOP_DET)
+#define DW_IC_INTR_MASTER_MASK			(DW_IC_INTR_DEFAULT_MASK | \
+						 DW_IC_INTR_TX_EMPTY)
+#define DW_IC_INTR_SLAVE_MASK			(DW_IC_INTR_DEFAULT_MASK | \
+						 DW_IC_INTR_RX_UNDER | \
+						 DW_IC_INTR_RD_REQ)
+
+#define DW_IC_STATUS_ACTIVITY			BIT(0)
+#define DW_IC_STATUS_TFE			BIT(2)
+#define DW_IC_STATUS_RFNE			BIT(3)
+#define DW_IC_STATUS_MASTER_ACTIVITY		BIT(5)
+#define DW_IC_STATUS_SLAVE_ACTIVITY		BIT(6)
+
+#define DW_IC_SDA_HOLD_RX_SHIFT			16
+#define DW_IC_SDA_HOLD_RX_MASK			GENMASK(23, 16)
+
+#define DW_IC_ERR_TX_ABRT			0x1
+
+#define DW_IC_TAR_10BITADDR_MASTER		BIT(12)
 
 #define DW_IC_COMP_PARAM_1_SPEED_MODE_HIGH	(BIT(2) | BIT(3))
 #define DW_IC_COMP_PARAM_1_SPEED_MODE_MASK	GENMASK(3, 2)
@@ -125,16 +125,16 @@
 /*
  * Sofware status flags
  */
-#define STATUS_ACTIVE			BIT(0)
-#define STATUS_WRITE_IN_PROGRESS	BIT(1)
-#define STATUS_READ_IN_PROGRESS		BIT(2)
-#define STATUS_MASK			GENMASK(2, 0)
+#define STATUS_ACTIVE				BIT(0)
+#define STATUS_WRITE_IN_PROGRESS		BIT(1)
+#define STATUS_READ_IN_PROGRESS			BIT(2)
+#define STATUS_MASK				GENMASK(2, 0)
 
 /*
  * operation modes
  */
-#define DW_IC_MASTER		0
-#define DW_IC_SLAVE		1
+#define DW_IC_MASTER				0
+#define DW_IC_SLAVE				1
 
 /*
  * Hardware abort codes from the DW_IC_TX_ABRT_SOURCE register
@@ -142,20 +142,20 @@
  * Only expected abort codes are listed here
  * refer to the datasheet for the full list
  */
-#define ABRT_7B_ADDR_NOACK	0
-#define ABRT_10ADDR1_NOACK	1
-#define ABRT_10ADDR2_NOACK	2
-#define ABRT_TXDATA_NOACK	3
-#define ABRT_GCALL_NOACK	4
-#define ABRT_GCALL_READ		5
-#define ABRT_SBYTE_ACKDET	7
-#define ABRT_SBYTE_NORSTRT	9
-#define ABRT_10B_RD_NORSTRT	10
-#define ABRT_MASTER_DIS		11
-#define ARB_LOST		12
-#define ABRT_SLAVE_FLUSH_TXFIFO	13
-#define ABRT_SLAVE_ARBLOST	14
-#define ABRT_SLAVE_RD_INTX	15
+#define ABRT_7B_ADDR_NOACK			0
+#define ABRT_10ADDR1_NOACK			1
+#define ABRT_10ADDR2_NOACK			2
+#define ABRT_TXDATA_NOACK			3
+#define ABRT_GCALL_NOACK			4
+#define ABRT_GCALL_READ				5
+#define ABRT_SBYTE_ACKDET			7
+#define ABRT_SBYTE_NORSTRT			9
+#define ABRT_10B_RD_NORSTRT			10
+#define ABRT_MASTER_DIS				11
+#define ARB_LOST				12
+#define ABRT_SLAVE_FLUSH_TXFIFO			13
+#define ABRT_SLAVE_ARBLOST			14
+#define ABRT_SLAVE_RD_INTX			15
 
 #define DW_IC_TX_ABRT_7B_ADDR_NOACK		BIT(ABRT_7B_ADDR_NOACK)
 #define DW_IC_TX_ABRT_10ADDR1_NOACK		BIT(ABRT_10ADDR1_NOACK)
@@ -172,11 +172,11 @@
 #define DW_IC_RX_ABRT_SLAVE_ARBLOST		BIT(ABRT_SLAVE_ARBLOST)
 #define DW_IC_RX_ABRT_SLAVE_FLUSH_TXFIFO	BIT(ABRT_SLAVE_FLUSH_TXFIFO)
 
-#define DW_IC_TX_ABRT_NOACK		(DW_IC_TX_ABRT_7B_ADDR_NOACK | \
-					 DW_IC_TX_ABRT_10ADDR1_NOACK | \
-					 DW_IC_TX_ABRT_10ADDR2_NOACK | \
-					 DW_IC_TX_ABRT_TXDATA_NOACK | \
-					 DW_IC_TX_ABRT_GCALL_NOACK)
+#define DW_IC_TX_ABRT_NOACK			(DW_IC_TX_ABRT_7B_ADDR_NOACK | \
+						 DW_IC_TX_ABRT_10ADDR1_NOACK | \
+						 DW_IC_TX_ABRT_10ADDR2_NOACK | \
+						 DW_IC_TX_ABRT_TXDATA_NOACK | \
+						 DW_IC_TX_ABRT_GCALL_NOACK)
 
 struct clk;
 struct device;
@@ -295,21 +295,21 @@ struct dw_i2c_dev {
 	struct i2c_bus_recovery_info rinfo;
 };
 
-#define ACCESS_INTR_MASK	BIT(0)
-#define ACCESS_NO_IRQ_SUSPEND	BIT(1)
-#define ARBITRATION_SEMAPHORE	BIT(2)
+#define ACCESS_INTR_MASK			BIT(0)
+#define ACCESS_NO_IRQ_SUSPEND			BIT(1)
+#define ARBITRATION_SEMAPHORE			BIT(2)
 
-#define MODEL_MSCC_OCELOT	BIT(8)
-#define MODEL_BAIKAL_BT1	BIT(9)
-#define MODEL_AMD_NAVI_GPU	BIT(10)
-#define MODEL_MASK		GENMASK(11, 8)
+#define MODEL_MSCC_OCELOT			BIT(8)
+#define MODEL_BAIKAL_BT1			BIT(9)
+#define MODEL_AMD_NAVI_GPU			BIT(10)
+#define MODEL_MASK				GENMASK(11, 8)
 
 /*
  * Enable UCSI interrupt by writing 0xd at register
  * offset 0x474 specified in hardware specification.
  */
-#define AMD_UCSI_INTR_REG	0x474
-#define AMD_UCSI_INTR_EN	0xd
+#define AMD_UCSI_INTR_REG			0x474
+#define AMD_UCSI_INTR_EN			0xd
 
 struct i2c_dw_semaphore_callbacks {
 	int	(*probe)(struct dw_i2c_dev *dev);
-- 
2.35.1

