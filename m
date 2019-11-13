Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDA8FACCA
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2019 10:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727361AbfKMJVu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Nov 2019 04:21:50 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35486 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbfKMJVt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Nov 2019 04:21:49 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAD9LZs3079237;
        Wed, 13 Nov 2019 03:21:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573636895;
        bh=u9PBpBJyuGK+Y9fwrD9P1uFBRg8ej0bM51sYHD9zJ2E=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ALGUoxWgKCXgCLEsn3aHZeuFbbwtQWHDyd/ghPP5gZ8BMc7pC9DRdQgbnVOYgswGl
         3kkNMeIlfbrMzqFRnChnmGYxq7rCVt7tZf8FvaJLPLhRHo7tC6dZgADnxWtwDKVxZj
         Z/5nlusqlzBhPELltJbxAjA1PVUq5JQJYJMXpqe0=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAD9LZvs030499;
        Wed, 13 Nov 2019 03:21:35 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 13
 Nov 2019 03:21:15 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 13 Nov 2019 03:21:15 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAD9LJ1I056807;
        Wed, 13 Nov 2019 03:21:29 -0600
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
Subject: [PATCH 2/4] i2c: qup: Use dma_request_chan() directly for channel request
Date:   Wed, 13 Nov 2019 11:22:33 +0200
Message-ID: <20191113092235.30440-3-peter.ujfalusi@ti.com>
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
 drivers/i2c/busses/i2c-qup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index e09cd0775ae9..2d7dabe12723 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -628,7 +628,7 @@ static int qup_i2c_req_dma(struct qup_i2c_dev *qup)
 	int err;
 
 	if (!qup->btx.dma) {
-		qup->btx.dma = dma_request_slave_channel_reason(qup->dev, "tx");
+		qup->btx.dma = dma_request_chan(qup->dev, "tx");
 		if (IS_ERR(qup->btx.dma)) {
 			err = PTR_ERR(qup->btx.dma);
 			qup->btx.dma = NULL;
@@ -638,7 +638,7 @@ static int qup_i2c_req_dma(struct qup_i2c_dev *qup)
 	}
 
 	if (!qup->brx.dma) {
-		qup->brx.dma = dma_request_slave_channel_reason(qup->dev, "rx");
+		qup->brx.dma = dma_request_chan(qup->dev, "rx");
 		if (IS_ERR(qup->brx.dma)) {
 			dev_err(qup->dev, "\n rx channel not available");
 			err = PTR_ERR(qup->brx.dma);
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

