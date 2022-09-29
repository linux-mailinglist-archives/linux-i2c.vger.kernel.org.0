Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEAF65EF255
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 11:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234971AbiI2JmC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 05:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235025AbiI2JmB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 05:42:01 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F4D7392C;
        Thu, 29 Sep 2022 02:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664444520; x=1695980520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hHmGWy3UADCaVz7LizTWSfFrC0JuHkp4q6xmOica7pM=;
  b=BSs7UEJDkOhbqZnFEyPph310VVagZFlrou2peVs5nuDj7KcY3Is+2XxD
   hmJmmktTzaYL62xxukUbF6RMsDnwSvXOpyU1/PHNr19sR6v2pWdP38h15
   P0cyMqQ/syY2dyMKtOz4zOwoA7UFONawlEc4vV/lGSA4JHdFFbDIU7EoA
   W5IVEHMqLIo6M7Yu4Xf4WoqJJtTQi5IdZWS3T++zBG7RuzcviwoXGlZx0
   vyFiuY1KK8kXDR90m630IM/qkcEtbG2KYlpOBb2+ZQoa2Yvqy6jsbV7Q3
   t18BEOlWbo5ywLe3K5df/eSuFL8B6QAs4KnQq/C/X3MNmOxe51uADH3uC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="328221781"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="328221781"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2022 02:42:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="764648888"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="764648888"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Sep 2022 02:41:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3DDE67C; Thu, 29 Sep 2022 12:42:17 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: [PATCH v2 2/2] i2c: designware-pci: Use standard pattern for memory allocation
Date:   Thu, 29 Sep 2022 12:42:15 +0300
Message-Id: <20220929094215.76236-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220929094215.76236-1-andriy.shevchenko@linux.intel.com>
References: <20220929094215.76236-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pattern
	foo = kmalloc(sizeof(*foo), GFP_KERNEL);
has an advantage when foo type is changed. Since we are planning a such,
better to be prepared by using standard pattern for memory allocation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v2: added tag (Jarkko)
 drivers/i2c/busses/i2c-designware-pcidrv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 6e8a9d26563a..e499f96506c5 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -263,7 +263,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		return dev_err_probe(&pdev->dev, r,
 				     "I/O memory remapping failed\n");
 
-	dev = devm_kzalloc(&pdev->dev, sizeof(struct dw_i2c_dev), GFP_KERNEL);
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
 
-- 
2.35.1

