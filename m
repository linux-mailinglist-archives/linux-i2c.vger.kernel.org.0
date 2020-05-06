Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB33D1C7A57
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 21:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729220AbgEFTeK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 15:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbgEFTeJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 15:34:09 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75985C061A0F;
        Wed,  6 May 2020 12:34:09 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e16so3573290wra.7;
        Wed, 06 May 2020 12:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3/vHHfXaPkc2BVemCUzY7Jz2Az00+vaAtxpSsXyV1G0=;
        b=g/FQLcyNVN5aT1SKsfGFiX+UVYAzZUluVs5BRfBQXEqvXPfMsoduxKl2q8KSZyAYSN
         gPJvY/daHdcOnrcWC6K/pUAtQhNoSYrQunUunddXmKWYvx0R1S3EIeLLNdgUzHMLKMue
         4BhRlEEVmPuTHlwH0eXfBOFFfwDNVZtllgFxH7/vamZoSmT1aYoitCpMfOt9jnh7sUVd
         s2vduz3kBR1jOEeeY7j7Ce2rJ4xtYykxEjOm3sE/teSzRKZ9bwxF2k4dpwQJGkucTYvA
         mMXf/ekrEk4rcfs46J/0BogMxMyzBKTOf/pqMElneJSr0v34dtC9yBagllzDbNuYetal
         jW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3/vHHfXaPkc2BVemCUzY7Jz2Az00+vaAtxpSsXyV1G0=;
        b=pP7H2Yoas1XFVPINZEEJa+fNpOkHWCIUTV4pYBL+mgELbYS0xpLCtDR7CFUlfh8L2Z
         vVKmtza9oEQjVkVhKviTyC7iCEdBuCIlOaQIG6dlHnI8RFqeKYERc6gkUIuOgRFiEO7/
         PEfarGa2rP3Ba2B5RD9aRy6MXcf80/vQYsK6PggQm+/VV8jWGLezGbgIh61U7vF4gbZQ
         fAFfuOreOthZAClDvzw6lCtdFjP3Bp/nLvLpHaEZhpZQQ6It59nXsfPAr7ZQiFPpLeGn
         HB2ln+BWa7efuxZ4yvNw60S/7TdG6FU9jrp3yqb75yhaxSx8TGZJFWsThCQJa/QdKO8j
         GBdw==
X-Gm-Message-State: AGi0PuZkpuOgWr3Fd8KeuasYKDOKO6f3PezBIQTDhQo4sUG+ybLyK1IF
        Z6LqjSZ03Qc7uhDuH3Fal/yfUXQkU2o=
X-Google-Smtp-Source: APiQypKOqLaPHR2GXr38hzeADI8lY4uWafphydd2x0K9hIW5mO+Z/kTlD16xMidFIH9HhnltDFTBhQ==
X-Received: by 2002:a05:6000:146:: with SMTP id r6mr11864833wrx.9.1588793648128;
        Wed, 06 May 2020 12:34:08 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id x7sm3885312wmi.17.2020.05.06.12.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 12:34:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
Date:   Wed,  6 May 2020 21:33:55 +0200
Message-Id: <20200506193358.2807244-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200506193358.2807244-1-thierry.reding@gmail.com>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Depending on the board design, the I2C controllers found on Tegra SoCs
may require pinmuxing in order to function. This is done as part of the
driver's runtime suspend/resume operations. However, the PM core does
not allow devices to go into runtime suspend during system sleep to
avoid potential races with the suspend/resume of their parents.

As a result of this, when Tegra SoCs resume from system suspend, their
I2C controllers may have lost the pinmux state in hardware, whereas the
pinctrl subsystem is not aware of this. To fix this, make sure that if
the I2C controller is not runtime suspended, the runtime suspend code is
still executed in order to disable the module clock (which we don't need
to be enabled during sleep) and set the pinmux to the idle state.

Conversely, make sure that the I2C controller is properly resumed when
waking up from sleep so that pinmux settings are properly restored.

This fixes a bug seen with DDC transactions to an HDMI monitor timing
out when resuming from system suspend.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 7c88611c732c..db142d897604 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1769,10 +1769,14 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 static int __maybe_unused tegra_i2c_suspend(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
+	int err = 0;
 
 	i2c_mark_adapter_suspended(&i2c_dev->adapter);
 
-	return 0;
+	if (!pm_runtime_status_suspended(dev))
+		err = tegra_i2c_runtime_suspend(dev);
+
+	return err;
 }
 
 static int __maybe_unused tegra_i2c_resume(struct device *dev)
@@ -1788,9 +1792,11 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
 	if (err)
 		return err;
 
-	err = tegra_i2c_runtime_suspend(dev);
-	if (err)
-		return err;
+	if (pm_runtime_status_suspended(dev)) {
+		err = tegra_i2c_runtime_suspend(dev);
+		if (err)
+			return err;
+	}
 
 	i2c_mark_adapter_resumed(&i2c_dev->adapter);
 
-- 
2.24.1

