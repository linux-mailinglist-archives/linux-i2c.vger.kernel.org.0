Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2802C26D1
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Nov 2020 14:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387669AbgKXNIz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Nov 2020 08:08:55 -0500
Received: from mail.loongson.cn ([114.242.206.163]:45306 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387752AbgKXNIz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Nov 2020 08:08:55 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxStDUBb1fLf4VAA--.35257S2;
        Tue, 24 Nov 2020 21:08:36 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: busses: Use dma_set_mask_and_coherent
Date:   Tue, 24 Nov 2020 21:08:35 +0800
Message-Id: <1606223315-13390-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxStDUBb1fLf4VAA--.35257S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFW8KFWfJrW8Kw4xAF4Utwb_yoWkCwb_tw
        10qF92gFsYyr90v347KFW5Xr95t3yrZ34DZF1vy3WI9ry3uwsxJa17uFykAF4UZFsrJFya
        g3WvyrZ5ArWjvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb7kYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
        80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
        zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx
        8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW5GwCF04k20xvY
        0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
        0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAI
        cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcV
        CF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
        6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUsw0eDUUUU
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

