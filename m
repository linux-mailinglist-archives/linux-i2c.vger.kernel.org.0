Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 268B77E7176
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 19:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345063AbjKIS2w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 13:28:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345021AbjKIS2n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 13:28:43 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D2E3C0E;
        Thu,  9 Nov 2023 10:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699554521; x=1731090521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0y0h7BkktYSsLfLGZrjiG6Eoa1Wm0LmcKR98LPxa7Tg=;
  b=A5nk8Q5DqC9i3hMzuE8S6Lk2i9DbqOO9CIFDZfAkVSNWnyrAgdYcttOW
   GDB3VlnK6EuSiK1cxVZz3jW0HNvfuORYybO+6KpZbbS8temtFZGCXXS+4
   Slo2f2BBfeyyxdzKYXOrF3M6v97bqo5RYHA5HT9gV14gyXW3XTHls6y26
   S4htxSrFTrq3PwIo3LPPy9FC9FbtDoeOzQkdnq+L1qrXY5X1SaIubiEpQ
   I8viSmVq+AND7L17yzOGq/HwUmiqOZj+k9eUEQFH5ZiFp2Z0TQvZDgKL6
   cYxBeukRxoeNzuIXtX6E59eDL1pz57RKvikb2mrEFjm4IXFiF46Qgo6u8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389853931"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="389853931"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 10:28:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936938989"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="936938989"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 09 Nov 2023 10:28:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C9F2B81E; Thu,  9 Nov 2023 20:28:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 09/12] i2c: designware: Get rid of redundant 'else'
Date:   Thu,  9 Nov 2023 20:19:19 +0200
Message-ID: <20231109182823.3531846-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1996.gbec44491f096
In-Reply-To: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
References: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In the snippets like the following

	if (...)
		return / goto / break / continue ...;
	else
		...

the 'else' is redundant. Get rid of it.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 50cf4cbfeff3..4d7dc346e619 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -638,10 +638,10 @@ int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev)
 
 	if (abort_source & DW_IC_TX_ARB_LOST)
 		return -EAGAIN;
-	else if (abort_source & DW_IC_TX_ABRT_GCALL_READ)
+	if (abort_source & DW_IC_TX_ABRT_GCALL_READ)
 		return -EINVAL; /* wrong msgs[] data */
-	else
-		return -EIO;
+
+	return -EIO;
 }
 
 int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
-- 
2.40.0.1996.gbec44491f096

