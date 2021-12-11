Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F01D547115F
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Dec 2021 05:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345845AbhLKEU0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Dec 2021 23:20:26 -0500
Received: from mga14.intel.com ([192.55.52.115]:33265 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345829AbhLKEUZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 10 Dec 2021 23:20:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639196209; x=1670732209;
  h=from:to:cc:subject:date:message-id;
  bh=DUmrzvVoskRHGVGcIrie/Qwex1NV/ufikffceISj/8k=;
  b=VANUOdP620/X5Nfn+1VjkoFu4ob2WO509EeEj29Qn8P/VjQsX6AlX2L+
   TCwKHsklUhn19S/AL97ZaBlRUyJwa1UEwAZdntjzzgMKdat8qNsLS+Sjq
   zEgyvD6R0R7W1Ut4toQsJzz8tHfKl37gAmvouA4Wc8EVkPIRCfJjv8dXz
   yl35Gh0/GGW8fzIJhPF4ccuPeTW41U+OiebAYJAkZUQvYbOq+u6S3/b4F
   mV6aYO7z+bg7ll6KSfZbl56hnO8V5F5ciI1FSDvuT8PHlkGIzabHGwa0D
   +Q7VGeqvwyFXnfN9Lrxb+fv7uhXJ5KQdK1zg7SsUV5EAGTB3RKAazRNVL
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="238730556"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; 
   d="scan'208";a="238730556"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 20:16:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; 
   d="scan'208";a="613150652"
Received: from coresw01.iind.intel.com ([10.106.46.194])
  by orsmga004.jf.intel.com with ESMTP; 10 Dec 2021 20:16:44 -0800
From:   tamal.saha@intel.com
To:     wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        jarkko.nikula@linux.intel.com, linux-i2c@vger.kernel.org
Cc:     tamal.saha@intel.com, bala.senthil@intel.com
Subject: [PATCH v1] i2c: designware: Do not complete i2c read without RX_FULL interrupt
Date:   Sat, 11 Dec 2021 09:46:43 +0530
Message-Id: <20211211041643.21543-1-tamal.saha@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tamal Saha <tamal.saha@intel.com>

Intel Keem Bay platform supports multimaster operations over same i2c
bus using Synopsis i2c designware IP. When multi masters initiate i2c
operation simultaneously in a loop, SCL line is stucked low forever
after few i2c operations. Following interrupt sequences are observed
in:
  working case: TX_EMPTY, RX_FULL and STOP_DET
  non working case: TX_EMPTY, STOP_DET, RX_FULL.

DW_apb_i2c stretches the SCL line when the TX FIFO is empty or when
RX FIFO is full. The DW_apb_i2c master will continue to hold the SCL
line LOW until RX FIFO is read.

Linux kernel i2c designware software does not handle above non working
sequence. TX_EMPTY, RX_FULL and STOP_DET routine execution are required
in sequence although RX_FULL interrupt is raised after STOP_DET by
hardware. Clear STOP_DET for following conditions
  (STOP_DET ,RX_FULL, rx_outstanding)
    Write Operation: (1, 0, 0)
    Read Operation:
      RX_FULL followed by STOP_DET: (0, 1, 1) -> (1, 0, 0)
      STOP_DET followed by RX_FULL: (1, 0, 1) -> (1, 1, 0)
      RX_FULL and STOP_DET together: (1, 1, 1)

Signed-off-by: Tamal Saha <tamal.saha@intel.com>
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

