Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A91AE274CB9
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbgIVWxs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbgIVWwv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:51 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403E9C0613D1;
        Tue, 22 Sep 2020 15:52:49 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id b22so19824172lfs.13;
        Tue, 22 Sep 2020 15:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DtwhdcYe1/rW3u1cX4z6pvysE+j6MqsTW1PsvueCYsE=;
        b=CMI6UU5z2XqW9YiVQINQT1oa3GkoooQU8YBSScgQFubdI/+z3gKBf7LSESabI+C0+Z
         QpkJK5d/WeE3xk7O9ommgxrWSnQ49qA3ueg1wrj3lNy5wgH6YKMLaLkvsY1VBYdJME0Z
         e3o8T494mtA45mHcJI0p+pZcXWhIWUmygzf7WxWt265Pm+rZnT+lnHCSgDiiTpmXcCUc
         IXyPOHPJ52Tmq49OPJJF+L5YC7sQJK1EPM4EwYgwVpS0T/niMlZZSxPnN2D683+Om22k
         pDpDspA+3QN7N3nL956vObB6WFxeQLDIYr6gEIHGUkXzYp6ML6Zxacb4TIH8WGJPcmY/
         hipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DtwhdcYe1/rW3u1cX4z6pvysE+j6MqsTW1PsvueCYsE=;
        b=Gbx1YpfV//gWPyv9cY/83jowqAT5SD+vbbe81FUbWvVSqIOv+jCT8TQ3DZyP5s3toX
         qWoOmJhLqkNA/7144Odko2K1dGXT63L6Z2RYVgFu3tmD9rL1GkjqAlxTTwoH53OTZ1B3
         fLUqVFkcmAXd/EadicyK4JRAnpQs4Mk4DG0wniUXydWBcXAx3QMioZVbsbBlwQeUl7pO
         Bqzz5gDSPA/LOxo3ec8hGTsYTKNScfYOtPVqrVkPu3OyP3BHAyAjFQb89yL0IgemlGHo
         9ViWA4SNB52XsidXkrPI7enVDjPhAw/x/+uDDXXoiqDcTXvC0SWiApVm5b0abfw1CHv1
         mbFg==
X-Gm-Message-State: AOAM531G4lD53h8xcmKzDX75NZlR9t0L5a8s1D9Vh4dRi7SlUYJGafYb
        eHf+Jaf+yvMfUUlD11sOOB4=
X-Google-Smtp-Source: ABdhPJw7iETcMdt2etY21hYRs83/PAeXfWVeZwpayk9//ddO8Q9/xCzPfQwr2Alr+PpuXQ0EF+DNQg==
X-Received: by 2002:ac2:5df3:: with SMTP id z19mr2172712lfq.567.1600815167689;
        Tue, 22 Sep 2020 15:52:47 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:47 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 18/32] i2c: tegra: Remove likely/unlikely from the code
Date:   Wed, 23 Sep 2020 01:51:41 +0300
Message-Id: <20200922225155.10798-19-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The likely/unlikely annotations should be used only in a hot paths of
performance-critical code. The I2C driver doesn't have such paths, and
thus, there is no justification for usage of likely/unlikely annotations
in the code. Hence remove them.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 347651401cd6..dc25578adb6b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -852,7 +852,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 		goto err;
 	}
 
-	if (unlikely(status & status_err)) {
+	if (status & status_err) {
 		tegra_i2c_disable_packet_mode(i2c_dev);
 		if (status & I2C_INT_NO_ACK)
 			i2c_dev->msg_err |= I2C_ERR_NO_ACK;
@@ -1294,7 +1294,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_dev->msg_err);
 
 	i2c_dev->is_curr_dma_xfer = false;
-	if (likely(i2c_dev->msg_err == I2C_ERR_NONE))
+	if (i2c_dev->msg_err == I2C_ERR_NONE)
 		return 0;
 
 	tegra_i2c_init(i2c_dev);
-- 
2.27.0

