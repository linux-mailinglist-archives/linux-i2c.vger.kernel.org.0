Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9FE8FACDB
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2019 10:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbfKMJVp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Nov 2019 04:21:45 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55804 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbfKMJVp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Nov 2019 04:21:45 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAD9LTvd075931;
        Wed, 13 Nov 2019 03:21:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573636889;
        bh=+19M8RYh7GYsqFpm6snFxu0nMiEUH/Wi0M5/3kESkSs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=p5Mn+phnCUr7oKAzu6BweVTNRMWqMooon2KLfcgJZ+f5R12BDIzweW29/GPLGHb57
         kXCl2HVNfP9E/lPKNFlOND+zhc+tIAV3EeZydOtKtFdt9WVMxnX25h1wwMsyGeqM9Y
         nH3mdt+kHGHNvMnK870IKW/sNd14P9YvkauxbzXI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAD9LTXc101484
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 13 Nov 2019 03:21:29 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 13
 Nov 2019 03:21:11 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 13 Nov 2019 03:21:11 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAD9LJ1H056807;
        Wed, 13 Nov 2019 03:21:24 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <ludovic.desroches@microchip.com>, <agross@kernel.org>,
        <wsa+renesas@sang-engineering.com>, <ldewangan@nvidia.com>
CC:     <vkoul@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <digetx@gmail.com>,
        <linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <bjorn.andersson@linaro.org>
Subject: [PATCH 1/4] i2c: at91: Use dma_request_chan() directly for channel request
Date:   Wed, 13 Nov 2019 11:22:32 +0200
Message-ID: <20191113092235.30440-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113092235.30440-1-peter.ujfalusi@ti.com>
References: <20191113092235.30440-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

dma_request_slave_channel_reason() is:
#define dma_request_slave_channel_reason(dev, name) \
	dma_request_chan(dev, name)

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/i2c/busses/i2c-at91-master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index 6e0b554dcd4e..7a862e00b475 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -758,14 +758,14 @@ static int at91_twi_configure_dma(struct at91_twi_dev *dev, u32 phy_addr)
 	slave_config.dst_maxburst = 1;
 	slave_config.device_fc = false;
 
-	dma->chan_tx = dma_request_slave_channel_reason(dev->dev, "tx");
+	dma->chan_tx = dma_request_chan(dev->dev, "tx");
 	if (IS_ERR(dma->chan_tx)) {
 		ret = PTR_ERR(dma->chan_tx);
 		dma->chan_tx = NULL;
 		goto error;
 	}
 
-	dma->chan_rx = dma_request_slave_channel_reason(dev->dev, "rx");
+	dma->chan_rx = dma_request_chan(dev->dev, "rx");
 	if (IS_ERR(dma->chan_rx)) {
 		ret = PTR_ERR(dma->chan_rx);
 		dma->chan_rx = NULL;
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

