Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFB9812BF74
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2019 23:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbfL1WRW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Dec 2019 17:17:22 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40399 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfL1WRW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Dec 2019 17:17:22 -0500
Received: by mail-lj1-f194.google.com with SMTP id u1so29973002ljk.7;
        Sat, 28 Dec 2019 14:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0wDGXuY18A0/+zgWOUGjS7EoingM7KoaMm0Na+dcu9U=;
        b=kYYx9FZxeN72Vkix7fn42y+fx6VD9koyBQKVPBVJNxi4E4a/4cGXB7/urmcky01/5o
         6KTud2TjDqGlBz/B/uN94R4CmJ4EELR+yeOlX+wY/RaHuABSePMD4yDMIhz/GHl2gG1y
         Z8pai+0ym9waVnqDZ0V8BpIcJW3BYmfxbzyI615y9LVziVLkZneMomsdndCdZzAjZvTV
         dQt+J5GUz7Z3N3A13HuxDho4m7xuzhuDvRUFc1uyfu5svhlGN93ViY/9vztKeXykN1cB
         ilMOCrPAelXTvX36q6V/YRPGb0W1TuhHHCoTq1Za7ohk/JPHjGP5GrIPTdhyL1hcHyBH
         hWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0wDGXuY18A0/+zgWOUGjS7EoingM7KoaMm0Na+dcu9U=;
        b=XjbIVjxVi5aDwE8SkwZGPfttBH+SiVFft7sipo43xjJjktazGXPzzTTaSXmzQvUFWl
         tTp26+p65pI9CrOOHtnEsOMS9CaCvjk4qY4mkeUMB5irwL+sO8tOeQwgNLgAE7DmsRwW
         PEjMhKstOg316/fD9/H30Rupvv5lS18yfeC0Pkk8/FOj7gU6Fh3+7RMcf9YoyixoDQmA
         RzfAAzctGNETxJsott6pyrhjNo7cYpyWDAHRX3X4mQADqMsuZEK2RGzolz/6igyZoCJ8
         dv/DuTwz+TeBeFMSFinrcJmGDkj314hj//GBUnL6/y0Nh/EOcUIBxyyatYZ+Hrj+s/wL
         zptA==
X-Gm-Message-State: APjAAAVh5F4v/jzKka8lZyi5FUouG0GBHonKIokPALwKrp/Fq32MElR3
        icAjqOc/frQJZoZqx0IKF2Q=
X-Google-Smtp-Source: APXvYqxps+Uo2YCxjkG2qDWaRiB1uO9CTn0y+Cu94BMp4r0e4BTp8sAR342uHdgyvUWNR4OxvweOYQ==
X-Received: by 2002:a2e:b4ef:: with SMTP id s15mr24877542ljm.20.1577571440065;
        Sat, 28 Dec 2019 14:17:20 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id y10sm15209584ljm.93.2019.12.28.14.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2019 14:17:19 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] i2c: tegra: Fix suspending in active runtime PM state
Date:   Sun, 29 Dec 2019 01:16:49 +0300
Message-Id: <20191228221654.28842-2-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191228221654.28842-1-digetx@gmail.com>
References: <20191228221654.28842-1-digetx@gmail.com>
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

