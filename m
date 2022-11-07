Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70F6B61F48E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 14:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbiKGNnT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 08:43:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbiKGNnS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 08:43:18 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C9DA1C927
        for <linux-i2c@vger.kernel.org>; Mon,  7 Nov 2022 05:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667828597; x=1699364597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4xBT/u8ieddHvXJ/GbWMfcOi++REdG1ffPYpj5xW2mc=;
  b=QMdYE3dN9WwhXwHnaSi094WEuwKDumHuJBYtWocj5KXBPgqsnnQpXUDM
   qScrVM/2oKvMjiZWGvEwyTj0OWMljll1uuVEca/xU/Rzj5XjQNVbqE1gr
   h+3EgQ29bUjf2cIz/ubgYDgcQuVsupAMY0RgwlGTIaXxz1xNHQQOSMTjO
   lymayNPAv8Yc6PxxSQvjrC7OqVEEIrMkFPMj7j7UYX4g7BtQnWtBu0Myc
   ir8gKILdudarzAZ5Lzss7sJ3OQWQreDkcPEFlSzV8/ECUrYnUg7xki1f1
   HY/cdhrqEK7PyKjbzRkToIGgn/f/OSrDT5pIZVsOzuVe0wKN3qjzM0CEC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372531130"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="372531130"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 05:43:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="586971907"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="586971907"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 05:43:14 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 07/12] i2c: designware: Do not process interrupt when device is suspended
Date:   Mon,  7 Nov 2022 15:42:43 +0200
Message-Id: <20221107134248.864890-8-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221107134248.864890-1-jarkko.nikula@linux.intel.com>
References: <20221107134248.864890-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: Use GENMASK(31, 0) instead of ~0.
---
 drivers/i2c/busses/i2c-designware-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 1b7db2b58f31..d6fcf955dfc0 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -778,6 +778,8 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 	dev_dbg(dev->dev, "enabled=%#x stat=%#x\n", enabled, stat);
 	if (!enabled || !(stat & ~DW_IC_INTR_ACTIVITY))
 		return IRQ_NONE;
+	if (pm_runtime_suspended(dev->dev) || stat == GENMASK(31, 0))
+		return IRQ_NONE;
 
 	i2c_dw_irq_handler_master(dev);
 
-- 
2.35.1

