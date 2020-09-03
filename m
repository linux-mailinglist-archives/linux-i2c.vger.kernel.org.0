Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8734A25B801
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgICAzw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgICAxy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:53:54 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A6F3C061246;
        Wed,  2 Sep 2020 17:53:54 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u4so534633ljd.10;
        Wed, 02 Sep 2020 17:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sZD+fCtDbYnWXQk8Be3VFNb2Qop9c99v3RaE1XWrdU8=;
        b=jsMUtQ6/3ZfGHoMUA/nJYUCzuin8+fIK0w1KtwslMDrrHiSnVsPRwFvVB9oGfMLkF+
         IGIOM4kguc6M6jUdiWn42PTxBAAfeIlEhgoUDDgVijIZV8MIcV+abNr/KmHLWefjzaID
         2IwMIF0m0hTrutt60Z6Skru5WswWi1Go5PpRCo3kmxs1mnmapDVZrvAqn85vliHrJik3
         eK4U5PL5GZbGu7Jtsf/+Cls3/+83mQoVc1g0o2TqOJvtao4YEHFcteKwMYiXuN2IKizO
         Bgu7+/XkFyyeOo3H7A+0crwMWVSf5AXhbxUF4vbsSiC8mB2ri6/M/gQRg8tRzjXV+OlA
         hA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sZD+fCtDbYnWXQk8Be3VFNb2Qop9c99v3RaE1XWrdU8=;
        b=KhR4bnjL3tkqx1Ql6DttZ0lrGbvsgMihvE85stBjJe3cbPqAZmYAr7QaREv4GXNOfV
         ezEDh9koIx8hiMvlAORNxZgwboSZE207Y76MdiBur580rqqylUDvrj9VNnHcWTxSBt3F
         on05oD4+UlxKQlBOBujJj8JXmMZyrP6zoUrESVq/6lIdTJVz/PzOo+m/jjnGu7FlrMNh
         qbZeKLEWlbi01a6lbt0iouUfaakUXnLa89x1TRyNENJMA3w/b5JSZQ6e8mh/D4a+wxlO
         c6CwtFBKfmmhIuC1U3f10VpHHzNYJJlWq8m9jkXzmcuumSmadzRIQ71pPuQlx0C8RMJX
         QWkw==
X-Gm-Message-State: AOAM5313iVA/tGhIE3njpL2+rr+R7i6jYH/oustuip0ufdyS8/kSnE16
        QGXNGCIiF9U1/sJQ1GsEXC0=
X-Google-Smtp-Source: ABdhPJwmQvdTzq6Zc42d5JlTjGv6d/SWVdYCqbDhGWUnIDz+ujCYWwwgNDxl90+WazHBk6jJK5wPAw==
X-Received: by 2002:a2e:9899:: with SMTP id b25mr248714ljj.178.1599094432614;
        Wed, 02 Sep 2020 17:53:52 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:53:52 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/22] i2c: tegra: Add missing newline before returns
Date:   Thu,  3 Sep 2020 03:52:40 +0300
Message-Id: <20200903005300.7894-3-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some places in the code are missing a newline before return, making
code more difficult to read and creating inconsistency of the code.
This patch adds the missing newlines.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 72f03ded2eae..efc6e97aeb8a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -317,6 +317,7 @@ static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
 	else if (i2c_dev->is_vi)
 		reg = 0xc00 + (reg << 2);
+
 	return reg;
 }
 
@@ -392,6 +393,7 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 	dma_desc->callback_param = i2c_dev;
 	dmaengine_submit(dma_desc);
 	dma_async_issue_pending(chan);
+
 	return 0;
 }
 
@@ -510,6 +512,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 
 		ktime = ktime_get();
 	}
+
 	return 0;
 
 err_timeout:
@@ -717,6 +720,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	clk_disable(i2c_dev->slow_clk);
 disable_fast_clk:
 	clk_disable(i2c_dev->fast_clk);
+
 	return ret;
 }
 
@@ -1431,6 +1435,7 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 
 	if (i2c_dev->hw->has_continue_xfer_support)
 		ret |= I2C_FUNC_NOSTART;
+
 	return ret;
 }
 
@@ -1898,6 +1903,7 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 	clk_unprepare(i2c_dev->fast_clk);
 
 	tegra_i2c_release_dma(i2c_dev);
+
 	return 0;
 }
 
-- 
2.27.0

