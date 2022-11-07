Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3DD861F493
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 14:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbiKGNne (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 08:43:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbiKGNnd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 08:43:33 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D590A2700
        for <linux-i2c@vger.kernel.org>; Mon,  7 Nov 2022 05:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667828611; x=1699364611;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=at5Sl9HpT4+11Zeiayqs+Iw+TjIWFVz09cdZnMBirkM=;
  b=QFy+6KBjlDez72kP/1LYYzJV5uuwcroxTVOQqcIRrAzuuEb1vAdzrEmx
   MyMolLy7o+I8lgxm5SjXj8MvV9OPXwSVRmR9mnBFBv2nzJlZBg8pmwcHe
   jxfJdg1sAjvqgjDcQ/DTd/ofEyahOcSVoLk/0j6BorS1c5+N72/7oqo2w
   i9/E8Nt6O8qcPOq6exUDhqRhmNS83MczAeWM0pIXVqGJHMsYCKq14Ky/W
   ElEgj4sUxP4hFsEfaCmDmPPRTfsh49FGxhCVupa0hfF47x1/c5NWZ9RGF
   29pbII/i5lMsmWk9Mn9bzO1qfhbo4tXfpOlusX+T7OFJ2o6AtnPTShlEN
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372531166"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="372531166"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 05:43:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="586971991"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="586971991"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 05:43:29 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 12/12] i2c: designware: Add comment to custom register value constants
Date:   Mon,  7 Nov 2022 15:42:48 +0200
Message-Id: <20221107134248.864890-13-jarkko.nikula@linux.intel.com>
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

DW_IC_COMP_VERSION register contains the ASCII representation of the
Synopsys component version. Here 0x3131312A == "111*" means version
1.11* required for DW_IC_SDA_HOLD register availability where '*' means
any letter starting from 'a'.

DW_IC_COMP_TYPE is constant and is derived from two ASCII letters "DW"
followed by a 16-bit unsigned number.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: Updated commit log and comment about DW_IC_COMP_VERSION and
DW_IC_SDA_HOLD_MIN_VERS define.
---
 drivers/i2c/busses/i2c-designware-core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 0668888d557d..95ebc5eaa5d1 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -79,9 +79,9 @@
 #define DW_IC_CLR_RESTART_DET			0xa8
 #define DW_IC_COMP_PARAM_1			0xf4
 #define DW_IC_COMP_VERSION			0xf8
-#define DW_IC_SDA_HOLD_MIN_VERS			0x3131312A
+#define DW_IC_SDA_HOLD_MIN_VERS			0x3131312A /* "111*" == v1.11* */
 #define DW_IC_COMP_TYPE				0xfc
-#define DW_IC_COMP_TYPE_VALUE			0x44570140
+#define DW_IC_COMP_TYPE_VALUE			0x44570140 /* "DW" + 0x0140 */
 
 #define DW_IC_INTR_RX_UNDER			BIT(0)
 #define DW_IC_INTR_RX_OVER			BIT(1)
-- 
2.35.1

