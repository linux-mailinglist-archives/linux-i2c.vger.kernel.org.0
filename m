Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55F25FACD5
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2019 10:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfKMJV4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Nov 2019 04:21:56 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35492 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbfKMJVu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Nov 2019 04:21:50 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAD9Lbln079247;
        Wed, 13 Nov 2019 03:21:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573636897;
        bh=VPZmHplZXQZ63+NkFCd+Yo8MCd9uce4y78zsUpDF3q0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=pqvRvrFDAn6U6jgLejHtmCgeFVlxGkxaQpkuv5y2B2Roj2nwta5KMyqKYij3HJL62
         +bYYgSJnae2wBe/b2SgckTaEYgBp97kGa/OcOiIS3jLenUTLJ2pZKrfM+zS2xrYKVF
         w31wISgLz7Gh+q+Nv/yNwOWdp5BVuI9gIVt1Wz4g=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAD9LbQm101641
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 13 Nov 2019 03:21:37 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 13
 Nov 2019 03:21:19 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 13 Nov 2019 03:21:19 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAD9LJ1J056807;
        Wed, 13 Nov 2019 03:21:33 -0600
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
Subject: [PATCH 3/4] i2c: sh_mobile: Use dma_request_chan() directly for channel request
Date:   Wed, 13 Nov 2019 11:22:34 +0200
Message-ID: <20191113092235.30440-4-peter.ujfalusi@ti.com>
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
 drivers/i2c/busses/i2c-sh_mobile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 8777af4c695e..82b3b795e0bd 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -486,7 +486,7 @@ static struct dma_chan *sh_mobile_i2c_request_dma_chan(struct device *dev,
 	char *chan_name = dir == DMA_MEM_TO_DEV ? "tx" : "rx";
 	int ret;
 
-	chan = dma_request_slave_channel_reason(dev, chan_name);
+	chan = dma_request_chan(dev, chan_name);
 	if (IS_ERR(chan)) {
 		dev_dbg(dev, "request_channel failed for %s (%ld)\n", chan_name,
 			PTR_ERR(chan));
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

