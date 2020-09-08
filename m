Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9971E2622C4
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729876AbgIHWko (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgIHWk2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:28 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CCA8C061756;
        Tue,  8 Sep 2020 15:40:28 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so958854ljk.8;
        Tue, 08 Sep 2020 15:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j3XbNtVZD6rVkiU+YdggTYpRd5hx/FUuMpH7Z/8WhF0=;
        b=M4tYoOsTKHBpbjgmEGpja25ZjPU7TCMxUZA+6/I6qkhXuDU4p6WAXYfOp+Goee8ixd
         TcIDRFMwkT98jZ/R4bkjA0vXRE+sQOooStH9wppyTo7A8d8nBmlzE3lIxBmBB2/O+1hO
         a5NPi3F3ARzpAWftHCeUUKTDqXUPLMtE9SivwOUoRGNvTw+dTKvqhLTW+i1B8nD8xwn0
         QLaTYI7kpwE4hqEChB5hj4bqwjZ5AVFaKToiso7nEBoMpeqy/ZGqz9CmDGxZFToQvEsQ
         Ha1qwYuiCEghqYXHThLoy7XWfnajR8Ti3mdllzc7lXebr1IVkRGhV123SZnHHn1QSz0C
         y1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j3XbNtVZD6rVkiU+YdggTYpRd5hx/FUuMpH7Z/8WhF0=;
        b=lgKLkymPjuPRpgc1HGIx5AsgMPOHcU2yeoK33xcJOqlnKySSb5F7Jzbjb5hncc+7eJ
         iboZYGftGM45MkN1xIyNC94UgEMVjiqdqcHQ+wciYhFGiopup/qUQXQ0GwF2dIZjovQJ
         0LD3219n93CFXmDDdmY2BhPbFOAjhIJpzUoETr80mGVWSWWQ50VUhIlfjEeOzT8DEil6
         zqrLlWWki2A+h11eK6xu8yz1tjIiPIZokj7ojysMoUGiWq3o5+oeqXH1Br3pHXO1JfaB
         pKnlnkhAO8Vh+pBxtXYoKJJn1aRguwEuez6UPluuPlQup/zRC1sA9noqjNt2GLRqR3T5
         YaQg==
X-Gm-Message-State: AOAM5336Fni4/DiOrE9HXqoatOrugkTgPT76ZlvL9UQDhnlVtvj6UP4h
        NPY85QYhRLfAYEYRcok+1Bk=
X-Google-Smtp-Source: ABdhPJxLflmSI+W+pxXtlsMfQYPSvuXhcUdX5YfRuY25Tah3QgO1pjWOxUhX1JAWoXGSLSWzySWEKQ==
X-Received: by 2002:a2e:b4fc:: with SMTP id s28mr325583ljm.305.1599604826804;
        Tue, 08 Sep 2020 15:40:26 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:26 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 04/34] i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
Date:   Wed,  9 Sep 2020 01:39:36 +0300
Message-Id: <20200908224006.25636-5-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
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
index 88d6e7bb14a2..1d1ce266255a 100644
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

