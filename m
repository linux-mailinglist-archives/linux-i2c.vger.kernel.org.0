Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3FD3B178E
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 12:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhFWKCL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 06:02:11 -0400
Received: from www.zeus03.de ([194.117.254.33]:50964 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231127AbhFWKCG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Jun 2021 06:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=Tsy6U2g68Sud/3
        KeD5XvqvjnXzM52XcXBTKsmPwfMsM=; b=X1TPNXfXDq99TWqydpdT/G6TheRPts
        J89y8JlYaWk/HqsIi4mjLVWGFRRSlDqjy/n+JQ6rT8eSfLJwOGhIJi2dcmuCrI8t
        OhK3hULYGnWjrPKN99n2JI0eLpYSgSBTld1nxsErdkIM+lVKVt4nJfvLDOGe6mNy
        JD35kXnk01Cz4=
Received: (qmail 2552076 invoked from network); 23 Jun 2021 11:59:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2021 11:59:46 +0200
X-UD-Smtp-Session: l3s3148p1@IYFd92vFGqogARa4RfhaAavnjlTTqzSz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] i2c: rcar: : use proper DMAENGINE API for termination
Date:   Wed, 23 Jun 2021 11:59:39 +0200
Message-Id: <20210623095942.3325-6-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-rcar.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 327c092a4130..41ff327882ef 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -391,9 +391,9 @@ static void rcar_i2c_cleanup_dma(struct rcar_i2c_priv *priv)
 	if (priv->dma_direction == DMA_NONE)
 		return;
 	else if (priv->dma_direction == DMA_FROM_DEVICE)
-		dmaengine_terminate_all(priv->dma_rx);
+		dmaengine_terminate_sync(priv->dma_rx);
 	else if (priv->dma_direction == DMA_TO_DEVICE)
-		dmaengine_terminate_all(priv->dma_tx);
+		dmaengine_terminate_sync(priv->dma_tx);
 
 	rcar_i2c_dma_unmap(priv);
 }
-- 
2.30.2

