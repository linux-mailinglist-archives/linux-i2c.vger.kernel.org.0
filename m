Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 353102F74B
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2019 07:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfE3Fz0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 May 2019 01:55:26 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15712 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfE3Fz0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 May 2019 01:55:26 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cef704c0000>; Wed, 29 May 2019 22:55:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 29 May 2019 22:55:25 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 29 May 2019 22:55:25 -0700
Received: from HQMAIL102.nvidia.com (172.18.146.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 May
 2019 05:55:25 +0000
Received: from HQMAIL103.nvidia.com (172.20.187.11) by HQMAIL102.nvidia.com
 (172.18.146.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 May
 2019 05:55:24 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 30 May 2019 05:55:24 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cef704a0001>; Wed, 29 May 2019 22:55:24 -0700
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
Subject: [PATCH V1] i2c: busses: tegra: Add suspend-resume support
Date:   Wed, 29 May 2019 22:55:18 -0700
Message-ID: <1559195718-6693-1-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559195725; bh=EPpj67COYGBhlkWdKr0QIR/atWxow2EbLdfTiuxH0u4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=dtfcl42/jEs/OXvHlq4hBtfPuB3IDVKkqtZfI4Ftr9JxH50H7V46TkhmITkqasE+E
         pMufthNmo6PssZsCRY5rvx/8QcH9rcpJ/epYtgsDMj0doWmg6AAsCUBsRlBCDFmplG
         5fXvPLY9I/+cBh6tIp3EGJk58ZXMJExWnnrLKL6uEcCQaeCWmF7jA6PJCJHvjIywTA
         QIrbwOzpguAeDvEWbnCXvZp2oPjrCwUytpZPHkQ5bJgSO1pCMGZ70vLOm7E3ZR7bHr
         mu96qnxP/IP0iVYnk4iS2DC9WhpnEQJuHydfF+SAWOPMDbLk2O2tJYe5GdMYBZcvwn
         w6xC3/2wOx7hw==
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

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index ebaa78d..f6a377f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1687,9 +1687,33 @@ static int tegra_i2c_remove(struct platform_device *pdev)
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
+	i2c_lock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
+	ret = tegra_i2c_init(i2c_dev, false);
+	i2c_unlock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
+	if (!ret)
+		i2c_mark_adapter_resumed(&i2c_dev->adapter);
+
+       return ret;
+}
+
 static const struct dev_pm_ops tegra_i2c_pm = {
 	SET_RUNTIME_PM_OPS(tegra_i2c_runtime_suspend, tegra_i2c_runtime_resume,
 			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend, tegra_i2c_resume)
 };
 #define TEGRA_I2C_PM	(&tegra_i2c_pm)
 #else
-- 
2.7.4

