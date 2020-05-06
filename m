Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA3271C7A5D
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 21:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729250AbgEFTeU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 15:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbgEFTeT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 15:34:19 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F24C061A0F;
        Wed,  6 May 2020 12:34:19 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id i15so3145155wrx.10;
        Wed, 06 May 2020 12:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zRA8XHCGUliIZX7g4aZI0lIxZlvmSkIAUWwgi9G+qmo=;
        b=n5vOV7HTcxF5a+OaKTiHiiO+Rfql0MJMQKpTrjndMphBnZmng80wX+qiuonm+Ev0hz
         aLWuHvLPGnbFf6EIQQDGPRB0xvgNfm5mieh65bP6y34nc3VWnud/0VOxm92l5mW+qbik
         64yqmN1djlV6dXttqAykbMAl5gDzFrwCMhhKBLodjdK39utli1z9s/FYXcofRzH1sWZ3
         whVOHr3gCv8/olhimRCiWj+vapQUoLEQEtjMKhG0EcFDkS7Gf0rT4Y3RooYYKc8fm9Se
         x6SY1gGc04tTikIDlUCFS+RjzhSQqfCnfSfjZGc+Hom8s25nRI42KfVeTY1xE47ihuF7
         WC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zRA8XHCGUliIZX7g4aZI0lIxZlvmSkIAUWwgi9G+qmo=;
        b=GKdFK9tc+REKPG414aS71rjvPm7hDJ/JwDBp/hFsLrLSJjbswaO/VakkKbxRVmP8zB
         5gbAp9FCCJ5tpiF6yeUCTjVKsYaN11uoxXyuw3kDv0ua8Xoo7++AGYWuzwa7jZt5SgK9
         EtrwpYJgsNh/cSWQAnW6wxzdqMFuoK3lbEfHGaX2GvFdHL6uNUudyQelYFO0piC0AZPS
         zjo+0cTY/6CxWC3XRGmP2s49BRYPX64AIc+l+hu2BteFGkEs2YrUnuSgTOjt4gyPGj7U
         j/BZWL3v6ntzJHrMVavyniM4RoTTamxTvta9dAhbwbpSDEuq+HWYjvci+FatDSr/mZDm
         lk4w==
X-Gm-Message-State: AGi0PuZB7lvaz4pRtpNmNEXc7euce1aLSe9FJ5HqsvPLkss65v3EuwN7
        ojS8cDTlvFLz6+g73gLMerA=
X-Google-Smtp-Source: APiQypJ+kc/R94I1R5NmwlQqbRyKNjrwfCC6Th54Lb8dAgLwYFZHQH8rWfUE2kYvG4BEcjdY+darhQ==
X-Received: by 2002:a5d:46cf:: with SMTP id g15mr7064607wrs.276.1588793658383;
        Wed, 06 May 2020 12:34:18 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id s18sm4807274wra.94.2020.05.06.12.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 12:34:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 5/5] i2c: tegra: Synchronize DMA before termination
Date:   Wed,  6 May 2020 21:33:58 +0200
Message-Id: <20200506193358.2807244-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200506193358.2807244-1-thierry.reding@gmail.com>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

DMA transfer could be completed, but CPU (which handles DMA interrupt)
may get too busy and can't handle the interrupt in a timely manner,
despite of DMA IRQ being raised. In this case the DMA state needs to
synchronized before terminating DMA transfer in order not to miss the
DMA transfer completion.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d504e272d9fa..4cee596a604d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1219,6 +1219,15 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		time_left = tegra_i2c_wait_completion_timeout(
 				i2c_dev, &i2c_dev->dma_complete, xfer_time);
 
+		/*
+		 * Synchronize DMA first, since dmaengine_terminate_sync()
+		 * performs synchronization after the transfer's termination
+		 * and we want to get a completion if transfer succeeded.
+		 */
+		dmaengine_synchronize(i2c_dev->msg_read ?
+				      i2c_dev->rx_dma_chan :
+				      i2c_dev->tx_dma_chan);
+
 		dmaengine_terminate_sync(i2c_dev->msg_read ?
 					 i2c_dev->rx_dma_chan :
 					 i2c_dev->tx_dma_chan);
-- 
2.24.1

