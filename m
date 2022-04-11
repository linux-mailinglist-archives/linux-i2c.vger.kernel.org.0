Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E83E74FC3CF
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Apr 2022 20:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349053AbiDKSKQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Apr 2022 14:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349049AbiDKSKP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Apr 2022 14:10:15 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807B537A87;
        Mon, 11 Apr 2022 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649700480; x=1681236480;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YUx+7TS3T7WKp9bH0u+RWM0zj399AI31rwxf9iB4yJU=;
  b=gYj52TCeUaYHJ3+bGTqJeWM9k8sv/Cy0sIZjkynO8ogngoZicXW3Agp7
   +/9aBy3KC7g4SNH64RbdzIzUhkd2Y+zXcXiARuJerSmXrihagLpwsbgxT
   1h2pFLbufLOGKrxyHa6QMHB3+VFgba3gs3rSQQ5Hs5RgOXiNIp+HFgbnG
   jdiED7eLYGdGLtL7PUx7BjwKZWlhhOHpSedTF+ceLqCrKr9+znpaaQEfd
   Z4S5w9TNQI+ZQalEElbODBrlSHyQGvmuuHYUk2+aZPu2wIS+j7MhJ0g4p
   9C+2Fag0r1asCXeEMt2po9sE2D6mc71R+fVGR2imDykwTJmaRgnnIsKFk
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="322625777"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="322625777"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 11:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="654732505"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2022 11:07:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 350DA144; Mon, 11 Apr 2022 21:07:56 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jakub Kicinski <kuba@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] i2c: dev: check return value when calling dev_set_name()
Date:   Mon, 11 Apr 2022 21:07:51 +0300
Message-Id: <20220411180752.36920-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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

If dev_set_name() fails, the dev_name() is null, check the return
value of dev_set_name() to avoid the null-ptr-deref.

Fixes: 1413ef638aba ("i2c: dev: Fix the race between the release of i2c_dev and cdev")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-dev.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index cf5d049342ea..6fd2b6718b08 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -668,16 +668,21 @@ static int i2cdev_attach_adapter(struct device *dev, void *dummy)
 	i2c_dev->dev.class = i2c_dev_class;
 	i2c_dev->dev.parent = &adap->dev;
 	i2c_dev->dev.release = i2cdev_dev_release;
-	dev_set_name(&i2c_dev->dev, "i2c-%d", adap->nr);
+
+	res = dev_set_name(&i2c_dev->dev, "i2c-%d", adap->nr);
+	if (res)
+		goto err_put_i2c_dev;
 
 	res = cdev_device_add(&i2c_dev->cdev, &i2c_dev->dev);
-	if (res) {
-		put_i2c_dev(i2c_dev, false);
-		return res;
-	}
+	if (res)
+		goto err_put_i2c_dev;
 
 	pr_debug("adapter [%s] registered as minor %d\n", adap->name, adap->nr);
 	return 0;
+
+err_put_i2c_dev:
+	put_i2c_dev(i2c_dev, false);
+	return res;
 }
 
 static int i2cdev_detach_adapter(struct device *dev, void *dummy)
-- 
2.35.1

