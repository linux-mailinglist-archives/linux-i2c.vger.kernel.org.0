Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E24258289
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 22:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729984AbgHaUXc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 16:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729976AbgHaUX3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 16:23:29 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571B6C061575;
        Mon, 31 Aug 2020 13:23:29 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z25so1102795lfj.9;
        Mon, 31 Aug 2020 13:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FRnx45u7/i2kry58qh4geYUb8/TK/AjF/UDJOIFPEeg=;
        b=TQSm3orKZFtx48PL9rXWPF+QicyZywM+5js65DonZeTjkZfqJDGS4rnAS1d5hv6MDV
         rFm3PgpGOjmuqKbqYE9N/grYw2dHI6n33ljM76xM2yu/0bBF7C5aFN+OI4CGbK8GX36p
         aZgmT1K/5D2HAOnVT77RZ1wLuftRqLNBb4jygAcMzWn5DWnO9QBT5sLUtzNOEDzaAlwd
         FXF30aK8TTP2qhegf9cNTdbt2hqhh/RMkA5A026tbRUMb0z8R+oVwQhJJHyyztG6MP4/
         gJcrb2UroEGGdzjTkkhCD6TQer2rnZrNbE3tY0d0zFfHbPXUxhC3cXZS4WorFSJj9+hy
         4Yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FRnx45u7/i2kry58qh4geYUb8/TK/AjF/UDJOIFPEeg=;
        b=poK6vXQgcOS87VMQMH8ccPsTkBGHsKpPx3OtEQ9s7cqpTv3UjZV9cnmVMP/cEB6moD
         IVgk1wm4t1PACtbO4BmyZ3nSU53L5HB7iJmwzT350zfBqFlJTF2IRAsGRcepPwyXJ2FR
         AJt3XZkv3HgSgR1gJFXwwX2zOxvIPLkMaDKXu6BRcCuODoZ9BDnZOrPKXT+9CjzUY91C
         4Ym81It0ZiNgM1fsPA1PBwYhjyxgMcxxt37CBhohx2bQEgXxByuoaqp1h8kph+Zu1bka
         Uji4YDeUoyxMQpqPjR8QphNKs+9Qa7BQE/SwaqFVsEs9LNevKMXG2Otr0NkRMoe9s0kL
         pBSg==
X-Gm-Message-State: AOAM530YvLm9UkyCwqZjKcCOIUz0aadBNHGfoBReaJWP9iVaacdv7AiC
        cZhC2N3VVEDpRwxWcFhY3feqHsq35Jc=
X-Google-Smtp-Source: ABdhPJz3PRoABhtWRAaEJeBE6ftdtg0VDdHNNymnzHMEgS8i06hSaZNuqdqbf5qJP6c0lT/ylt8YIw==
X-Received: by 2002:a19:ef13:: with SMTP id n19mr1446589lfh.1.1598905407773;
        Mon, 31 Aug 2020 13:23:27 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id z20sm1769054ljk.97.2020.08.31.13.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:23:27 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/12] i2c: tegra: Add missing newline before returns
Date:   Mon, 31 Aug 2020 23:22:53 +0300
Message-Id: <20200831202303.15391-3-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831202303.15391-1-digetx@gmail.com>
References: <20200831202303.15391-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some places in the code are missing a newline before return, making
code more difficult to read and creating inconsistency of the code.
This patch adds the missing newlines.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index aab58395fb71..9bd91b6f32f4 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -317,6 +317,7 @@ static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
 	else if (i2c_dev->is_vi)
 		reg = 0xc00 + (reg << 2);
+
 	return reg;
 }
 
@@ -392,6 +393,7 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 	dma_desc->callback_param = i2c_dev;
 	dmaengine_submit(dma_desc);
 	dma_async_issue_pending(chan);
+
 	return 0;
 }
 
@@ -500,6 +502,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 
 		ktime = ktime_get();
 	}
+
 	return 0;
 
 err_timeout:
@@ -707,6 +710,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	clk_disable(i2c_dev->slow_clk);
 disable_fast_clk:
 	clk_disable(i2c_dev->fast_clk);
+
 	return ret;
 }
 
@@ -1421,6 +1425,7 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 
 	if (i2c_dev->hw->has_continue_xfer_support)
 		ret |= I2C_FUNC_NOSTART;
+
 	return ret;
 }
 
@@ -1888,6 +1893,7 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 	clk_unprepare(i2c_dev->fast_clk);
 
 	tegra_i2c_release_dma(i2c_dev);
+
 	return 0;
 }
 
-- 
2.27.0

