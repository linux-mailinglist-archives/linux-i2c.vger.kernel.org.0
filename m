Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 978F025EAAA
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbgIEUpW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728732AbgIEUmn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:43 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD327C061251;
        Sat,  5 Sep 2020 13:42:42 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c2so11745876ljj.12;
        Sat, 05 Sep 2020 13:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=awLSeV2Z+rtM7VgtALGSpyYZLB8XgYyFATh83dG2VAk=;
        b=U6QU02nTrbCYvhTJP8nKo3faoUQ5yN7PFq7AEFDPxztZ6JoJGLuhgDPSKMuVM0l6Na
         gw3ZrVSw0GRa5sn6/8By8B8Iw32riZr4+Va5SJ63eR0YisRIllMn/r3BLhRG1lM/bYJT
         F65SGGlqghKV8KuPcHI/TPidVQmtdfoNtVDitrvAg0758ZSzDb2Ykxoct0Mh7cUgHaO+
         bA7XlhGSUqwuFCLbfFvJIx76onQ5mj6iFUDo2kpGIgiJ2t+w+qTRIU+pCK+LWcw7vMu/
         eShTIRJ3N1QbxA8yC0TYpXnBvaHxDDx+zKVRtQSJEExdFZ7aDfJEtgoO5xAVXhOfgZWP
         /HdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=awLSeV2Z+rtM7VgtALGSpyYZLB8XgYyFATh83dG2VAk=;
        b=PCVurmxCIkpJxbMx3LRinSCkp68ptUbRcyNFEpVoIXmDqfO2M72Be58Gq+XubYPS1M
         ltw0ZZC0rrXSgMjkm/pgijK+7CtqJy5yg0JGiJnSlEX98/pvip8rWKYWzN5U1Xvzl6b2
         dXtUBdNpoVsnT4VZNMhOdfuTQSnjt8NSyfukmnOPms7vGtclJminhXro20NnM5s08ZJd
         VUi3owlNjE7Ig9ggumWZI9OqkOjEz+PUjuANvK/B6amZP3EY33SUkEUe59HU0rXYfdfD
         ur/XDLWDGKDBjsgZRLgMMD7lgVMbpJqjxsFpc5/st8ekhm4p+CoXuHhYNl7auEaKW2Dd
         UsQw==
X-Gm-Message-State: AOAM531kYasW75N3NkSPSd2c3xyguuR6OnC5VNa9i3DaXZ1IBWr/i/8g
        lOJqIgw+4he1IzIa/Axci3Q=
X-Google-Smtp-Source: ABdhPJwOSpMvUluNXcAAVMQ2/3ptwiUkDHhpW29MCnCdU4/NzraZQkHAY1ybvJkiklvJZPfZvRuyow==
X-Received: by 2002:a2e:e1a:: with SMTP id 26mr5060631ljo.377.1599338561168;
        Sat, 05 Sep 2020 13:42:41 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:40 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 18/31] i2c: tegra: Improve coding style of tegra_i2c_wait_for_config_load()
Date:   Sat,  5 Sep 2020 23:41:38 +0300
Message-Id: <20200905204151.25343-19-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Improve coding style of the tegra_i2c_wait_for_config_load() function by
removing need to wrap code in order make it more readable and to adhere to
the common kernel coding style.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a2ae4dab8001..dc9948d816ac 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -700,25 +700,23 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	u32 val;
 	int err;
 
-	if (i2c_dev->hw->has_config_load_reg) {
-		reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
-		addr = i2c_dev->base + reg_offset;
-		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
-
-		if (i2c_dev->is_curr_atomic_xfer)
-			err = readl_relaxed_poll_timeout_atomic(
-						addr, val, val == 0, 1000,
-						I2C_CONFIG_LOAD_TIMEOUT);
-		else
-			err = readl_relaxed_poll_timeout(
-						addr, val, val == 0, 1000,
-						I2C_CONFIG_LOAD_TIMEOUT);
+	if (!i2c_dev->hw->has_config_load_reg)
+		return 0;
 
-		if (err) {
-			dev_warn(i2c_dev->dev,
-				 "timeout waiting for config load\n");
-			return err;
-		}
+	reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
+	addr = i2c_dev->base + reg_offset;
+	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
+
+	if (i2c_dev->is_curr_atomic_xfer)
+		err = readl_relaxed_poll_timeout_atomic(addr, val, val == 0, 1000,
+							I2C_CONFIG_LOAD_TIMEOUT);
+	else
+		err = readl_relaxed_poll_timeout(addr, val, val == 0, 1000,
+						 I2C_CONFIG_LOAD_TIMEOUT);
+
+	if (err) {
+		dev_warn(i2c_dev->dev, "timeout waiting for config load\n");
+		return err;
 	}
 
 	return 0;
-- 
2.27.0

