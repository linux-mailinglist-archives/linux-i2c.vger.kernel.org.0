Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDD53BA5E
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 19:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387579AbfFJRIs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 13:08:48 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:13192 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfFJRIr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 13:08:47 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfe8e9f0000>; Mon, 10 Jun 2019 10:08:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 10 Jun 2019 10:08:46 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 10 Jun 2019 10:08:46 -0700
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Jun
 2019 17:08:46 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 10 Jun 2019 17:08:46 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cfe8e9b0001>; Mon, 10 Jun 2019 10:08:46 -0700
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
Subject: [PATCH V4 2/6] i2c: tegra: remove unnecessary variable init
Date:   Mon, 10 Jun 2019 10:08:31 -0700
Message-ID: <1560186515-30797-2-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
References: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560186527; bh=XYTp22GPT3LhHXj00jg3jwzFkyK0+QPueRkDH3BlZZQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=SgI/PVGoQ1zqgJLrIVlmdNc5/3DgUU3flNgAdQFEXU3R20jmtmrgytMPxF3P3LT/b
         HCl+Yg8ScQscF+3KOkDrzLyIXBmQQCbye89b2rf0WguIV3U+4DiSmEg26q3sKzMg0g
         TUpB7i7kgm0tYdhpU/mQpykEBCobRI2RlGVGnIig7j1GH5gyRRALTQcdSDhUCuTqhI
         SHwFEWOvuqukCaNfzAaSH59GcIo4nGvdOGj3i3+MHr8EbBHNFZdjPfl422HKOanrGw
         UK4vqgGzjM9TqCFUQ7mjDi7aD20bsw/zx7QYwkDQY24SjeizbWFqJeV7eXcjJxg0to
         UsF1fBICT/TmQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove variable initializations in functions that
are followed by assignments before use

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
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

