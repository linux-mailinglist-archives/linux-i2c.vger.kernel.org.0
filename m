Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3776A338C15
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Mar 2021 12:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbhCLL6A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Mar 2021 06:58:00 -0500
Received: from www.zeus03.de ([194.117.254.33]:39470 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229866AbhCLL5p (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Mar 2021 06:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=iaBckEgUieoJW6UiJu5aejon2xH
        cuC8ygE1XFQ9BWwc=; b=Ep60/7FHkx0JonwGX9Y+Jt/09ThhkCUmxsUlPj6nEZN
        S5KlhEbUYQyYNv6qZtF4KCwoby1O7LXY/p2o/7eKsouMCNNN5bd8p0MY+ggiXt+t
        eZhXYYZdrV5ZPr4zwG9enIT8wIzAjysXUUqScVhL5/vEr3MHJGhtSP3WTRbrDSMA
        =
Received: (qmail 366347 invoked from network); 12 Mar 2021 12:57:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Mar 2021 12:57:43 +0100
X-UD-Smtp-Session: l3s3148p1@BSiSm1W9oOYgAwDPXwjxAOzndPPvnXZD
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        syzbot+ffb0b3ffa6cfbc7d7b3f@syzkaller.appspotmail.com
Subject: [PATCH] i2c: bail out early when RDWR parameters are wrong
Date:   Fri, 12 Mar 2021 12:57:34 +0100
Message-Id: <20210312115734.14022-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The buggy parameters currently get caught later, but emit a noisy WARN.
Userspace should not be able to trigger this, so add similar checks much
earlier. Also avoids some unneeded code paths, of course. Apply kernel
coding stlye to a comment while here.

Reported-by: syzbot+ffb0b3ffa6cfbc7d7b3f@syzkaller.appspotmail.com
Tested-by: syzbot+ffb0b3ffa6cfbc7d7b3f@syzkaller.appspotmail.com
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-dev.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index 6ceb11cc4be1..6ef38a8ee95c 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -440,8 +440,13 @@ static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 				   sizeof(rdwr_arg)))
 			return -EFAULT;
 
-		/* Put an arbitrary limit on the number of messages that can
-		 * be sent at once */
+		if (!rdwr_arg.msgs || rdwr_arg.nmsgs == 0)
+			return -EINVAL;
+
+		/*
+		 * Put an arbitrary limit on the number of messages that can
+		 * be sent at once
+		 */
 		if (rdwr_arg.nmsgs > I2C_RDWR_IOCTL_MAX_MSGS)
 			return -EINVAL;
 
-- 
2.30.0

