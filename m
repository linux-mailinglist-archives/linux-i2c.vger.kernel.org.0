Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A3B35E1B3
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 16:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245105AbhDMOi2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 10:38:28 -0400
Received: from mga06.intel.com ([134.134.136.31]:59450 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244991AbhDMOiT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 10:38:19 -0400
IronPort-SDR: fDA6/xiaxQMceKuRm6JOY7vYdDct9tkQoU725znyw97O8oQWgJzLp/vEA00RTt6hInoZ2HUG33
 apIvbqnIbrpw==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="255745416"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="255745416"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 07:37:59 -0700
IronPort-SDR: apJb53K3B22MdPpvtvmVTJ06AXnv8IF3da2FrqSac9ZzV2+S3VoIAZ7oS8OL0kLmv7Yub3PijZ
 vBxb0oUF3iDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="521618605"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2021 07:37:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4E53A17E; Tue, 13 Apr 2021 17:38:10 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>, wsa@kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/4] i2c: mpc: Drop duplicate message from devm_platform_ioremap_resource()
Date:   Tue, 13 Apr 2021 17:37:56 +0300
Message-Id: <20210413143756.60138-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413143756.60138-1-andriy.shevchenko@linux.intel.com>
References: <20210413143756.60138-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

devm_platform_ioremap_resource() prints a message in case of error.
Drop custom one.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mpc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index ec9d7d93e80f..684a8cd17efd 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -664,10 +664,8 @@ static int fsl_i2c_probe(struct platform_device *op)
 	init_waitqueue_head(&i2c->queue);
 
 	i2c->base = devm_platform_ioremap_resource(op, 0);
-	if (IS_ERR(i2c->base)) {
-		dev_err(i2c->dev, "failed to map controller\n");
+	if (IS_ERR(i2c->base))
 		return PTR_ERR(i2c->base);
-	}
 
 	i2c->irq = platform_get_irq(op, 0);
 	if (i2c->irq < 0)
-- 
2.30.2

