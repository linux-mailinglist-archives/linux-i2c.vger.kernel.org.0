Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96899274CDE
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgIVWwk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgIVWwf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:35 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E7AC0613D1;
        Tue, 22 Sep 2020 15:52:35 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id w11so19869796lfn.2;
        Tue, 22 Sep 2020 15:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=phIL1waZsLrTjpbItBSk9Y3qWphaNWEIyAqP/hDi1uE=;
        b=U4AhUWPRni+7mIqRn2Y/nwGe2DBuOloax8knJIR6ozXaSMFx6Lfz5Q8Fx7rSaQP33h
         MWvNQtLfqvTjkSNWNI7QNLC6EwpbR8ziD6wO1u4uDuNB1wn1uBlnfwAemJeUj7Grnr6P
         mD1gIz870jo4dfQI9V+CWtr/mf/Qcun4BUWBWcSVFZ4ukqrDpJKPeNU3yDNWWlDF1dxr
         /oKWcf8dvhxyAG7FWpDbh6+veKTHtD3VIvuHWaLmEcEa0vaRaBe+ZIIl3ZmxFOFkjLEk
         V26ygxkNocUa2VGZMZMmMs9fVwezpBW8Mif2/CibZtdvP1Y+omVP0mumVjYILSmAYIET
         yPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=phIL1waZsLrTjpbItBSk9Y3qWphaNWEIyAqP/hDi1uE=;
        b=HaTbAH8s617Pj7QvelU5TfZFmFl5SAs2Xl3lFHkReaUzMsbK79NrLoenrv3ssVwZGc
         PdHcKilsq5XQS7Ay9LBKd0mMPv+h50KzTOwnvcBbLpF5MvxV4UOAknb+SH/0EkC+ciTa
         sRDPo9fg687yKsue7VJ/0K0ELL9YVwLNSLXWaQp3zi3K/QSHPWv/96NBRzzMYGjOG1aO
         5Zls+v69p+EtDhwjNsNOD/hh9/Rad9qKGgnQBiP9pDWfZlmLxaIpRysdqpBGngdIHK8F
         eHAdURm6E+UWu9gv/Zz9y99C3js3hjJAb5yDde57fvERfK9Ewup7f0RwDWnqSzxWVUgs
         o9+g==
X-Gm-Message-State: AOAM533e0/Ih2qyQnkXRCVc0YBc3w5rucNwASchkpxQdykM+rmKqejak
        FYblyvDUAoSaU4s5Gq1Xktw=
X-Google-Smtp-Source: ABdhPJyP7CTnrOYduKHCEQb5q84GHK3EPfOXcBPLKxTuAnDWnC7gVdlWjpTStA2QtrCxhqjZWWDiqw==
X-Received: by 2002:ac2:53b3:: with SMTP id j19mr2673522lfh.101.1600815153681;
        Tue, 22 Sep 2020 15:52:33 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:33 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 04/32] i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
Date:   Wed, 23 Sep 2020 01:51:27 +0300
Message-Id: <20200922225155.10798-5-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tegra_i2c_issue_bus_clear() may fail and in this case BUS_CLR_DONE
stays unmasked. Hence let's mask it for consistency. This patch doesn't
fix any known problems.

Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
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

