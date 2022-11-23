Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA327635116
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 08:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235505AbiKWH3X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 02:29:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235343AbiKWH3W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 02:29:22 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30476532E3;
        Tue, 22 Nov 2022 23:29:19 -0800 (PST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NHCMQ0XB8zqSVt;
        Wed, 23 Nov 2022 15:25:22 +0800 (CST)
Received: from huawei.com (10.67.175.21) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 23 Nov
 2022 15:29:16 +0800
From:   Li Zetao <lizetao1@huawei.com>
To:     <wsa@kernel.org>, <gregkh@suse.de>, <khali@linux-fr.org>
CC:     <lizetao1@huawei.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] i2c: core: Fix possible memleak in i2c_register_adapter()
Date:   Wed, 23 Nov 2022 16:16:43 +0800
Message-ID: <20221123081643.713184-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.175.21]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I got memory leak as follows when doing fault injection test:

unreferenced object 0xffff88818be6dcb8 (size 8):
  comm "modprobe", pid 1022129, jiffies 4363911608 (age 43.838s)
    hex dump (first 8 bytes):
      69 32 63 2d 30 00 6b a5                          i2c-0.k.
    backtrace:
      [<ffffffff812f588f>] __kmem_cache_alloc_node+0x2cf/0x4b0
      [<ffffffff81283c43>] __kmalloc_node_track_caller+0x53/0x140
      [<ffffffff81604b0a>] kvasprintf+0x6a/0xd0
      [<ffffffff81604be7>] kvasprintf_const+0x77/0xa0
      [<ffffffff81a00173>] kobject_set_name_vargs+0x23/0x90
      [<ffffffff817bf743>] dev_set_name+0x53/0x70
      [<ffffffffa023ebb2>] i2c_register_adapter+0x112/0x6c0 [i2c_core]
      [<ffffffffa023f268>] i2c_add_adapter+0x78/0xc0 [i2c_core]
      [<ffffffffa0300182>] piix4_add_adapter+0x132/0x210 [i2c_piix4]
      [<ffffffffa0300535>] piix4_probe+0x2d5/0x5f4 [i2c_piix4]
      [<ffffffff816c5da2>] pci_device_probe+0xb2/0x180
      [<ffffffff817c769f>] really_probe+0xff/0x380
      [<ffffffff817c79aa>] __driver_probe_device+0x8a/0x190
      [<ffffffff817c7b33>] driver_probe_device+0x23/0xb0
      [<ffffffff817c80a3>] __driver_attach+0xd3/0x1b0
      [<ffffffff817c4ede>] bus_for_each_dev+0x7e/0xd0

The root cause was traced to an error handing path in
i2c_register_adapter() when device_register() fails. After
calling dev_set_name() which called by i2c_register_adapter(),
the put_device() should be used to give up the device reference
in error handling path in order to free "kobj->name" alloced
in dev_set_name().

Fix it by calling put_device() when device_register() fails in
i2c_register_adapter(). In addition, when i2c_adapter device
is released, i2c_adapter_dev_release() is called, in which
"dev_released" must be initialized, otherwise a kernel bug
will be triggered.

Fixes: b119c6c952a0 ("i2c: __must_check fixes (core drivers)")
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/i2c/i2c-core-base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5dcea9f1deab..ef85e58533e2 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1472,6 +1472,9 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	res = device_register(&adap->dev);
 	if (res) {
 		pr_err("adapter '%s': can't register device (%d)\n", adap->name, res);
+		init_completion(&adap->dev_released);
+		put_device(&adap->dev);
+		wait_for_completion(&adap->dev_released);
 		goto out_list;
 	}
 
-- 
2.25.1

