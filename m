Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B7125B7F6
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgICAzZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbgICAx5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:53:57 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353DAC061244;
        Wed,  2 Sep 2020 17:53:57 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 12so816565lfb.11;
        Wed, 02 Sep 2020 17:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3DVrXspxAfjtmPTZCRcFcFzh2D6dTh3Ycw0j/X4bFgU=;
        b=GKU2WIaquS95wr1u8AKoRmPWi1tnc3F+sdc1rpbpA2E0gRiZy5ul7+ySSkSRN2Su5q
         WWtLEuiIK19GcAqxU0HCR6D7R64bWUIIANuAvKPW3apu+zeptv+sYLYeGDqzITMOLYSG
         gtmP/3eVkEISTiclMomTXc0ClikYn23uc0+Tb7u6DW2cAlzSeBt4MRtB5iyGkhRO0IXc
         afZEdwDJERWM9YMagiQK1TwDvwVQKxVmQCPI6+RbiZ/cPq0ciS4vi74jsSuZIq5orpKT
         xH7aVU5/h5l4u0T+2/B5mvplIcdjyEIa6dlIHEuz4qlWlcydvk0jnizihVmuryDvcwVg
         DmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3DVrXspxAfjtmPTZCRcFcFzh2D6dTh3Ycw0j/X4bFgU=;
        b=g1jSIEiRjjr5ZDjVNG1Ow6r3SF7r7QO3D8+hUwRPsJyYQvZixQuIOApLqBk2LMRUTd
         rI31Zun9gnU+s7kG31gmYXqFcVzLPRzU49x7ttpOp9hN80S3i/zuZ+254LdaNQtFqp2J
         cDR6z7mbIUi9I7QDC6kDQUjJYEzKUHI1t6/v3rg+swL78YL5g7+VFChRxXr62GG0zz2q
         PHaOhLd8MpwjEsDYe1dOSTHSMh5P1ZQPZcObirRFSGgO3TBYsQdhe6OKN0NRV7/B3nPv
         tTaxECd+0R+k1pEJCjmIzmjqZ3nJ/lOykwUI18z20mF+L0rKSXMQ4q8gRiFAXtD/vUIz
         ptIQ==
X-Gm-Message-State: AOAM533NMO/Vp5LfBnXA2+5WR4L55QF7+OM+ar4YIl9Nf4nOERJohND1
        mPBXt38nla4AnFxNwoU6I3w=
X-Google-Smtp-Source: ABdhPJyduzHXmYs0EMFrBmXpy3P+Gs8JLtTsHRq5nTuigWQVriSXBfMMC1uOewz8jtwBcZrZaMLCWA==
X-Received: by 2002:a05:6512:3084:: with SMTP id z4mr268108lfd.141.1599094435664;
        Wed, 02 Sep 2020 17:53:55 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:53:55 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/22] i2c: tegra: Use reset_control_reset()
Date:   Thu,  3 Sep 2020 03:52:43 +0300
Message-Id: <20200903005300.7894-6-digetx@gmail.com>
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

Use a single reset_control_reset() instead of assert/deasset couple in
order to make code cleaner a tad. Note that the reset_control_reset()
uses 1 microsecond delay instead of 2 that was used previously, but this
shouldn't matter. In addition don't ignore potential error of the reset.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b912a7153e3b..22f6020e79aa 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -800,9 +800,9 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
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

