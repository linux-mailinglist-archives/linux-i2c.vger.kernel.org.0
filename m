Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47F40616378
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 14:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiKBNMV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 09:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231390AbiKBNMF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 09:12:05 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28AEF2AC61
        for <linux-i2c@vger.kernel.org>; Wed,  2 Nov 2022 06:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667394715; x=1698930715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UjXGMn79bQIInCSHBPxXhvJpczQkaD82eXy7QM+qXsw=;
  b=LiKZr4jXwco0osRzPP3BA/Er0+lsl7TyIGENwb+Nohx55jw/U0VLf9TQ
   jmJuT1bpRzztL2wCv3DeTIQreP1CA7xZ30frjaIZoYrBWEtZk7RK0pSH6
   AZvvQDnSrae2sJintvGCledbqNAX0QIfIUw4G6pKt8NoXAxWkKag+leAV
   u2A4Y78LrXE3YqqK6jAM2TRQ06pOHZBKv9/eknosb4ZmCD5rz4DVN5RgJ
   WWNJwwemBAql7YjC2Najiju4kH+evWQsF7+Zqjv3EWbrjrY7+I2QShqQm
   qWr0+ot6IW4wvN7sk8etqwMFG0OR210c5BsREkfob02u7pI9KQxv7uRmG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="308120861"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="308120861"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 06:11:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="612234911"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="612234911"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.68])
  by orsmga006.jf.intel.com with ESMTP; 02 Nov 2022 06:11:51 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 08/12] i2c: designware: Move debug print in i2c_dw_isr()
Date:   Wed,  2 Nov 2022 15:11:21 +0200
Message-Id: <20221102131125.421512-9-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102131125.421512-1-jarkko.nikula@linux.intel.com>
References: <20221102131125.421512-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It is kind of needless to print interrupt status when code immediately
after that finds interrupt was not originating from this device.
Therefore move it after spurious interrupt detection.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index d6fcf955dfc0..9c2c9d002dc3 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -775,11 +775,11 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 
 	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
 	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &stat);
-	dev_dbg(dev->dev, "enabled=%#x stat=%#x\n", enabled, stat);
 	if (!enabled || !(stat & ~DW_IC_INTR_ACTIVITY))
 		return IRQ_NONE;
 	if (pm_runtime_suspended(dev->dev) || stat == GENMASK(31, 0))
 		return IRQ_NONE;
+	dev_dbg(dev->dev, "enabled=%#x stat=%#x\n", enabled, stat);
 
 	i2c_dw_irq_handler_master(dev);
 
-- 
2.35.1

