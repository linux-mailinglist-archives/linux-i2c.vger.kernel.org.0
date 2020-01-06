Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2831E130B3B
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 02:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbgAFBEj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jan 2020 20:04:39 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37785 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgAFBEj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jan 2020 20:04:39 -0500
Received: by mail-lf1-f67.google.com with SMTP id b15so35323631lfc.4;
        Sun, 05 Jan 2020 17:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0wDGXuY18A0/+zgWOUGjS7EoingM7KoaMm0Na+dcu9U=;
        b=GBs2UtWFxeeLekr/D23vfCkd6wnRqAm/OYCnKE6jqfuYusXS3XxMYEP537ysCys0eR
         iuedWCneC4VKarU6uLQusFsskJm++OOxrpHUail8Z2jhCJEO7Y1Kfy5wKDVLaTxziF8m
         6NX4/5QH+Peva8UBv9i5mvSRuYeEG6q1PiEfBx3BIhFpvlOjSopjtgxcK4pzt6JprdCX
         h+hg7vQIPXXgt5zwU275NljW4f67keVEhYbrRx8Tk25ANRTFJeMEEHVvozg+ST+w2wMX
         IJIOTKcY8sgw2n5JZ2Drbtym/G8080qk19+w63KLGtex2RMMRSXKiNbTNjMfWHYvw6ww
         wlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0wDGXuY18A0/+zgWOUGjS7EoingM7KoaMm0Na+dcu9U=;
        b=qeDuAywQSVHuwoSI6q+cm6v+XOhr2jIHxHYd9D5rytwxgOo9a8czWTooW7G2yg/FZe
         RYWqiHUnvb8Svrj16Z5N/EmmJk1F5TtW/0X0MxU9cLKWXRloLStyKUmR39p+PEre0vFu
         d552ah+aDND7xz1zrBr4rpoG2UiOD8zgW0W+WH2XE4AbM4QxMPhi5zE+g65uNdYzVJny
         4VA4aCJUiS/1gijgEFY3MmwC5nRF+MMSxkPrBLC0tkysmkVuJbwuyEvx9BFnmEAKFPbY
         YrjsN6uiu6zUnKGwmroP2d2OPzMlT15SCE4wMbfKdw2L4Z3klusRLPOlEmLMUdt/fH/p
         uOLQ==
X-Gm-Message-State: APjAAAXq6I5rXDNflPbnF9QxBrFE3P4OsWb4z0+dO59l0fiaX3oiNA1l
        iOL0axPVa07mBd3LxWUtI4E=
X-Google-Smtp-Source: APXvYqxkQWqOVDC0dr/q+iMiB9WA3jGHlRZdbwquamB1Agbx4s6gXrXkM1ED6wRyQxM4Hk9A8AS5RA==
X-Received: by 2002:a19:7401:: with SMTP id v1mr54473610lfe.129.1578272676859;
        Sun, 05 Jan 2020 17:04:36 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id a19sm28245910ljb.103.2020.01.05.17.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2020 17:04:36 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/9] i2c: tegra: Fix suspending in active runtime PM state
Date:   Mon,  6 Jan 2020 04:04:15 +0300
Message-Id: <20200106010423.5890-2-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200106010423.5890-1-digetx@gmail.com>
References: <20200106010423.5890-1-digetx@gmail.com>
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

