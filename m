Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF4725EFDA
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729211AbgIFSzZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729181AbgIFSvy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:54 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A8DC061756;
        Sun,  6 Sep 2020 11:51:53 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id t23so13595734ljc.3;
        Sun, 06 Sep 2020 11:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WoCEsCAP1fy/lfIOqPFGX4zHLxGv9ICTmk/FKMS1D4M=;
        b=ZhwLID17rc/gI8ttExshTUUiVfSu9J76DRFclRk+2d5RZuLKnFb47WJnBtMbUURgBt
         eghcB8oNZWcj2dwXW4J7RfLKVATepk0w+4slC9/F6Fb5z8woxxZ5qZzZlt/q/73uv43i
         DGBeD0/EEASFWZVeWCq8mJhsZF35ZQmVTqdQmOBb39Bt518MZN3cNQAmVNEPNqVYigKQ
         LI2evU4mPctyZWQ8EEzhgBjMVyFa6u6W2yrpGGj10qmLD+EdlYPeaD5CoLBTscPxZaN4
         lwtFFzNuImwiiSPzDgO5vfn5g4ubs9EPEuTHSzZ9tOboHMeO3+WEG7AVeRL1URYyTQDQ
         m3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WoCEsCAP1fy/lfIOqPFGX4zHLxGv9ICTmk/FKMS1D4M=;
        b=X8tAg8/l6qkHvvgKCwLOxgUGhrlsnGrus8Gv/y4YXWx1K+LlE07wqYrn/x2FRXmdr3
         8Jkey25yXcv+SLqNBPb8sgNdS15D3z1bTInNoZ/qXuUbFUjaDnvrhe5vm793ed9cLNZr
         uxbYQ+SsMHAkahvVWwRSyZbffde68R+VgZLRdydc1qZXxDye2lshgF3SIrR340rIJ8JL
         lgE5XO/Syw66/N/7/qobAoL9fPBcdf/Yh4/s21eP7jpGHZbhojLT5pI6XAlE0Dxt7AN+
         y7xH2mYSFFkp+6SbrI8dTTs3eOAopX3CHeXh1Q9aynlA8QYg/9y3+MScfROOH9xypznQ
         Yztw==
X-Gm-Message-State: AOAM531opz1Qeeha5C29Pa1YNXCvNbafVkP95jDllYVUiCfAjEDEv+bB
        NQ3ycDNvV98gUbgcMftC3iE=
X-Google-Smtp-Source: ABdhPJxjfW4y6dB2+4dt6CVnjaTYl+V9zdiTOcJD6PY4vqTowTJXR4M2m1JCcjgjAv/QXNH6t/nHYA==
X-Received: by 2002:a05:651c:1253:: with SMTP id h19mr5819295ljh.55.1599418311619;
        Sun, 06 Sep 2020 11:51:51 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:51 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 14/36] i2c: tegra: Remove likely/unlikely from the code
Date:   Sun,  6 Sep 2020 21:50:17 +0300
Message-Id: <20200906185039.22700-15-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The likely/unlikely annotations should be used only in a hot paths of
performance-critical code. The I2C driver doesn't have such paths, and
thus, there is no justification for usage of likely/unlikely annotations
in the code. Hence remove them.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b4df0351252e..6597cbe0a059 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -890,7 +890,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 		goto err;
 	}
 
-	if (unlikely(status & status_err)) {
+	if (status & status_err) {
 		tegra_i2c_disable_packet_mode(i2c_dev);
 		if (status & I2C_INT_NO_ACK)
 			i2c_dev->msg_err |= I2C_ERR_NO_ACK;
@@ -1332,7 +1332,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_dev->msg_err);
 
 	i2c_dev->is_curr_dma_xfer = false;
-	if (likely(i2c_dev->msg_err == I2C_ERR_NONE))
+	if (i2c_dev->msg_err == I2C_ERR_NONE)
 		return 0;
 
 	tegra_i2c_init(i2c_dev);
-- 
2.27.0

