Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1434F139F1E
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2020 02:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbgANBg5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 20:36:57 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37227 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728944AbgANBg4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jan 2020 20:36:56 -0500
Received: by mail-lj1-f193.google.com with SMTP id o13so12381736ljg.4;
        Mon, 13 Jan 2020 17:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QVU0l94ZGKYq2v7mTNWPaJoWlqCeIiCLa/ETRf3XXY8=;
        b=PRTPGsNcR6uDo2LcQlNAYMn4RrcFdLzb/GGSel85h3gujCai+G1NT97EckXsCIHCiN
         t31iT1gC74nZ7PLkkTByZY14HZZl4/TcshWRDYYCbKTshv6UrGXFrRIV0F/tDomIZkdi
         OMYqdj04mH9SoweRsnxdy2tuGTDwDzHJRIpLBTKNvDi7vxfOJTqWmrlRJIionEVqCh5G
         GolwbM6Gl3/gS99iAeyDbyTn6A6HpcxzaRrr8Pob+G9kp3zQdoiO5PCRTVFnSfVVwbAj
         UbZ144C+fnf5p2wQfBT4jifD6glikKmTjcjK1rYWCUb9xBVthj5CRYmi94y0k9HB756l
         OIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QVU0l94ZGKYq2v7mTNWPaJoWlqCeIiCLa/ETRf3XXY8=;
        b=Jg/NeJIQkUl/n1Dli4fsLFMh1RBOW4jYgWfQB/2U8CK4h/8INJMYvmA7kE9yZtzMET
         x0LPDlo+98XlXmECdG+r3GMWTGLzsmzcBUMm58rVW7Rsi6eXHoNwOodE4/G3J0wzjanb
         yYGW1Z7F6OcCPODPGjbRtBRy//kqpzMz5VVBuqNPWmr80pRACDKO/QokgN/f1Rq0WKx6
         2USpjXE5Q2cdo+ZYfRoSLWET15couBe9+I9hzGebQrMB5sjfxBo2s7KrT89lgmuUZxF8
         7F1Oi1gVsOqr9DJtJgIAAMmrPcBro/U8z6o12ijTpkWmvjJPfcNhe8rqdVVwSmH2Pgeu
         49Bg==
X-Gm-Message-State: APjAAAWz1Ytt+gNaQeg0K43HYZ0dRJXk1K5b0hV+SIIPPvlus/rUVB2S
        jF0uBOau68b3mQ1UWJLactQ=
X-Google-Smtp-Source: APXvYqz0s9Dhz3aUWokE6OYDxqroGU77U8O7NEtp1T+vldWsHUHgr0RRMeui43pxKagx9mETijB0fA==
X-Received: by 2002:a2e:9a04:: with SMTP id o4mr12756284lji.214.1578965814262;
        Mon, 13 Jan 2020 17:36:54 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id m189sm6427627lfd.92.2020.01.13.17.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 17:36:53 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/8] i2c: tegra: Fix suspending in active runtime PM state
Date:   Tue, 14 Jan 2020 04:34:35 +0300
Message-Id: <20200114013442.28448-2-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200114013442.28448-1-digetx@gmail.com>
References: <20200114013442.28448-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I noticed that sometime I2C clock is kept enabled during suspend-resume.
This happens because runtime PM defers dynamic suspension and thus it may
happen that runtime PM is in active state when system enters into suspend.
In particular I2C controller that is used for CPU's DVFS is often kept ON
during suspend because CPU's voltage scaling happens quite often.

Fixes: 8ebf15e9c869 ("i2c: tegra: Move suspend handling to NOIRQ phase")
Cc: <stable@vger.kernel.org> # v5.4+
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a98bf31d0e5c..79d19f6ce94e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1710,9 +1710,14 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 static int __maybe_unused tegra_i2c_suspend(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
+	int err;
 
 	i2c_mark_adapter_suspended(&i2c_dev->adapter);
 
+	err = pm_runtime_force_suspend(dev);
+	if (err < 0)
+		return err;
+
 	return 0;
 }
 
@@ -1733,6 +1738,10 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
 	if (err)
 		return err;
 
+	err = pm_runtime_force_resume(dev);
+	if (err < 0)
+		return err;
+
 	i2c_mark_adapter_resumed(&i2c_dev->adapter);
 
 	return 0;
-- 
2.24.0

