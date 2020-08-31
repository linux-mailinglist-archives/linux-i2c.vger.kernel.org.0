Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE19258267
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 22:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729979AbgHaUXb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 16:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbgHaUX3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 16:23:29 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE7D4C061573;
        Mon, 31 Aug 2020 13:23:28 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id c15so4260774lfi.3;
        Mon, 31 Aug 2020 13:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o54z0KyncSkTIRCR00YgxkSeoepil1oHLoUd4CNcJV8=;
        b=YKUGtkIeM4sT3ADMccYAqtjuhhdcIC/Br+EJIXZ6BLesD5mO6uhtw6m1wSHFaVvC+m
         BiYmG4hNtIwbAdh9AIvX+A0AnbhZ+NfoCSEB/q4hlv0iiWwzuJ8kGsAJevDcEPI1zrYB
         N6iem77dI7vTFn+KQXIzA6uxT6uutN8YxGQFPHnDiEYNeQlP5vwW+aWpLR6ZxcNzkXEJ
         Pzbt+SVn5iAm393aKlRbX662AIy72DPKYy65aFALHuf+Eg3nz+1GbUTvw7HqLhA6fV58
         opdtOfwp+U8VSXfHPnhHo6YCb8JXXZYASEt0UU48viHlcmrbDb0W4NZy+RsrTQVEmXWz
         ombQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o54z0KyncSkTIRCR00YgxkSeoepil1oHLoUd4CNcJV8=;
        b=QV+v2Nd+13Fz+oRvP8YPzcDqb+WpWuyLlN0uCnbkCcQsvfvszpW+Jx0u8ZwOqhiHUc
         5rwAFxHLlkl8ut2rleyfueJf/eJU35MzfjVnb7M2dsu28RqX6TrbCRYBsRSCyQemgHVG
         ycz6QvsmgFE82UyvQB0XlET8Wu6wxE99W3nF3JgjttMIwmIX+5+idwq78acoHBuYj42z
         MB5+1KJ/pbH8NgZJD7wcBeO0KVrF+M85gCiDNsJESR6hBwc+EMsrEcdo6irErnsDQf+v
         sLFhsk4URDzyzh3kp3+//UPJRSbQsxKP+tZu97aqVTY7XBbL25NxPuz1UqyCTnisAwD0
         cU/w==
X-Gm-Message-State: AOAM531nyMnk7Z1OSEStiu0ckeGGcbSF1nA7sG1/SstMGbaZyK3SvQuD
        BMNNoJVXnRuzKvnw+8Uk4Gw=
X-Google-Smtp-Source: ABdhPJwOCcYqnIkdSbxBQu7IW0uhHMbUBoMCNzewxnXSQH2p8bj0BC99J2mu5z9k7AGVxEweTlgp/w==
X-Received: by 2002:ac2:5dc1:: with SMTP id x1mr1402141lfq.217.1598905406717;
        Mon, 31 Aug 2020 13:23:26 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id z20sm1769054ljk.97.2020.08.31.13.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:23:26 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/12] i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
Date:   Mon, 31 Aug 2020 23:22:52 +0300
Message-Id: <20200831202303.15391-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831202303.15391-1-digetx@gmail.com>
References: <20200831202303.15391-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tegra_i2c_flush_fifos() shouldn't sleep in atomic transfer and jiffies
are not updating if interrupts are disabled. Hence let's use proper delay
functions and use ktime API in order not to hang atomic transfer. Note
that this patch doesn't fix any known problem because normally FIFO is
flushed at the time of starting a new transfer.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 00d3e4d7a01e..aab58395fb71 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -470,7 +470,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned long timeout = jiffies + HZ;
+	ktime_t ktime = ktime_get();
+	ktime_t ktimeout = ktime_add_ms(ktime, 1000);
 	unsigned int offset;
 	u32 mask, val;
 
@@ -489,13 +490,22 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 	i2c_writel(i2c_dev, val, offset);
 
 	while (i2c_readl(i2c_dev, offset) & mask) {
-		if (time_after(jiffies, timeout)) {
-			dev_warn(i2c_dev->dev, "timeout waiting for fifo flush\n");
-			return -ETIMEDOUT;
-		}
-		usleep_range(1000, 2000);
+		if (ktime_after(ktime, ktimeout))
+			goto err_timeout;
+
+		if (i2c_dev->is_curr_atomic_xfer)
+			mdelay(1);
+		else
+			fsleep(1000);
+
+		ktime = ktime_get();
 	}
 	return 0;
+
+err_timeout:
+	dev_err(i2c_dev->dev, "fifo flush timed out\n");
+
+	return -ETIMEDOUT;
 }
 
 static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
-- 
2.27.0

