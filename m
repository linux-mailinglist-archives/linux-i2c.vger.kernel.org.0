Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEDF617C3F
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 13:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiKCMNF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Nov 2022 08:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231479AbiKCMNC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 08:13:02 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE271028
        for <linux-i2c@vger.kernel.org>; Thu,  3 Nov 2022 05:12:57 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N32d46WzHzJnDr;
        Thu,  3 Nov 2022 20:10:00 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 20:12:55 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 20:12:55 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <syniurge@gmail.com>, <shyam-sundar.s-k@amd.com>,
        <Raju.Rangoju@amd.com>, <basavaraj.natikar@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <wsa@kernel.org>,
        <yangyingliang@huawei.com>
Subject: [PATCH -next] i2c: amd-mp2: drop free_irq() of devm_request_irq() allocated irq
Date:   Thu, 3 Nov 2022 20:11:46 +0800
Message-ID: <20221103121146.99836-1-yangyingliang@huawei.com>
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

irq allocated with devm_request_irq() will be freed in devm_irq_release(),
using free_irq() in ->remove() will causes a dangling pointer, and a
subsequent double free. So remove the free_irq() in the error path and
remove path.

Fixes: 969864efae78 ("i2c: amd-mp2: use msix/msi if the hardware supports")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/i2c/busses/i2c-amd-mp2-pci.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
index 143165300949..ef7370d3dbea 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
@@ -327,13 +327,11 @@ static int amd_mp2_pci_init(struct amd_mp2_dev *privdata,
 			      amd_mp2_irq_isr, irq_flag, dev_name(&pci_dev->dev), privdata);
 	if (rc) {
 		pci_err(pci_dev, "Failure requesting irq %i: %d\n", privdata->dev_irq, rc);
-		goto free_irq_vectors;
+		goto err_dma_mask;
 	}
 
 	return rc;
 
-free_irq_vectors:
-	free_irq(privdata->dev_irq, privdata);
 err_dma_mask:
 	pci_clear_master(pci_dev);
 err_pci_enable:
@@ -376,7 +374,6 @@ static void amd_mp2_pci_remove(struct pci_dev *pci_dev)
 	pm_runtime_forbid(&pci_dev->dev);
 	pm_runtime_get_noresume(&pci_dev->dev);
 
-	free_irq(privdata->dev_irq, privdata);
 	pci_clear_master(pci_dev);
 
 	amd_mp2_clear_reg(privdata);
-- 
2.25.1

