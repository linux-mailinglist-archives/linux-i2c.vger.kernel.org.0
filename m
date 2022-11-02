Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED0E616409
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 14:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbiKBNrK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 09:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbiKBNrK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 09:47:10 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF3F2AC7F;
        Wed,  2 Nov 2022 06:47:06 -0700 (PDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4N2SqT4bQkz15Lwh;
        Wed,  2 Nov 2022 21:47:01 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 21:47:04 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 2 Nov
 2022 21:47:04 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-i2c@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC:     <yangyicong@hisilicon.com>, <andriy.shevchenko@linux.intel.com>,
        <digetx@gmail.com>, <wsa@kernel.org>, <corbet@lwn.net>,
        <yangyingliang@huawei.com>
Subject: [PATCH v2] Documentation: devres: add missing I2C helper
Date:   Wed, 2 Nov 2022 21:45:59 +0800
Message-ID: <20221102134559.282716-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add missing devm_i2c_add_adapter() to devres.rst. It's introduced by
commit 07740c92ae57 ("i2c: core: add managed function for adding i2c
adapters").

Fixes: 07740c92ae57 ("i2c: core: add managed function for adding i2c adapters")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Acked-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v1 -> v2:
  Order them alphabetically.
---
 Documentation/driver-api/driver-model/devres.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 853396d19419..0afaabe78fb8 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -279,6 +279,7 @@ GPIO
   devm_gpio_request_one()
 
 I2C
+  devm_i2c_add_adapter()
   devm_i2c_new_dummy_device()
 
 IIO
-- 
2.25.1

