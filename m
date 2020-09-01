Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B31F25A0A8
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729863AbgIAVNL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728730AbgIAVLb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 17:11:31 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E591C061245;
        Tue,  1 Sep 2020 14:11:30 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id h19so3256879ljg.13;
        Tue, 01 Sep 2020 14:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dZ6TJT0d2WHfPiQp5ZxQDWsFPOMSgFVrHCsGXELQF8Q=;
        b=XponkNRvckXfs6klc/3ZLBkX+6Uzlaof5yRSvgENVLsRKI3+jYQmVOgQhRrBFkymjU
         uYUDNwTVfCwW4ncmQ0NBqipZNdI39CthK3xAZ7W2B3xNYRVFh/MaIWdRDzjZiOkzCwXC
         Fmkzwojm5trS1Qkr1ApsyOxgsYy1aReIWRSvXTzGU7rlADmQOC0B4mmsDjbDuJH/Mm3/
         y0DVK1kwJfb4XpC9jThoeaDm3AjEGu/oUGXzzwmSntMhGLtxECD0yKtCB3X7BgFkGz5z
         7IfobfUfU75JTCmzuVgadJtkCGFpqtBd01wTH7eKpFSJs/KjmwZnXqFWzic8RwoK20v/
         IGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dZ6TJT0d2WHfPiQp5ZxQDWsFPOMSgFVrHCsGXELQF8Q=;
        b=CKDd2TzhxmI6SfxlrFacAzLpaC5SiE/YdndYLYwCpNf/0+fvj5Ff2dliycp+W07KnQ
         NQKZ+vbR06Fsjws8HxR6MiGkYtjP1mQxLq+hdMQMZxUtn3QGiZrPNoRNL10kD7D/mJu9
         BzG9b3bCAD9Sjuv8Wj9D0oSmvWn4QTPKN0pWfFESJqzQArsGNR/+/5qt826b4YOHsi/n
         ZBN1+SHVO1MmZY+M76Xv4b8m1vhhUfEKY9UCEJr6lEdRLLhuJsx3gNU//NMMFIgCX/mt
         k3ZbdpsUryscgLimpLNZUpWPLTaElLjnzbRfdWZ9JL1aO5guYB2mjC/GGM7oUE8ODW9i
         dtLA==
X-Gm-Message-State: AOAM532QaFfEgPkqNW8IowB7hRuIawx7N8OAEN90Sca7hfG+IbVxfGKO
        QPiZG9IAZ8cF72oYeRLpiQ4=
X-Google-Smtp-Source: ABdhPJwiJytVcgBcne7J0ipyPrtfRdDtc1xB2F+SIki3k+XNyS6122ZHB1Zp3BHdZsIIZu0fz9GZiw==
X-Received: by 2002:a05:651c:231:: with SMTP id z17mr1469756ljn.109.1598994688546;
        Tue, 01 Sep 2020 14:11:28 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g19sm502656ljk.125.2020.09.01.14.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:11:28 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/17] i2c: tegra: Use reset_control_reset()
Date:   Wed,  2 Sep 2020 00:10:50 +0300
Message-Id: <20200901211102.11072-6-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200901211102.11072-1-digetx@gmail.com>
References: <20200901211102.11072-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use a single reset_control_reset() instead of assert/deasset couple in
order to make code cleaner a tad. Note that the reset_control_reset()
uses 1 microsecond delay instead of 2 that was used previously, but this
shouldn't matter. In addition don't ignore potential error of the reset.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2da45ff32621..aa815e48f77e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -790,9 +790,9 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 	u32 tsu_thd;
 	u8 tlow, thigh;
 
-	reset_control_assert(i2c_dev->rst);
-	udelay(2);
-	reset_control_deassert(i2c_dev->rst);
+	err = reset_control_reset(i2c_dev->rst);
+	if (WARN_ON_ONCE(err))
+		return err;
 
 	if (i2c_dev->is_dvc)
 		tegra_dvc_init(i2c_dev);
-- 
2.27.0

