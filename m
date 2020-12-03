Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A24EE2CCB5C
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 02:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbgLCBCS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 20:02:18 -0500
Received: from mail.loongson.cn ([114.242.206.163]:36546 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727384AbgLCBCS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 20:02:18 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx73_qOMhfRz0ZAA--.41109S2;
        Thu, 03 Dec 2020 09:01:31 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Neil Horman <nhorman@tuxdriver.com>,
        Seth Heasley <seth.heasley@intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: ismt: Use dma_set_mask_and_coherent
Date:   Thu,  3 Dec 2020 09:01:30 +0800
Message-Id: <1606957290-15260-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx73_qOMhfRz0ZAA--.41109S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFW8KFWfJrW8Kw4xAF4Utwb_yoWkCwb_tw
        10qF92gFsYyr90v347KFW5Xr95t3yrZ34DZF1vy3WI9ry3uwsxJa17uFykAF4UZFsrJFya
        g3WvyrZ5ArWjvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb7kYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z2
        80aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_KwCF04k20xvY
        0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
        0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAI
        cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
        CF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
        6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcZqXDUUUU
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 drivers/i2c/busses/i2c-ismt.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
index a35a27c..5f49830 100644
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
+	if (dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(64)) != 0)
+		if (dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(32)) != 0) {
 			dev_err(&pdev->dev, "pci_set_dma_mask fail %p\n",
 				pdev);
 			return -ENODEV;
 		}
-	}
 
 	err = ismt_dev_init(priv);
 	if (err)
-- 
2.1.0

