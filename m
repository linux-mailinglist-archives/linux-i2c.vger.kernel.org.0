Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8003B1783
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 12:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbhFWKCF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 06:02:05 -0400
Received: from www.zeus03.de ([194.117.254.33]:50896 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230464AbhFWKCD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Jun 2021 06:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=qu5snV65MT2dXm
        jt06pGR2OjRw6FIkGJrYDKJpHo0Xs=; b=b8Jfm2zgz3ETciAlTu3uo7WXsE1B7P
        UlIKEIxwOlbFfu73PmFwdUFjVIkvdwd0YOY18Zxgixf91mMUmeG/l7MBPl0EqwYp
        f94eOnCW4VRPQoY/8dAIAb64Ue0Q6U7omvV4Q1QrPsMhAWo3llMIBswZaNDBpt4e
        x2V1Drzge/+Fo=
Received: (qmail 2551991 invoked from network); 23 Jun 2021 11:59:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2021 11:59:44 +0200
X-UD-Smtp-Session: l3s3148p1@1LFC92vFFKogARa4RfhaAavnjlTTqzSz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] i2c: imx: : use proper DMAENGINE API for termination
Date:   Wed, 23 Jun 2021 11:59:36 +0200
Message-Id: <20210623095942.3325-3-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-imx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index dc5ca71906db..b224e82924d2 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -423,7 +423,7 @@ static int i2c_imx_dma_xfer(struct imx_i2c_struct *i2c_imx,
 	return 0;
 
 err_submit:
-	dmaengine_terminate_all(dma->chan_using);
+	dmaengine_terminate_sync(dma->chan_using);
 err_desc:
 	dma_unmap_single(chan_dev, dma->dma_buf,
 			dma->dma_len, dma->dma_data_dir);
@@ -899,7 +899,7 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 				&i2c_imx->dma->cmd_complete,
 				msecs_to_jiffies(DMA_TIMEOUT));
 	if (time_left == 0) {
-		dmaengine_terminate_all(dma->chan_using);
+		dmaengine_terminate_sync(dma->chan_using);
 		return -ETIMEDOUT;
 	}
 
@@ -954,7 +954,7 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 				&i2c_imx->dma->cmd_complete,
 				msecs_to_jiffies(DMA_TIMEOUT));
 	if (time_left == 0) {
-		dmaengine_terminate_all(dma->chan_using);
+		dmaengine_terminate_sync(dma->chan_using);
 		return -ETIMEDOUT;
 	}
 
-- 
2.30.2

