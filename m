Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C3225EF8D
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729199AbgIFSv7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729133AbgIFSvq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:46 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10CC9C061574;
        Sun,  6 Sep 2020 11:51:43 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id b19so13530936lji.11;
        Sun, 06 Sep 2020 11:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9sDkB98/BqDLzDJtZbPX/ic3OZ6YzNTO88MukIU98YA=;
        b=cW9ePg7Bam0JIKogsjHmRXByq1XVwS6/nEhDcWpfdKOszHYTAvckcen3sp3hJqu8UY
         5LIMzjfBGTV0fY+W+kvWVAwdLe4kDhIC/iSLu8aYT5a6K/mptaNOMYVrKYHcV0KSO8P6
         BFaY8/rYLThHOUtPayrUVMUtrPITHIK9t0X6WPfTbeF4BpP0IPjHnFoHwuZfKNcc8v2Q
         vv8TKN6Zqt9Nwnzmor0tfpje9d9ItxD2iv6czP+5+lHlyFk4Do2xQ3B2fw4eB3SOsaU5
         FpYJS2P62wMsHaQQEumW8GQSm4f5Uz4/MsWXet1qtlkQmrzjLSCYDtz5M8+4dh1jLg7q
         4Xkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9sDkB98/BqDLzDJtZbPX/ic3OZ6YzNTO88MukIU98YA=;
        b=bBaSoTH2V3nAV5UvaOncp3ML8IA70UMgh/TgcPWni/QvSqa8pXGd6lAUvF7KKPcHC+
         k51f8EyNjKGFxdAuvkxTSiKZelsevSPRXkJpYc3hvCOVPegRePaYkVEOpqsoPvx1kjn4
         30r67idv7sMhMyaHmnIY/nwxlRoORPEw5aIKUlyEjSytK9vVC0eqzpNr8WIP7lKK0jil
         Jig3sEmFzqJmvuqSWG4hQUliBL6pEvunB71QHnu0ffM20uK5bz/pOxCyF9lUoAksNQxo
         ysRf3sPLGbBe1EMbbk0j6b3u5Y2qEeC5/DzDNDxJweAS7Qixwmotq5/foupIcV2CN4J6
         ttJA==
X-Gm-Message-State: AOAM533McdiLJp67WY07lu85F8BquUMF6CzogkakXdcKzYz3gRTQ+bRf
        2Xhv85MXDLZcDkMwC5A0tMk=
X-Google-Smtp-Source: ABdhPJxwNETgP0J6SWQ8WIPNCCtd6ksGfKndAOz6/dTCwz4wSsXCDp2EJRi3D7HhbdjfvoZhFK0/Dw==
X-Received: by 2002:a2e:9e17:: with SMTP id e23mr8573173ljk.439.1599418301137;
        Sun, 06 Sep 2020 11:51:41 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:40 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/36] i2c: tegra: Handle potential error of tegra_i2c_flush_fifos()
Date:   Sun,  6 Sep 2020 21:50:05 +0300
Message-Id: <20200906185039.22700-3-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
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

