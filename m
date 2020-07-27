Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3702322FA7E
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 22:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgG0Uvz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 16:51:55 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9067 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbgG0Uvy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jul 2020 16:51:54 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1f3e5c0000>; Mon, 27 Jul 2020 13:51:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 27 Jul 2020 13:51:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 27 Jul 2020 13:51:53 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:51:53 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 27 Jul 2020 20:51:53 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.236]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f1f3e680003>; Mon, 27 Jul 2020 13:51:53 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v5 05/14] i2c: tegra: Avoid tegra_i2c_init_dma() for Tegra210 vi i2c
Date:   Mon, 27 Jul 2020 13:57:23 -0700
Message-ID: <1595883452-17343-6-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595883100; bh=BMA/iG9RTUEd5/zUo8Vr5bcj5BAWPvKwkFECh1c8kbY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Vm4bseEOhBXlmHuGTHvTM+6gHWj51y/yeUvD6TKm0OY+eBExPSLvCmsOJZUYFpRSl
         gt4/bPkyhR1Yju+bQBoiCQaGMn3ptgoRR3jaW22oV7CmyFbrwWFlMu6URP7XrhAvmX
         RJ1fhE8izr0+eVNZqYi1xL8BsNIWXmFXa7926STvhe0o73MtBa51Q9RIABQoUr+Zkk
         AJMjMEW8Z2pXv7ovwk9oqAGZHaTGIm5YPHkgYQ9tvPraB6NkjUuGmX+pjo9TErdM83
         FVJy3S3tntyECy1pQFbBAWl+s3AQROkFNCEGAF5UAzmCyKcZRubdisWrQii+t9aUAX
         Ay2+Wq0Hli01A==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VI I2C is on host1x bus so APB DMA can't be used for Tegra210 VI
I2C and there are no tx and rx dma channels for VI I2C.

So, avoid attempt of requesting DMA channels.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1bf3666..00d3e4d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -421,7 +421,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	dma_addr_t dma_phys;
 	int err;
 
-	if (!i2c_dev->hw->has_apb_dma)
+	if (!i2c_dev->hw->has_apb_dma || i2c_dev->is_vi)
 		return 0;
 
 	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
-- 
2.7.4

