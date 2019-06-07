Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1CA638977
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 13:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbfFGLzU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 07:55:20 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17385 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727047AbfFGLzT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 07:55:19 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfa50a60002>; Fri, 07 Jun 2019 04:55:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Jun 2019 04:55:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Jun 2019 04:55:18 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 11:55:18 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 7 Jun 2019 11:55:18 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cfa50a30001>; Fri, 07 Jun 2019 04:55:18 -0700
From:   Bitan Biswas <bbiswas@nvidia.com>
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V1 2/6] i2c: tegra: remove unnecessary variable init
Date:   Fri, 7 Jun 2019 04:55:03 -0700
Message-ID: <1559908507-31192-2-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559908507-31192-1-git-send-email-bbiswas@nvidia.com>
References: <1559908507-31192-1-git-send-email-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559908518; bh=bIs4t6pG7C8b9YdTHwvLImnfaMYMUPpnRc4mS4FXXGI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Oe1yWBc9ElCQV6wDY6dW0P2ryDz4yT6Yz/4IDgNc4f7qsL7FL0MV+mDJdLnB657/n
         a+d20Ya4scqoT9VsWBkdTR3Oz+7yhnlJVAmso725q8kSXJxojGvwpnBbM/9JQYaK1n
         6bWgSUYT0Cc2XSpJ2rlaryVoS7wXxHsjg4SFaR0jH8vhg2O2lU7NdTyMe0otlUd+Th
         9GrdD4AWxGUN0towhKp5EoaR+uQJKNvrtAG+O6MgyxO63q8GL0h83GqGpQd4l4rRAG
         d5gRPMWwWKkAvLSMok5eCUu8C6DJ1dpGwyBw0ue77mYRb1OjI2+hDp6AY/b2EqXxUE
         aGeMakooFRA4A==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove variable initializations in functions that
are followed by assignments before use

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 00692d8..f7116b7 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -689,7 +689,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 	u32 val;
 	int err;
 	u32 clk_divisor, clk_multiplier;
-	u32 tsu_thd = 0;
+	u32 tsu_thd;
 	u8 tlow, thigh;
 
 	err = pm_runtime_get_sync(i2c_dev->dev);
@@ -1218,7 +1218,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	int i;
-	int ret = 0;
+	int ret;
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
 	if (ret < 0) {
@@ -1489,7 +1489,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	void __iomem *base;
 	phys_addr_t base_phys;
 	int irq;
-	int ret = 0;
+	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base_phys = res->start;
-- 
2.7.4

