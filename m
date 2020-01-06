Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35E7F130B32
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 02:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbgAFBFE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jan 2020 20:05:04 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36922 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727319AbgAFBEp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jan 2020 20:04:45 -0500
Received: by mail-lj1-f194.google.com with SMTP id o13so37840110ljg.4;
        Sun, 05 Jan 2020 17:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ANgiDb8lZrIeT4lzak+4/Bj4JKSfzatLnqU517vszuw=;
        b=bCZh7sn1VUvH4O8G0t9GV9IBXWVCKvjhvK3J7hNAKqBVyma4FAawu2PyQL+11wh5Ig
         KJau3GSNxmHNdZzk6l3CwH6KMbrXvr8qKXXouURwpID6QypBTlZLUHBIpkxm7JdH/JVj
         uajomTXxkHyjOCW7cqzjVmr388s1TkJKWh0Yo/Wym9W90MHs0s06sf+aAYEXvX7NNaO4
         kVX8Lb2ngT9SqO+K8dQxr201hjhWVajhWi2h3lKD89sxAoBFYCCgEt4U4fLFV84rVSAi
         VyINIGrLZGi/b7FfWHs/MAigdBuy5l366RHUtHg+bVbqpXtLgm9z6/AgquNVw38FpUYz
         8WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ANgiDb8lZrIeT4lzak+4/Bj4JKSfzatLnqU517vszuw=;
        b=IAj41B4+MfrEEzo9KPARy8NdKR9OUGpjGnjHGIX28aNXM9DKS4rm8vbnltYGn7dhhF
         eWME7UgeDOieLoiaECZPZG0rL2ouEDG6CPq9w5knF+7lvCwbl6kwrYkfOl+zCooP6rVg
         IywqqUchIHKmsAS5wgr9XS+4CIPnF55pC1iRv8sIvElkD3oxDqNxblJnIg2FKHhF1JnP
         5SB7f3E8xauYY9T8oTcU+lNHfXl8y2T3V8CmzHTrwtoUbEDEV2GhxHuuuRK1UDMc2Esd
         TBK3rA8DosK2viXzakjS7WLgwiW8cEQCcfOQawWZpayZbc/O0rpuC9V+UCF7b9O28rv5
         lXyw==
X-Gm-Message-State: APjAAAVwmeo09qdzRg496NHWNnrJu+y2cPiqJI7SNufdoq77ASap8UEy
        dXbBDIhlvNj4jLBVU15t3zg=
X-Google-Smtp-Source: APXvYqyvt0gDop+YZPMkwrWE6qLA4t5qEf9AbN3ZjV4IOv2YAihOdvy//l0QPSSgh3utm9HHhNZjkg==
X-Received: by 2002:a2e:858b:: with SMTP id b11mr53286291lji.135.1578272682891;
        Sun, 05 Jan 2020 17:04:42 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id a19sm28245910ljb.103.2020.01.05.17.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2020 17:04:42 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/9] i2c: tegra: Always terminate DMA transfer
Date:   Mon,  6 Jan 2020 04:04:22 +0300
Message-Id: <20200106010423.5890-9-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200106010423.5890-1-digetx@gmail.com>
References: <20200106010423.5890-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It is possible that I2C could error out in the middle of DMA transfer and
in this case DMA channel needs to be reset, otherwise a follow up transfer
will fail because DMA channel stays blocked.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1a390e1bff72..3c7c86d4b0e4 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1220,11 +1220,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		time_left = tegra_i2c_wait_completion_timeout(
 				i2c_dev, &i2c_dev->dma_complete, xfer_time);
 
+		dmaengine_terminate_sync(i2c_dev->msg_read ?
+					 i2c_dev->rx_dma_chan :
+					 i2c_dev->tx_dma_chan);
+
 		if (time_left == 0) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
-			dmaengine_terminate_sync(i2c_dev->msg_read ?
-						 i2c_dev->rx_dma_chan :
-						 i2c_dev->tx_dma_chan);
 			tegra_i2c_init(i2c_dev, true);
 			return -ETIMEDOUT;
 		}
@@ -1237,11 +1238,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf,
 			       msg->len);
 		}
-
-		if (i2c_dev->msg_err != I2C_ERR_NONE)
-			dmaengine_synchronize(i2c_dev->msg_read ?
-					      i2c_dev->rx_dma_chan :
-					      i2c_dev->tx_dma_chan);
 	}
 
 	time_left = tegra_i2c_wait_completion_timeout(
-- 
2.24.0

