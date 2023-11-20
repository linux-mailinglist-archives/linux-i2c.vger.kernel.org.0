Return-Path: <linux-i2c+bounces-327-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD007F1614
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 15:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1948A2826FD
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 14:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E551D529;
	Mon, 20 Nov 2023 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M++pXFN1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A821CD62;
	Mon, 20 Nov 2023 06:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700491619; x=1732027619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kTclvOl7vkPey5C16DKDFp42ZZYtPi/iqZTaSSBYP+g=;
  b=M++pXFN1LpNgHmYcj49Cv3v2wInBrHBHAQ1AJnrZzbgAT4C2ti9eTEl6
   lcr+qXh7fuNQjObvByDf9iHru6r+mqPiNWXDwHc6bs2b1seTZq+DdMlsp
   4mViOKmzkUgAtY4YCPifga8RGLhhtmRb7WqneqzfdX/uyUdKrgFVvNgpY
   5epBpH/JlbxJq6HPwzBCqurAe/gfqNlj2HcekMrS0XB7mnYAuOktw0P6R
   7acdb9u8d6e58PYNkp6VuMgKg2zaAgqX6iIhJfVR5Oq9gI7NKjjs/3nGN
   hl/ZjT4SyGX9Rv1qxLe97LfyT/2a3F+en9RiaElBTyJDgJBEeZNHe+xxI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="382017085"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="382017085"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 06:46:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="832291657"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="832291657"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 20 Nov 2023 06:46:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4AC0C706; Mon, 20 Nov 2023 16:46:45 +0200 (EET)
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
Subject: [PATCH v4 23/24] i2c: designware: Get rid of redundant 'else'
Date: Mon, 20 Nov 2023 16:42:05 +0200
Message-ID: <20231120144641.1660574-24-andriy.shevchenko@linux.intel.com>
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
index 45ced3354eef..b8e5d56473d6 100644
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


