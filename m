Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15E8460C1E2
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 04:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbiJYCsW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 22:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbiJYCsV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 22:48:21 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35689FF225;
        Mon, 24 Oct 2022 19:48:20 -0700 (PDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MxGTd0f3PzVj0Z;
        Tue, 25 Oct 2022 10:43:33 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 25 Oct 2022 10:48:18 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 25 Oct 2022 10:48:18 +0800
From:   Chen Zhongjin <chenzhongjin@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <jdelvare@suse.com>, <wsa@kernel.org>, <chenzhongjin@huawei.com>
Subject: [PATCH] i2c: piix4: Fix adapter not be removed in piix4_remove()
Date:   Tue, 25 Oct 2022 10:44:56 +0800
Message-ID: <20221025024456.110090-1-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In piix4_probe(), the piix4 adapter will be registered in:

   piix4_probe()
     piix4_add_adapters_sb800() / piix4_add_adapter()
       i2c_add_adapter()

Based on the probed device type, piix4_add_adapters_sb800() or single
piix4_add_adapter() will be called.
For the former case, piix4_adapter_count is set as the number of adapters,
while for antoher case it is not set and kept default *zero*.

When piix4 is removed, piix4_remove() removes the adapters added in
piix4_probe(), basing on the piix4_adapter_count value.
Because the count is zero for the single adapter case, the adapter won't
be removed and makes the sources allocated for adapter leaked, such as
the i2c client and device.

These sources can still be accessed by i2c or bus and cause problems.
An easily reproduced case is that if a new adapter is registered, i2c
will get the leaked adapter and try to call smbus_algorithm, which was
already freed:

Triggered by: rmmod i2c_piix4 & modprobe max31730

 BUG: unable to handle page fault for address: ffffffffc053d860
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 Oops: 0000 [#1] PREEMPT SMP KASAN
 CPU: 0 PID: 3752 Comm: modprobe Tainted: G
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
 RIP: 0010:i2c_default_probe (drivers/i2c/i2c-core-base.c:2259) i2c_core
 RSP: 0018:ffff888107477710 EFLAGS: 00000246
 ...
 <TASK>
  i2c_detect (drivers/i2c/i2c-core-base.c:2302) i2c_core
  __process_new_driver (drivers/i2c/i2c-core-base.c:1336) i2c_core
  bus_for_each_dev (drivers/base/bus.c:301)
  i2c_for_each_dev (drivers/i2c/i2c-core-base.c:1823) i2c_core
  i2c_register_driver (drivers/i2c/i2c-core-base.c:1861) i2c_core
  do_one_initcall (init/main.c:1296)
  do_init_module (kernel/module/main.c:2455)
  ...
 </TASK>
 ---[ end trace 0000000000000000 ]---

Fix this problem by correctly set piix4_adapter_count for the single
adapter path so the adapter can be normally removed in piix4_remove().

Fixes: 528d53a1592b ("i2c: piix4: Fix probing of reserved ports on AMD Family 16h Model 30h")
Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 drivers/i2c/busses/i2c-piix4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 39cb1b7bb865..125646fd36dc 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -1080,6 +1080,7 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 					   "", &piix4_main_adapters[0]);
 		if (retval < 0)
 			return retval;
+		piix4_adapter_count++;
 	}
 
 	/* Check for auxiliary SMBus on some AMD chipsets */
-- 
2.17.1

