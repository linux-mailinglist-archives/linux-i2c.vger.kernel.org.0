Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E64E61636F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 14:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbiKBNLp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 09:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbiKBNLn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 09:11:43 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4022A433
        for <linux-i2c@vger.kernel.org>; Wed,  2 Nov 2022 06:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667394702; x=1698930702;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LA9a+YnE7wf4Tj6Rq9h09p2BZcXUOTg4rilgMle90yA=;
  b=iuLRTCgbbXgD1cm1+BpvRcFfh8684nddZbKNeLQqxgczETQGicgbYxX2
   lc0MbWGrBCPfpoB7D0hjv3NKpjs3EL8ec7FGJ+2f+wmBCTuv+UDtMSWYU
   J9Y1K0eYlvfIPHi67NRx5OQwfRzxTcUKgQqe2PdSB7CSQ72fF4bs0Cgyg
   VxbheBQL/MZS+DOreJpUDahyQQZj54S36gOW4V1qKyJhigsw57jU3REGl
   5Ott0CBs5jNGLxAnsoJV9W9bEDNRjSTxE1mHwhm3wC2Y/9pdaCcSa2nrf
   SmWDjSSTuxSDuhpBVxBUevYo7G2v5PRcl7DV4ztjIhEtj1I6NpgW0gLTq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="310507712"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="310507712"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 06:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="612234793"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="612234793"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.68])
  by orsmga006.jf.intel.com with ESMTP; 02 Nov 2022 06:11:39 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 04/12] i2c: designware: Remove needless initializations from i2c_dw_reg_slave()
Date:   Wed,  2 Nov 2022 15:11:17 +0200
Message-Id: <20221102131125.421512-5-jarkko.nikula@linux.intel.com>
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

These struct dw_i2c_dev members are not used in i2c-designware-slave.c
so remove re-initialization of them from i2c_dw_reg_slave().

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-slave.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 84eb0bec70fa..421a604bf68f 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -78,13 +78,7 @@ static int i2c_dw_reg_slave(struct i2c_client *slave)
 
 	__i2c_dw_enable(dev);
 
-	dev->cmd_err = 0;
-	dev->msg_write_idx = 0;
-	dev->msg_read_idx = 0;
-	dev->msg_err = 0;
 	dev->status = 0;
-	dev->abort_source = 0;
-	dev->rx_outstanding = 0;
 
 	return 0;
 }
-- 
2.35.1

