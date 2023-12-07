Return-Path: <linux-i2c+bounces-652-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BA6808A09
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 15:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41A7F1C20898
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 14:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8849D41C60;
	Thu,  7 Dec 2023 14:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JI61SYtR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EAEB10E6;
	Thu,  7 Dec 2023 06:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701958630; x=1733494630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SmTTAtvj/WHt+DPwODvK2J45LXm4S596UKrVP2u4rro=;
  b=JI61SYtReW+5KSmvCgMuvtmrdfn8dEooWY5XNzFrzqRvI/2rVL/r6sej
   Rdp71zLIQroWomu26Ss6asj4CYcp/0U9k5MuaerbhHllrzafedq+4t/5s
   BIEBsLUFbBwhzIZPFYjb6po/sIYk7BkM53bGG8Egv9QYtGwkS2jRKuePQ
   sjpBPtpllRldS878kzFpWK1A0wxRCZ2uKfYo717QcPh/3Hwns1bjyh4py
   PW1VazxHxSl9MfmxKsvO7RdrXa1fWbvOiW1Y7gD7gO4a2M4N+sGL3Bf/W
   GBjZxFHU+Arqr7rMImn735kQlnJk6taVv3S7Rg0zMNZEj3mob8H60BLtJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460726081"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="460726081"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889756074"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="889756074"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2023 06:17:07 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B6707690; Thu,  7 Dec 2023 16:17:02 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v5 05/24] i2c: designware: Replace a while-loop by for-loop
Date: Thu,  7 Dec 2023 16:13:45 +0200
Message-ID: <20231207141653.2785124-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
References: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace a while-loop by for-loop in i2c_dw_probe_lock_support() to
save a few lines of code.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Link: https://lore.kernel.org/r/20231120144641.1660574-6-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 63cc3cdca2c7..cb954f11540e 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -260,11 +260,9 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
 	int i = 0;
 	int ret;
 
-	ptr = i2c_dw_semaphore_cb_table;
-
 	dev->semaphore_idx = -1;
 
-	while (ptr->probe) {
+	for (ptr = i2c_dw_semaphore_cb_table; ptr->probe; ptr++) {
 		ret = ptr->probe(dev);
 		if (ret) {
 			/*
@@ -276,7 +274,6 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
 				return ret;
 
 			i++;
-			ptr++;
 			continue;
 		}
 
-- 
2.43.0.rc1.1.gbec44491f096


