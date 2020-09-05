Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBBF25EABB
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728824AbgIEUpo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728726AbgIEUmm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:42 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F58C06125E;
        Sat,  5 Sep 2020 13:42:40 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id k25so11759407ljg.9;
        Sat, 05 Sep 2020 13:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6RRXFQ1kc/Y4nyCU/wNkP0keA+UqxgPIjRTZx+8dm4A=;
        b=a+iZWQEuFYJXTbNB5GtxF3034zigYvAk8cvLJCSMCu6JOV9tI9/rSoTO5n6COVYOUv
         UlVYahELxxiWU0sOvjbdzElJ7+7Khx6TXP2FOPlriEJhP7Py1jWDp6FbB2XXplu9hzci
         4wGjglpXnL+NJ8ywMqyXOn5SLfNmXSw08FvhVGA+geydjgrnzVDiJe+YGq5y71p2AtI2
         ERH4emHKOt9sK+wtDE9E9eHokJli+YE08Fg56QYEp4qGXx2hZvMUN6DC7JyBNjUF6foP
         io6sIlFOcGOJDcZbVdvVCOOEOPcECs7zplkr5jrrubcE2N0BwhNN4Qp3kBYrGdA/EzIa
         ocvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6RRXFQ1kc/Y4nyCU/wNkP0keA+UqxgPIjRTZx+8dm4A=;
        b=uTRmQfTbZZrbb1eU2qVPhxBvrvMSWTJDWul+kkyrqv/4zkfQesMZDwg9TBHSeCz+Wj
         39D5QRx5XJ/Sc6h/7+Xfqip8ijmGaD6JO3UWxamZHvu6B+iBv74QLGN8Qax7xcrU8EoB
         Vc8puAQIL6S+VlKxLjKEBRPQ8oFg5ZT6jz7WFFqaJjHc8JSZG04fp1t1mawr2CYRA2zM
         uKoIovaacv5M05k+z1XRdZh0g8In25n5A0JH5A9zUMv4BfQwykW1RakhFFPWbb+gPf2h
         i7PuzhuYrBMRj4BoLUWQQMw1FyH5tVo+epPuMKm0FVu+M25iLMqU6Yg5KElGrx2Snywu
         aGOQ==
X-Gm-Message-State: AOAM531EUk/7bMUPMpyHKJjpyfBZ4JPWTOvZGHKanzfAHEyPPxfi188t
        iW+eo5VngO6xxx3NC8cb0l4=
X-Google-Smtp-Source: ABdhPJzmkohcwp5n3Kob3QdltSsLijAXqaBw2ePopAD4H4AQWjOvGgqy74RUdcYLtgAXsoynphQhug==
X-Received: by 2002:a2e:8606:: with SMTP id a6mr3712386lji.299.1599338558570;
        Sat, 05 Sep 2020 13:42:38 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 15/31] i2c: tegra: Remove bogus barrier()
Date:   Sat,  5 Sep 2020 23:41:35 +0300
Message-Id: <20200905204151.25343-16-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Apparently barrier() was intended to reduce possibility of racing
with the interrupt handler, but driver's code evolved significantly
and today's driver enables interrupt only when it waits for completion
notification. Hence barrier() has no good use anymore, let's remove it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 33d37a40fa83..f69587ca163b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -600,7 +600,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->msg_buf_remaining = buf_remaining;
 		i2c_dev->msg_buf = buf +
 			words_to_transfer * BYTES_PER_FIFO_WORD;
-		barrier();
 
 		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
 
@@ -624,7 +623,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		/* Again update before writing to FIFO to make sure isr sees. */
 		i2c_dev->msg_buf_remaining = 0;
 		i2c_dev->msg_buf = NULL;
-		barrier();
 
 		i2c_writel(i2c_dev, val, I2C_TX_FIFO);
 	}
-- 
2.27.0

