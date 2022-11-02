Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33527616381
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 14:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbiKBNMh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 09:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbiKBNML (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 09:12:11 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF872A96B
        for <linux-i2c@vger.kernel.org>; Wed,  2 Nov 2022 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667394725; x=1698930725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ozm/b0g80SjN8g4WJj9B+ZJL528g4Q1wnT54L/h1efE=;
  b=HJhRd3n7mWECQPxj0FfleCe0adGhKgod8Cfu1MhnSfEi7b0NIlYRvxHg
   gA0NF0msFsOOYvtvQRmhRymvCFxGLrfJ2hYMCwCv+ixo/ae9vE1SmgYR8
   wvXtwjuGWn5LCHir0ahUi2EAY6D306tc0v9Y0m4vI7A69k+WIGxxg8/od
   kIb8AKVy6bE047CDkk8Ig4R9KlKK63vR7Q9OwXOQNUauIwp3yHFQ9tVjf
   TlgLF641puOOy+jVylajN1bAa/nPqoqYJL1dLF1gud13hIvvMsnU+jOWR
   ViWZdiIsK7H1VRIj0h27GvWUBd7JrNnuR6Scb2Ne6hxiQQVWMxB1vPWXG
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="308120904"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="308120904"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 06:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="612234946"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="612234946"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.68])
  by orsmga006.jf.intel.com with ESMTP; 02 Nov 2022 06:12:02 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 12/12] i2c: designware: Add comment to custom register value constants
Date:   Wed,  2 Nov 2022 15:11:25 +0200
Message-Id: <20221102131125.421512-13-jarkko.nikula@linux.intel.com>
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

DW_IC_COMP_VERSION register contains the ASCII representation of the
Synopsys component version followed by '*'. Here 0x3131312A == "111*"
means version 1.11 is required for DW_IC_SDA_HOLD register availability.

DW_IC_COMP_TYPE is constant and is derived from two ASCII letters "DW"
followed by a 16-bit unsigned number.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 0668888d557d..aae22ca5c5e2 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -79,9 +79,9 @@
 #define DW_IC_CLR_RESTART_DET			0xa8
 #define DW_IC_COMP_PARAM_1			0xf4
 #define DW_IC_COMP_VERSION			0xf8
-#define DW_IC_SDA_HOLD_MIN_VERS			0x3131312A
+#define DW_IC_SDA_HOLD_MIN_VERS			0x3131312A /* "111*" == 1.11 */
 #define DW_IC_COMP_TYPE				0xfc
-#define DW_IC_COMP_TYPE_VALUE			0x44570140
+#define DW_IC_COMP_TYPE_VALUE			0x44570140 /* "DW" + 0x0140 */
 
 #define DW_IC_INTR_RX_UNDER			BIT(0)
 #define DW_IC_INTR_RX_OVER			BIT(1)
-- 
2.35.1

