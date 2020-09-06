Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D7225EFE6
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgIFSzx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729180AbgIFSvy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:54 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54AFBC061796;
        Sun,  6 Sep 2020 11:51:51 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id c2so13520408ljj.12;
        Sun, 06 Sep 2020 11:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yY5ozAr6b7Vgqfl+x9NP50rXLkO3sgT20nqJuaIQuVE=;
        b=IdwI59bqbsZbymQqZghaJMDN0Ep4nV6TQZh3G3bDRIexa+xr8vYtbzXLjdrRX1G8jN
         5X7P1vTR2LGdsej1usMd989TbrQZjLrKENKFDZnwHXiYg7ikjnLVx/CfR74UP2npq9J9
         6eCV9ZaN4uuBuuTIqFrWS7zo1ARcPRu+/dqY5qltp8EJC6obVzaExaE3H66pm7e0rdIu
         DrUrLAPc2CkfZyNFE1WyadK6s97lUx8OVJstU340RaH+L+z29qypQeJ/HArEZtwy5gLF
         hLyjHGgVFatvsjoH/fLCtbyPF57iUFA8VcuntoxuJjKL6lsLO5YcpGmIPfFTvheRbJR1
         euQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yY5ozAr6b7Vgqfl+x9NP50rXLkO3sgT20nqJuaIQuVE=;
        b=Tlfrr7VsvdclLl1+Ylvo18BvNEHE/THRhgmz9jOuMmZpFF36Lhe4SwKteHkiuOhRA2
         Qe8Dhg2vG47VV0naO2buWt19pF0Rpw7OjI48spH/i/LZ+BPyyhpeVtXH3FxCAR0rRZWK
         3OlSXW4YG0E0Ox28TI6UqKdEo93vzGr2fP+6Ovi/r+t0K/wulErYvFyXB53NiJpLsOkA
         gwHrvWs2v+hlfFrzy+e1WeWvAW5XfHIIwsrdtXhpKI9XjdEZH9EZpaueS/cfT8pNCDJa
         dlfA5kmwDYjwllItjf7l+CymgZHcL5QhgjE43CIkej2yzX/u0f0/pmUkBcy7Mep2yJiH
         MdsA==
X-Gm-Message-State: AOAM530Dtz79yOll6rGOFP0CIYHXOwn3Eku2BMqr6BLW6xKWMZebQ3zF
        URI3utlYSNngkyYD2iPRNDA=
X-Google-Smtp-Source: ABdhPJypnrUpy8Xi9zjBMipPuJSokfb2uylfLBXW7mWEQ3moS9MoZegf9fGLJcM5AdbV1nVKnevvwg==
X-Received: by 2002:a2e:8896:: with SMTP id k22mr7923463lji.298.1599418309840;
        Sun, 06 Sep 2020 11:51:49 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:49 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 12/36] i2c: tegra: Move out all device-tree parsing into tegra_i2c_parse_dt()
Date:   Sun,  6 Sep 2020 21:50:15 +0300
Message-Id: <20200906185039.22700-13-digetx@gmail.com>
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

Move out code related to device-tree parsing from the probe function into
tegra_i2c_parse_dt() in order to make code more consistent.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6021b9bcd802..ae4b80b522ab 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1418,6 +1418,12 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 
 	multi_mode = of_property_read_bool(np, "multi-master");
 	i2c_dev->is_multimaster_mode = multi_mode;
+
+	if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
+		i2c_dev->is_dvc = true;
+
+	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
+		i2c_dev->is_vi = true;
 }
 
 static const struct i2c_algorithm tegra_i2c_algo = {
@@ -1718,10 +1724,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		return ret;
 
 	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
-	i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
-						  "nvidia,tegra20-i2c-dvc");
-	i2c_dev->is_vi = of_device_is_compatible(dev->of_node,
-						 "nvidia,tegra210-i2c-vi");
 	i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
 	i2c_dev->dma_buf_size = i2c_dev->adapter.quirks->max_write_len +
 				I2C_PACKET_HEADER_SIZE;
-- 
2.27.0

