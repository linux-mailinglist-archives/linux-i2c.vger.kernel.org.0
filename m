Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39904511523
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Apr 2022 12:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbiD0KuX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Apr 2022 06:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbiD0KuV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Apr 2022 06:50:21 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D5A3D7040
        for <linux-i2c@vger.kernel.org>; Wed, 27 Apr 2022 03:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651054876; x=1682590876;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KzlCG6Pj+HOWnIkvaHQ6dSVV1UWpwXf5ZQyKMWidT7Q=;
  b=B2leo88QzEYWegQpdAzglAO7cfQA8gOr2+4/5UuY/EqsZBzETkkzHp5z
   8cLhX+clF0+KDvm7YfQo0cfaApFd07r/+wjirST0/zCFL228nGrtjDnlL
   utDs8r2o0NTGyCSj3EGkGAys7+e/isvqoJAhTS6o9k6OOin8IDO9eboLM
   +cbf8A9LP27lPG2Uo8RELxstG4f0i346y61HQjgp7XeOUZ6iLf0YKeTvL
   EGhKb/sRNTmlwzizFcQesxhn0WzxdyYraP9Xbswe5X6HRAJ2Gn+KqVu+G
   RUw5N6v5MsOllCD4XIT86SobCg0GnXl6G+PejmUBPi2SOvXmZGQkWlV4P
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="263474120"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="263474120"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 03:19:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="596215766"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 27 Apr 2022 03:19:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id A672414F; Wed, 27 Apr 2022 13:19:10 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: ismt: Provide a DMA buffer for Interrupt Cause Logging
Date:   Wed, 27 Apr 2022 13:19:10 +0300
Message-Id: <20220427101910.47438-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Before sending a MSI the hardware writes information pertinent to the
interrupt cause to a memory location pointed by SMTICL register. This
memory holds three double words where the least significant bit tells
whether the interrupt cause of master/target/error is valid. The driver
does not use this but we need to set it up because otherwise it will
perform DMA write to the default address (0) and this will cause an
IOMMU fault such as below:

  DMAR: DRHD: handling fault status reg 2
  DMAR: [DMA Write] Request device [00:12.0] PASID ffffffff fault addr 0
        [fault reason 05] PTE Write access is not set

To prevent this from happening, provide a proper DMA buffer for this
that then gets mapped by the IOMMU accordingly.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/i2c/busses/i2c-ismt.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
index c0364314877e..c16157ee8c52 100644
--- a/drivers/i2c/busses/i2c-ismt.c
+++ b/drivers/i2c/busses/i2c-ismt.c
@@ -82,6 +82,7 @@
 
 #define ISMT_DESC_ENTRIES	2	/* number of descriptor entries */
 #define ISMT_MAX_RETRIES	3	/* number of SMBus retries to attempt */
+#define ISMT_LOG_ENTRIES	3	/* number of interrupt cause log entries */
 
 /* Hardware Descriptor Constants - Control Field */
 #define ISMT_DESC_CWRL	0x01	/* Command/Write Length */
@@ -175,6 +176,8 @@ struct ismt_priv {
 	u8 head;				/* ring buffer head pointer */
 	struct completion cmp;			/* interrupt completion */
 	u8 buffer[I2C_SMBUS_BLOCK_MAX + 16];	/* temp R/W data buffer */
+	dma_addr_t log_dma;
+	u32 *log;
 };
 
 static const struct pci_device_id ismt_ids[] = {
@@ -411,6 +414,9 @@ static int ismt_access(struct i2c_adapter *adap, u16 addr,
 	memset(desc, 0, sizeof(struct ismt_desc));
 	desc->tgtaddr_rw = ISMT_DESC_ADDR_RW(addr, read_write);
 
+	/* Always clear the log entries */
+	memset(priv->log, 0, ISMT_LOG_ENTRIES * sizeof(u32));
+
 	/* Initialize common control bits */
 	if (likely(pci_dev_msi_enabled(priv->pci_dev)))
 		desc->control = ISMT_DESC_INT | ISMT_DESC_FAIR;
@@ -708,6 +714,8 @@ static void ismt_hw_init(struct ismt_priv *priv)
 	/* initialize the Master Descriptor Base Address (MDBA) */
 	writeq(priv->io_rng_dma, priv->smba + ISMT_MSTR_MDBA);
 
+	writeq(priv->log_dma, priv->smba + ISMT_GR_SMTICL);
+
 	/* initialize the Master Control Register (MCTRL) */
 	writel(ISMT_MCTRL_MEIE, priv->smba + ISMT_MSTR_MCTRL);
 
@@ -795,6 +803,12 @@ static int ismt_dev_init(struct ismt_priv *priv)
 	priv->head = 0;
 	init_completion(&priv->cmp);
 
+	priv->log = dmam_alloc_coherent(&priv->pci_dev->dev,
+					ISMT_LOG_ENTRIES * sizeof(u32),
+					&priv->log_dma, GFP_KERNEL);
+	if (!priv->log)
+		return -ENOMEM;
+
 	return 0;
 }
 
-- 
2.35.1

