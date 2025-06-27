Return-Path: <linux-i2c+bounces-11669-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3F6AEBA04
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 16:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADAFE1C60C95
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 14:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC6D2E2656;
	Fri, 27 Jun 2025 14:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YM/LY4rc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA8927F00F;
	Fri, 27 Jun 2025 14:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034925; cv=none; b=novl/7q4cAzP3QRH7UYBhRqRbVbSRuyrOO3MJjrzUGsnv9PY7kJCSBuMbmTJz/g9Ze9s9fVycQiathaNHHwtkWjhykca6yaj9twcT7xOMVtejoqb443z55OeyKV3MKuY/stqQimyGbzyWt1r2WO6nAyU2CwVD4+tfL/Q1qv94pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034925; c=relaxed/simple;
	bh=NZZXC515ZgT0fUOzjmcsg0e8paiYFX5FCo8x0ojHTjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BB7W2/H1XeR6h6+xec4A0QoSr74Dz+EA8dkcJxdWuTEDmeB3J9u2347TNJS2ylVWrDKlVED+MSLNZb9ZtwhVp3mgvr8JzXBiL090K0qBBrRiZQ3ZaWwqMVq8aFl/5pU5aQewX8dbpmaliO+LMo6ZdXisiEC/X0A2G9sPeRswo2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YM/LY4rc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751034924; x=1782570924;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NZZXC515ZgT0fUOzjmcsg0e8paiYFX5FCo8x0ojHTjI=;
  b=YM/LY4rcYdzBT0045NKsx1WsWxgzeRslaB8ch+VtnwIb5GntTQtllqgu
   W2bp6pW2gHmhHq2FUIPVsA510uTxXmGfOoyzpeGR4w0f2RpyrJCriq8xG
   6ZnJ5EOuQFTk7i09rYu4acmuFtRNRncmWVEN7hAeuSqapZjcj8zyXYh8L
   Ow/a0eATXKyvQrtgG+orHPwkMxMyvvVaVJI6SaycCAlmu8davNeWKy4vZ
   fW1an+FZkw2mqhBOQAzeEwXgcHtnNewXDT5JoY5KvtzwWkNOO1u3PX3iW
   M06tRtjXo48YIeLLWUPZpJ4tcHWClX2gYBlrcGneprF7JAqF+D4R2O8RH
   A==;
X-CSE-ConnectionGUID: TaeS3RtmTAyZ+/VKltemuA==
X-CSE-MsgGUID: 45EU7pBJS3mznCxZ4355fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="63606894"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="63606894"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 07:35:24 -0700
X-CSE-ConnectionGUID: 3M/Ip3BYSE+KIXNI9eqoUw==
X-CSE-MsgGUID: CKtq3BtuRv+ft8Xnww3Elw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152344332"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.252])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 07:35:23 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: linux-i2c@vger.kernel.org,
	andi.shyti@kernel.org,
	andriy.shevchenko@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c/designware: Fix an initialization issue
Date: Fri, 27 Jun 2025 10:35:11 -0400
Message-ID: <20250627143511.489570-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i2c_dw_xfer_init() function requires msgs and msg_write_idx from the
dev context to be initialized.

amd_i2c_dw_xfer_quirk() inits msgs and msgs_num, but not msg_write_idx.

This could allow an out of bounds access (of msgs).

Initialize msg_write_idx before calling i2c_dw_xfer_init().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Fixes: 17631e8ca2d3 ("i2c: designware: Add driver support for AMD NAVI GPU")
Cc: <stable@vger.kernel.org>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c5394229b77f..40aa5114bf8c 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -363,6 +363,7 @@ static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	dev->msgs = msgs;
 	dev->msgs_num = num_msgs;
+	dev->msg_write_idx = 0;
 	i2c_dw_xfer_init(dev);
 
 	/* Initiate messages read/write transaction */
-- 
2.49.0


