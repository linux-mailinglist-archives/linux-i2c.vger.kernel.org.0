Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930AE22AED9
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 14:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbgGWMTL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 08:19:11 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:19162 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgGWMTK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 08:19:10 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f197fc40000>; Thu, 23 Jul 2020 05:17:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 Jul 2020 05:19:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 Jul 2020 05:19:10 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jul
 2020 12:19:09 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 23 Jul 2020 12:19:09 +0000
Received: from kyarlagadda-linux.nvidia.com (Not Verified[10.19.64.169]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f19803a0003>; Thu, 23 Jul 2020 05:19:09 -0700
From:   Krishna Yarlagadda <kyarlagadda@nvidia.com>
To:     <digetx@gmail.com>, <linux-i2c@vger.kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ldewangan@nvidia.com>,
        <smohammed@nvidia.com>, <rgumasta@nvidia.com>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [PATCH 2/7] i2c: tegra: Fix setting of controller ID
Date:   Thu, 23 Jul 2020 17:48:48 +0530
Message-ID: <1595506733-10307-2-git-send-email-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595506628; bh=dsjnuZOTtQt5TvQcOndJuqUXWxDoWmm74K7vWSQWQx0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=i5H4s+qvPEYh8/QWROqjl8QOSLkP6Gqz7k8JpCZ8E6DziSbMGY3pHC4cSlmanpk3E
         RdHQ7reA2vv02xY7N6k9t/HjnOHB7qrKgB5wtR0hYHO1tmGjUX68oYGl98fWELGtCt
         w7ROlpaiOotZYcSEr6UzMdSswK9NIp1c3JKlkwnlCa03IrDqmxJpHzOnQ/0krY/MlQ
         K1Uxfn2rqtCjXwSLsS+fun7XK0HceIEr1eamXaT61L4O1807tTg94Teiauz6PfbBXn
         0xYUtgX24wtLl/CMJ84Nv9k1MgaC8Kw4CV8SaazUukCgtPyI6yA1Y1DkvqxIIf1jhI
         PvscGed9V1XDg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Shardar Shariff Md <smohammed@nvidia.com>

Assign controller id with adapter number as it (cont_id) is passed
through DT(through alias). Mask with controller id mask to avoid
overflow other fields when single device is present and id is -1.

Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c6c870c..a841d6c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -83,6 +83,7 @@
 #define PACKET_HEADER0_CONT_ID			GENMASK(15, 12)
 #define PACKET_HEADER0_PROTOCOL			GENMASK(7, 4)
 #define PACKET_HEADER0_PROTOCOL_I2C		1
+#define PACKET_HEADER0_CONT_ID_MASK		0xF
 
 #define I2C_HEADER_CONT_ON_NAK			BIT(21)
 #define I2C_HEADER_READ				BIT(19)
@@ -1669,7 +1670,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->adapter.retries = 1;
 	i2c_dev->adapter.timeout = 6 * HZ;
 	i2c_dev->irq = irq;
-	i2c_dev->cont_id = pdev->id;
 	i2c_dev->dev = &pdev->dev;
 
 	i2c_dev->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");
@@ -1807,6 +1807,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		goto release_dma;
 
+	i2c_dev->cont_id = i2c_dev->adapter.nr & PACKET_HEADER0_CONT_ID_MASK;
 	pm_runtime_put(&pdev->dev);
 
 	return 0;
-- 
2.7.4

