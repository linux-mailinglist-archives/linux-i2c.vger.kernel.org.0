Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1DA51F8588
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jun 2020 23:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgFMV7b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Jun 2020 17:59:31 -0400
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:50738 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgFMV7b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 Jun 2020 17:59:31 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 49ks2B53jyz9vYxJ
        for <linux-i2c@vger.kernel.org>; Sat, 13 Jun 2020 21:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OXiYf32DdzRl for <linux-i2c@vger.kernel.org>;
        Sat, 13 Jun 2020 16:59:30 -0500 (CDT)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 49ks2B3Pkrz9vYx0
        for <linux-i2c@vger.kernel.org>; Sat, 13 Jun 2020 16:59:30 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 49ks2B3Pkrz9vYx0
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 49ks2B3Pkrz9vYx0
Received: by mail-il1-f200.google.com with SMTP id x63so9140030ilk.8
        for <linux-i2c@vger.kernel.org>; Sat, 13 Jun 2020 14:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=41c7FVjnuZxspya187rlx7OBSjVWB+zOwPrRB+ZgQSg=;
        b=ZClCkewZT10IFwgu68fiRQ0a2lUNssxCW8Qpwbz1BlQQD9oo8RsEMk+B6NXFRWyjAR
         G78hU9OGxRfC4up3QAteuRz5aiuxkQ8Ll64R9AxKIwttWPAnrnmXomK4nRuaAGD2Ka6T
         eE0OIsZ0pHhG5bVrjTLwEbgdxG+V9gNKj3gwO4U0oNq3mxaYZb9n+lb1thduT55wQock
         xRgRORglF9rM6zbJa60dU9T7cQ/tCIqV+E8kYCq0YV/S4ZcPMBhCqUGuzBYWT8oxCivW
         ypVEGDWcM9GBGIjHClhYdXGsdYp5QWCWIP5rRfA661NNizK7nUMU3aqnMOCufYCeIEcA
         zaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=41c7FVjnuZxspya187rlx7OBSjVWB+zOwPrRB+ZgQSg=;
        b=XFDdrMe7+15RgR1xgVNzdLGhXvLdYDByyQcp250HJLoR/HqgL1ccM81MhA03//KrUc
         ySEsoI1MkJ0a15AkLEtr3GgZ+R0nVQz82ulHUlI4LSDSkQqs5bx4vrDyS4H4CGJCVZdk
         xBdAMssRu8E9AGlHdM8+Kzn4km+pGP94xU1hpgz7x8SjcZCaeU6cB9uYAhc2YNHPTm6F
         5yvL1rw+gUks/ey6SVpTfurJBTkOm2lXde5eObeCFP+8YR/POx2qwti3F831lFvn+m7H
         1yV2QGeY7RlcnfLhf06DYTV9A9IxldmUUJkVu+DMByhDuA7WX86PJ7w5dlBrCrfgB0Yj
         IGRA==
X-Gm-Message-State: AOAM533NOkzqAbcAy1qWV6VEm8kUSaLagH4ynamNvUuJCcpVlFXaC9f5
        8nnK1owjk//iKtKPq07OQT2RAjhtbrCWPVTcjA8Il8MfTAZTRxTw31mYyXigPmf84pgFq8Aobe+
        MOyEJlk+qGPpEFaFPFNGfzV13
X-Received: by 2002:a5d:87c4:: with SMTP id q4mr20721683ios.169.1592085569968;
        Sat, 13 Jun 2020 14:59:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzipdRZykMqI9KaxMvFY/GNQReGYjPRPDqXiZP3a3gDErwMDUCI4tYTOc9XVtuyQfZVY4AYBg==
X-Received: by 2002:a5d:87c4:: with SMTP id q4mr20721663ios.169.1592085569733;
        Sat, 13 Jun 2020 14:59:29 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id t12sm5321589ilj.75.2020.06.13.14.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 14:59:29 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu, Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: xiic: Fix reference count leaks.
Date:   Sat, 13 Jun 2020 16:59:23 -0500
Message-Id: <20200613215923.2611-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus call pm_runtime_put_noidle()
if pm_runtime_get_sync() fails.

Fixes: 36ecbcab84d0 ("i2c: xiic: Implement power management")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/i2c/busses/i2c-xiic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 90c1c362394d..ffec41e6be72 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -696,8 +696,10 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		xiic_getreg8(i2c, XIIC_SR_REG_OFFSET));
 
 	err = pm_runtime_get_sync(i2c->dev);
-	if (err < 0)
+	if (err < 0) {
+		pm_runtime_put_noidle(i2c->dev);
 		return err;
+	}
 
 	err = xiic_busy(i2c);
 	if (err)
@@ -860,8 +862,10 @@ static int xiic_i2c_remove(struct platform_device *pdev)
 	i2c_del_adapter(&i2c->adap);
 
 	ret = pm_runtime_get_sync(i2c->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(i2c->dev);
 		return ret;
+	}
 
 	xiic_deinit(i2c);
 	pm_runtime_put_sync(i2c->dev);
-- 
2.17.1

