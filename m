Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7FEA3463E2
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 16:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbhCWP5V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 11:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233001AbhCWP4z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 11:56:55 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E57DEC061574;
        Tue, 23 Mar 2021 08:56:54 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id y6so24065649eds.1;
        Tue, 23 Mar 2021 08:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z5Tj5RZrN0i243a4vjp62s31Axnbl+7HM9j4lz54tzo=;
        b=RRxMZFVjzCjlVEhRi4puR4IwBHEqSAOsL1885yZmq9MSP4e5GIjMbTHzGKZdRdAE3t
         CQyMY5jqXh186Lc8XKHmmnR4ZJ4VzS8kyJLIEUGNZf2PnUJTtOpZ1wdXm3LVgBJ/P2F5
         M1w2w/kGbPCPypLweGICTqlqyj4UkcAKGILxLF6X3+3o3nXhGhUNqDKFazrB4Sf3TG0D
         VWfDqnj3raOZfwewVZyL3LEJgl7YNmZZuFoaRNA3m5QcVKbtb0DFDKnqfcvttA75csW4
         ZYBvZXR5pXl7BGk558P/MpSBNi5CujNFZ/H6ZMkQpsXaV7Bo/GQdr+e4pdqUOmdlSxzi
         bGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z5Tj5RZrN0i243a4vjp62s31Axnbl+7HM9j4lz54tzo=;
        b=ntagLD8gxTGDce76XvJJcLTg0x6TYwkrektgQIG7Jn9cu8QFklnwYVv9pvSgAeRuYx
         BCKrCThItSZHxeEczyXxlvlmBkLbnidFPLQAm1MC5Z6mh1is+epo0sVKe9YzciQFkQ8M
         uHOMWnuVLd5fqHp5GHt30umVj4VgK9VPuU43nyDvM9Zx60O1qW85+TqKD6NSif9mAGOJ
         eefHbgyWxtk7rTAGYOapXGMhqTORQQnkCtW9KnbPQ7HQ7PEEf+QMh3zT8v8WjJ6zelt/
         6bU0VWagd4krJTzVRJKzgs+DZ5u5bzYCsDuRMKXm/VdchN51xZKvPwAciOWcSeu61xz4
         FNTA==
X-Gm-Message-State: AOAM531+yLilqorZF9BOZ8Jr8HA4zwzY4iNwI8Rzdfxcy64bDXV3sOEe
        9VFGSIsJxwNwMHTdryCFP+k=
X-Google-Smtp-Source: ABdhPJxh8W+9ELd4KtZYHNOQjTwnlxHoVUzdGiTXeOpgj83LOiYTtMvvevk2BXDntZUvoj4FGkNUeg==
X-Received: by 2002:aa7:da46:: with SMTP id w6mr5374313eds.40.1616515013663;
        Tue, 23 Mar 2021 08:56:53 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c20sm11453768eja.22.2021.03.23.08.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 08:56:52 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH] i2c: tegra: bpmp: Implement better error handling
Date:   Tue, 23 Mar 2021 16:57:13 +0100
Message-Id: <20210323155713.513864-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Inspect a message's return value upon successful IVC transaction to
determine if the I2C transaction on the BPMP side was successful.

Heavily based on work by Timo Alho <talho@nvidia.com>.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra-bpmp.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra-bpmp.c b/drivers/i2c/busses/i2c-tegra-bpmp.c
index c0c7d01473f2..c934d636f625 100644
--- a/drivers/i2c/busses/i2c-tegra-bpmp.c
+++ b/drivers/i2c/busses/i2c-tegra-bpmp.c
@@ -217,7 +217,32 @@ static int tegra_bpmp_i2c_msg_xfer(struct tegra_bpmp_i2c *i2c,
 	else
 		err = tegra_bpmp_transfer(i2c->bpmp, &msg);
 
-	return err;
+	if (err < 0) {
+		dev_err(i2c->dev, "failed to transfer message: %d\n", err);
+		return err;
+	}
+
+	if (msg.rx.ret != 0) {
+		if (msg.rx.ret == -BPMP_EAGAIN) {
+			dev_dbg(i2c->dev, "arbitration lost\n");
+			return -EAGAIN;
+		}
+
+		if (msg.rx.ret == -BPMP_ETIMEDOUT) {
+			dev_dbg(i2c->dev, "timeout\n");
+			return -ETIMEDOUT;
+		}
+
+		if (msg.rx.ret == -BPMP_ENXIO) {
+			dev_dbg(i2c->dev, "NAK\n");
+			return -ENXIO;
+		}
+
+		dev_err(i2c->dev, "transaction failed: %d\n", msg.rx.ret);
+		return -EIO;
+	}
+
+	return 0;
 }
 
 static int tegra_bpmp_i2c_xfer_common(struct i2c_adapter *adapter,
-- 
2.30.2

