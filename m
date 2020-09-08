Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F326260879
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728317AbgIHCPX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:15:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728324AbgIHCMA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:00 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7963AC06179F;
        Mon,  7 Sep 2020 19:11:54 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s205so18039122lja.7;
        Mon, 07 Sep 2020 19:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ssXvtmU8WdM4pL4rp/dgR6uSS2Fq2XHwxYSCuPbIYk0=;
        b=tyKhR3OTV1qz9wjOI40GJJjPDMk7mw338EgTN1MgP/oT1/0yDuBBTWFsgy4FGLnhqD
         nyUmHYc3QgcUahravEB/ndZ2Z/NNs+g7gcu8e4FJOBqVs6OwTxprL6Ka9dTSaqAf4HLy
         Mul8PK+Yo943WiHP9IpIUlNqHUKlfdZDu9EHJfBJTxqXLfEH7Q54H+lB6HpiIts9ma8C
         hpCLyjn8Zbm9JYllguxvBOMT186w/mt3YiQmjnEz53p/oHBmC+IvdLuheF5Bpjvb0OAC
         fsLt4p0DXeRcKIbJFkjcNqHdls1arsO4NJWXA8C1cEKDLQHOqeYvP9jAy+tg6G+xquX2
         +vYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ssXvtmU8WdM4pL4rp/dgR6uSS2Fq2XHwxYSCuPbIYk0=;
        b=PgQXcy1aP8n9g3mDFOKcEC76uKj9Jh0tpdcw+3EJfXQgGuoLU5tRp8jckIDqqDXvLy
         grb6icKJVGBKwwuGs6Q01Sactz9Nfrbqd1irr7jvxjqO7OzChs/Ewd90nTToxTkiTxzA
         IlqHI03BDttv0LD2xXMu6dNgWeY0j1dl+/y1o8R3L+uE8V+6w7n8dER/9MpMolQdFzfN
         7dK7xbtK/gAagOtQJMdZZbo2fCUtw+omOq9j/eBR/cK4SLfpTwweMfbwjohsu9DxwYXw
         acnyaXWC2emi6G3K/30eZ8XExdOXc0l15I5YJ7zlL9vbucL7WChlsWCOlsXDjtBYjDw+
         MO+Q==
X-Gm-Message-State: AOAM532caR93oL/5n6QaV3c/gesGqF5N6PsplBVWGTbgt2mY1yz8CrFe
        gqSBto68/Sh4FIDAeI9NzeYCRocMjO4=
X-Google-Smtp-Source: ABdhPJzUue1PWgb38U/8GIweq/QAWNJBnHxQG60y5Dj7MTGmURo6LOJgX1aAbVlcvovKPwK0e8TXwA==
X-Received: by 2002:a2e:98cf:: with SMTP id s15mr12646456ljj.446.1599531112986;
        Mon, 07 Sep 2020 19:11:52 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:52 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 19/35] i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear()
Date:   Tue,  8 Sep 2020 05:10:05 +0300
Message-Id: <20200908021021.9123-20-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tegra_i2c_wait_for_config_load() checks for 'has_config_load_reg' by
itself, hence there is no need to duplicate the check.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2393f52fc584..4e8514696b0c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1082,11 +1082,10 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	reg = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
 	      I2C_BC_TERMINATE;
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
-	if (i2c_dev->hw->has_config_load_reg) {
-		err = tegra_i2c_wait_for_config_load(i2c_dev);
-		if (err)
-			return err;
-	}
+
+	err = tegra_i2c_wait_for_config_load(i2c_dev);
+	if (err)
+		return err;
 
 	reg |= I2C_BC_ENABLE;
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
-- 
2.27.0

