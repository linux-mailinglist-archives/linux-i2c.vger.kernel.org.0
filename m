Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 728294FC3CE
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Apr 2022 20:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349050AbiDKSKP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Apr 2022 14:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbiDKSKO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Apr 2022 14:10:14 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80EF2B183;
        Mon, 11 Apr 2022 11:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649700479; x=1681236479;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=etbDmp0HEg236kvaE9ytGyeBfa0w1hXztgiz7DlpaKU=;
  b=ANvNFgXqy8WLjtEnQt6k1gOTt5eMr5il26p7+7VESMIlRAxZWaNHkekd
   pFzLfBGLeCJdrisrkqGwZ6MIZAFwzaWfRApRmPnfN4fopF4DORarcm/I6
   Tq+pIw0Aa5diYRNZuraft8+QX3VcWIoggGnrQ6eK9P2untOwy4YebsnDx
   fLgYeW3FnXxUENLI2AYMh3dQ6pytwNCbLT78Zj6oDfkx5D5qf0fcsXy9s
   Y8SWAFHrdnqfHDJoam3CCELWM/+TCoi656THQ6CJ+3N5zIS3anuGTA0fX
   YwSi2P4zPK3lj3ZcrlINWOQrxLGHZttgLh9cWCps8ujrCqsDV/x+nSsPp
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="322625775"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="322625775"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 11:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="572321674"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 11 Apr 2022 11:07:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3E15C120; Mon, 11 Apr 2022 21:07:57 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jakub Kicinski <kuba@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] i2c: dev: Force case user pointers in compat_i2cdev_ioctl()
Date:   Mon, 11 Apr 2022 21:07:52 +0300
Message-Id: <20220411180752.36920-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411180752.36920-1-andriy.shevchenko@linux.intel.com>
References: <20220411180752.36920-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sparse has warned us about wrong address space for user pointers:

  i2c-dev.c:561:50: warning: incorrect type in initializer (different address spaces)
  i2c-dev.c:561:50:    expected unsigned char [usertype] *buf
  i2c-dev.c:561:50:    got void [noderef] __user *

Force cast the pointer to (__u8 *) that is used by I²C core code.

Note, this is an additional fix to the previously addressed similar issue
in the I2C_RDWR case in the same function.

Fixes: 3265a7e6b41b ("i2c: dev: Add __user annotation")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index 6fd2b6718b08..ab0adaa130da 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -557,7 +557,7 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 				.addr = umsg.addr,
 				.flags = umsg.flags,
 				.len = umsg.len,
-				.buf = compat_ptr(umsg.buf)
+				.buf = (__force __u8 *)compat_ptr(umsg.buf),
 			};
 		}
 
-- 
2.35.1

