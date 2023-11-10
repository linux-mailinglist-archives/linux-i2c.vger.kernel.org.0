Return-Path: <linux-i2c+bounces-32-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7ED7E81BE
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5468D281200
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3E22BCF7;
	Fri, 10 Nov 2023 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDr/5Nv4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B080200D7
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:33:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4A512C917;
	Fri, 10 Nov 2023 10:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699641116; x=1731177116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ogMo2ROZ1IRQfZGGc0DiQKwc3w6L4EKaxN3bgiF6KaQ=;
  b=mDr/5Nv4e4uaa7nUd41A2dSB1aQ9Z48N7Aw6lrMxKNr7SAyBoxHFSmMd
   M1mak7toTMNIl0PbWFIGK6OiZ4+Jqj5i180gbkNjLGhwe12JH9HWc4Fbi
   bN9Fi6hCVQCy/vO6TNBZaipvK47Csjzgaeusbcmz6g1XsE0tZ43CdVerC
   NimkKUsRN9m6dut0bqwXmlaIwGSLkU1z+TpVUszbZFy7YNSOtTgFAKgPH
   Ob04uUJKsKvb8Aql2iJAwIGjE1upJCrbuW8Cy9HjeSpRK0FkFqLL/P1yd
   LAW4Xupy+vhXZNcmfwdILThERPV2axsM1U88BJdr2fqiLHSC8qHsGvQa4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="380606876"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="380606876"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:29:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="792912170"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="792912170"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 10 Nov 2023 10:29:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6D374918; Fri, 10 Nov 2023 20:23:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 24/25] i2c: designware: Get rid of redundant 'else'
Date: Fri, 10 Nov 2023 20:11:44 +0200
Message-ID: <20231110182304.3894319-25-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
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
index 45b5c910b8db..5e28f50e4ce6 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -639,10 +639,10 @@ int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev)
 
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
2.43.0.rc1.1.gbec44491f096


