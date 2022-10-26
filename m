Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDF5A60E102
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 14:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233806AbiJZMki (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Oct 2022 08:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233867AbiJZMkF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Oct 2022 08:40:05 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E99A4C03A
        for <linux-i2c@vger.kernel.org>; Wed, 26 Oct 2022 05:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666787993; x=1698323993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6nOPVVUAo1HLV89nMlgmsHgATC1jLLquQXoG2m1KX9Y=;
  b=PzqMnDHm3IKXHoPNkI0xyLTIZ2S72vls82sB2KQAUBQQs9zzGPcMNtmz
   tEs9c1W37eVuRws0GJ0HL3NQaX5vK1REsWSqG9p9EdTPEWXbOxemWvW2l
   o8rhXgEmv+3uPZN09BZsz2RZsNMKMcVRboSdXzSm4KZxC+/HXVcGF3V/v
   g6rDV1hglHEitGloePJaOU6sjygy3CE2CN+8r5MN7l7IsvpIFoB+tTRap
   Xe65kGxPMKwIdMSoVZQ7EeqMCDuPuGrv5b5YL72k5XyOS89yGe/OaMgiO
   EWUdrZ4vRAQEvgYtxhVv1cq7pebyGCjoxoU8jbM2Hyz6nqdmmVP/fs6a7
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="309625054"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="309625054"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 05:39:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="700908684"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="700908684"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2022 05:39:45 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Luis Oliveira <luis.oliveira@synopsys.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 06/11] i2c: designware: Simplify slave interrupt handler nesting
Date:   Wed, 26 Oct 2022 15:39:07 +0300
Message-Id: <20221026123912.2833271-7-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221026123912.2833271-1-jarkko.nikula@linux.intel.com>
References: <20221026123912.2833271-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Interrupt processing code in i2c-designware-slave.c is bit more readable
if not divided into another subroutine. Also explicit IRQ_NONE and
IRQ_HANDLED return values are more obvious.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-slave.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 12f0417aa0ae..3c855cd45c34 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -147,9 +147,9 @@ static u32 i2c_dw_read_clear_intrbits_slave(struct dw_i2c_dev *dev)
  * Interrupt service routine. This gets called whenever an I2C slave interrupt
  * occurs.
  */
-
-static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
+static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
 {
+	struct dw_i2c_dev *dev = dev_id;
 	u32 raw_stat, stat, enabled, tmp;
 	u8 val = 0, slave_activity;
 
@@ -159,7 +159,7 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 	slave_activity = ((tmp & DW_IC_STATUS_SLAVE_ACTIVITY) >> 6);
 
 	if (!enabled || !(raw_stat & ~DW_IC_INTR_ACTIVITY) || !dev->slave)
-		return 0;
+		return IRQ_NONE;
 
 	stat = i2c_dw_read_clear_intrbits_slave(dev);
 	dev_dbg(dev->dev,
@@ -205,17 +205,7 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 	if (stat & DW_IC_INTR_STOP_DET)
 		i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
 
-	return 1;
-}
-
-static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
-{
-	struct dw_i2c_dev *dev = dev_id;
-	int ret;
-
-	ret = i2c_dw_irq_handler_slave(dev);
-
-	return IRQ_RETVAL(ret);
+	return IRQ_HANDLED;
 }
 
 static const struct i2c_algorithm i2c_dw_algo = {
-- 
2.35.1

