Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492B41ED692
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jun 2020 21:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgFCTOd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Jun 2020 15:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgFCTOc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Jun 2020 15:14:32 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FFFC08C5C0
        for <linux-i2c@vger.kernel.org>; Wed,  3 Jun 2020 12:14:32 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id v19so2984031wmj.0
        for <linux-i2c@vger.kernel.org>; Wed, 03 Jun 2020 12:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:mime-version
         :content-disposition:user-agent;
        bh=IgITx0iqh2VPVGxMHenemKe7oWEIZTBorCdvcnIeHXk=;
        b=PU+82AvnaBuSu06xnGYStqq58JL/LbcjGFDvz1KAKB8eqYGJhtXARGUfsdz+54mdJr
         JipYZEu+qCJ4StpMktun8BYTDhOz3GC3q2tF38L8lmD/5W2ip/GMw3E/HQJ4rgfWw926
         2YFlF6z51RURm5xvMNnGy2ef1M48z2bzPW8PdKBH8Sdmd0YwZ3YIfjHtQ/akruMGT1Q3
         ZbElFMDX/nXGyXr/0lV7vslftOa1L1HKqvSMd3XSXbzd5iOX6mrOvhhvo7DIEnaEz3CS
         Kn+lbeb39+6hzm0lig98uzJ7Bm1bFXRWJBE8Uk5AiZe5+2riRFaRpT3bwVil8A8Be5Za
         IAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :mime-version:content-disposition:user-agent;
        bh=IgITx0iqh2VPVGxMHenemKe7oWEIZTBorCdvcnIeHXk=;
        b=HrISCCeVo/CZ3KFDZj3q3lvx4Jurl3CroBTbXus7GkmcFnZqEGvn4orq9fg9/iYXnH
         f3IMdnvm0FUYuxtOhU6IMb/Xk1p6huVY12GVFavheBCu1JjOYpNN94ipQYHjJB0Pf9/U
         psK8gudRMg1etF4CVlpb4Vy7UYypUmgJ0o72yRh0c+AUEF3Yq2tLwB3j/nFwp1BgDOTt
         GoWLunA0NN2Zoov7ClxtPdZIioWYb3Mpx7LWUvgzg751QUn7RXI97cD0wbL+KIJz0HJ/
         rbYkuN6fqmg8/kjwK7ioCGOrExqUNN/fuZB51TPmVnJ4kPCxtFLlkBjuZRQ10R3VmrMT
         4/KA==
X-Gm-Message-State: AOAM530OiRGyWvRwqXILpvgyPUFOu00PJLtsnXuS9o8y5vsm2P9AWFEm
        0yjDlhGCmctDiWbBd6sjpuyyFHFuD3d8OQ==
X-Google-Smtp-Source: ABdhPJyt2NMM+SIlIyc3Q6svBK/ryuJlzuMYLqO8nfu2pm0FjDM0QvfvR2McBQfd1s2oAk+r4Jw3Rg==
X-Received: by 2002:a7b:cb99:: with SMTP id m25mr601677wmi.0.1591211671441;
        Wed, 03 Jun 2020 12:14:31 -0700 (PDT)
Received: from workpc ([5.148.47.5])
        by smtp.gmail.com with ESMTPSA id k14sm4513792wrq.97.2020.06.03.12.14.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 12:14:31 -0700 (PDT)
Date:   Wed, 3 Jun 2020 20:14:28 +0100
From:   Quentin Strydom <qstrydom0@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
Cc:     Quentin Strydom <qstrydom0@gmail.com>
Subject: [PATCH RESEND] i2c: mux: pca9541: Change bus control commands and
 release control of bus
Message-ID: <20200603191426.GA20270@workpc>
Reply-To: 2e2c3b98-20a6-2671-ad74-a0f171073bd0@axentia.se
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Change current bus commands to match the pca9541a datasheet
(see table 12 on page 14 of
https://www.nxp.com/docs/en/data-sheet/PCA9541A.pdf).

Also add change so that previous master releases control of bus.

Signed-off-by: Quentin Strydom <qstrydom0@gmail.com>
---
 drivers/i2c/muxes/i2c-mux-pca9541.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
index 50e1fb4aedf5..eb2552fbd0d0 100644
--- a/drivers/i2c/muxes/i2c-mux-pca9541.c
+++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
@@ -134,7 +134,8 @@ static void pca9541_release_bus(struct i2c_client *client)
 	reg = pca9541_reg_read(client, PCA9541_CONTROL);
 	if (reg >= 0 && !busoff(reg) && mybus(reg))
 		pca9541_reg_write(client, PCA9541_CONTROL,
-				  (reg & PCA9541_CTL_NBUSON) >> 1);
+				 (reg & (PCA9541_CTL_BUSON | PCA9541_CTL_MYBUS))
+				 ^ (PCA9541_CTL_BUSON | PCA9541_CTL_MYBUS));
 }
 
 /*
@@ -163,7 +164,7 @@ static void pca9541_release_bus(struct i2c_client *client)
 
 /* Control commands per PCA9541 datasheet */
 static const u8 pca9541_control[16] = {
-	4, 0, 1, 5, 4, 4, 5, 5, 0, 0, 1, 1, 0, 4, 5, 1
+	4, 4, 5, 5, 4, 4, 5, 5, 0, 0, 1, 1, 0, 0, 1, 1
 };
 
 /*
-- 
2.17.1

