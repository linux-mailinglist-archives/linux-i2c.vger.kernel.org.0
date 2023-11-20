Return-Path: <linux-i2c+bounces-315-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0CF7F1607
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 15:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0F03B2182F
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 14:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B9D1C6A7;
	Mon, 20 Nov 2023 14:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uod9xnTl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F12C0138;
	Mon, 20 Nov 2023 06:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700491615; x=1732027615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ra1fDXxXZDiL0Wl6vqb23lOjaK/9+v5dMqICn+uCCZQ=;
  b=Uod9xnTlQ6Td9COtd51owX8oYBs0HHE39hpKFJlnwf+hstBizr2Cgh7d
   BovDJIq1ObfrFfLtSklEzlPfEf0Rzg+TdZVPEFGyr9ajBP+fYdYiJUlUr
   5EeO3Qg+8Tx+wxUU2HvDbcquAM25K5LyFdd7n/X1rA7rCdzVFZq6/4I+q
   6CZavTKqfOAkRPzIw3RazfFv4IgT/w7eC1N50WmuOiGaIk056TQ6Y+sWr
   bFFTa6nowwNg1/0bXrTpJyhjcGdacksmGV1R1q2rBGfbw1X6zI7sJjkAn
   yZgcyo5AW5E3Pd7RqWj0wyjpGEusiUTeYRsa9h9lV46dU88J7D0E4frer
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="382017024"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="382017024"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 06:46:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="832291642"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="832291642"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 20 Nov 2023 06:46:50 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5EA8F1D9; Mon, 20 Nov 2023 16:46:44 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 05/24] i2c: designware: Replace a while-loop by for-loop
Date: Mon, 20 Nov 2023 16:41:47 +0200
Message-ID: <20231120144641.1660574-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
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


