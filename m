Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48CE3B1792
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 12:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhFWKCM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 06:02:12 -0400
Received: from www.zeus03.de ([194.117.254.33]:50976 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231133AbhFWKCI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Jun 2021 06:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=hNIDVQIO78HKgP
        meMku+RhCqaBeiw/s2B3jJjKpLSTs=; b=FzeLJi5gbu/4MpNu49P8mhvRP2dlw9
        qf9YsRKZSuhDthpegm7lqjWj6fXXwOCCZmY2TLl8Q2v0HsLEP1efsUoQ0YAhzmn8
        lcqKFf0dkIZIARoNWQzNNr1Pz6bTQ+OL2hZu9nM1V3w2SWmcMzz2RlA64XHcRzzf
        8OmOY6ToNzoMI=
Received: (qmail 2552129 invoked from network); 23 Jun 2021 11:59:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2021 11:59:46 +0200
X-UD-Smtp-Session: l3s3148p1@gldn92vFHKogARa4RfhaAavnjlTTqzSz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] i2c: sh_mobile: : use proper DMAENGINE API for termination
Date:   Wed, 23 Jun 2021 11:59:40 +0200
Message-Id: <20210623095942.3325-7-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-sh_mobile.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 2d2e630fd438..db8fa4186814 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -458,9 +458,9 @@ static void sh_mobile_i2c_cleanup_dma(struct sh_mobile_i2c_data *pd)
 	if (pd->dma_direction == DMA_NONE)
 		return;
 	else if (pd->dma_direction == DMA_FROM_DEVICE)
-		dmaengine_terminate_all(pd->dma_rx);
+		dmaengine_terminate_sync(pd->dma_rx);
 	else if (pd->dma_direction == DMA_TO_DEVICE)
-		dmaengine_terminate_all(pd->dma_tx);
+		dmaengine_terminate_sync(pd->dma_tx);
 
 	sh_mobile_i2c_dma_unmap(pd);
 }
-- 
2.30.2

