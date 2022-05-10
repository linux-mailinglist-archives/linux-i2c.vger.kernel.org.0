Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 585BD521E7B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 17:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345730AbiEJP2z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 11:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345987AbiEJP1h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 11:27:37 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6813626122;
        Tue, 10 May 2022 08:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652195948; x=1683731948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kPfOvWxtiOQgydvhidTbirNyYEpGUtcQOWxp4O2/dTk=;
  b=HnlgMZIuwBUNQCUipCcDa1sphq2PhaPbzcm49LN864OQS8+03YjTdxku
   o0kNKoFU6/5Pj+BVl94gfYtcd5lHn28UrNg5p7ycp0LZTIrmR7KBw9cHv
   J48FBBZhZfjZ0PdinrtJviKq6J5nYfeFmtdiF3F/8Dw/u6czHhAX77hz+
   HfRuiXNZ3rRa1zS632hx1jXn2vz5m2hrCcPaQ5epGeDkLEyuytTxRPf44
   YLxhVN5Af6sv1vAOCPMEywyefTT576FFbdc+8CHO6hzvS0v23HPN8tjll
   IJpXszbBmJGZcn7UVRJBcdfsQEbPRCIl9VVFBNwoGuUpNuW7yYq2WA6Pp
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249305340"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="249305340"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 08:17:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="519802400"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 10 May 2022 08:17:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C3977630; Tue, 10 May 2022 18:15:16 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?=C5=81ukasz=20Bartosik?= <lb@semihalf.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH v5 7/8] EDAC, pnd2: Use proper I/O accessors and address space annotation
Date:   Tue, 10 May 2022 18:14:50 +0300
Message-Id: <20220510151451.85561-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
References: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver uses rather voodoo kind of castings and I/O accessors.
Replace it with proper __iomem annotation and readl()/readq() calls.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Henning Schild <henning.schild@siemens.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
 drivers/edac/pnd2_edac.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/edac/pnd2_edac.c b/drivers/edac/pnd2_edac.c
index c94ca1f790c4..7d1df120e24c 100644
--- a/drivers/edac/pnd2_edac.c
+++ b/drivers/edac/pnd2_edac.c
@@ -265,7 +265,7 @@ static u64 get_sideband_reg_base_addr(void)
 static int dnv_rd_reg(int port, int off, int op, void *data, size_t sz, char *name)
 {
 	struct pci_dev *pdev;
-	char *base;
+	void __iomem *base;
 	u64 addr;
 	unsigned long size;
 
@@ -297,8 +297,9 @@ static int dnv_rd_reg(int port, int off, int op, void *data, size_t sz, char *na
 			return -ENODEV;
 
 		if (sz == 8)
-			*(u32 *)(data + 4) = *(u32 *)(base + off + 4);
-		*(u32 *)data = *(u32 *)(base + off);
+			*(u64 *)data = readq(base + off);
+		else
+			*(u32 *)data = readl(base + off);
 
 		iounmap(base);
 	}
-- 
2.35.1

