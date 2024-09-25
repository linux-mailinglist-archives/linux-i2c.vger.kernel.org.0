Return-Path: <linux-i2c+bounces-6989-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE1E986048
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 16:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7FBF1F266F5
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 14:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9651A0702;
	Wed, 25 Sep 2024 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3LLQDOc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECB71A00D7;
	Wed, 25 Sep 2024 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268566; cv=none; b=a4Uj+oxbtBW9z6VtZ4qSf1DvvWfqemM2cKxdtmG88aYuNAu3IWCBb9bK6LxfqCfQXUNaCdIwBv+is7aHRRi59Mrg+cAemsP2I3Sz/TlVef2VlzMmuQVn4OLtsWxshyIpSA+xico8ENMqBqBs4IDZ4dP+jDFPpVC3itIz4ejUyQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268566; c=relaxed/simple;
	bh=lGffxdgbxA4Ec1+1dFqnZHBgqwkMxcDxvgZGQYPLLXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sIUIMfSU+Ad3c/GJJvlM3tNhtbYPMGGGXTV4WleHUXPRy4CoVC3g/aToLPAClG8brG+7CaYwBBJLfXeNqbCG2MSUcSGsbHRLDBYtGgu1+NTbNcoq3VNPmaUH4xjpSwIsHUPD41lVP2PJONf7Z5+wudWtXtEUdymnyEPAIZUPb9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3LLQDOc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727268565; x=1758804565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lGffxdgbxA4Ec1+1dFqnZHBgqwkMxcDxvgZGQYPLLXU=;
  b=e3LLQDOchFud3hM49qy/+g7QbSFt87iqWX40ObFYgecamqvxnV4lH6x8
   aeegyA6teVA2QK2dJ4jgQ5TuxLFYVELLIGRAItedQAVv0EVzPDUhikvHe
   T/ca2+Gtp6wBaMGMXZlMe+t+q1YSaHraqo6d9K5VM2ipQeZmV62to1nWI
   KlzIsm49LESKZPylRvkI72L7CeD8T/J1WVcPOHdoFnBfZHEzaUGbW/Egn
   hA/ZHT6tG14yBoLtOYtTPntC7L7cQbrfpf5IjXHT/hWXfjG0sFMawFXz4
   7of3evkPrPDEOg8232I0HxUXYQgfvkx1JEFXaAqm5J8lXqlsFtqRQ1H5e
   A==;
X-CSE-ConnectionGUID: 0MbAETJTQkGec2tdzKoJ4g==
X-CSE-MsgGUID: +2vMJ4x5SDK/qyS8Qt+TcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="36878367"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="36878367"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 05:49:21 -0700
X-CSE-ConnectionGUID: 4aol0lnySXmY0UyxzzPSyA==
X-CSE-MsgGUID: A9X9JXooRuSWFvBNNwdrng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="72577338"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 25 Sep 2024 05:49:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A2498595; Wed, 25 Sep 2024 15:49:17 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH v1 2/5] i2c: designware: Get rid of redundant 'else'
Date: Wed, 25 Sep 2024 15:44:20 +0300
Message-ID: <20240925124916.976173-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240925124916.976173-1-andriy.shevchenko@linux.intel.com>
References: <20240925124916.976173-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index f31d352d98b5..84ca53ee3317 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -676,10 +676,10 @@ int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev)
 
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
2.43.0.rc1.1336.g36b5255a03ac


