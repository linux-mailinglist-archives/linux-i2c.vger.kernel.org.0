Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56252475B83
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 16:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243802AbhLOPMM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 10:12:12 -0500
Received: from mga18.intel.com ([134.134.136.126]:62944 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243787AbhLOPMK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Dec 2021 10:12:10 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="226104855"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="226104855"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 07:12:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="518801165"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.88])
  by orsmga008.jf.intel.com with ESMTP; 15 Dec 2021 07:12:08 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Tamal Saha <tamal.saha@intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 1/6] i2c: designware: Do not complete i2c read without RX_FULL interrupt
Date:   Wed, 15 Dec 2021 17:12:00 +0200
Message-Id: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tamal Saha <tamal.saha@intel.com>

Intel Keem Bay platform supports multi-master operations over same i2c
bus using Synopsys i2c DesignWare IP. When multi-masters initiate i2c
operation simultaneously in a loop, SCL line is stucked low forever
after few i2c operations. Following interrupt sequences are observed
in:
  working case: TX_EMPTY, RX_FULL and STOP_DET
  non working case: TX_EMPTY, STOP_DET, RX_FULL.

DW_apb_i2c stretches the SCL line when the TX FIFO is empty or when
RX FIFO is full. The DW_apb_i2c master will continue to hold the SCL
line LOW until RX FIFO is read.

Linux kernel i2c DesignWare driver does not handle above non working
sequence. TX_EMPTY, RX_FULL and STOP_DET routine execution are required
in sequence although RX_FULL interrupt is raised after STOP_DET by
hardware. Clear STOP_DET for the following conditions:
  (STOP_DET ,RX_FULL, rx_outstanding)
    Write Operation: (1, 0, 0)
    Read Operation:
      RX_FULL followed by STOP_DET: (0, 1, 1) -> (1, 0, 0)
      STOP_DET followed by RX_FULL: (1, 0, 1) -> (1, 1, 0)
      RX_FULL and STOP_DET together: (1, 1, 1)

Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 9b08bb5df38d..9177463c2cbb 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -701,7 +701,8 @@ static u32 i2c_dw_read_clear_intrbits(struct dw_i2c_dev *dev)
 		regmap_read(dev->map, DW_IC_CLR_RX_DONE, &dummy);
 	if (stat & DW_IC_INTR_ACTIVITY)
 		regmap_read(dev->map, DW_IC_CLR_ACTIVITY, &dummy);
-	if (stat & DW_IC_INTR_STOP_DET)
+	if ((stat & DW_IC_INTR_STOP_DET) &&
+	    ((dev->rx_outstanding == 0) || (stat & DW_IC_INTR_RX_FULL)))
 		regmap_read(dev->map, DW_IC_CLR_STOP_DET, &dummy);
 	if (stat & DW_IC_INTR_START_DET)
 		regmap_read(dev->map, DW_IC_CLR_START_DET, &dummy);
@@ -723,6 +724,7 @@ static int i2c_dw_irq_handler_master(struct dw_i2c_dev *dev)
 	if (stat & DW_IC_INTR_TX_ABRT) {
 		dev->cmd_err |= DW_IC_ERR_TX_ABRT;
 		dev->status = STATUS_IDLE;
+		dev->rx_outstanding = 0;
 
 		/*
 		 * Anytime TX_ABRT is set, the contents of the tx/rx
@@ -745,7 +747,8 @@ static int i2c_dw_irq_handler_master(struct dw_i2c_dev *dev)
 	 */
 
 tx_aborted:
-	if ((stat & (DW_IC_INTR_TX_ABRT | DW_IC_INTR_STOP_DET)) || dev->msg_err)
+	if (((stat & (DW_IC_INTR_TX_ABRT | DW_IC_INTR_STOP_DET)) || dev->msg_err) &&
+	     (dev->rx_outstanding == 0))
 		complete(&dev->cmd_complete);
 	else if (unlikely(dev->flags & ACCESS_INTR_MASK)) {
 		/* Workaround to trigger pending interrupt */
-- 
2.34.1

