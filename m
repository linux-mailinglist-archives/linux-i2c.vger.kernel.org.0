Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F3A47F43C
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Dec 2021 19:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbhLYSY1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Dec 2021 13:24:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhLYSY0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Dec 2021 13:24:26 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3481FC061401;
        Sat, 25 Dec 2021 10:24:26 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id x4so1136489ljc.6;
        Sat, 25 Dec 2021 10:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hAEvd6KYn3LoKz+A2XPAU9FKH6fu70yMnvCcwLB1oVY=;
        b=BGcg6Ojxtlj/3M92LrYHC6OK7aMuSwC9iK+2S55jrtyLtj7tdeZoI1kdH4M+s3BxKu
         xf7jCpx27846a7qYxdLD1zFzlnGM593FPaJDmH1jbmpHSLp8cwg4enPQdJAG3BC1MnyS
         eYpxfVdE9VRUcDX+XKKR2wXYuSYBj0oF9GnJGGuXwGY/XQnOHQmpc5x8hZsgM4zg7VtZ
         Oec++3a00iq7/lWzSJ/pi5+P6duNaIV584GFN0kdZU5aRraEBAae1MlDN48fdy3Gok1F
         yryqPXeJ1Gb4zxt3LAGk2cIY6sadr0Dyb7j10bTyuWH8DEqKQlLd2VEcmAkSs0gth0ul
         xX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hAEvd6KYn3LoKz+A2XPAU9FKH6fu70yMnvCcwLB1oVY=;
        b=698kz6MkPX814EOKrxa9dNpIgtn/HfeW5dx1Mn7wi8yMpShEX/UD9aYwlc/fpyoRGP
         clu2Q/7ZU/7H41bjYGVlMcizwc1JR1rPLhtTCHZqvWUJT3rgRNLroxtzXTIOtjW3b0jA
         Hxq8C7tmkMgh5ZiMKtXgF5hUis57RtIt0s0a+tswYKMxeZav4oyGlW7h8m3fPiL/icO5
         hYc0QWiWBvdagCZjbZIo2LRDoggn8vICfiEjWbQugeSz2e7RxzP0i6Fe40PnOhyveX9R
         SKNF9npBgF0fYgzcGTR/mKIlblgHPslMDJfgqYVHzlglnXlc2SlLD+lzcAyebZfQH3Dw
         XzRw==
X-Gm-Message-State: AOAM532w+XMKkY+r+I9MPcnDiEbyMcFY9YQWrkXXYrmcc0Pu38zHmDJE
        1F8uVPjs5gR1YVnKjUISdfA=
X-Google-Smtp-Source: ABdhPJyt4WJ1uXKo9ydZmLZr3IkhENsXKo+AKB8BTvSYNFw+G+oTm/clHQGbU1fe8Wfexxzab12xrQ==
X-Received: by 2002:a2e:a30f:: with SMTP id l15mr3456975lje.493.1640456664448;
        Sat, 25 Dec 2021 10:24:24 -0800 (PST)
Received: from localhost.localdomain ([94.103.235.97])
        by smtp.gmail.com with ESMTPSA id k32sm1166349lfv.214.2021.12.25.10.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Dec 2021 10:24:24 -0800 (PST)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     wsa@kernel.org, viro@zeniv.linux.org.uk
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com
Subject: [PATCH v2] i2c: don't pass 0 nmsgs to i2c_transfer
Date:   Sat, 25 Dec 2021 21:24:18 +0300
Message-Id: <20211225182418.26839-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211225142816.6255-1-paskripkin@gmail.com>
References: <20211225142816.6255-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We should not pass 0 nmsgs to i2c_transfer(), since it will cause
warning. This patch adds missing validation check to prevent passing
0 nmsgs to i2c_transfer().

Reported-and-tested-by: syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com
Fixes: 7d5cb45655f2 ("i2c compat ioctls: move to ->compat_ioctl()")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

Changes in v2:
	- Fixed typos in commit message

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

