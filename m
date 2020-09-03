Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F6B25B7EE
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbgICAz0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbgICAx4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:53:56 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7ADC061249;
        Wed,  2 Sep 2020 17:53:56 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id z19so845689lfr.4;
        Wed, 02 Sep 2020 17:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hyq+q97UN4p59/VDrav/iLglYVPxR0jExQlR01K2sGE=;
        b=IBaJQSEy7AKhSWWM96SzLKbozmy4W2t0TzTqDOAZNxslBH3IoCD2o91OX9kB6mZqRh
         MS3t4K9ngII+9QmqYbQkvnrj7grru86mVIsfAru4rM6V0TB6NZg6472MNb4EpY/zKRkQ
         WYYL8V+hroXBy6++hytb/exTxfDu1TDQvjGZFdcyfd/LYS3tSHvmFdXSMAbbHJ35a0wO
         U8nmj33o1M8QbMolMtgpPlICqrrIOj7imkugLLfCKEBq6ox9C6+Vo81a64ZZ/sixS9iO
         j6oeEoY9GaVpz7loLI6POxoS2ggoV6bYCJel8PmuPNHam+Sgc8ILtEPsCPKdaZLKVH1l
         ve9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hyq+q97UN4p59/VDrav/iLglYVPxR0jExQlR01K2sGE=;
        b=cE1iFoQfij2JVC6HA5oqZphy71/CXjZfJA3xTwn+R/OcEeJvKIz63uAPSftrwysEeP
         j1+0WmCXJ9wbE3Xras/6C+s77AvE2ywhl1ztvhmW/mYJpOT2X6GDBYMcQtS5AZG83XoH
         npjNHSQ/msYevbYRMkrW1fXYvm/e7iGv37yb1a77P+VSwoNdkj1Xx//3am+yII6dQ0V4
         dE6TUlyfajXxn3XNvW8bIPsjJj8zCIMH+3YCgifGLbLXOyZ3r10m8NnkO+birqZ36WVO
         5zvUeswJnvhMVramMkpiVo3OWEdofsa+X9Rb9f/WWe4GNHCn2MocQ8VnNDKa+xCBFq9Z
         WNOA==
X-Gm-Message-State: AOAM531hoRDU7giGY9F/spDEn7dUstSVS1D4/v74oWogPygOYrwu9KvL
        R0COZgTWhvLP1Txl5fWGDe8=
X-Google-Smtp-Source: ABdhPJyWEW1JSEKu0uSLc+V3ZC7+0QIuApFfHUS+nibUUs0ZNCPzPTMaDrrkxQkjtOhsWl98AU81QQ==
X-Received: by 2002:ac2:546f:: with SMTP id e15mr281845lfn.133.1599094434637;
        Wed, 02 Sep 2020 17:53:54 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:53:54 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/22] i2c: tegra: Don't ignore tegra_i2c_flush_fifos() error
Date:   Thu,  3 Sep 2020 03:52:42 +0300
Message-Id: <20200903005300.7894-5-digetx@gmail.com>
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

The tegra_i2c_flush_fifos() may fail and transfer should be aborted in
this case.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 79e542cf3e59..b912a7153e3b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1189,7 +1189,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	bool dma;
 	u16 xfer_time = 100;
 
-	tegra_i2c_flush_fifos(i2c_dev);
+	err = tegra_i2c_flush_fifos(i2c_dev);
+	if (err)
+		return err;
 
 	i2c_dev->msg_buf = msg->buf;
 	i2c_dev->msg_buf_remaining = msg->len;
-- 
2.27.0

