Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4036425EAD1
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgIEUqz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728674AbgIEUme (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:34 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9B0C061249;
        Sat,  5 Sep 2020 13:42:33 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id y17so5608778lfa.8;
        Sat, 05 Sep 2020 13:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sWOlssNuSGCzjjA3lrlvo4h1YuU+VYnsvS+BhKQWTGk=;
        b=nRhzb9I7Rs4eWEfRMLIvXkEjIrXtaslZsZhxNgQME9gMyhmqo3LnUYV9hWMmNRmZ16
         Faaba0HAJoVY8JitZoKeReLPzIw9+mZVDHbTpFB715kMgIuSufDOucdiySf+7/lS9QvQ
         kyv6oP+e8FvYO6m6ADJ1Ro7muoBc0P0ROg0bWE+LT1lGDkxq8Z9/t4jH0F8vTlJ/Lu4O
         bAHxdHDnNT1/zpPRsKQWvaQ23SkWlppkv1oWQpYOiG8XbHRlZFiLTEBCP/nSL4I+J+Fq
         dqBCV3eYoK+02X2lJIb3dQhKbmzRUKDGfwwWD43nBqH5XP60MNugk1MM05BBCl7jYL2q
         tJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sWOlssNuSGCzjjA3lrlvo4h1YuU+VYnsvS+BhKQWTGk=;
        b=TmgVBBey0ikTmad2LahYErhckuQ06am3FLvB+Tk6teTVuAfj7JtNrDtTGeFpFZ1G4G
         CCG9WmMBPlMtQzLxdwzlv+fTIFMn4j+Q8Y2FCF4d58DqJknv7rgq3vgW/usOOTBPKh6w
         VNv318UONajV+Ad2EjvK8hJvd3B8MtOcYnoQNy8y4X/nGD5bYl7cbJKhiWG6qEV9eHO1
         aQxqV6B54SVU4894REVsuEXXcaWZBpu2cgVUTclIoUxq9mlIIIe8VbEfOcHpUTiJ4Q+Q
         ppYC8AVW8/ldak9aRBRVKsTZoXkqurJw/mhv1hcgy1nK72KteVib8hTdVKVALwktn19L
         6gFw==
X-Gm-Message-State: AOAM530SBphqwHkEL/x+rjDMk2hEpc48JtAHUVfPx9NSzn0/2ooZN4xJ
        1ocoLaqxO6abzoyGXXzgqTSuLab70CM=
X-Google-Smtp-Source: ABdhPJyxvhcQWq7BoHeLnrR8llYmOFCjMYpe72MzavUmWi/uObGK3hDvkSPhFz/usuF47knp1297KA==
X-Received: by 2002:ac2:4253:: with SMTP id m19mr6953635lfl.81.1599338551463;
        Sat, 05 Sep 2020 13:42:31 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:30 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/31] i2c: tegra: Use reset_control_reset()
Date:   Sat,  5 Sep 2020 23:41:27 +0300
Message-Id: <20200905204151.25343-8-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use a single reset_control_reset() instead of assert/deasset couple in
order to make code cleaner a tad. Note that the reset_control_reset()
uses 1 microsecond delay instead of 2 that was used previously, but this
shouldn't matter. In addition don't ignore potential error of the reset
control by emitting a noisy warning if it fails, which shouldn't ever
happen in practice.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2f74bdd75e1c..940b5f15ef11 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -785,9 +785,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	u32 tsu_thd;
 	u8 tlow, thigh;
 
-	reset_control_assert(i2c_dev->rst);
-	udelay(2);
-	reset_control_deassert(i2c_dev->rst);
+	err = reset_control_reset(i2c_dev->rst);
+	WARN_ON_ONCE(err);
 
 	if (i2c_dev->is_dvc)
 		tegra_dvc_init(i2c_dev);
-- 
2.27.0

