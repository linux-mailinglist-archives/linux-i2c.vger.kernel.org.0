Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B121461F48C
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 14:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbiKGNnM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 08:43:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbiKGNnM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 08:43:12 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C999F1CB38
        for <linux-i2c@vger.kernel.org>; Mon,  7 Nov 2022 05:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667828591; x=1699364591;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4E2f+S/f9gwxKWUkwBjMXrSuE1xLRD1siWPlGoWggQY=;
  b=E2E7xp6vYkRHXBTswGHRxTyaVFHeQKunrH1hqUGjjF29jz36kdRPD07V
   GxoecDzeWzAv3F/zQhT5pCurY6/yvtqAdb48czMTpZbN7INB7oIml5ttB
   BnDkp6O79YEGKZmVdtE6nUgJxoL9HpPurEt/IBOKU1bYqh71a45/lX6sn
   1ab4HK1nxTJ2xw9Z09oYLvs63xiolCuI0TH9/ngRCRS+D51ak4LGQNwXx
   9ox+lSm6Ixt2QBepNkam8ZY37etGc/Hfx9+bUT/z0IlHxZni6nlgbh24S
   3yvUutf1s6TaC6HavfIdr7j5x5iI/o3FhE/24jbxlaWg5evSTf7NtGOWM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372531101"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="372531101"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 05:43:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="586971876"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="586971876"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 05:43:08 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 05/12] i2c: designware: Remove unused completion code from i2c-designware-slave
Date:   Mon,  7 Nov 2022 15:42:41 +0200
Message-Id: <20221107134248.864890-6-jarkko.nikula@linux.intel.com>
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

Remove unused completion code from i2c-designware-slave.c. Used only in
i2c-designware-master.c.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-slave.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 421a604bf68f..12f0417aa0ae 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -214,8 +214,6 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
 	int ret;
 
 	ret = i2c_dw_irq_handler_slave(dev);
-	if (ret > 0)
-		complete(&dev->cmd_complete);
 
 	return IRQ_RETVAL(ret);
 }
@@ -242,8 +240,6 @@ int i2c_dw_probe_slave(struct dw_i2c_dev *dev)
 	struct i2c_adapter *adap = &dev->adapter;
 	int ret;
 
-	init_completion(&dev->cmd_complete);
-
 	dev->init = i2c_dw_init_slave;
 	dev->disable = i2c_dw_disable;
 	dev->disable_int = i2c_dw_disable_int;
-- 
2.35.1

