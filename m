Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE51274C83
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgIVWwl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgIVWwe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:34 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4643AC0613D0;
        Tue, 22 Sep 2020 15:52:34 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id y17so19854257lfa.8;
        Tue, 22 Sep 2020 15:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sl+YJeRliWSfQxiypGkl3jBHOTrO2+fM5FTcJwbD+6M=;
        b=U4DcHdRjiPGw/UpfSef4ysBeW5cGPP/Cny/9NTzpkqbhpoXieT38JuxiG7Dunj37Zt
         6KuOhQXa87ojALpeMQU1jvitJ1XT4DQRCF3QidIYxLG3+wharsXhJjwIWlrLL3JlhRev
         lC99rjt+oAOfStksXyCIFqG4IGEptwJEEu7qkIpJsbwXwiauOp7DjfqH3s2dCuxxwks2
         JYilnUyQQOrOb+bcZyzjnOC4pZWcReYM/vBIziiYyfAS43oqUWY5SAvi1IJs18Ews6Qr
         d6/NoH+7MerBYnw4o1k7keGCTZdmd5Cx1GXBvJWzhbVsnZZ3D/I3NOflikAXTi0WiFuW
         Y9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sl+YJeRliWSfQxiypGkl3jBHOTrO2+fM5FTcJwbD+6M=;
        b=Y0bySzFP2MSmX6VN7owRnMLlKNLA4mRK+x3Abjws3wRH4x83/8OLa1Fwa2JbApR9/F
         UZNAlM2EEe1NCBVwBbVTE20tB3fvM9YGaMQqOu2PrbG5TRDwMMtD1vHslaswOzIErqVX
         fwSnBktz1+f5K8ar+OhXwMhk6GDFffoMLYvUSOoLdGpXDDN1SxsFdbqKrffgZbRhMxQ/
         6zkgiCG9ZKRIaAvg/J+EdL1arQb2hMy9e0VztVfm6RHTPzKnieaZZ5PUYaBh4FDRlthx
         THLDT5VgVxNJZFrwRcQiqHcPVbRwLEbXvyDDA/SwQQ4nBDZQ5wdyYxDZlsI5WMZNenFZ
         2o9w==
X-Gm-Message-State: AOAM532mbp7XFXdQ6fLzsUjCgYm+3BRRfKvjDtlNRLdjkp3iBNoCLvPs
        ETCKx/yVbd+6+Lo2axW5tFk=
X-Google-Smtp-Source: ABdhPJzLMdsq4YOgvI2MmIymSPTkbXv1tvMnzA5rLI2CsU2mYZ7sroZWCPIeqdV/Q2LEsdD1HNr/Qg==
X-Received: by 2002:a19:82c3:: with SMTP id e186mr2193404lfd.144.1600815152743;
        Tue, 22 Sep 2020 15:52:32 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:32 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 03/32] i2c: tegra: Handle potential error of tegra_i2c_flush_fifos()
Date:   Wed, 23 Sep 2020 01:51:26 +0300
Message-Id: <20200922225155.10798-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Technically the tegra_i2c_flush_fifos() may fail and transfer should be
aborted in this case, but this shouldn't ever happen in practice unless
there is a bug somewhere in the driver. Let's add the error check just
for completeness.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4e7d0eec0dd3..88d6e7bb14a2 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1177,7 +1177,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

