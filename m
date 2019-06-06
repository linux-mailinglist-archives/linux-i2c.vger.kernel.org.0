Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1416E36BF0
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 07:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbfFFFyo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 01:54:44 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:13063 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFFyn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 01:54:43 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf8aa930000>; Wed, 05 Jun 2019 22:54:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 05 Jun 2019 22:54:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 05 Jun 2019 22:54:42 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Jun
 2019 05:54:41 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 6 Jun 2019 05:54:41 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cf8aa9f0001>; Wed, 05 Jun 2019 22:54:41 -0700
From:   Bitan Biswas <bbiswas@nvidia.com>
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V2] i2c: busses: tegra: Add suspend-resume support
Date:   Wed, 5 Jun 2019 22:54:35 -0700
Message-ID: <1559800475-5446-1-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559800468; bh=Ql18WqF5DlKTmuF9A6ySKjZp8fdZDrnvE3SqNnzlawE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=HrlMr375rplGGrTwZAMBPbEiWKXvAb6on7iK2T+rPQz2OO7AbLocC3HCdyFdgzXw+
         Urc1zmcD/z27n703dwJepbKzj97ru1mcf/YvPubtz2PKRzCaCKQ9ojHu/D7SHcLtEF
         llhlan2uG0/xsmEEOzloW0pXsTpl4Cd0C1qSy8CzOnlC2yGgMYa2BPGnwURUH05RpF
         VOYuYD9Nid5mbrTig/Z2lurtoO0/kP8HBTIuuU6gddbzUm0JT80dOaQZqhIcfGboVq
         3tKXxCJopWv5wnXy+H99CDKPpvLBSLwhCx3mqJczX8bY6AeJLl5DRxOzcuXP/hYWqD
         yTp9HVCc2yahQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Post suspend I2C registers have power on reset values. Before any
transfer initialize I2C registers to prevent I2C transfer timeout
and implement suspend and resume callbacks needed. Fix below errors
post suspend:

1) Tegra I2C transfer timeout during jetson tx2 resume:

[   27.520613] pca953x 1-0074: calling pca953x_resume+0x0/0x1b0 @ 2939, parent: i2c-1
[   27.633623] tegra-i2c 3160000.i2c: i2c transfer timed out
[   27.639162] pca953x 1-0074: Unable to sync registers 0x3-0x5. -110
[   27.645336] pca953x 1-0074: Failed to sync GPIO dir registers: -110
[   27.651596] PM: dpm_run_callback(): pca953x_resume+0x0/0x1b0 returns -110
[   27.658375] pca953x 1-0074: pca953x_resume+0x0/0x1b0 returned -110 after 127152 usecs
[   27.666194] PM: Device 1-0074 failed to resume: error -110

2) Tegra I2C transfer timeout error on jetson Xavier post resume.

Remove i2c bus lock-unlock calls in resume callback as i2c_mark_adapter_*
(suspended-resumed) help ensure i2c core calls from client are not
executed before i2c-tegra resume.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index ebaa78d..76b7926 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1687,7 +1687,30 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM_SLEEP
+static int tegra_i2c_suspend(struct device *dev)
+{
+	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
+
+	i2c_mark_adapter_suspended(&i2c_dev->adapter);
+
+	return 0;
+}
+
+static int tegra_i2c_resume(struct device *dev)
+{
+	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = tegra_i2c_init(i2c_dev, false);
+	if (ret)
+		return ret;
+
+	i2c_mark_adapter_resumed(&i2c_dev->adapter);
+	return 0;
+}
+
 static const struct dev_pm_ops tegra_i2c_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend, tegra_i2c_resume)
 	SET_RUNTIME_PM_OPS(tegra_i2c_runtime_suspend, tegra_i2c_runtime_resume,
 			   NULL)
 };
-- 
2.7.4

