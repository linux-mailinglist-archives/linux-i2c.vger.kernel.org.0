Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C475326085D
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbgIHCOl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728317AbgIHCMA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:00 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE0C8C06179B;
        Mon,  7 Sep 2020 19:11:52 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id k25so5443725ljk.0;
        Mon, 07 Sep 2020 19:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0/NnRDH2LzHZtHYBLKcTqzIuFvCSK+MGSMEdMNw6Vd0=;
        b=F4UHz9YufeNsgNIZM5zZWVtIsnbC/wQroXA08ZVOmJnCfhCtxcBpTwH4ipSdIt5D6W
         9QHMbYibFkiN1732pYbvrl1XuEoY9NeRTACGybj8vzjpH1UPGu1vfDmVh9bCdoGWrH9s
         EZyU6J9wM9rRAeDorjvqTchN/8thqg/473Jrd54CvBvP1FzBIMIj/YzkaiT5EeYrkKF7
         XVgFGa1ReInEFWlZzuhJP/alDc3xuZeAT/HY3v/r8Wgtz0OGfZD7xImCtKc7koym3WoO
         aXC7E4OZUf35CEpgifjzUariciayuFsy4u8Djj7G7WpO5RwoWiW9xxE7yULEKTJKmtB9
         KD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0/NnRDH2LzHZtHYBLKcTqzIuFvCSK+MGSMEdMNw6Vd0=;
        b=mInAX16dw/Kg+z29MbRxwwMe6C98flMxsNPVpeBem7bvzCrmYRou0TRb3cPG9wB66u
         c/h1dW03jmTmkXdlVtp7bSVF9JHzNQW9+gkaeSoHB3KHxtJN2R6lv4yZlC1/G4OBR0+A
         YMKxKxigq6c0FsYUA4KBV4QFDONIwf2XcLaJWRBSLfIgh5oxNiXWdvs070bZQJHtNMxz
         kMC6kyxXA26R1OB0/Ip5y1uPTQQHkKi0R1pzDZfo7HzLKgMHD9L+6Eavokl+ZhfJf0jT
         1zqwJSLAJeF31m391n1SfDFDQrLKQqPduPqsVAJCCjIigyhXzBL8mgBXeUeb+Jyl9h2P
         xIEw==
X-Gm-Message-State: AOAM532Uu0uhpKJpQt6OCC4/SEiF6IpZaGJ9mg7S/Dy0xj8LxUry4DHp
        cgkvIezfjJSlXelYRCW+Lmw=
X-Google-Smtp-Source: ABdhPJwjb54BtcpgW7PspIyMAVq41mNQvz3+yVewoLGPs3L4TublroMk788MJgMSgtyz/s3+KvVjvw==
X-Received: by 2002:a2e:92cd:: with SMTP id k13mr11960861ljh.441.1599531111250;
        Mon, 07 Sep 2020 19:11:51 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:50 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 17/35] i2c: tegra: Remove likely/unlikely from the code
Date:   Tue,  8 Sep 2020 05:10:03 +0300
Message-Id: <20200908021021.9123-18-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The likely/unlikely annotations should be used only in a hot paths of
performance-critical code. The I2C driver doesn't have such paths, and
thus, there is no justification for usage of likely/unlikely annotations
in the code. Hence remove them.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 542436cb7823..29e096422b95 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -855,7 +855,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 		goto err;
 	}
 
-	if (unlikely(status & status_err)) {
+	if (status & status_err) {
 		tegra_i2c_disable_packet_mode(i2c_dev);
 		if (status & I2C_INT_NO_ACK)
 			i2c_dev->msg_err |= I2C_ERR_NO_ACK;
@@ -1297,7 +1297,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_dev->msg_err);
 
 	i2c_dev->is_curr_dma_xfer = false;
-	if (likely(i2c_dev->msg_err == I2C_ERR_NONE))
+	if (i2c_dev->msg_err == I2C_ERR_NONE)
 		return 0;
 
 	tegra_i2c_init(i2c_dev);
-- 
2.27.0

