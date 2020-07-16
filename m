Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B100C222641
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 16:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgGPOxX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 10:53:23 -0400
Received: from mga18.intel.com ([134.134.136.126]:50301 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728054AbgGPOxX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Jul 2020 10:53:23 -0400
IronPort-SDR: 90UpZ/mnUoeH3hPnnm/OUlzoQXz0VlrBFuhVQNgu6D7N78WdtXMGKyKpkn4gDUvxhErGKwo7Xw
 mOVLWYqrz6MA==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="136844565"
X-IronPort-AV: E=Sophos;i="5.75,359,1589266800"; 
   d="scan'208";a="136844565"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2020 07:53:22 -0700
IronPort-SDR: t7n1onWHDCFmsb/g9hAKRKlrJY1q3fANH+Fp86FuM/9PbZm0PxwNyBD+X5bIeU1gLoAjyTZZrv
 6Z9BJIHO2gsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,359,1589266800"; 
   d="scan'208";a="282477960"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 16 Jul 2020 07:53:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6F29C190; Thu, 16 Jul 2020 17:53:20 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] i2c: nvidia-gpu: Use put_unaligned_be24()
Date:   Thu, 16 Jul 2020 17:53:19 +0300
Message-Id: <20200716145319.53773-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This makes the driver code slightly easier to read.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-nvidia-gpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index f480105000b8..f9a69b109e5c 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -125,8 +125,7 @@ static int gpu_i2c_read(struct gpu_i2c_dev *i2cd, u8 *data, u16 len)
 		put_unaligned_be16(val, data);
 		break;
 	case 3:
-		put_unaligned_be16(val >> 8, data);
-		data[2] = val;
+		put_unaligned_be24(val, data);
 		break;
 	case 4:
 		put_unaligned_be32(val, data);
-- 
2.27.0

