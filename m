Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED1015EE1B1
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Sep 2022 18:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234161AbiI1QVQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Sep 2022 12:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiI1QVP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Sep 2022 12:21:15 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DCBD30574;
        Wed, 28 Sep 2022 09:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664382074; x=1695918074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ot/k0+GJgqY2Cia6IZBVgLjo1TwaIpk5IaFk3oWJ/pA=;
  b=CSES0dEroZpABP2FOQdp60fYlvGW+bcbfMK/VffFofGWr29cDziLJ3nC
   EaPmdQyN1tONjmmR95VpyHL4iqONnlPEH4m8e5EUAhp/je11Hqp+HjiP1
   OF3MPixctLhu7/WnKfyno605MZLrzKsSTa1HAm4Xqx0JU+iwbWzfyF6An
   sBRsZ15DIMpyVw1eSk5x8cjtN1Kk9E7RnqxZ+98KYLkK94ymiUIHhU9c/
   /DYCAqgVulDnDdsEETRnnQGRvHZDt5IE3b+BXdHbJp65MU9c9Q/AUXuoq
   YS/rQ7bt+b8luRyK2NSQN+hxpfDM9uWcD+WpJbyr9LrWxncSEHnkf3Kr4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="288805365"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; 
   d="scan'208";a="288805365"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 09:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="599634417"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; 
   d="scan'208";a="599634417"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 28 Sep 2022 09:21:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 32D0E265; Wed, 28 Sep 2022 19:21:22 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: [PATCH v1 2/2] i2c: designware-pci: Use standard pattern for memory allocation
Date:   Wed, 28 Sep 2022 19:21:16 +0300
Message-Id: <20220928162116.66724-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928162116.66724-1-andriy.shevchenko@linux.intel.com>
References: <20220928162116.66724-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
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
---
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

