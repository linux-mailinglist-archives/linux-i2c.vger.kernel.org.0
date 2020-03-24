Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40BB61919B8
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 20:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgCXTNf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 15:13:35 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42161 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbgCXTNb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Mar 2020 15:13:31 -0400
Received: by mail-lj1-f193.google.com with SMTP id q19so19791746ljp.9;
        Tue, 24 Mar 2020 12:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jzcdODLP0bHV5KexQQTzdWyhTj19LdLpMLvVPCui0eA=;
        b=l+gUJAYdrgzLt3eLoI04QicNrazbv0v+FgYsKc5KoGBu5YFAIrTVAiCOBKdoV1ngoh
         0deLxHa1n/6oUByrwhYO9rKBsC8iDCQJoyjr8SHwOGNl7YpwJxvJB+GEEOACJqZgC9qU
         TRnv9gtrZOIDcpih7GDiNyv8wu0HUswtMoJXj3JlyR2PxjN/vCf4BVcrdpPuLT2a6Vnd
         8YWYQPvcAxt2m1bneX4xjIfz6krJozZvFnYpyNShqmdk6hMh9hzRHJ+RTvTHZa+mdTKv
         U0Zw9I5U4hqX4/JuOmytNJPNTZNkIJQWnfIoO/SSRsjY0h94mVLQCLDvMr6uYeV75g/L
         92Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jzcdODLP0bHV5KexQQTzdWyhTj19LdLpMLvVPCui0eA=;
        b=jKWqyyMp1IQ3j5wpWMDl3k73MNw1v7lIcTPKt2dnbk3ef+i77KO4tCxSSF44bu+NhQ
         FT1z0AmMH+gAC4fK/XnQHc8Q0F2WIzc2560sjVgTUro2X6qwo4oCeDoZ3HYsVZLuWdHB
         O51LPgT28Opw2LYqjs0ZM2dPKcsEyqxRbBcWkEdO5ywO9HZUAbgsXnbHk+4rYG1DM7yb
         hzW8r07uOgbxzPdhInbTPQpeLelvyS+QbHtppMvrB7O4CQu8yoPZM9tvpVlm1coWoQ7z
         MMgJGuFAkraM+ZG0Z04uq9nIYR5+Afo9Huka3Zkx+FYOY+jl2Vpn6mstrS6561WG6rb1
         pXdw==
X-Gm-Message-State: ANhLgQ2LFW3hJ5Wputerv4X64GKiYbSsj6VtBfzsmvfVlAIahkIu47d4
        ohF6oI44sV6UWYzfr3/tSSc=
X-Google-Smtp-Source: ADFU+vvXcCNXExgmOgRhQdzvVwwjdgeb/M53b6DLd/ZJF0pjeI+wUwRDDFat9JdSB/+780j3l9i3YQ==
X-Received: by 2002:a2e:93c5:: with SMTP id p5mr17839557ljh.192.1585077208915;
        Tue, 24 Mar 2020 12:13:28 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id z23sm6347723ljz.52.2020.03.24.12.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 12:13:28 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] i2c: tegra: Synchronize DMA before termination
Date:   Tue, 24 Mar 2020 22:12:17 +0300
Message-Id: <20200324191217.1829-3-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324191217.1829-1-digetx@gmail.com>
References: <20200324191217.1829-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DMA transfer could be completed, but CPU (which handles DMA interrupt)
may get too busy and can't handle the interrupt in a timely manner,
despite of DMA IRQ being raised. In this case the DMA state needs to
synchronized before terminating DMA transfer in order not to miss the
DMA transfer completion.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 0daa863fb26f..0c6dac770fc3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1223,6 +1223,15 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
2.25.1

