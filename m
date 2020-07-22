Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF35229958
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 15:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgGVNoA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 09:44:00 -0400
Received: from mga07.intel.com ([134.134.136.100]:56105 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726425AbgGVNn7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 09:43:59 -0400
IronPort-SDR: RwflVpw05nNiboD8eQOZSUT8XIxNBJwd5lFSNrkVUIZEApPs8jHSeKAU9iAQatxu1r7m8ilr4y
 CWEeBmmXZw3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="214963304"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; 
   d="scan'208";a="214963304"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2020 06:43:58 -0700
IronPort-SDR: yzz5A+Crm8oTSGoEgGvn7J9QFCvjcG9FMFvdvkp4Zct+O5iPBVO368djz65Mjr2RL+UmWHEqqS
 mCLSpzjDEN8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; 
   d="scan'208";a="328214904"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 22 Jul 2020 06:43:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5081817E; Wed, 22 Jul 2020 16:43:56 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] i2c: ismt: Describe parameters in kernel doc
Date:   Wed, 22 Jul 2020 16:43:55 +0300
Message-Id: <20200722134355.46098-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Kernel doc validation script complains:

  CHECK   .../drivers/i2c/busses/i2c-ismt.c
.../i2c-ismt.c:182: warning: cannot understand function prototype: 'const struct pci_device_id ismt_ids[] = '
.../i2c-ismt.c:202: warning: Function parameter or member 'dev' not described in '__ismt_desc_dump'
.../i2c-ismt.c:202: warning: Function parameter or member 'desc' not described in '__ismt_desc_dump'
.../i2c-ismt.c:649: warning: cannot understand function prototype: 'const struct i2c_algorithm smbus_algorithm = '

Fix corresponding descriptions to make reader and kernel doc validator happy.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-ismt.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
index 6ba91d4a4ce4..078e01799c83 100644
--- a/drivers/i2c/busses/i2c-ismt.c
+++ b/drivers/i2c/busses/i2c-ismt.c
@@ -176,9 +176,6 @@ struct ismt_priv {
 	u8 buffer[I2C_SMBUS_BLOCK_MAX + 16];	/* temp R/W data buffer */
 };
 
-/**
- * ismt_ids - PCI device IDs supported by this driver
- */
 static const struct pci_device_id ismt_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_S1200_SMT0) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_S1200_SMT1) },
@@ -197,6 +194,8 @@ MODULE_PARM_DESC(bus_speed, "Bus Speed in kHz (0 = BIOS default)");
 
 /**
  * __ismt_desc_dump() - dump the contents of a specific descriptor
+ * @dev: the iSMT device
+ * @desc: the iSMT hardware descriptor
  */
 static void __ismt_desc_dump(struct device *dev, const struct ismt_desc *desc)
 {
@@ -642,11 +641,6 @@ static u32 ismt_func(struct i2c_adapter *adap)
 	       I2C_FUNC_SMBUS_PEC;
 }
 
-/**
- * smbus_algorithm - the adapter algorithm and supported functionality
- * @smbus_xfer: the adapter algorithm
- * @functionality: functionality supported by the adapter
- */
 static const struct i2c_algorithm smbus_algorithm = {
 	.smbus_xfer	= ismt_access,
 	.functionality	= ismt_func,
-- 
2.27.0

