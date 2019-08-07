Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9901E84582
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2019 09:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727511AbfHGHST (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 03:18:19 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40106 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727436AbfHGHSS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Aug 2019 03:18:18 -0400
Received: by mail-pl1-f195.google.com with SMTP id a93so39304008pla.7;
        Wed, 07 Aug 2019 00:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lStqXB1CE+Wazs+U2rxsTV3wYflhaLXJIkT4Eebm9Ds=;
        b=GkhaTE0UE4nePuRPazYfHVmLl6UFjBwfbR+C7iplIolBn3RNuWmgNzI5I+eVahe+xe
         Z43Ykl28TtMMC3LHyqfeOlHRS2OAr9n+GrSpcd9ldBUs0yKv1ECHGpiVeYIF4rLATZE4
         FUdFochaJMaCsk00J0T+sUD60TXWdH3PfHsf4C3YJBh+z4Jk31SiocHLSNhkrP3s+S2g
         UPBx5S44gcygQJX/CZVv2nzw1YlDFBbGYooMVxb+n/uAU52tGGaJJxvzf5uKgHDuRo4R
         fTfqCUOey/c94OTSearRQTi1pYfvL8ou/ryK/TVvyHihQrVdVTuwXHqgvwYJHCl82TGp
         omSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lStqXB1CE+Wazs+U2rxsTV3wYflhaLXJIkT4Eebm9Ds=;
        b=Gx1JvqOi2S5f/S6wNT4Hx4/g689lj4XcEleFdYbqwdSj5gJTyV+msDB48yoWC/uBLT
         mmZe7FoOysj8ffE5lx15CjLZtJkTaVRMt1RTqiSCnNPPFPNfBNfpNDZxdAViuUBcAX3w
         8Ad2co8dmnw3m4vN5CfO32bjTRbLa2Ar67ydKRCLC3lTY9Q6DbSbyGk8PCFxzR/oMkQQ
         3WRA4L9XRA5i7oqHau544TC6KGfDsZvvYZoTVSTMdIj8yIf/zb/FhylDyo2LGNsVh9sa
         g0vmprnJypLhNOZibcFb4xL8M+B6N61tSyeTctKFPid/xYpcdgw/2xDDWPvBi3KwvChE
         BFKw==
X-Gm-Message-State: APjAAAVOXq6liDhb2LrXw+9QgY4gSfmaRoumWwGrUdg4mvqGSCVMl46G
        pGvOZ1TdtbbVhXLwgpwu3QREidzKDSE=
X-Google-Smtp-Source: APXvYqyVBs5fnbKDSnwvjleSvufFtN8/d/YvIkLh89tOTYbCjM/8+P1+YlW+dqGIDupRvcRSJdcPaw==
X-Received: by 2002:a17:902:9004:: with SMTP id a4mr6927957plp.109.1565162298236;
        Wed, 07 Aug 2019 00:18:18 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id q22sm83570089pgh.49.2019.08.07.00.18.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 00:18:17 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH v2] i2c: avoid sleep in IRQ context
Date:   Wed,  7 Aug 2019 15:18:07 +0800
Message-Id: <20190807071807.17488-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c_pxa_handler -> i2c_pxa_irq_txempty ->
i2c_pxa_reset -> i2c_pxa_set_slave -> i2c_pxa_wait_slave

As i2c_pxa_handler is an interrupt handler, it will finally
calls i2c_pxa_wait_slave which calls msleep.

Add in_interrupt check before msleep to avoid sleep
in IRQ context.
When in interrupt context, use mdelay instead of msleep.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/i2c/busses/i2c-pxa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 2c3c3d6935c0..876e693bafd9 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -456,7 +456,10 @@ static int i2c_pxa_wait_slave(struct pxa_i2c *i2c)
 			return 1;
 		}
 
-		msleep(1);
+		if (in_interrupt())
+			mdelay(1);
+		else
+			msleep(1);
 	}
 
 	if (i2c_debug > 0)
-- 
2.11.0

