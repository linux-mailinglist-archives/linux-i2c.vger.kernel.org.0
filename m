Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C852F3169
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 14:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbhALNTJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 08:19:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbhALNTI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jan 2021 08:19:08 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B003CC061575;
        Tue, 12 Jan 2021 05:18:27 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id o13so3338131lfr.3;
        Tue, 12 Jan 2021 05:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dnN2tqffNW/ZGJScvjdPkfvZef1jhn/Tnr5Ec8h0oh0=;
        b=lfbpCHc32dI/mtyN8tTDPI3iPN5eDGiGfC3Dj78llxLL1P5b8EMsEZ8lF+hJdBk16w
         3zSNKO0fuGc14xwdxWY46TgG0AP8odFcgsSrGZTY4QlLZGQcGlyKOLI7cWwQyXfq877L
         cKU4KhCQWixhEQB/KZ+eFXyxXICpV3SHJ7YlaiT4ALazX8z6pZRu27/RSFU1sdh+15jy
         vukfl5vatsjc0+KvZ9wDoxV1yxUa65lWFsspw+SqKAdHPf2NBqnDd7A3Y9fkH3IKzYn+
         gIUZY/euy9LvFcSZRz2AX6DOHpVSSkqW1y1Nl8FHtjEB3aXiQJSxTIy0eK4H9HVlrtmu
         MVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dnN2tqffNW/ZGJScvjdPkfvZef1jhn/Tnr5Ec8h0oh0=;
        b=uGjTn6RwzD0OqxpsLpZmqrVkUcQPG7BZN08OnVYRU5ZpPYQJRFHxn9F9Z3Z1MCOVjh
         mBDkwNt/iVI6iJvpVwYk0ZbKxNsM6QzIWLV8oIvLf0MhAFaBSsSEX/HfX9XIPWLEp2iI
         Jx8pmZwyCnNF46N5QDbKgiBXYirq8sL9Wv0aT5UeS/IHWXWgl7EzcknRnk9ppc4F/cWc
         k/y+ypBQ8x0yokndV8X/hmvAnHtu2ZOXTHm2asqydKXZ/iDIbdx8ZhKvcCf5DIfqJQyg
         3DILiiOV5iiBLiAqISPWA0kQLYVo6+79Q7xvFL9PYoeHb9cIK9GPftnWLOQ+tAnHEXOw
         0x2Q==
X-Gm-Message-State: AOAM53124CaETgO+uOGxdXa1oWp+PKqi3vzLCNR4oHRUx9U0oQnlmxZc
        IKrupyH7MJ3m5biIMlZvyZQ=
X-Google-Smtp-Source: ABdhPJzCNXMgByNGSo/TbKGw4SKYy1tY2E1liRirSA3809X/h2kuk074wDqkgiNEdhHO8eV3SepH0w==
X-Received: by 2002:a19:6459:: with SMTP id b25mr2063344lfj.635.1610457506271;
        Tue, 12 Jan 2021 05:18:26 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id a4sm341188ljp.14.2021.01.12.05.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 05:18:25 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] i2c: tegra: Use threaded interrupt
Date:   Tue, 12 Jan 2021 16:17:09 +0300
Message-Id: <20210112131709.1711-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Switch to use threaded interrupt context in order to avoid checking of
"are we in interrupt?" for the code that may sleep in the IRQ handler.
I2C doesn't require a very low interrupt-handling latency, hence this
change doesn't introduce any noticeable effects.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 0727383f4940..c4262408bae7 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -533,7 +533,7 @@ static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
 	void __iomem *addr = i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
 	u32 val;
 
-	if (!i2c_dev->atomic_mode && !in_irq())
+	if (!i2c_dev->atomic_mode)
 		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
 						  delay_us, timeout_us);
 
@@ -1719,9 +1719,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	/* interrupt will be enabled during of transfer time */
 	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
 
-	err = devm_request_irq(i2c_dev->dev, i2c_dev->irq, tegra_i2c_isr,
-			       IRQF_NO_SUSPEND, dev_name(i2c_dev->dev),
-			       i2c_dev);
+	err = devm_request_threaded_irq(i2c_dev->dev, i2c_dev->irq,
+					NULL, tegra_i2c_isr,
+					IRQF_NO_SUSPEND | IRQF_ONESHOT,
+					dev_name(i2c_dev->dev), i2c_dev);
 	if (err)
 		return err;
 
-- 
2.29.2

