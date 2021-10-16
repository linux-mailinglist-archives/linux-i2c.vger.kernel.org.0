Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9AF430137
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Oct 2021 10:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243841AbhJPIug (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Oct 2021 04:50:36 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:51379 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240127AbhJPIug (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Oct 2021 04:50:36 -0400
Received: from pop-os.home ([92.140.161.106])
        by smtp.orange.fr with ESMTPA
        id bfMhmb2HZqYovbfMhmCLAi; Sat, 16 Oct 2021 10:48:28 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 16 Oct 2021 10:48:28 +0200
X-ME-IP: 92.140.161.106
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     rric@kernel.org, jan.glauber@gmail.com, wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] i2c: thunderx: Fix some resource leak
Date:   Sat, 16 Oct 2021 10:48:26 +0200
Message-Id: <6657505309174d3ea6df14169d42b6df91298470.1634374036.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We need to undo a 'pci_request_regions()' call in the error handling path
of the probe function and in the remove function.

Fixes: 22d40209de3b ("i2c: thunderx: Add i2c driver for ThunderX SOC")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index 12c90aa0900e..2d37096a6968 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -177,8 +177,10 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 		return ret;
 
 	i2c->twsi_base = pcim_iomap(pdev, 0, pci_resource_len(pdev, 0));
-	if (!i2c->twsi_base)
-		return -EINVAL;
+	if (!i2c->twsi_base) {
+		ret = -EINVAL;
+		goto err_release_regions;
+	}
 
 	thunder_i2c_clock_enable(dev, i2c);
 	ret = device_property_read_u32(dev, "clock-frequency", &i2c->twsi_freq);
@@ -231,6 +233,8 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 
 error:
 	thunder_i2c_clock_disable(dev, i2c->clk);
+err_release_regions:
+	pci_release_regions(pdev);
 	return ret;
 }
 
@@ -241,6 +245,7 @@ static void thunder_i2c_remove_pci(struct pci_dev *pdev)
 	thunder_i2c_smbus_remove(i2c);
 	thunder_i2c_clock_disable(&pdev->dev, i2c->clk);
 	i2c_del_adapter(&i2c->adap);
+	pci_release_regions(pdev);
 }
 
 static const struct pci_device_id thunder_i2c_pci_id_table[] = {
-- 
2.30.2

