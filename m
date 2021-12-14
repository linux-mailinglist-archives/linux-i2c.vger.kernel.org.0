Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 417764744D2
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Dec 2021 15:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbhLNOZP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Dec 2021 09:25:15 -0500
Received: from mga06.intel.com ([134.134.136.31]:62980 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232427AbhLNOZP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Dec 2021 09:25:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639491914; x=1671027914;
  h=from:to:cc:subject:date:message-id;
  bh=4aEF09A6v3rYd2GDsCyFmwJiPx8pK9gv/YEI8Dx0wog=;
  b=iEgbhoUMYn74gEqo13K4vL93qRd28oaawY/8YnDvPbkRXxOnZ9xJfOjz
   hCjRJxvugo2jFSNEWpb24FgVCEy0AOSLWydp6Edk0paZGl7ox0e56e8dh
   owgNLvRQfQX3XarivpDgcC4ayh79k/SyHkxXsMvm2HDjT4kRefg8N2pwE
   dEeczvI5IrBPGVeirSyvHzRuZAbPr+nRWhK4xP5ZPOvUGCRIeOhSdellb
   mAMFOiLXQN6boehJA5748Qq4GYX9HVlX/t2xIverCuCLnP+s+Kvyj1SZy
   lZ9ir19Q8zpuePFxEM7wxyDpVT9XhwhcL3YoeY97OHtv8wnjWJR/+eMDf
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="299764943"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="299764943"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 06:24:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="465108549"
Received: from coresw01.iind.intel.com ([10.106.46.194])
  by orsmga006.jf.intel.com with ESMTP; 14 Dec 2021 06:24:52 -0800
From:   tamal.saha@intel.com
To:     wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        jarkko.nikula@linux.intel.com, linux-i2c@vger.kernel.org
Cc:     tamal.saha@intel.com, bala.senthil@intel.com
Subject: [PATCH v3] i2c: designware: Do not complete i2c read without RX_FULL interrupt
Date:   Tue, 14 Dec 2021 19:54:51 +0530
Message-Id: <20211214142451.3638-1-tamal.saha@intel.com>
X-Mailer: git-send-email 2.17.1
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
---
Changes in v3:
 - "multi-master" is used in commit message
Changes in v2:
 - Commit message updated as suggested by Andy Shevchenko
  - Replaced Synopsis by Synopsys, designware by DesignWare, software by driver
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
2.17.1

