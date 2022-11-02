Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF58961637A
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 14:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiKBNMQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 09:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbiKBNLq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 09:11:46 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D72A2A42A
        for <linux-i2c@vger.kernel.org>; Wed,  2 Nov 2022 06:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667394706; x=1698930706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v5UVN/HeSfh308fxBKaTOPNFWPFECQSIeqnNjl8qwdw=;
  b=RDgtsYOhAOVz8090lk7cdR/Lx2UJueR2hv9Hbn7ICM/1zszZoKfrbPU4
   wXdZAPIq3AHSiKlgyVT9PzWaNFk8wWiM8mwgF7FBJSjYYNqhkWC2RdYO/
   g5y3lhPDWA2vwt77NgpzrhyTRipt+hCPZQEiR59zbkHaTCKxPWPU2Bi4M
   53FtkI1Hs2FnI3GbDKVC4q/qcAEnr0zcWKNky6MN8JoTsdUSvJOdJABio
   3FGZ0Qcy6XMG+z0lDTTcG2K4vSViEN52ISHQztcaFdhlQbjOjjF+H2UkS
   TsecfAdCnene+qsaToUa1i+rRSmJmWWRzZBaTx3tteqMLLS7N9L7qY42g
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="310507720"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="310507720"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 06:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="612234804"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="612234804"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.68])
  by orsmga006.jf.intel.com with ESMTP; 02 Nov 2022 06:11:42 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 05/12] i2c: designware: Remove unused completion code from i2c-designware-slave
Date:   Wed,  2 Nov 2022 15:11:18 +0200
Message-Id: <20221102131125.421512-6-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102131125.421512-1-jarkko.nikula@linux.intel.com>
References: <20221102131125.421512-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove unused completion code from i2c-designware-slave.c. Used only in
i2c-designware-master.c.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
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

