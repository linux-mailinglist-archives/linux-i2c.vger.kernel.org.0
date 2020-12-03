Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17CC2CCFD8
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 07:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgLCGvn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 01:51:43 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59368 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726226AbgLCGvm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Dec 2020 01:51:42 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx73_MishfHlQZAA--.41237S2;
        Thu, 03 Dec 2020 14:50:52 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: ismt: Use dma_set_mask_and_coherent
Date:   Thu,  3 Dec 2020 14:50:52 +0800
Message-Id: <1606978252-26169-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx73_MishfHlQZAA--.41237S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4DXw4DAw17CF13XrWfAFb_yoW8Gr43pw
        1UGasIk3yIg3WFqa45Aws5Z345Kws5Was8tFW7K3WfCayYyr4ktrn7AFy7KF18JF92krW3
        Z3yDtF4FgF15C37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_GF1l42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2
        IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
        6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
        IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280
        aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
        ZEXa7IU0yKZJUUUUU==
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---

v3: Fix build errors of incompatible pointer types.

 drivers/i2c/busses/i2c-ismt.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
index a35a27c..88f6039 100644
--- a/drivers/i2c/busses/i2c-ismt.c
+++ b/drivers/i2c/busses/i2c-ismt.c
@@ -903,16 +903,12 @@ ismt_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return -ENODEV;
 	}
 
-	if ((pci_set_dma_mask(pdev, DMA_BIT_MASK(64)) != 0) ||
-	    (pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64)) != 0)) {
-		if ((pci_set_dma_mask(pdev, DMA_BIT_MASK(32)) != 0) ||
-		    (pci_set_consistent_dma_mask(pdev,
-						 DMA_BIT_MASK(32)) != 0)) {
-			dev_err(&pdev->dev, "pci_set_dma_mask fail %p\n",
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64)) != 0)
+		if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32)) != 0) {
+			dev_err(&pdev->dev, "dma_set_mask_and_coherent fail %p\n",
 				pdev);
 			return -ENODEV;
 		}
-	}
 
 	err = ismt_dev_init(priv);
 	if (err)
-- 
2.1.0

