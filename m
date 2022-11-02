Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60DA0615AE0
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 04:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbiKBDnD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 23:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbiKBDnB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 23:43:01 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC48F26AD8
        for <linux-i2c@vger.kernel.org>; Tue,  1 Nov 2022 20:42:59 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4N2CQR2ykHz15MJW;
        Wed,  2 Nov 2022 11:42:55 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 11:42:56 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 2 Nov
 2022 11:42:55 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-i2c@vger.kernel.org>
CC:     Yang Yingliang <yangyingliang@huawei.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] Documentation: devres: add missing I2C helper
Date:   Wed, 2 Nov 2022 11:40:53 +0800
Message-ID: <20221102034053.1708845-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
Cc: Yicong Yang <yangyicong@hisilicon.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dmitry Osipenko <digetx@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 Documentation/driver-api/driver-model/devres.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 853396d19419..ec97261530da 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -280,6 +280,7 @@ GPIO
 
 I2C
   devm_i2c_new_dummy_device()
+  devm_i2c_add_adapter()
 
 IIO
   devm_iio_device_alloc()
-- 
2.25.1

