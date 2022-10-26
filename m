Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F382A60E100
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 14:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233805AbiJZMkg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Oct 2022 08:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233850AbiJZMkI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Oct 2022 08:40:08 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC544D240
        for <linux-i2c@vger.kernel.org>; Wed, 26 Oct 2022 05:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666787993; x=1698323993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9HrUiak8pLU8Kd13ipfwEtwxpS9pu86wYQf7OjzXhqE=;
  b=IqbvH5LyUac2NdA1//nB+bvO5sgnUMekUElcP3icRkxn6QDVAkMOWNI6
   NlECdQXumdlC+ghw0ORi4LNl9TvdSaUQ0yMJ+9QQf9mO4QagLScrLdEay
   0omVFz87zkdjuEjl0HKcC4F387HKk7NtHUsgev7Mm7DPO55eiyN6vLyAT
   01vTA8WrRalx7jE/e/mkRBLOV1YNXbqQ0E3Z+scn+2NlcavChUkWWv6hH
   lwzNP7KtYvq2TAB3nIKl11RO3/yjzz+zHEWTmDD3ltJX0XfP74ivuNkuj
   ZszywEpR3gzfFoXoS9CbTQbEOPZTfdMIugs52FiC01OlL2tKSSiO1ijEd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="309625061"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="309625061"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 05:39:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="700908696"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="700908696"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2022 05:39:48 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Luis Oliveira <luis.oliveira@synopsys.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 07/11] i2c: designware: Do not process interrupt when device is suspended
Date:   Wed, 26 Oct 2022 15:39:08 +0300
Message-Id: <20221026123912.2833271-8-jarkko.nikula@linux.intel.com>
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

Do not return with interrupt handled if host controller is off and thus
interrupt is originating from other device or is spurious.

Add a check to detect when controller is runtime suspended or
transitioning/reset. In latter case all raw interrupt status register
bits may read one. In both cases return IRQ_NONE to indicate interrupt
was not from this device.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 1b7db2b58f31..dce74f8ab171 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -778,6 +778,8 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 	dev_dbg(dev->dev, "enabled=%#x stat=%#x\n", enabled, stat);
 	if (!enabled || !(stat & ~DW_IC_INTR_ACTIVITY))
 		return IRQ_NONE;
+	if (pm_runtime_suspended(dev->dev) || stat == ~0)
+		return IRQ_NONE;
 
 	i2c_dw_irq_handler_master(dev);
 
-- 
2.35.1

