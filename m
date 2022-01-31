Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 060894A4A26
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 16:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349426AbiAaPOr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 10:14:47 -0500
Received: from mga02.intel.com ([134.134.136.20]:27476 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1378574AbiAaPOS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Jan 2022 10:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643642058; x=1675178058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qQkwPSXTENbjyjDZdLfhag9BeYCec/oyiE8eCJlXk+U=;
  b=iQM9Grtfr/Qt1pRg2Y4p3bS3qiObM5+ucg7MhdX7g/QhWjtLxbMv0szu
   KaEwRYHUg8AlF9YDydxQbEjLHgC3HcFijbnEW4zcv4bYqTFR6QMgIORQv
   xxAWEf2nU8UOXflelivfvc9Cob6Yhj+EkJXsbFfml/b1wfJUiBfZwRIVW
   VOrtd9MHisj4m52A8uLGCyUtIOh8lpv9QG+h5l0ISgmSvRdZ/SDus2Wfz
   OKan5XgCstuhmadUtL2aKxaxQkjAQQdJ+m2XxHE9Vl3YzSyw7szq1MZlR
   l4gGM7xaaYPnXlwsQ3TZuMjZ5j2OUrzn3aWR5XB9LXBexjoXDGqjvi9ne
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="234868818"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="234868818"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 07:14:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="598860290"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 31 Jan 2022 07:14:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 240CC4BC; Mon, 31 Jan 2022 17:14:16 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH v4 7/8] EDAC, pnd2: Use proper I/O accessors and address space annotation
Date:   Mon, 31 Jan 2022 17:13:45 +0200
Message-Id: <20220131151346.45792-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver uses rather voodoo kind of castings and I/O accessors.
Replace it with proper __iomem annotation and readl()/readq() calls.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
2.34.1

