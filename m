Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE5F47F369
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Dec 2021 15:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbhLYO2X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Dec 2021 09:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbhLYO2X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Dec 2021 09:28:23 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF83EC061401;
        Sat, 25 Dec 2021 06:28:22 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id u13so24630051lff.12;
        Sat, 25 Dec 2021 06:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U2n7gOBWr67q7RKJF59fQ5VTidYmMez9zbdcA+qwLy0=;
        b=QSd9gfzWwfUMbBrRnLLkB6KLqUEzp6yGBY003RhtFvIY4SmmzqdRQYHEJHWZ9mEdn5
         Z4MOVdHjk1aq1jQ99wYNStzYDLLqFoRJeb1G7DqRHqOr/udHT0pu/C6G/U16f0V8Jfeo
         c+NS0iQ1amOe2eLM9PfuJPA3YTJbR4A/3gWHUYCrKiCexQwuEbF0nnnb/GzYxE/RgS1M
         YjY+Mf3Xb4EgTuYdD48mgc9piUMT46nYsYf5TNVFZJ4e8w+RyfreWMU/qF4cf3iqVd+R
         jEffHmtlyVQoW9nBtVpPQqRYQ8NUpG9yrsLjRJQ5Gpme33K0mdqW+mR8C3VUivcev/5r
         AOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U2n7gOBWr67q7RKJF59fQ5VTidYmMez9zbdcA+qwLy0=;
        b=01z6jFK1VaEKL/AJmS+9aETV298BPeo1tzHKGT97vkRdeptc5fmbAM8UVSYBiVkml/
         I69Aj8tQ48WzVmsQKsNhWIEUr/Ho8Jz+1Dxff762+wgr3dPHY2kGjgFxk0Fi8SykMgs7
         oWHH4o0rx6umpvvqOZij+71pGFtyip1ze6RxyOI3gH9wySUaMpLFzJbYX5owylazJj+b
         8XwiqROD/d+QV44jNpVmiNEqTr8QAb1GKNO0N+lDwwEsVzqF+a7mWAZ73ldFTT02U4b6
         Phm/8rk8Occm9NDJMDg8gnPJSk7IivRAImWlomc/5SgT5yTSdpOZGdCR74elokq6OUw4
         4gGA==
X-Gm-Message-State: AOAM5306VBbZckIWndAJqjjvcH4TKyd2ZpZOk1YIKsyEEGaDBARxDcl4
        a3O/mZvde74gJ7mjdV365H13nFGSWyk=
X-Google-Smtp-Source: ABdhPJzkpHXTIgpp+R+VlG5cIPruWr+POpykf4AyCIMFVPKyIp3WXVNs/GddM/SWcfilOu8DKFJbPg==
X-Received: by 2002:ac2:5dc8:: with SMTP id x8mr8717846lfq.383.1640442500561;
        Sat, 25 Dec 2021 06:28:20 -0800 (PST)
Received: from localhost.localdomain ([94.103.235.97])
        by smtp.gmail.com with ESMTPSA id f33sm1125980lfv.39.2021.12.25.06.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Dec 2021 06:28:20 -0800 (PST)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     wsa@kernel.org, viro@zeniv.linux.org.uk
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com
Subject: [PATCH] i2c: don't pass 0 nmsgs to i2c_transfer
Date:   Sat, 25 Dec 2021 17:28:16 +0300
Message-Id: <20211225142816.6255-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We should not pass 0 nmsgs to i2c_transfer(), since it will cause
warning. This patch addd missing validion check to prevent passing
0 nmsgs.

Reported-and-tested-by: syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com
Fixes: 7d5cb45655f2 ("i2c compat ioctls: move to ->compat_ioctl()")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/i2c/i2c-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index bce0e8bb7852..3b54efa4b1ec 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -535,7 +535,7 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 				   sizeof(rdwr_arg)))
 			return -EFAULT;
 
-		if (rdwr_arg.nmsgs > I2C_RDWR_IOCTL_MAX_MSGS)
+		if (!rdwr_arg.nmsgs || rdwr_arg.nmsgs > I2C_RDWR_IOCTL_MAX_MSGS)
 			return -EINVAL;
 
 		rdwr_pa = kmalloc_array(rdwr_arg.nmsgs, sizeof(struct i2c_msg),
-- 
2.34.1

