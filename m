Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A7625EABE
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728423AbgIEUqR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728719AbgIEUml (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:41 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA82C061246;
        Sat,  5 Sep 2020 13:42:38 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id m5so4718278lfp.7;
        Sat, 05 Sep 2020 13:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9sDkB98/BqDLzDJtZbPX/ic3OZ6YzNTO88MukIU98YA=;
        b=bDOJ059SB5waB5YdOiWCNmYXq95rEv+6bqiNjvp3Kr7eLkaPaD9qgoRGLoMnHWc3Wf
         YCj0SBZ4aLV5S/Ie2gtm338hJxLppFFY1Au10yiKkiOECf/OT2J8ugXkfwTXzd8UXpXT
         DdlJmltgRyLmc0Bnkh7j7vQXwJSPvjdDYphHIwDrITvFWscbwxFuGNWSTKSO1pLtpHzM
         kEZUi4Z02LKeOfXRexArDkjtzL7kNrqPrxJWY/JlATZqNCM0J6MSv3XHEwQhN+nhwHm7
         zy+lUOddR1huIW5U6qHngOrOKfeZbeY5ScoB5xCDIE8h08WgC1T2dnrGnERuraPHR24K
         6ADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9sDkB98/BqDLzDJtZbPX/ic3OZ6YzNTO88MukIU98YA=;
        b=pUdYovBh7czHGZgtU9QNaLn5VvAuCMUrxalMGrUEyxx7n1ck912t3zKCo1Hh1Nb5p/
         QbfE5HZ4o2hgCziuIhYG64WByP8qdYPirDpYMWqn/CiDwxqF4j+Rj7M0oCO2Y7lzDYLA
         EXtU/lY0mtnMoV/zXGKAZ3s9+tCh7ZGy0aWH2qZEEM14adpPdvwQf+sjrjV1NBgHFPGF
         B43oCw4tOfR+gY2lsDW1m9E/rOFLD/NPjboLcGOB2x/7dfYPoEp/WIzPgBg69OPzGt+S
         2KPpigjqFyAaVeSL87TEnk+P7S91UZh/ienJbxDHqTsueBVmKIn0ShMPmJKtshKF5V9h
         N/2g==
X-Gm-Message-State: AOAM533kQ7w1rqScatqvw/1a8X4BFZwm47TbfUfJ6KvVx7liEJVK+Vvw
        f00m0rUgUu3Z5Hh0bfM5/68=
X-Google-Smtp-Source: ABdhPJwDv6TQxMYPx5kGwwZ4zd3ynhzOJcgn03qYzFLa3uBFrrRmL/mSORRDtVxXGXwAPEnVkTuV5g==
X-Received: by 2002:a19:4a88:: with SMTP id x130mr6729007lfa.31.1599338546862;
        Sat, 05 Sep 2020 13:42:26 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:26 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/31] i2c: tegra: Handle potential error of tegra_i2c_flush_fifos()
Date:   Sat,  5 Sep 2020 23:41:22 +0300
Message-Id: <20200905204151.25343-3-digetx@gmail.com>
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

Technically the tegra_i2c_flush_fifos() may fail and transfer should be
aborted in this case, but this shouldn't ever happen in practice unless
there is a bug somewhere in the driver. Let's add the error check just
for completeness.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index ab88cdd70376..307df6f97ed0 100644
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

