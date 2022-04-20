Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEE850889E
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Apr 2022 14:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358301AbiDTNAz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Apr 2022 09:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343572AbiDTNAy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Apr 2022 09:00:54 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91583E5C6
        for <linux-i2c@vger.kernel.org>; Wed, 20 Apr 2022 05:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650459487; x=1681995487;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zGLgpEce6wg/8K/LzOjqswgwqE7aNLV8wx6b+nBUTE4=;
  b=AE4/x3FMMz15hfY/4wbIW7PWPZ2tbfW5+cyHxJHNwbtAPE5o4CBm0sDs
   eZmoaBad07hOCZJrAJ/U5wl2F7UgyPKM68qXoHnHVScd3qVc4o0HIFGL4
   Tfnu2r3CfeyD4CF2QIM4NBiLWulC8H7NwJihWIM7uKeS/KcEp2hz1xoqq
   PY1El8Cetm/Jd0uWfCyjDNqgOmuMb1VDVNV4Qhw982C7ZvDcBeVjsSEQh
   46Zw8WRRoDdyZBKKyqu35672RhIsa5+WQ8NzpgHzETe0l7lqdDDgti63H
   vEj7hrB588Cq+6CjeS/xwo1KPSKCQHbGgA/pgCgjkklE7Jf0ZvZghclsn
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="263480034"
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; 
   d="scan'208";a="263480034"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 05:58:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; 
   d="scan'208";a="668516642"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.59])
  by orsmga004.jf.intel.com with ESMTP; 20 Apr 2022 05:58:05 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: designware: Sort timing parameter ACPI method calls by the speed
Date:   Wed, 20 Apr 2022 15:58:02 +0300
Message-Id: <20220420125802.352306-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It's more logical to read these get timing parameters ACPI method calls
sorted by speed categories in increasing order: Standard-mode,
Fast-mode, Fast-mode Plus and High-speed mode.

Originally these were in order after commit a92ec1746f10
("i2c: designware: get fast plus and high speed *CNT configuration") but
got mixed up over the years.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 9f8574320eb2..e7d316b1401a 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -266,9 +266,9 @@ int i2c_dw_acpi_configure(struct device *device)
 	 * selected speed modes.
 	 */
 	i2c_dw_acpi_params(device, "SSCN", &dev->ss_hcnt, &dev->ss_lcnt, &ss_ht);
+	i2c_dw_acpi_params(device, "FMCN", &dev->fs_hcnt, &dev->fs_lcnt, &fs_ht);
 	i2c_dw_acpi_params(device, "FPCN", &dev->fp_hcnt, &dev->fp_lcnt, &fp_ht);
 	i2c_dw_acpi_params(device, "HSCN", &dev->hs_hcnt, &dev->hs_lcnt, &hs_ht);
-	i2c_dw_acpi_params(device, "FMCN", &dev->fs_hcnt, &dev->fs_lcnt, &fs_ht);
 
 	switch (t->bus_freq_hz) {
 	case I2C_MAX_STANDARD_MODE_FREQ:
-- 
2.35.1

