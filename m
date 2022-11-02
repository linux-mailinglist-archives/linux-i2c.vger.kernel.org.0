Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8F7D61637D
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 14:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbiKBNMT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 09:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbiKBNMD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 09:12:03 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B74432AC5A
        for <linux-i2c@vger.kernel.org>; Wed,  2 Nov 2022 06:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667394713; x=1698930713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7Dx+9arQ2reqX4331u/mOp22OqaOcWNBwuoq5kn6pjQ=;
  b=NVAFc2v7KsPybfOK0eYomoAXwi75QV5VFSXWjGqww5hSBetMvkiPpBVh
   uTKYq14FTq4U0XDmRwpehXtqTjp4rNSeystEeMArVY5V1k2aE7ywzm4fQ
   pBn9IaoZvH2jRtGi67RrdZqlRUhgH2lqOBsYEI7Fw1mzsgamd8h9WgF3M
   gWRmpqifird+nFHLV4GfEchbEj6ejTf/XXGyEgF83C+XNGnqAvnJNs6Jn
   gPgkMGbE3i2h0a4bMBiDhAcZEIzulJUKFWtJYeJpYR/SrOPco6fX1l+GN
   h/GmCGlLIQX8SNAD2FRU9VEyVb0cdSb+5f291KP+nA83UdJoj2pP9Spwv
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="308120854"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="308120854"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 06:11:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="612234879"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="612234879"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.68])
  by orsmga006.jf.intel.com with ESMTP; 02 Nov 2022 06:11:48 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 07/12] i2c: designware: Do not process interrupt when device is suspended
Date:   Wed,  2 Nov 2022 15:11:20 +0200
Message-Id: <20221102131125.421512-8-jarkko.nikula@linux.intel.com>
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

Do not return with interrupt handled if host controller is off and thus
interrupt is originating from other device or is spurious.

Add a check to detect when controller is runtime suspended or
transitioning/reset. In latter case all raw interrupt status register
bits may read one. In both cases return IRQ_NONE to indicate interrupt
was not from this device.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
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

