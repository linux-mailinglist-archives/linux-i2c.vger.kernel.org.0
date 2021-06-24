Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497313B3282
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jun 2021 17:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232025AbhFXP2W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Jun 2021 11:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbhFXP2V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Jun 2021 11:28:21 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADBD2C061574;
        Thu, 24 Jun 2021 08:26:01 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id gn32so10209092ejc.2;
        Thu, 24 Jun 2021 08:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ieIaXg0d6oC/tMZWj0BlA0EeOBWnm8IldZ4BgM9lmcg=;
        b=Lwty/wp4Vra1bISTUndqed2e5HYGqHsijwO1xmvuDDMm6h3WiWXhHBMzESBdukFmH2
         FhlUK6YEJUp9zvr1cUE6PTLrDYGhvxbnJSjsuDTau8z62lrdWfMLVRAMrNzMLlF9r7yR
         wNm9kW7ib2j7vjYuWcBhmmFiGfXqDOPGs5vRZMIBxCna2AX8olUoST+In1ETMUDBgLww
         0BEiDCz/nmKnF7myr9X5bb/7KTryUTz/PjN/lZmFjsZlZn8lmOlUwVAWzc2NA3WUDj1K
         w63kYYNo0RKmRRB+3A652BCmKfK8bXGXI/hvYkTytRb0n71lrbjWBVGnE2assWjYaO/d
         Ul8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ieIaXg0d6oC/tMZWj0BlA0EeOBWnm8IldZ4BgM9lmcg=;
        b=l1GLXuwZbMscUvnPX+kvP4G9/glbqJy/LJLvzVcmSB8SmiVn5IAf3fedRrpx/qUnEX
         sbL8EvfKJQ0Iu99n2akGRQF8kYjZG6u1cJfLUqnB+cOOzd4qlaaN6HfSUbM4O52Z8zA4
         4ETblUH079GX0PEx7LwL1lF+ud9UjeAW7F+8xKuERohBaAVDXLKBIdKOFxaKLE2Kdpzb
         hcEphamcUQLmlL35A1AekSbL1H+QNBLfv8DKuuOrF/g4mGKg0MynSFv7ZdtLQ7z+7ySb
         PuaiEpl0sBCHvfMKxSfxRfmXiLMhWMhqlZ5BcbVYyk/ElQRnL+GK0dszJ8RygVoHJM0m
         7asg==
X-Gm-Message-State: AOAM533Fpjsx2oGx0KVGEiODDo9zXb/ME9N+aSQ/EafRUom0I2CuKriV
        2hCirjVgZExFE1DTL1Goff0=
X-Google-Smtp-Source: ABdhPJxriGh/Iy3QQ2drbGQmZD5pETZMjCptA6iQYJeb/jNH1W8BZ5qmJ09YAt196M4I3O1IZIE++g==
X-Received: by 2002:a17:906:f283:: with SMTP id gu3mr5997636ejb.415.1624548360078;
        Thu, 24 Jun 2021 08:26:00 -0700 (PDT)
Received: from andreas-HP-Compaq-8200-Elite-CMT-PC.speedport.ip (p200300c64732629ba21324299f39edc4.dip0.t-ipconnect.de. [2003:c6:4732:629b:a213:2429:9f39:edc4])
        by smtp.gmail.com with ESMTPSA id r23sm462260edv.26.2021.06.24.08.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 08:25:59 -0700 (PDT)
From:   Andreas Hecht <andreas.e.hecht@gmail.com>
To:     wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andreas Hecht <andreas.e.hecht@gmail.com>
Subject: [PATCH] i2c: i2c-dev: Add __user annotation
Date:   Thu, 24 Jun 2021 17:25:35 +0200
Message-Id: <20210624152535.4949-1-andreas.e.hecht@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix Sparse warnings:
drivers/i2c/i2c-dev.c:546:19: warning: incorrect type in assignment (different address spaces)
drivers/i2c/i2c-dev.c:549:53: warning: incorrect type in argument 2 (different address spaces)

compat_ptr() returns a pointer tagged __user which gets assigned to a
pointer missing the __user annotation. The same pointer is passed to
copy_from_user() as an argument where it is expected to have the __user
annotation. Fix both by adding the __user annotation to the pointer.

Signed-off-by: Andreas Hecht <andreas.e.hecht@gmail.com>
---
 drivers/i2c/i2c-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index 6ef38a8ee95c..cb64fe649390 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -526,7 +526,7 @@ static long compat_i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned lo
 		return put_user(funcs, (compat_ulong_t __user *)arg);
 	case I2C_RDWR: {
 		struct i2c_rdwr_ioctl_data32 rdwr_arg;
-		struct i2c_msg32 *p;
+		struct i2c_msg32 __user *p;
 		struct i2c_msg *rdwr_pa;
 		int i;
 
-- 
2.25.1

