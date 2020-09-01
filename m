Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E03425A094
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729494AbgIAVMZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729085AbgIAVLk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 17:11:40 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9E4C061258;
        Tue,  1 Sep 2020 14:11:40 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id q8so1594250lfb.6;
        Tue, 01 Sep 2020 14:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MjQLy+fqN+zR1x3JEChLov2U4aIDCj6NHus1SvLWF3Y=;
        b=lKZWHY1fLrBJOdT96nmXh95jzL8MJognCqc+GfqVgP1HA6P8LOaMVkMs30c/IMFfli
         44HOdUpqhH2BVO1JMcgvrVaOYHtQtNzcn0LdDr1DvsuBidHAruHtXLA/WegcTEr4Gu8A
         C1vxurWxhmB9sgwBxCJQiil5y40wxuDnDmPP/9aEkDSvlEA1mmLlKTmmc6M/8tEJhEDS
         kqJMoozdTWmqss3x0Nkv2G0OULzxqJk8qdXjt9SzZjeporqdfjmYMA8u7uStwIoTi9m5
         unlTeeK3Qo7gs2bF06wx5UreSOPXQ9gMPwjnUDAV20xYFKE3C5JYu8X0VAndzovNaXGV
         MKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MjQLy+fqN+zR1x3JEChLov2U4aIDCj6NHus1SvLWF3Y=;
        b=UBL4OaFc5Lp52sjZ+S+ojMuZUQCluAArMc4gZdQrCOD4SbwJg25LlELuDSvBKJ5WhD
         xZjFxfHvGA12xaIzlYvG6U/alddSJoPAn0uWPXbApBF5Leqj4AYHf/kW8LlzxJls5+aZ
         L8InkAlRz7cjQ/hrEgaUCAYVhgV+PfjnrIU3GPlrfCBrplaWXcnz0T544iLrdOqDNA2g
         7L+nKmMoNt+u9hU59SJhHxt/enn9Yo3BMnZVeIxVOSRMyBU8SuSVfDvroenLFO6y47N8
         Yd6BB8gIhaTnZr7xDtCPts4KOL9K1HExLy0hW0GKFWcAk/e6lFbD+wXVpg7NEZJlMQj7
         t85Q==
X-Gm-Message-State: AOAM533LKxpZRv4Bfvk1MDx+RWUFK3rFaHBFjcnfw9Pm1vR928elLRpu
        MtlRgWChl425qEIf3iKwETa52lSih14=
X-Google-Smtp-Source: ABdhPJw6A2L3GbY4ssQxDtN4bSbqPCQrL4MgHO3URaRl3Ec1gW9+VhuzVx2nkhr4s13SukinuispIg==
X-Received: by 2002:a05:6512:358c:: with SMTP id m12mr1589217lfr.18.1598994698561;
        Tue, 01 Sep 2020 14:11:38 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g19sm502656ljk.125.2020.09.01.14.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:11:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/17] i2c: tegra: Rename variable in tegra_i2c_issue_bus_clear()
Date:   Wed,  2 Sep 2020 00:11:01 +0300
Message-Id: <20200901211102.11072-17-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200901211102.11072-1-digetx@gmail.com>
References: <20200901211102.11072-1-digetx@gmail.com>
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
index bdfccf055959..628674ed8440 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1127,21 +1127,21 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
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
@@ -1151,8 +1151,8 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 		return -ETIMEDOUT;
 	}
 
-	reg = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
-	if (!(reg & I2C_BC_STATUS)) {
+	val = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
+	if (!(val & I2C_BC_STATUS)) {
 		dev_err(i2c_dev->dev, "un-recovered arbitration lost\n");
 		return -EIO;
 	}
-- 
2.27.0

