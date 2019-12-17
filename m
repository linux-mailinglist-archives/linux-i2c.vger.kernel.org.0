Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD76B1225BF
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2019 08:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfLQHpB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Dec 2019 02:45:01 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54872 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbfLQHpB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Dec 2019 02:45:01 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBH7irHs010018;
        Tue, 17 Dec 2019 01:44:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576568693;
        bh=b5wBk0F+R2tKX9Jfr0hu+FEeVGuPCo3CtdCMf1Fl6z0=;
        h=From:To:CC:Subject:Date;
        b=ocdDM+0+2oMtaIT2PjYA5ioIOdbnnk2y5S/OFwISnRwof5f8o5YTEYoBbI4+pXlSg
         iRLP3L2fcUFgREHp0QgEnZmNr5fpMTr5f6vAGxN8BO1fKCAUZYb+BIYZ3jZUDnbYxE
         PcK5OBT4wq87fxA48ONBEUB7B7ZjrAvQUsrA6Kfo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBH7ir5s017765;
        Tue, 17 Dec 2019 01:44:53 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 01:44:52 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 01:44:52 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBH7iopt102141;
        Tue, 17 Dec 2019 01:44:50 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <shawnguo@kernel.org>, <s.hauer@pengutronix.de>
CC:     <vkoul@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] i2c: mxs: Use dma_request_chan() instead dma_request_slave_channel()
Date:   Tue, 17 Dec 2019 09:45:05 +0200
Message-ID: <20191217074505.22527-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

dma_request_slave_channel() is a wrapper on top of dma_request_chan()
eating up the error code.

By using dma_request_chan() directly the driver can support deferred
probing against DMA.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/i2c/busses/i2c-mxs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 89224913f578..03f5eee9883a 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -836,10 +836,10 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	}
 
 	/* Setup the DMA */
-	i2c->dmach = dma_request_slave_channel(dev, "rx-tx");
-	if (!i2c->dmach) {
+	i2c->dmach = dma_request_chan(dev, "rx-tx");
+	if (IS_ERR(i2c->dmach)) {
 		dev_err(dev, "Failed to request dma\n");
-		return -ENODEV;
+		return PTR_ERR(i2c->dmach);
 	}
 
 	platform_set_drvdata(pdev, i2c);
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

