Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B285761BBF
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 16:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbjGYOan (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 10:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbjGYOab (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 10:30:31 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0345E2106;
        Tue, 25 Jul 2023 07:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690295428; x=1721831428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=csNr0uHnApehbWbLBcR96Up2BGeOr3TZJ/TrYLmOnZc=;
  b=ZlOzDpJkko2I3XORf9A+H4AO2gJ9J/eoxplQ+vTSy3iL6on9xp1BZFEc
   vFtF1aWs4pu/Os8zMVoxeJlkcWwlFT9CCDEQiTEv7Vk2H7v/7sDZKu4a7
   H+UcVVdIq1PgawaxaKXF/iJuVfQuN7XN1IiQY+dMOCamaF4+eOgCr+33Y
   OIsII1/bVGTS5TC/COHMG99nwRtSTPn0NYtYvMnxXyr/c+Neuwmk8Z7nS
   VRHyOJygHuRPFNeyDYZbqE1KoMlt1ie5/PfwwR818sLhWFlYQX6wC+JU7
   yCTpXMasr0Nd319kHwWT96CBVaNPKf9yssyP8T8DSW6kQPecyX+2hKR6M
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="357742912"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="357742912"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 07:30:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="869491476"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2023 07:30:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DB885438; Tue, 25 Jul 2023 17:30:24 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 8/9] i2c: designware: Get rid of redundant 'else'
Date:   Tue, 25 Jul 2023 17:30:22 +0300
Message-Id: <20230725143023.86325-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In the snippets like the following

	if (...)
		return / goto / break / continue ...;
	else
		...

the 'else' is redundant. Get rid of it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e6df6a484955..de28dd66c5eb 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -615,10 +615,10 @@ int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev)
 
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
2.40.0.1.gaa8946217a0b

