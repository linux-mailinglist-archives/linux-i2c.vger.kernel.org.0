Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36E9A1919B6
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 20:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbgCXTNb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 15:13:31 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38859 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727747AbgCXTN3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Mar 2020 15:13:29 -0400
Received: by mail-lj1-f196.google.com with SMTP id w1so19829658ljh.5;
        Tue, 24 Mar 2020 12:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8e7+L+UHZHa2zA2O9LK9VZBpvO0sNomc3WT2/0CqCjU=;
        b=ByzkfVsgRm5bJi+U8RCJHRQt9tjP2J474FwUvPZZtITq5rx5+eU82yk90R3S+6x81T
         ZXMiflZ4qDlC3MA0hUkYLhnhVtjVKmMdo8EYgH3JAH0Sq28mQUYQXD9q9Xrh9w0pvvtt
         g2o/uj5Ke6DudG4zTgun1YXTssK+frT6CBzPN9hWnaK64YX18YLZm/gYOH1nU/d2FVBN
         bYbe9U+kY/Zl6i2wDxO73uIEZXAJIdS9RuXf5bxPpqpwRJjCIRFiWTntWt7MGaAQVSC2
         iFMnewIylkBTehqrn56LrXk0RBrI+vKxGWjhh7PBNlrtmfhEVYAIovTEAKyo4tq4oN+9
         qKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8e7+L+UHZHa2zA2O9LK9VZBpvO0sNomc3WT2/0CqCjU=;
        b=iadn6XWpmDv8b5i9r+m0f3J4lSmY+KVzbLtYVtR2xiE9/aVsX4i528aXtmFMbZdR4c
         g9jUdMm8/KJebtTy19+B9L+zkLrvCR/F6hfLa9nQ1BkSLnJLiqEA5NPRspmRP1uKDCQs
         AFzO/GyYdh8E1yTEulI1tOM7GV18hzXEf/ShFT6wQdJoJtd44aAOFq81tjjYjX8IBu+p
         NwY8DmNZNRmXFQSGITSWLmB73hC7CzyCToIOT1eoKA8EveoEa998TCJeTjPH3IE+yfk0
         TepTMwY4JEIaiXY4pyu/b+9i/BsB5dvLi4tEXak0XfHisYJXtRqharOpDEPm++O2vXwk
         yVcQ==
X-Gm-Message-State: ANhLgQ2ZMbY660+IQ2YCN2DCZofmu3AgVZEZwLWXvniJZxn0dUSDrWv8
        N01J2+hE2w+pfDeYj4K/uew=
X-Google-Smtp-Source: ADFU+vuiAlL6Nfj0JpdKx9a6iHCBFnG2bGLQweFpi5dg/eF6KCPlw0Vh1GVnHbPzEfXKdAhKoyBNeg==
X-Received: by 2002:a2e:6809:: with SMTP id c9mr10101355lja.251.1585077207778;
        Tue, 24 Mar 2020 12:13:27 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id z23sm6347723ljz.52.2020.03.24.12.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 12:13:27 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy for a long time
Date:   Tue, 24 Mar 2020 22:12:16 +0300
Message-Id: <20200324191217.1829-2-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324191217.1829-1-digetx@gmail.com>
References: <20200324191217.1829-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Boot CPU0 always handle I2C interrupt and under some rare circumstances
(like running KASAN + NFS root) it may stuck in uninterruptible state for
a significant time. In this case we will get timeout if I2C transfer is
running on a sibling CPU, despite of IRQ being raised. In order to handle
this rare condition, the IRQ status needs to be checked after completion
timeout.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index cbc2ad49043e..0daa863fb26f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1000,14 +1000,13 @@ tegra_i2c_poll_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 	do {
 		u32 status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
-		if (status) {
+		if (status)
 			tegra_i2c_isr(i2c_dev->irq, i2c_dev);
 
-			if (completion_done(complete)) {
-				s64 delta = ktime_ms_delta(ktimeout, ktime);
+		if (completion_done(complete)) {
+			s64 delta = ktime_ms_delta(ktimeout, ktime);
 
-				return msecs_to_jiffies(delta) ?: 1;
-			}
+			return msecs_to_jiffies(delta) ?: 1;
 		}
 
 		ktime = ktime_get();
@@ -1034,14 +1033,18 @@ tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 		disable_irq(i2c_dev->irq);
 
 		/*
-		 * There is a chance that completion may happen after IRQ
-		 * synchronization, which is done by disable_irq().
+		 * Under some rare circumstances (like running KASAN +
+		 * NFS root) CPU, which handles interrupt, may stuck in
+		 * uninterruptible state for a significant time.  In this
+		 * case we will get timeout if I2C transfer is running on
+		 * a sibling CPU, despite of IRQ being raised.
+		 *
+		 * In order to handle this rare condition, the IRQ status
+		 * needs to be checked after timeout.
 		 */
-		if (ret == 0 && completion_done(complete)) {
-			dev_warn(i2c_dev->dev,
-				 "completion done after timeout\n");
-			ret = 1;
-		}
+		if (ret == 0)
+			ret = tegra_i2c_poll_completion_timeout(i2c_dev,
+								complete, 0);
 	}
 
 	return ret;
-- 
2.25.1

