Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 328CD383C9
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 07:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfFGFhz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 01:37:55 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:5698 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725772AbfFGFhz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 01:37:55 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf9f8300000>; Thu, 06 Jun 2019 22:37:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 06 Jun 2019 22:37:54 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 06 Jun 2019 22:37:54 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 05:37:54 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 05:37:54 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 7 Jun 2019 05:37:53 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cf9f82e0000>; Thu, 06 Jun 2019 22:37:53 -0700
From:   Bitan Biswas <bbiswas@nvidia.com>
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>,
        "Bitan Biswas" <bbiswas@nvidia.com>
Subject: [PATCH V3] i2c: busses: tegra: Add suspend-resume support
Date:   Thu, 6 Jun 2019 22:37:47 -0700
Message-ID: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559885872; bh=lradURPIF8NVqpsjNzVcQeBNJXNwJ8oAGPuiXA8KFuA=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=pWM8R+X3XP03BDpAARq4mr4lqMCBp5A1EJMy+8dM8R2difViMjqMo1jwNUfCy2yxw
         zsguWB588FIcl0EdbIyCZUtvKXzFaDZvqEW2gertxCeIuY8w0RWPkCjZ9wjZcZ6sjt
         763t09KTvrpbT1a+zjd7GTXzQAkwuaG2CC1RtYOOXHSjYNJFYv0HcNqu4iqtnPsYw8
         bhXiUUVUe4qBCB2QMdQRo3bxWry6SzHAzkkid7olVKw6r+lAl/cf/DZKZnx8wmfw6/
         pLW4zcwPjF/5vV1bco72zmznTG+XYV5Ri28u2dpaq/msEIJUb/Odxxcq8OBSV4OQe5
         FR4DmW+2j9f7w==
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
 drivers/i2c/busses/i2c-tegra.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index ebaa78d..1dbba39 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1687,7 +1687,31 @@ static int tegra_i2c_remove(struct platform_device *pdev)
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
+	int err;
+
+	err = tegra_i2c_init(i2c_dev, false);
+	if (err)
+		return err;
+
+	i2c_mark_adapter_resumed(&i2c_dev->adapter);
+
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

