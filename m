Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B01972622C1
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729843AbgIHWkk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729663AbgIHWk2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:28 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61E2C061755;
        Tue,  8 Sep 2020 15:40:27 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u4so940800ljd.10;
        Tue, 08 Sep 2020 15:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8EoeQfm2V7iEFCAPBa5UMm2YWlodiF1UtVHJ3u58T+Y=;
        b=DeyKLD//BU8Ez6r28Edj0FvXCyEA1O2F6QmsnIh9wMrf9GW5Z+A4KjoD9OT4dB0WFh
         A3HOjyFw0mMTISgaEkj2vprkCycg1qRVBC49UG5CCeqrkA3DdmfmMOKo2OQKZOBb3OVg
         B/wv3D3b45vdadhCMkkh0D98Fkd80pN3BHiXqZwUmAmt47OG5blZdxCvAsIxrjA/PasB
         tJpXKH8UMlJjgVyxfkARgrMTDQiQfET3V8xZ5F/9cI3ucTcrtW+HpOS2/NUQ3CS78rJy
         b5IDMJ14obStxky4odGdJ/ORjj3XJUXjnftAGAuUEqVqfa/ItI2Mtn7pHp6WHBmmh6Ji
         +ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8EoeQfm2V7iEFCAPBa5UMm2YWlodiF1UtVHJ3u58T+Y=;
        b=eeH3slvAFKEbwXAQtLCIscixr7Z5laHAoCZZj+jTkGWlbkBdl7AsgJgyRoooB0q1RD
         UXqWNazSKlnrTVcWKRZynmVLpmPTENNKz7kXKiE4xBk00GcOuVchDsxxx0QMP5FEtuyp
         DZ9NKf/e2kJNcAR3Cj/iALLwx9vabhK/YcIGQpprFNzD0iD9wMcuIZIrAcw+TliiCPWG
         pFJrQF7K/f5uWzctckbD9bpTlI9ink3luseJ3EwbU/o32G53V1XM+49niCTXu2VUg/P5
         OiAUSr/DOJKPYmCsLvTsiskJnOraGjQhOSjF8h/2UAM74lRWOFDoOFE2a+ZFvsasL3sC
         YGrA==
X-Gm-Message-State: AOAM533O+r79U93jlAbLnEBfZtXX4R+TJZn1Fx6hYfQcAkN8Fy6p/unU
        j/hplfl1WDydu3DmzXezD4A=
X-Google-Smtp-Source: ABdhPJwyLqjNSu9T36XxAXOl2bf/3PFF9f3L+CE3KOj2/ieTPTS2ILq0cPpuFumJiSg9gvMgHiN0WA==
X-Received: by 2002:a05:651c:134a:: with SMTP id j10mr352391ljb.337.1599604825884;
        Tue, 08 Sep 2020 15:40:25 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:25 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 03/34] i2c: tegra: Handle potential error of tegra_i2c_flush_fifos()
Date:   Wed,  9 Sep 2020 01:39:35 +0300
Message-Id: <20200908224006.25636-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
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

