Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B082025EAA8
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728678AbgIEUow (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728737AbgIEUmp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:45 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C371C061245;
        Sat,  5 Sep 2020 13:42:44 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u21so1537003ljl.6;
        Sat, 05 Sep 2020 13:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pEHmIb4d6XMROUI2DH0Ea67xbvLArLBVTrqBQH+Lcrs=;
        b=Z7fm9c0xw+dAAOdGX25/VDX68Y5naWg2ZdRE4MK0F1xd88nO+PYI8evUJkRtfmASgd
         X1YyGu7QVA6Ie96QizsnDdKv/ZGyfJ5N6Ax1CT+6mbpwBSGcV27835Tsv9xQPTvzmh03
         /EIRRhW9qtZ6aAp6LEjFlhvgpafru55SDsPu3/dRgJgK38QsKlWHVxmHe4xCeBF5C18b
         cDSs81NgoMZN/DWFWV7ah4SnBEjFJoBOD3RjG7xEbUPH3xT8AZH3JHTQKQ3mfKDexuee
         XEqPEyfBBwwzxSxhxF2/FZLvax+XSzU988jOJTvV++0gCJHMeD+F/O6tlrdWsXpALaiX
         5jpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pEHmIb4d6XMROUI2DH0Ea67xbvLArLBVTrqBQH+Lcrs=;
        b=Hgdsb0k+foAkjbUqVF+jpiF23ncORqV7hURUo+kCCh8EmfhjxdCDj7ZLRclb3DPIKj
         BDNNhBMx8eLwE2995CWXPM8iiPn7re2lupke2Q7Vzv9l0XO94qm1uPGewtiulTuungQq
         HW9wZdpaTiorOSqqqjS/EwHSoiZ2ICXjoNJvQnsenWm2pPPqid/iY4mysQUSGpHy6IBH
         WrW3dFnD5YZmGog+sgsXhGaoKWlPuPokMFCENWwogX+Rm2CbcW1f6dPMfwTP8FT253Wc
         qWik9rhohpHvlRDjFl+nH306pQha4ygaJzSHcBkLNRMYcKqgnbR9FbCvkknLV+H3jCes
         QaEA==
X-Gm-Message-State: AOAM530GUt9Svr5QyxnELror7GlfPx3jlu/sc5SlvM14wq/FbgbhZHAc
        npBYmfNONwZYe+gqOgikv2k=
X-Google-Smtp-Source: ABdhPJznSbdTMBxUgOgE20zXY6jOTU/G5DkiPy3yiChechbFydNBc+phR/JeTP9ZSOlexVOu6Fzmuw==
X-Received: by 2002:a2e:5c89:: with SMTP id q131mr4725689ljb.352.1599338562990;
        Sat, 05 Sep 2020 13:42:42 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:42 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 20/31] i2c: tegra: Rename variable in tegra_i2c_issue_bus_clear()
Date:   Sat,  5 Sep 2020 23:41:40 +0300
Message-Id: <20200905204151.25343-21-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Rename variable "reg" to "val" in order to better reflect the actual usage
of the variable in the code and to make naming consistent with the rest of
the code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c2ff55e8db54..6ec6161a1895 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1100,21 +1100,21 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	unsigned long time_left;
-	u32 reg;
+	u32 val;
 	int err;
 
 	reinit_completion(&i2c_dev->msg_complete);
-	reg = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
+	val = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
 	      I2C_BC_TERMINATE;
-	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
+	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
 	if (i2c_dev->hw->has_config_load_reg) {
 		err = tegra_i2c_wait_for_config_load(i2c_dev);
 		if (err)
 			return err;
 	}
 
-	reg |= I2C_BC_ENABLE;
-	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
+	val |= I2C_BC_ENABLE;
+	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
 	tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
 	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
@@ -1124,8 +1124,8 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 		return -ETIMEDOUT;
 	}
 
-	reg = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
-	if (!(reg & I2C_BC_STATUS)) {
+	val = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
+	if (!(val & I2C_BC_STATUS)) {
 		dev_err(i2c_dev->dev,
 			"un-recovered arbitration lost\n");
 		return -EIO;
-- 
2.27.0

