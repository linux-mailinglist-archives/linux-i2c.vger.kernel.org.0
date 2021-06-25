Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0B43B3C28
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 07:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbhFYFZB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 01:25:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:46324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233133AbhFYFZA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 25 Jun 2021 01:25:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C54B56140B;
        Fri, 25 Jun 2021 05:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624598560;
        bh=MPl3vTAAEWf4+fP0ly5QUJMsJvvm/k1y8noRL42CSiI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A32ePgDycnk16AQJ9ftY5wD76rBy/xHphLZ0/ePtzUmNAAgeC0CfleSfg2G5pFSZA
         /h1SYvGeFn7dUIDaeQjW6AV5Uo/Fiok8d0NTBhASL3DoMvgcbYVVmye+ebcQbD04Gj
         guqoKhh6Gt7CPVoPCTPZ2yGXXjZZ8VBzqRUjCSHAUa+8LmeqDKMgzWqNW6tYyqb3Tx
         w2nxVetxHq2PFEvZSUTqp5L6hsxBvxTJfLHZ+AXkD26cQtJRE7Dnw4SHIAr5h80w/U
         o6vBqeHtQ5etL4H56CKEW8F6ULlba0ZqJP7BN/JQsn/ojD0exaTbV1f47GC9wVEAxl
         BvkAjYJUho1Zg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] spi: core: add dma_map_dev for dma device
Date:   Fri, 25 Jun 2021 10:52:11 +0530
Message-Id: <20210625052213.32260-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625052213.32260-1-vkoul@kernel.org>
References: <20210625052213.32260-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some controllers like qcom geni need the parent device to be used for
dma mapping, so add a dma_map_dev field and let drivers fill this to be
used as mapping device

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/spi/spi.c       | 4 ++++
 include/linux/spi/spi.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index e353b7a9e54e..315f7e7545f7 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -961,11 +961,15 @@ static int __spi_map_msg(struct spi_controller *ctlr, struct spi_message *msg)
 
 	if (ctlr->dma_tx)
 		tx_dev = ctlr->dma_tx->device->dev;
+	else if (ctlr->dma_map_dev)
+		tx_dev = ctlr->dma_map_dev;
 	else
 		tx_dev = ctlr->dev.parent;
 
 	if (ctlr->dma_rx)
 		rx_dev = ctlr->dma_rx->device->dev;
+	else if (ctlr->dma_map_dev)
+		rx_dev = ctlr->dma_map_dev;
 	else
 		rx_dev = ctlr->dev.parent;
 
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 74239d65c7fd..4d3f116f5723 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -586,6 +586,7 @@ struct spi_controller {
 	bool			(*can_dma)(struct spi_controller *ctlr,
 					   struct spi_device *spi,
 					   struct spi_transfer *xfer);
+	struct device *dma_map_dev;
 
 	/*
 	 * These hooks are for drivers that want to use the generic
-- 
2.31.1

