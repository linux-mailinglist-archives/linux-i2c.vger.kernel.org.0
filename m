Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7126A4820B6
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 23:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237340AbhL3Wr4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Dec 2021 17:47:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234264AbhL3Wr4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Dec 2021 17:47:56 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87AF5C061574;
        Thu, 30 Dec 2021 14:47:55 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id u22so42667293lju.7;
        Thu, 30 Dec 2021 14:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SbcC2v/0NBjsVE5jCKkZ0+SK3mSOCyHq2tcLGlMmR80=;
        b=B5m5ZVorjFzP6y4P5ERWZjQ53JVAuTUkkZHpFs+35AQjZB4j/LKMB1DReCLoIYHlAi
         ya6r+D93y8Qq6jEEbZWHuRbt6ZjOoZY54N03uJwiVywuuDwIbXTFfDpjtF+3EZBJeHnJ
         2JoK0jnrlgnbqu7k376dFKOyIN7txMno/VsPNAIVL+yqI0s4sBPWQtfiTJkVSAmqxRr4
         GGbHFid+C+/CeOi8WxPsXJhJpH8+l/tGVEOopwksO3pj0QagmHxdqjHisQgy5PpaWFoz
         StyPi3kl2Pgyes5+Q6MMfKTad6tow61KrC+a6MRdJschahQugi4TaLWuurat/06IfGyg
         7afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SbcC2v/0NBjsVE5jCKkZ0+SK3mSOCyHq2tcLGlMmR80=;
        b=2pCTzDhBijvOcYk2qUpOnE01JI36Bst9Z4Ibx4uELbjf1ThLMs4hcJQr3EJA1ruacp
         m+lmYFT+Fg0vzAWskXp254R3MXZHKdP2qsu4LbprOwc/+nes0cRvFnUN7T8XLGI49uVa
         6DSM9zfKucjN2miojJN+47/L35D/8SgNs/kujgNxATAt8ljSqkia7nodTs/YiFKh4wHC
         0PfSdTh1ROBN/NQ+GwIccDp70bi/v92pIa94r1XFKNQk4ollgOEE8qufIFknsjuUFZIT
         8XUFzeaDU7OF3GO7AvUpYfN8OQW2Bwa3CwcLw+bkkefbI9V/BB1iFOD33QNq4N1zkjlB
         JwNQ==
X-Gm-Message-State: AOAM532rZV1S2Zr1L0bB2RoCBh0oGHLQh6RwiTntB+DGb+ktnPObVQMM
        tjPS1i9eKEXJ9J5gRJRA4dc=
X-Google-Smtp-Source: ABdhPJwNeW0YwcCVn+OHHPX+JuvMnHH01IsqbEcDr6vwOaEVYzqQ32sKgI8Lse82P6L5m5MglW8Ahw==
X-Received: by 2002:a2e:b90d:: with SMTP id b13mr27747608ljb.253.1640904473760;
        Thu, 30 Dec 2021 14:47:53 -0800 (PST)
Received: from localhost.localdomain ([94.103.235.97])
        by smtp.gmail.com with ESMTPSA id z20sm1436888lji.122.2021.12.30.14.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 14:47:53 -0800 (PST)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     wsa@kernel.org, viro@zeniv.linux.org.uk
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com
Subject: [PATCH v3] i2c: validate user data in compat ioctl
Date:   Fri, 31 Dec 2021 01:47:50 +0300
Message-Id: <20211230224750.15380-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Yc4wkyr7QTs8ao5x@kunai>
References: <Yc4wkyr7QTs8ao5x@kunai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wrong user data may cause warning in i2c_transfer(), ex: zero msgs.
Userspace should not be able to trigger warnings, so this patch adds
validation checks for user data in compact ioctl to prevent reported
warnings

Reported-and-tested-by: syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com
Fixes: 7d5cb45655f2 ("i2c compat ioctls: move to ->compat_ioctl()")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

Changes in v3
	- Add rdwr_arg.nmsgs == 0 check as Wolfram suggested

Changes in v2:
	- Fixed typos in commit message

---
 drivers/i2c/i2c-dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index bce0e8bb7852..cf5d049342ea 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -535,6 +535,9 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 				   sizeof(rdwr_arg)))
 			return -EFAULT;
 
+		if (!rdwr_arg.msgs || rdwr_arg.nmsgs == 0)
+			return -EINVAL;
+
 		if (rdwr_arg.nmsgs > I2C_RDWR_IOCTL_MAX_MSGS)
 			return -EINVAL;
 
-- 
2.34.1

