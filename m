Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E6A3B177E
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 11:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhFWKCD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 06:02:03 -0400
Received: from www.zeus03.de ([194.117.254.33]:50852 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230251AbhFWKCC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Jun 2021 06:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=EHCLToONuBfoCf
        nikBwdLOOKTwacqy07wHL9HimZduM=; b=SCojhPq055X0kA0JeVY7QARA/1LmX3
        ANBn0zFKKttBmQBb+8cGYnB0Yiee+COBq1iz0/vKQQ9Yav+e/m3xbuhOhOaXIfyA
        70WaYvw66HgZrHsZ+TUaDJM7YvrmoUc3pDfwfUs4p/t9j/eWOyxx6GMCJhos8lR5
        Iut596WaQwlRo=
Received: (qmail 2551935 invoked from network); 23 Jun 2021 11:59:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2021 11:59:43 +0200
X-UD-Smtp-Session: l3s3148p1@H3c492vFEqogARa4RfhaAavnjlTTqzSz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] i2c: at91-master: : use proper DMAENGINE API for termination
Date:   Wed, 23 Jun 2021 11:59:35 +0200
Message-Id: <20210623095942.3325-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

dmaengine_terminate_all() is deprecated in favor of explicitly saying if
it should be sync or async. Here, we want dmaengine_terminate_sync()
because there is no other synchronization code in the driver to handle
an async case.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-at91-master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index 1cceb6866689..b0eae94909f4 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -138,9 +138,9 @@ static void at91_twi_dma_cleanup(struct at91_twi_dev *dev)
 
 	if (dma->xfer_in_progress) {
 		if (dma->direction == DMA_FROM_DEVICE)
-			dmaengine_terminate_all(dma->chan_rx);
+			dmaengine_terminate_sync(dma->chan_rx);
 		else
-			dmaengine_terminate_all(dma->chan_tx);
+			dmaengine_terminate_sync(dma->chan_tx);
 		dma->xfer_in_progress = false;
 	}
 	if (dma->buf_mapped) {
-- 
2.30.2

