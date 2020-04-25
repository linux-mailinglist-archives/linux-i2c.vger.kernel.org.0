Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3C7F1B899C
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Apr 2020 23:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgDYVi6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Apr 2020 17:38:58 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:57183 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbgDYVi5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Apr 2020 17:38:57 -0400
Received: from localhost.localdomain ([37.4.249.134]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MV6G0-1jajx10av8-00S8Wh; Sat, 25 Apr 2020 23:38:49 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] i2c: brcmstb: Fix handling of optional interrupt
Date:   Sat, 25 Apr 2020 23:38:07 +0200
Message-Id: <1587850687-23675-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:tn0CEj9ZIDplun3FbAeVIJcYPxrDm4mFY4qyezpfYAlSmzz6ppy
 QRILXn3atgNyThnwpLICQW1sGny7tmMFMSHDCS7cTs3lkcUMqqW7M5wr53vHS35c33a8BXL
 4z34oywRAFPzRjdijGkKAwNpGEcfi7ZaVLv16w/2SI5pvQ0oyKJXq7spt02DsbULFcOaWv0
 Zt6rl4wjqKaibsCReH6Bw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TWnPE33LefM=:NNaqyIxuVGA9y2WHf31alT
 r500pBYTd8bO0gHSr2IPU8PnI9jd1aHoBqBD7hSW121gPHIr4h7J0Wrv2fNVhCcLSbWpUPLXY
 vXu6jMv1+x6r3/c9RxZQdbYZZWHkzt6WJ+joqjANI7bQGLDFuq8HnIXBpZz/LXFT/vqexHRGs
 G5cT9/0SIp99p2RxI6v/C+4//pyjbtQ8bsj5P4Fdfd6Npf3vjrlxCeAr6RNjy7VC9aIjfczsO
 xwK2NhKOIA7O29tx95hZUZBgalsGDeGKSW8c0/KFRP+G1b4pj+VMbSu8qlNb3xdYPVBaOlNQM
 mV7E7zpjc8CYNJT3pUyR3JbS3Dmfeu9/iSCbOVDqxwmyUGNdz6EfDiCjVNo62v+tp137nEqS4
 Vuu5WaTM/VF5Hga42yS+bpOYI+8e4C2Z2cI1OTPk3g/OH4hxhtWz/Z7Q+34GxRNFakX4u1iZY
 udeGWA5XQakRtKbgL6m3JdYky8CFj3S9ly5CFtqB7UKOu4cLJb5xAEjGPJULy13pmdo50pB0Q
 YsH+rkZ9FtBD/86kO3UGoawl9jb0Gz2L05/BEUlsVfhBesP3c/Mob8UhVGj6RtaVpGvH/AN27
 PhpQOP9LfV1ZTZ05IUB4RjYf/Y4d9YQ1FX/+JokWkMg9DR/Y97BG0twV2QJLjckYYxFu/yxX6
 mK5mD52JODP5RXfRLD1v4erV274xeXW4mxD7JTZpOjXWEviwZy7FSdnU8uCZDhMH/e7W778j7
 GRBdK8/K0kF5CnxZFN7cu5q2qOmRmxzH3lXr0bb8UDfLITyW3Iz9r7MNkj31pRVnKsuLTDMeA
 PbH6w6hPERMU8zqqg+eSuloMZ+ito/yqOOiOLOX29B7Fq3H2nFdQJaLphxlGWr7O5auFlhn
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

If there is no interrupt defined then an error is logged due
to the use of platform_get_irq. The driver handles not having
the interrupt by falling back to polling, therefore make
the appropriate call when claiming it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/i2c/busses/i2c-brcmstb.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index 169a283..d4e0a0f 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -647,20 +647,22 @@ static int brcmstb_i2c_probe(struct platform_device *pdev)
 		int_name = NULL;
 
 	/* Get the interrupt number */
-	dev->irq = platform_get_irq(pdev, 0);
+	dev->irq = platform_get_irq_optional(pdev, 0);
 
 	/* disable the bsc interrupt line */
 	brcmstb_i2c_enable_disable_irq(dev, INT_DISABLE);
 
 	/* register the ISR handler */
-	rc = devm_request_irq(&pdev->dev, dev->irq, brcmstb_i2c_isr,
-			      IRQF_SHARED,
-			      int_name ? int_name : pdev->name,
-			      dev);
-
-	if (rc) {
-		dev_dbg(dev->device, "falling back to polling mode");
-		dev->irq = -1;
+	if (dev->irq >= 0) {
+		rc = devm_request_irq(&pdev->dev, dev->irq, brcmstb_i2c_isr,
+				      IRQF_SHARED,
+				      int_name ? int_name : pdev->name,
+				      dev);
+
+		if (rc) {
+			dev_dbg(dev->device, "falling back to polling mode");
+			dev->irq = -1;
+		}
 	}
 
 	if (of_property_read_u32(dev->device->of_node,
-- 
2.7.4

