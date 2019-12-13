Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CED1911E4D7
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 14:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbfLMNoW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 08:44:22 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35085 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727346AbfLMNoW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 08:44:22 -0500
Received: by mail-wr1-f68.google.com with SMTP id g17so6719981wro.2;
        Fri, 13 Dec 2019 05:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GpEHeLLjWdENoSnNBLHaBrCZ+jWm2qDipLurc5jJAnQ=;
        b=EPl5GEVMJkQZsmPJrhP3AloFf1HZa+bj7wFwOa2Rywv5rEhsxsMfBJUK6YwOE2tV/Z
         2CmghTHAYFKcVRuzo2lJ0dYDpWMdOFkE2JLFbsc/MSYsUR3WaJEMqv3bgcavzSADeJf3
         iwJYob/L7bOptli8LJ1bpdVR/ElumqJJ7K4RnFeoBo4lNuyerEgJMRMkDfcBj6athMAj
         cbFUPziq15mWQIIxo8CYohx6YlyaLhL+qkwK81LnT5ZV8z0vjatZ1DLDXUxWVD1rVClQ
         rjvkXDMPlZe2ZC333AlIGWiISmumnx283Fw2tkRhL0XYo6xmEkEF7hWcuOccWjK/u+ma
         xdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GpEHeLLjWdENoSnNBLHaBrCZ+jWm2qDipLurc5jJAnQ=;
        b=TQJ18pisa0ezpu2G8pCsY6zkeUOtZFnmC8uc2isu83PprS+7Q+msLgISXctbwOLGNG
         DHOf3lzQ5PcZRcJRSZ9kTHplV6z1CI08SkWD/1UC4WmwTt+RRf8TW0zqXc9ub30MregU
         BLH2DgAD1SQTD32Vlcks83UBI/yWxzRrkvWq65U0yeemMnKAI1bEygL447gFsc248e+w
         ctS+R7S6wrRm0ZuSUEYSNqUfHrilz1vBJwpYVJaFc/1I4vkJq9R+eM4w4oQH4lwhptnJ
         h5fOj+JsTYQi/fXmI3g6BRFy9GbcaHRcRucknb0e2IyfUMQCM2nIs+S6Cxie5rxxw0Sj
         0q8g==
X-Gm-Message-State: APjAAAWaaq4OlKgy8NplunkgL3VuoiMODGa1VkG8b/Ad3T0z5JVng66O
        d3jgwRezzlLr95MuFyRGpv4=
X-Google-Smtp-Source: APXvYqwK59DBB1IZ8Xx7fyJcujAO7oDx1rubmErxbAopfmbA5FTxCe+V4/pd2kk5wyHmIObgfLhuYg==
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr12512899wrm.324.1576244660382;
        Fri, 13 Dec 2019 05:44:20 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id e6sm10031483wru.44.2019.12.13.05.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 05:44:19 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] i2c: tegra: Restore pinmux on system resume
Date:   Fri, 13 Dec 2019 14:44:17 +0100
Message-Id: <20191213134417.222720-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
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
index a98bf31d0e5c..dae2a3d7b512 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1710,10 +1710,14 @@ static int tegra_i2c_remove(struct platform_device *pdev)
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
@@ -1729,9 +1733,11 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
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
2.23.0

