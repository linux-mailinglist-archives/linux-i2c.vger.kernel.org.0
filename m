Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC7026087C
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgIHCLw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728210AbgIHCLi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:11:38 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7E8C061573;
        Mon,  7 Sep 2020 19:11:38 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id q8so8317345lfb.6;
        Mon, 07 Sep 2020 19:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gfmOtG2LX9A+Kel844rjarke+NfElZZeKMZp8MuQx6I=;
        b=Tm9/FIKEgk29yAi0gO/78j3swf1duBjircnaXPLyClkolmcK28ErMw5bcOf2C7Ujpt
         fT7XSGveqqyhId/l/DXscLwXQwo83fWp5Ww+uMvDGag9Ugz290vefzuwFOxDL1ieovFl
         2s7D2ZHoiClBXuGrWyqZB6i0CGMNzUWmQdmTozRaiAktWvDUDimVv9zyiZ7I9cIQZpW5
         9zHQgnkWqVv5XPnpLiJ32Z38cnPOyRHIwm8gPO8exALfsyoEwSkYfCEEWZ8d3jigCMY8
         ENvjAgGCg+TRnw/SZLrsJ5hhhFbsYvTg8jHMG8XmQ2cb5iyvn7wrj03vgDNjeZ6d712q
         3cDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gfmOtG2LX9A+Kel844rjarke+NfElZZeKMZp8MuQx6I=;
        b=F+SIGO/aUG9vOpEIxSyJyy8OURR43NUGGy16Oode2pNCtLsrCaHE1UOujM+GUZ1F/Z
         OE1Zb/cEJlTiYHmOh7KxMMP7x7V4lGH3/FBs4eh4c215O3saH9utbyiMQNqZNP0V5Bbj
         0JaBMyigKxTnBFbcdOF1YiAuQPPPflqBGnbMZ3iHQ/MSNzsGtrXPq05LZE13yrvBaidG
         3T/11Y8wfnWzaQvWGz9t9Car2874XECDUjP0ZwK6zQbEZf7ZUe7IKPsNm+Bs4D3K6SXc
         lrUa8W4CsJKuhV/3svxbVTG2Gr+4W8bvfuAFRazhPqEVJAk9ZRO4Lj9jJPwW+Rys1g7S
         IbBw==
X-Gm-Message-State: AOAM530vpHawqz4C0ePE4du2MDTimzBJPsElmAftj5+j2eWH0IDklZyB
        VeOVGS4fTv80n3eVXmlL7YVVgcLUuGc=
X-Google-Smtp-Source: ABdhPJxbhNZzdrhpduoiWG3QfFL5U8JRQEbaHSxR1Ll28MYeIk+N2mqh1fi5WIu0cCDDAw5IH+v7aA==
X-Received: by 2002:ac2:4891:: with SMTP id x17mr11233554lfc.28.1599531096485;
        Mon, 07 Sep 2020 19:11:36 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:35 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 01/35] i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
Date:   Tue,  8 Sep 2020 05:09:47 +0300
Message-Id: <20200908021021.9123-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tegra_i2c_flush_fifos() shouldn't sleep in atomic transfer and jiffies
are not updating if interrupts are disabled. Let's switch to use iopoll
API helpers for register-polling. The iopoll API provides helpers for both
atomic and non-atomic cases.

Note that this patch doesn't fix any known problem because normally FIFO
is flushed at the time of starting a new transfer.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 00d3e4d7a01e..ab88cdd70376 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -470,9 +470,9 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned long timeout = jiffies + HZ;
-	unsigned int offset;
-	u32 mask, val;
+	u32 mask, val, offset, reg_offset;
+	void __iomem *addr;
+	int err;
 
 	if (i2c_dev->hw->has_mst_fifo) {
 		mask = I2C_MST_FIFO_CONTROL_TX_FLUSH |
@@ -488,12 +488,19 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 	val |= mask;
 	i2c_writel(i2c_dev, val, offset);
 
-	while (i2c_readl(i2c_dev, offset) & mask) {
-		if (time_after(jiffies, timeout)) {
-			dev_warn(i2c_dev->dev, "timeout waiting for fifo flush\n");
-			return -ETIMEDOUT;
-		}
-		usleep_range(1000, 2000);
+	reg_offset = tegra_i2c_reg_addr(i2c_dev, offset);
+	addr = i2c_dev->base + reg_offset;
+
+	if (i2c_dev->is_curr_atomic_xfer)
+		err = readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
+							1000, 1000000);
+	else
+		err = readl_relaxed_poll_timeout(addr, val, !(val & mask),
+						 1000, 1000000);
+
+	if (err) {
+		dev_err(i2c_dev->dev, "failed to flush FIFO\n");
+		return err;
 	}
 	return 0;
 }
-- 
2.27.0

