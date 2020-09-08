Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E61262308
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729449AbgIHWnT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729960AbgIHWkw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:52 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B31EC061786;
        Tue,  8 Sep 2020 15:40:51 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id y11so539436lfl.5;
        Tue, 08 Sep 2020 15:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OsS78V1q+vZh1E8rpIjUMymq1NkW9yJlg2YzWQ5yU2Q=;
        b=XiARmRmbnNZ4NWlQiTVVG4fosLLQzEeW7+ChTDquOEbbSmVRhwAVSagypkEzif7/A3
         42qz7xjJJiTn+QWu5j8bhNN5HL5glhWp3D4LjX8aQOARYTtFZMK/nhoON1POQt0h5OyP
         KBUqihHu30MNyM+niFjPkb0OCYZKIRdALZHQC1D9FDZYy2hYEMvSN1rM/JMsHvK2as70
         JT5+ElQFRlQiGNmdjmEiwLhUsFDR3GIEMPftRvRddATwiRIWpDfJlDP5wxaRXqrESGhz
         9DGtokYICSJuPif7PGIM676yyyRPo+eycwbuSKYlJrcUZeu26X0+wOjjtwhMnKuv1sBs
         J8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OsS78V1q+vZh1E8rpIjUMymq1NkW9yJlg2YzWQ5yU2Q=;
        b=K0Id2milbExfTpu3FftffVBG98vVwruQNhqXxCISfxwlkCDdewdoRux/CDXtpeBsW7
         tyvthErqOPlQdcdAgcbilqBlSsD5Iw3DBLk/Z/y5PGrtOJ/PbpCm04amSlO1rNWXZPeb
         8ZDuTLdLh9BfsRz8uQ9RYHYv/CyViYIgMN2nIKNbQejpWLjDBPAPPbDpDvVjOldraRX6
         xFDK4oSA9TsN6sT95/VPgm682a2f2a8aSK/VSOG9aPMJWIhAYrFoxkzW+e1vIBEUEnv/
         FiyB7ZyctOmGavw/G0FY3TZuhkp7+wVLj9OR3iujmqafKPR8NwB99J01GEKe4/32NFGQ
         5vzw==
X-Gm-Message-State: AOAM530LxJ2fwaI44yuAovCjXz0Wa+yPKk+UP9mdkviysiO9FhD8Cxse
        uBuG4uCSirPdrQ7Nt3qoVEo=
X-Google-Smtp-Source: ABdhPJxebxvAnU369b/8BgvoNKzHmcKr5pAlLHT0O6e6oAf8IW0HtBDIFP7IsaumPhnZD6XtMEPH1Q==
X-Received: by 2002:a19:644f:: with SMTP id b15mr537917lfj.136.1599604850110;
        Tue, 08 Sep 2020 15:40:50 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:49 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 19/34] i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear()
Date:   Wed,  9 Sep 2020 01:39:51 +0300
Message-Id: <20200908224006.25636-20-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tegra_i2c_wait_for_config_load() checks for 'has_config_load_reg' by
itself, hence there is no need to duplicate the check.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index fd0d51ec447f..18968302457f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1082,11 +1082,10 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	reg = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
 	      I2C_BC_TERMINATE;
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
-	if (i2c_dev->hw->has_config_load_reg) {
-		err = tegra_i2c_wait_for_config_load(i2c_dev);
-		if (err)
-			return err;
-	}
+
+	err = tegra_i2c_wait_for_config_load(i2c_dev);
+	if (err)
+		return err;
 
 	reg |= I2C_BC_ENABLE;
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
-- 
2.27.0

