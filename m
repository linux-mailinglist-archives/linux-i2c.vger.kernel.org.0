Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 933051F8596
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 00:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgFMWOn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Jun 2020 18:14:43 -0400
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:57344 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgFMWOn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 Jun 2020 18:14:43 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 49ksMk56s4z9vYdP
        for <linux-i2c@vger.kernel.org>; Sat, 13 Jun 2020 22:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5PTtUxQ5AyCR for <linux-i2c@vger.kernel.org>;
        Sat, 13 Jun 2020 17:14:42 -0500 (CDT)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 49ksMk3QzTz9vYdK
        for <linux-i2c@vger.kernel.org>; Sat, 13 Jun 2020 17:14:42 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 49ksMk3QzTz9vYdK
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 49ksMk3QzTz9vYdK
Received: by mail-il1-f198.google.com with SMTP id o4so9247703ilc.15
        for <linux-i2c@vger.kernel.org>; Sat, 13 Jun 2020 15:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=SHRtdP67z8uDLtvRLzGIraQQT7+sVEzlRnsgaGPcsRo=;
        b=h6M8NnPvqdAqrDAJv6UWcsp49XdeRjFKA086Kh+Zj5T5H7vdS/OUbAfnBzBlt+xPBW
         92Q756u2saHe5LEppISrQkDGW5FTPbK+tDueuVC5/Ln9Jgh0tco5Sl+8FnMOg42unTXg
         ZlxSbndL+7qdBggt3etOABHRhG83U/ki4lM1QhQCDjM5UK60oIXpGYTI9c4KytPV0Y+7
         xI2EFls8R6+1v8aU3DZpD5Y8ECwZtw1phmw3wHv/jQLuHiOfVUxx1Te6tVqigvrN6TOR
         dBl5OkSeEGvN2je4Fy8J6Updm6tvdPtGyGvqhk5nXDJWn064eofS6y7YAhouCK1dVaWz
         S4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SHRtdP67z8uDLtvRLzGIraQQT7+sVEzlRnsgaGPcsRo=;
        b=Klmq+Ixuwgt8FgGQ6Knz/TWDUqdOHzPe4a6dW89DZoeLg8vEUnvA5siW5FZDzIAJJw
         5otpVsx08Ln6IEDJ9nM3tqpAMN3fm6a94xWmDaVeV5YRnxHTmA1PGi46m/GA/zIdFT7l
         LSaUqiS4w7eopPOxNqN2GjPRZGi6x1ZmQbGK2qGuOuRc//fiiiyQCZQtgoHQsDEekeO9
         rfqy+j/cIgPCwghO/DyEBEqwNUWoA6f577SXEShYMv5londjSedz+JW8f5E4am/HruNv
         m6RPqxUFh8AHzHCfSgwSmlPq36nmAQ6HvbuSGR7Nt+CgCwOXt+JH2BWEeqzjeIC7uGUH
         yAaA==
X-Gm-Message-State: AOAM530dNLJEHG28tPVAU8hJfJpflMEPMx7F7EeR88BmLezTUPridt8e
        HH2kNRIu4h57Nymk3li6bZNSYptJdeE+iGcqbYnAhd+m+NncMvyO+hgZpCd0wsUygsc87U54gHh
        PV4zMuswiBDT6eFAd2NDagaj9
X-Received: by 2002:a6b:2cc5:: with SMTP id s188mr20388953ios.77.1592086482006;
        Sat, 13 Jun 2020 15:14:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0lCYYRh6ocSAycvLPyWnvnC+e63kW8/89jijv8iPJrBReQ48/M8EjuMbfFy66BhIQItXDdw==
X-Received: by 2002:a6b:2cc5:: with SMTP id s188mr20388931ios.77.1592086481669;
        Sat, 13 Jun 2020 15:14:41 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id e8sm5570193ill.25.2020.06.13.15.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 15:14:41 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu, Wolfram Sang <wsa@kernel.org>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Robert Richter <rrichter@marvell.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: busses: Fix reference count leaks.
Date:   Sat, 13 Jun 2020 17:14:34 -0500
Message-Id: <20200613221436.8048-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus call pm_runtime_put_noidle()
if pm_runtime_get_sync() fails.

Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/i2c/busses/i2c-img-scb.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 98a89301ed2a..e13ca862fa97 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1058,8 +1058,10 @@ static int img_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	ret = pm_runtime_get_sync(adap->dev.parent);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(adap->dev.parent);
 		return ret;
+	}
 
 	for (i = 0; i < num; i++) {
 		struct i2c_msg *msg = &msgs[i];
@@ -1159,8 +1161,10 @@ static int img_i2c_init(struct img_i2c *i2c)
 	int ret;
 
 	ret = pm_runtime_get_sync(i2c->adap.dev.parent);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(i2c->adap.dev.parent);
 		return ret;
+	}
 
 	rev = img_i2c_readl(i2c, SCB_CORE_REV_REG);
 	if ((rev & 0x00ffffff) < 0x00020200) {
-- 
2.17.1

