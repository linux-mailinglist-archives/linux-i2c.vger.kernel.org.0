Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 819F860E0FE
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 14:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233837AbiJZMk0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Oct 2022 08:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233907AbiJZMjy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Oct 2022 08:39:54 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670AB2D1FC
        for <linux-i2c@vger.kernel.org>; Wed, 26 Oct 2022 05:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666787986; x=1698323986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v5UVN/HeSfh308fxBKaTOPNFWPFECQSIeqnNjl8qwdw=;
  b=UhJ3IN5arXX/HL0vSte2UV2Gyt01rgZrFXlWlfvxdoi+Ds6yCnM90eyp
   3kYZzm5kTSQ7ONMDBWj4kNUsYykd3Oojw+vLqrReJOyld1f1a8qHhvTsZ
   fCllJP9L1hmwNYKMLObFt8zW3s1H5bx0Ug/6a1C4kJZ2BZ9naMK/ElTlW
   MKyFfA5CXm2UEhEaPQ6uq3f6LB0ix1874lC+axrLuv28rHT7QJyhvyiqs
   xE4nKsYChUd5QH+DQwtIVvMw17yMV47MTO+vE137F0Mm2AGjW7F5tnzUY
   zQoLNZ3ibrzF7iImtau77Q0qP6ftGjQadgqb+PYd5WaXonx5w4nvd+7z/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="309625038"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="309625038"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 05:39:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="700908666"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="700908666"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2022 05:39:42 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Luis Oliveira <luis.oliveira@synopsys.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 05/11] i2c: designware: Remove unused completion code from i2c-designware-slave
Date:   Wed, 26 Oct 2022 15:39:06 +0300
Message-Id: <20221026123912.2833271-6-jarkko.nikula@linux.intel.com>
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

