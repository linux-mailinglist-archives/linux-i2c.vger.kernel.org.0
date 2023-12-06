Return-Path: <linux-i2c+bounces-628-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5472806A9F
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 10:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E70C1F211AC
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 09:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D281A70E;
	Wed,  6 Dec 2023 09:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=friendlyarm-com.20230601.gappssmtp.com header.i=@friendlyarm-com.20230601.gappssmtp.com header.b="QimAQ8iy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9236CD5B
	for <linux-i2c@vger.kernel.org>; Wed,  6 Dec 2023 01:06:57 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-28655c04da3so525834a91.0
        for <linux-i2c@vger.kernel.org>; Wed, 06 Dec 2023 01:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=friendlyarm-com.20230601.gappssmtp.com; s=20230601; t=1701853617; x=1702458417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vkgnInx34MsdRC00k2I9y+o/ne93gzAEsHKwXhaX8A0=;
        b=QimAQ8iyaUOdup2m6AGC1hbBh5vYSjA0MUj+FwRsUAo7Qp4bNh1lLzCyd72ukcNTgm
         pQPCqe7zk9g/1fUO4fqJao6w+GZrS5EulUhZXiz8gH0DJyfzW/EUqsI4jCgBkvkEHO/n
         9s5bKGBplbohpkBfWUZXre7w0wQNUINV4+WDDVqIiedS6Q1vflO/gRj97Pk56dEOQ4zh
         71b4cUyUO11HZlmj691nXXWmCjDkwZ9hFhqWuJyGkWegcW6IHMm8zG4b6bPB0dqZvDAP
         Syx0D3KhmOxBlfYUI/EuZdgrcm19iLhqXXvK0Hpx0bY+rCc4SgFUiCGFVu7mgSiUWQmP
         JpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701853617; x=1702458417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkgnInx34MsdRC00k2I9y+o/ne93gzAEsHKwXhaX8A0=;
        b=rINRdeGx9JATz39BuGBs7Bhc4m4eyNBuO7wY8bIV0VaVtF2A1Qp92LI4qtT+bKyvX9
         Ur0LKedq2nbI3k6QsIATEgLWwwztm5a52FsJyBoGoD48ZZTVjCTWhcg/x+JUtNiDwRuI
         IE4qpsYUnHBHjfl90F5FHD12p2TVY5yCsPWgxG7WaZwX++Q0HRMV1NgW8vMKeY8q+fXn
         q8/yFa3PbvrE9KfuODlUbQhyTOR0Ual6k0ex3VyY9xJx6vGMYBiozzmTdFAgOOCbh+f3
         4mLJPIi9O2tXoUsmlD3WpaPux+DBoFmLZO47UldRkpb94v+z/7EijpW8ujFedlx5dU0F
         VSSg==
X-Gm-Message-State: AOJu0Yy+F6WJsdV9RZPMGQ7FrS+HTv4t9KKf1ffF184fp11Ga2W2LgWD
	j4K/OL4Qfc6eSOpk7Od0oJ/7zk/tG/NEBacHc7KPxw==
X-Google-Smtp-Source: AGHT+IHrGxsDqoubS9LhJ6U+qoCk+pQ/zFRwTborkh3P26N1W35bYry7lNZkS91ue9idDeKXGjDzeQ==
X-Received: by 2002:a17:90b:1b46:b0:286:c155:10e0 with SMTP id nv6-20020a17090b1b4600b00286c15510e0mr827953pjb.31.1701853616973;
        Wed, 06 Dec 2023 01:06:56 -0800 (PST)
Received: from jensen.next (li999-236.members.linode.com. [45.33.49.236])
        by smtp.gmail.com with ESMTPSA id mi7-20020a17090b4b4700b00286a708cd07sm4967797pjb.57.2023.12.06.01.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 01:06:56 -0800 (PST)
From: Jensen Huang <jensenhuang@friendlyarm.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Jensen Huang <jensenhuang@friendlyarm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: rk3x: fix potential spinlock recursion on poll
Date: Wed,  6 Dec 2023 17:06:40 +0800
Message-ID: <20231206090641.18849-1-jensenhuang@friendlyarm.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Possible deadlock scenario (on reboot):
rk3x_i2c_xfer_common(polling)
    -> rk3x_i2c_wait_xfer_poll()
        -> rk3x_i2c_irq(0, i2c);
            --> spin_lock(&i2c->lock);
            ...
        <rk3x i2c interrupt>
        -> rk3x_i2c_irq(0, i2c);
            --> spin_lock(&i2c->lock); (deadlock here)

Store the IRQ number and disable/enable it around the polling transfer.
This patch has been tested on NanoPC-T4.

Signed-off-by: Jensen Huang <jensenhuang@friendlyarm.com>
---
 drivers/i2c/busses/i2c-rk3x.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index a044ca0c35a1..94514637c3bd 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -200,6 +200,7 @@ struct rk3x_i2c {
 	struct clk *clk;
 	struct clk *pclk;
 	struct notifier_block clk_rate_nb;
+	int irq;
 
 	/* Settings */
 	struct i2c_timings t;
@@ -1087,13 +1088,18 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 
 		spin_unlock_irqrestore(&i2c->lock, flags);
 
-		rk3x_i2c_start(i2c);
-
 		if (!polling) {
+			rk3x_i2c_start(i2c);
+
 			timeout = wait_event_timeout(i2c->wait, !i2c->busy,
 						     msecs_to_jiffies(WAIT_TIMEOUT));
 		} else {
+			disable_irq(i2c->irq);
+			rk3x_i2c_start(i2c);
+
 			timeout = rk3x_i2c_wait_xfer_poll(i2c);
+
+			enable_irq(i2c->irq);
 		}
 
 		spin_lock_irqsave(&i2c->lock, flags);
@@ -1310,6 +1316,8 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	i2c->irq = irq;
+
 	platform_set_drvdata(pdev, i2c);
 
 	if (i2c->soc_data->calc_timings == rk3x_i2c_v0_calc_timings) {
-- 
2.42.0


