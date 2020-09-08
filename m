Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0487C262325
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730261AbgIHWoi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729529AbgIHWk0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:26 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D7EC061755;
        Tue,  8 Sep 2020 15:40:25 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w3so977948ljo.5;
        Tue, 08 Sep 2020 15:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gfmOtG2LX9A+Kel844rjarke+NfElZZeKMZp8MuQx6I=;
        b=fZfZvEZj6u44b7Am/o2aIpGaKyuR49qUu5RTpwVop3Zxe5k5LaU0bZY7jyvMo1i3d8
         etWEqKT/uTlBkX+DwGl24cj3ST4xe+K4llf3U7WhI2NlEYDzyRJQyGqkZOmR8fuH9pxs
         vk57RgfpxCd+QgoJC8tYt/7TBFNQ9B+R7lhg8whPDzNa/oBY3P0hnx0TO9AD6ALWMAHi
         o02G/EzLufCkliF7IuaCpgcPLaBVIV9W6ItObT4Dhpr5CHBI6+1WsmT6RMQRqkXNnsMt
         frVZTZptQVKTjCi83TEXYSAwqQ8j99eQ+KTEQI2AAE1DMtGJMGY3edcKWDDYVguDiwed
         /Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gfmOtG2LX9A+Kel844rjarke+NfElZZeKMZp8MuQx6I=;
        b=V7Nk6e5WNyzklGp63IS1bCld1DyZKcsMHeXJf3cp+qaJezlMo+/3KPQujc2CSV39Po
         kNiMM8QW505G4QBd7PykVBAdxApmLU+KGQNcLuRgnlndRt8ZTFcAL7mJGAhpsYRsEtad
         yPVONu4lF3ATC5yxqRBuYy0HnnqC73nfUY/5EmSnTZZ1VpwZ9XbBBXHCa+kUamxABWnT
         W4eYA8uV00w3lNFDSJgx3d+1y65cUqwqool4BB+6P8XKEyX8uS6MKB8xVmoxZQnVHlsD
         B2neK42V2VYyQ2g+vCW6J2DgwCQwG2V2Bk34Jmul3DQ/BGBQAi+RJShkD/qCvzP4XRGW
         mHPw==
X-Gm-Message-State: AOAM533QHKzJuU8MUVkaTK3IL/NVADlSqvW5/9T6ssOeNjCyUfUPxKTq
        pQ7ZpDmflgxb9KSPfuADQyA=
X-Google-Smtp-Source: ABdhPJzSb2gPSUQiuFgN9L+zVFOsZdnWXBVVdz31UomLReL5JmxTqPGDgRqEnq5Cg/fafVl7yBSs8A==
X-Received: by 2002:a2e:965a:: with SMTP id z26mr376908ljh.88.1599604824100;
        Tue, 08 Sep 2020 15:40:24 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:23 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 01/34] i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
Date:   Wed,  9 Sep 2020 01:39:33 +0300
Message-Id: <20200908224006.25636-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
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

