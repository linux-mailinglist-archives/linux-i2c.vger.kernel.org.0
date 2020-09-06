Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D2F25EF8A
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729185AbgIFSvz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729118AbgIFSvp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:45 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE04C061755;
        Sun,  6 Sep 2020 11:51:44 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a15so13643492ljk.2;
        Sun, 06 Sep 2020 11:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OBUXvlICXAt4XhkXTBZEgHZISfsH0kwsfBBqReQcTB0=;
        b=tF3dtYTP1OUDdU6viCKHRFrYuoQMQMMHCW93Y/HzQVuQDyfPhNSCdUkdgaNaRqvYy/
         KeXviAV8gXfVtwefzL6LMzPFeoZDd/nbQGvLNUivrI1bCDCKd+jhrFlVnhLzZAwV68Ni
         fB/L+8nQh0JwRyFY3sRvNpVWRwtAASvevGC3lIjoQ1WngUWq1svHymP6R31GNLTz3g2T
         HKg20CLMYHwEP4sT1lgcPTenKfOkFVu+iIF+XHiaTALiNHoHm8ZsZVjX8J51Se3kEpAe
         Oqys5kmKt3UVg9iMcQ5zUZrj168UuU9bGhPwqp7mWZKelFJubfWuszCVfUqqw+5RZmZd
         w+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OBUXvlICXAt4XhkXTBZEgHZISfsH0kwsfBBqReQcTB0=;
        b=OyJbKhZWLjKFlfQufq2td2b26QyhKwRSXEWjNznfwci5M6IZCOO6eQR/htYY0Uc82N
         k/AVU6oYRAwuL427QUC2njTheQmvrOBPtq6tLBlCfl9snGzwGczB3Klv3vNu59hA1zUA
         ume7z/43wdjZuHw2GW5GTeWo0WP9bYRP0CtJZ8rg0M9p1TUKJN2vuUXsmezg+Iw42Jso
         wua231Rx64SZqBCsLWfT0BNvv2fTo97ELaXbs4W463BK5V8aLjdcKGAkpQXPYdChJ57o
         0tcChfG76F0SQjItudf6GtKZznnxwAwHz04MfFXU1yLTVOi+CYI0a0M0ZXuS8G3YEXNJ
         DBHg==
X-Gm-Message-State: AOAM532zvcQGX1vfozC8T6zBj8gYZPQ1WRunxfcIp+RjeQCownawRraf
        A01a8d41xHPhalswXIl96NjYZapCzrs=
X-Google-Smtp-Source: ABdhPJxGdwvw8sgsF6rAG5pZKaW9VOoQEBNSYyDn+n1FfUYH6PBvipwMmgS5hgwW70dgaf3RVux6JA==
X-Received: by 2002:a2e:980f:: with SMTP id a15mr756737ljj.153.1599418301977;
        Sun, 06 Sep 2020 11:51:41 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:41 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/36] i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
Date:   Sun,  6 Sep 2020 21:50:06 +0300
Message-Id: <20200906185039.22700-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tegra_i2c_issue_bus_clear() may fail and in this case BUS_CLR_DONE
stays unmasked. Hence let's mask it for consistency. This patch doesn't
fix any known problems.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 307df6f97ed0..d01697995224 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1149,6 +1149,8 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 
 	time_left = tegra_i2c_wait_completion_timeout(
 			i2c_dev, &i2c_dev->msg_complete, 50);
+	tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
+
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "timed out for bus clear\n");
 		return -ETIMEDOUT;
-- 
2.27.0

