Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272C12D2C9E
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 15:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729441AbgLHOGs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Dec 2020 09:06:48 -0500
Received: from mga12.intel.com ([192.55.52.136]:54828 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729358AbgLHOGs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Dec 2020 09:06:48 -0500
IronPort-SDR: p1zfKyGH7HnAwxjxtTv4DGjTwjNTgRwuLoqUGGS9MGIU9dkRoV/hiXC43TxDZiFibHepXhxCcJ
 iY3OHqSfi0nQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="153129047"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="153129047"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 06:03:40 -0800
IronPort-SDR: dhuEUn2pWLfNM4598PXtLzQJ/8ylBEp/wQ4qQW5Eb8OECXp91/Lr/EIHAMyCtjS6gAOhWRK058
 Kb05lYHFIzwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="367733164"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 08 Dec 2020 06:03:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3E49B1CB; Tue,  8 Dec 2020 16:03:37 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] i2c: designware: Switch header to use BIT() and GENMASK()
Date:   Tue,  8 Dec 2020 16:03:35 +0200
Message-Id: <20201208140337.33236-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Currently header file uses partially BIT() and GENMASK() macros.
Switch it to use those macros in all cases where it's applicable
for the sake of consistency.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h | 92 ++++++++++++------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index eb5ef4d0f463..c129074be63c 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -25,18 +25,18 @@
 					I2C_FUNC_SMBUS_BLOCK_DATA |	\
 					I2C_FUNC_SMBUS_I2C_BLOCK)
 
-#define DW_IC_CON_MASTER		0x1
-#define DW_IC_CON_SPEED_STD		0x2
-#define DW_IC_CON_SPEED_FAST		0x4
-#define DW_IC_CON_SPEED_HIGH		0x6
-#define DW_IC_CON_SPEED_MASK		0x6
-#define DW_IC_CON_10BITADDR_SLAVE		0x8
-#define DW_IC_CON_10BITADDR_MASTER	0x10
-#define DW_IC_CON_RESTART_EN		0x20
-#define DW_IC_CON_SLAVE_DISABLE		0x40
-#define DW_IC_CON_STOP_DET_IFADDRESSED		0x80
-#define DW_IC_CON_TX_EMPTY_CTRL		0x100
-#define DW_IC_CON_RX_FIFO_FULL_HLD_CTRL		0x200
+#define DW_IC_CON_MASTER			BIT(0)
+#define DW_IC_CON_SPEED_STD			(1 << 1)
+#define DW_IC_CON_SPEED_FAST			(2 << 1)
+#define DW_IC_CON_SPEED_HIGH			(3 << 1)
+#define DW_IC_CON_SPEED_MASK			GENMASK(2, 1)
+#define DW_IC_CON_10BITADDR_SLAVE		BIT(3)
+#define DW_IC_CON_10BITADDR_MASTER		BIT(4)
+#define DW_IC_CON_RESTART_EN			BIT(5)
+#define DW_IC_CON_SLAVE_DISABLE			BIT(6)
+#define DW_IC_CON_STOP_DET_IFADDRESSED		BIT(7)
+#define DW_IC_CON_TX_EMPTY_CTRL			BIT(8)
+#define DW_IC_CON_RX_FIFO_FULL_HLD_CTRL		BIT(9)
 
 /*
  * Registers offset
@@ -81,19 +81,19 @@
 #define DW_IC_COMP_TYPE		0xfc
 #define DW_IC_COMP_TYPE_VALUE	0x44570140
 
-#define DW_IC_INTR_RX_UNDER	0x001
-#define DW_IC_INTR_RX_OVER	0x002
-#define DW_IC_INTR_RX_FULL	0x004
-#define DW_IC_INTR_TX_OVER	0x008
-#define DW_IC_INTR_TX_EMPTY	0x010
-#define DW_IC_INTR_RD_REQ	0x020
-#define DW_IC_INTR_TX_ABRT	0x040
-#define DW_IC_INTR_RX_DONE	0x080
-#define DW_IC_INTR_ACTIVITY	0x100
-#define DW_IC_INTR_STOP_DET	0x200
-#define DW_IC_INTR_START_DET	0x400
-#define DW_IC_INTR_GEN_CALL	0x800
-#define DW_IC_INTR_RESTART_DET	0x1000
+#define DW_IC_INTR_RX_UNDER	BIT(0)
+#define DW_IC_INTR_RX_OVER	BIT(1)
+#define DW_IC_INTR_RX_FULL	BIT(2)
+#define DW_IC_INTR_TX_OVER	BIT(3)
+#define DW_IC_INTR_TX_EMPTY	BIT(4)
+#define DW_IC_INTR_RD_REQ	BIT(5)
+#define DW_IC_INTR_TX_ABRT	BIT(6)
+#define DW_IC_INTR_RX_DONE	BIT(7)
+#define DW_IC_INTR_ACTIVITY	BIT(8)
+#define DW_IC_INTR_STOP_DET	BIT(9)
+#define DW_IC_INTR_START_DET	BIT(10)
+#define DW_IC_INTR_GEN_CALL	BIT(11)
+#define DW_IC_INTR_RESTART_DET	BIT(12)
 
 #define DW_IC_INTR_DEFAULT_MASK		(DW_IC_INTR_RX_FULL | \
 					 DW_IC_INTR_TX_ABRT | \
@@ -105,13 +105,13 @@
 					 DW_IC_INTR_RX_UNDER | \
 					 DW_IC_INTR_RD_REQ)
 
-#define DW_IC_STATUS_ACTIVITY		0x1
+#define DW_IC_STATUS_ACTIVITY		BIT(0)
 #define DW_IC_STATUS_TFE		BIT(2)
 #define DW_IC_STATUS_MASTER_ACTIVITY	BIT(5)
 #define DW_IC_STATUS_SLAVE_ACTIVITY	BIT(6)
 
 #define DW_IC_SDA_HOLD_RX_SHIFT		16
-#define DW_IC_SDA_HOLD_RX_MASK		GENMASK(23, DW_IC_SDA_HOLD_RX_SHIFT)
+#define DW_IC_SDA_HOLD_RX_MASK		GENMASK(23, 16)
 
 #define DW_IC_ERR_TX_ABRT	0x1
 
@@ -154,20 +154,20 @@
 #define ABRT_SLAVE_ARBLOST	14
 #define ABRT_SLAVE_RD_INTX	15
 
-#define DW_IC_TX_ABRT_7B_ADDR_NOACK	(1UL << ABRT_7B_ADDR_NOACK)
-#define DW_IC_TX_ABRT_10ADDR1_NOACK	(1UL << ABRT_10ADDR1_NOACK)
-#define DW_IC_TX_ABRT_10ADDR2_NOACK	(1UL << ABRT_10ADDR2_NOACK)
-#define DW_IC_TX_ABRT_TXDATA_NOACK	(1UL << ABRT_TXDATA_NOACK)
-#define DW_IC_TX_ABRT_GCALL_NOACK	(1UL << ABRT_GCALL_NOACK)
-#define DW_IC_TX_ABRT_GCALL_READ	(1UL << ABRT_GCALL_READ)
-#define DW_IC_TX_ABRT_SBYTE_ACKDET	(1UL << ABRT_SBYTE_ACKDET)
-#define DW_IC_TX_ABRT_SBYTE_NORSTRT	(1UL << ABRT_SBYTE_NORSTRT)
-#define DW_IC_TX_ABRT_10B_RD_NORSTRT	(1UL << ABRT_10B_RD_NORSTRT)
-#define DW_IC_TX_ABRT_MASTER_DIS	(1UL << ABRT_MASTER_DIS)
-#define DW_IC_TX_ARB_LOST		(1UL << ARB_LOST)
-#define DW_IC_RX_ABRT_SLAVE_RD_INTX	(1UL << ABRT_SLAVE_RD_INTX)
-#define DW_IC_RX_ABRT_SLAVE_ARBLOST	(1UL << ABRT_SLAVE_ARBLOST)
-#define DW_IC_RX_ABRT_SLAVE_FLUSH_TXFIFO	(1UL << ABRT_SLAVE_FLUSH_TXFIFO)
+#define DW_IC_TX_ABRT_7B_ADDR_NOACK		BIT(ABRT_7B_ADDR_NOACK)
+#define DW_IC_TX_ABRT_10ADDR1_NOACK		BIT(ABRT_10ADDR1_NOACK)
+#define DW_IC_TX_ABRT_10ADDR2_NOACK		BIT(ABRT_10ADDR2_NOACK)
+#define DW_IC_TX_ABRT_TXDATA_NOACK		BIT(ABRT_TXDATA_NOACK)
+#define DW_IC_TX_ABRT_GCALL_NOACK		BIT(ABRT_GCALL_NOACK)
+#define DW_IC_TX_ABRT_GCALL_READ		BIT(ABRT_GCALL_READ)
+#define DW_IC_TX_ABRT_SBYTE_ACKDET		BIT(ABRT_SBYTE_ACKDET)
+#define DW_IC_TX_ABRT_SBYTE_NORSTRT		BIT(ABRT_SBYTE_NORSTRT)
+#define DW_IC_TX_ABRT_10B_RD_NORSTRT		BIT(ABRT_10B_RD_NORSTRT)
+#define DW_IC_TX_ABRT_MASTER_DIS		BIT(ABRT_MASTER_DIS)
+#define DW_IC_TX_ARB_LOST			BIT(ARB_LOST)
+#define DW_IC_RX_ABRT_SLAVE_RD_INTX		BIT(ABRT_SLAVE_RD_INTX)
+#define DW_IC_RX_ABRT_SLAVE_ARBLOST		BIT(ABRT_SLAVE_ARBLOST)
+#define DW_IC_RX_ABRT_SLAVE_FLUSH_TXFIFO	BIT(ABRT_SLAVE_FLUSH_TXFIFO)
 
 #define DW_IC_TX_ABRT_NOACK		(DW_IC_TX_ABRT_7B_ADDR_NOACK | \
 					 DW_IC_TX_ABRT_10ADDR1_NOACK | \
@@ -288,12 +288,12 @@ struct dw_i2c_dev {
 	bool			suspended;
 };
 
-#define ACCESS_INTR_MASK	0x00000001
-#define ACCESS_NO_IRQ_SUSPEND	0x00000002
+#define ACCESS_INTR_MASK	BIT(0)
+#define ACCESS_NO_IRQ_SUSPEND	BIT(1)
 
-#define MODEL_MSCC_OCELOT	0x00000100
-#define MODEL_BAIKAL_BT1	0x00000200
-#define MODEL_MASK		0x00000f00
+#define MODEL_MSCC_OCELOT	BIT(8)
+#define MODEL_BAIKAL_BT1	BIT(9)
+#define MODEL_MASK		GENMASK(11, 8)
 
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
-- 
2.29.2

