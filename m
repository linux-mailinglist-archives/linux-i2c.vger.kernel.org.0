Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D66E51C2C30
	for <lists+linux-i2c@lfdr.de>; Sun,  3 May 2020 14:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgECMcl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 May 2020 08:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728122AbgECMcl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 May 2020 08:32:41 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA989C061A0C;
        Sun,  3 May 2020 05:32:40 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id r14so4158447pfg.2;
        Sun, 03 May 2020 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=S9UZgj84mZAUAnmYOiySi9W6UM6bjoHB6qeDJBZBBZ4=;
        b=EfiAq3xhC9XfMREVxYJntXiQCSfbWYk1IgxAqVXwY9/XYi9od5O8peytXsfQ2QvClD
         /PCFthfcWmKq3W9UShq5i5xhkuVacd1WfhrKE8CoBJ8uATv0/CZ63Z+LgsdZgeC0WqvH
         sVSwL3NT6MaA56QifgOddRScrZbTpPRwF70nOR2LTtidsztx3yiMaCo5a4ksyqWZsJFQ
         sUGSCaGQOVLvBKE9BIJrcSKAtVA4dX6M6+cvjwGX6nCOnBsmOQV4JeowAFgsmYxfb0tm
         WXvSKjc+/eJc+zHNn28/W4obnMslqfQnJE1qBIzbY/eazL8H3K/7SEGvvbIv5Jx+2Rpu
         elXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=S9UZgj84mZAUAnmYOiySi9W6UM6bjoHB6qeDJBZBBZ4=;
        b=FXRMj15/klwKi/2psMa8JJMUgNGdokj6nhezqAJJw2RRCTGk0scr0G+olycqQUqAoF
         agF0UQiGtypji1knIjdBX+NOc2YN2gG+3B7YugjTo38MjUp7qv8b3tTGXhTW/xtntJFN
         g0jBeKa5mnl5k6OPheYclRFlQmt4PQY3rDd7XOrZXsJZdX99SZKk23o4Y+iLSn/wetMz
         cwBWNb43NwAGUIrcpCBO6Tp7O2IOSrHY0ReXbNz3KODfzHPUsAe3tPm7ZfmTrieQG692
         efMvfhdhP8R4xD9nT83sfwT91IAMjnPmxF5z7DBTbgPlGeEcSB1J0TvvvcVUyd69GRbX
         Byuw==
X-Gm-Message-State: AGi0Pub/+K6+9oxiJQvEm8EGhAuqckgSuGoFFijkHxrBcRXIJjSenGqw
        tnZQTlU4YsI12QSDPRDa63w=
X-Google-Smtp-Source: APiQypL6YSIqiQz/09JrBRtKPPnIm0Gn/IEdymEAxBFebb6kaG2jLSnHf77BG22ZRivXdD11gPVNhg==
X-Received: by 2002:a63:3206:: with SMTP id y6mr12499287pgy.68.1588509160450;
        Sun, 03 May 2020 05:32:40 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:8b:8746:9817:f6e9:c9f8:6a59])
        by smtp.gmail.com with ESMTPSA id u5sm6496514pfu.198.2020.05.03.05.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 05:32:39 -0700 (PDT)
From:   Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
To:     Vladimir Zapolskiy <vz@mleia.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     aishwaryarj100@gmail.com
Subject: [PATCH] i2c: lpc2k: Remove superfluous error message in i2c_lpc2k_probe()
Date:   Sun,  3 May 2020 18:02:30 +0530
Message-Id: <20200503123230.14304-1-aishwaryarj100@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The function platform_get_irq can log an error by itself.
This omit a redundant message for exception handling in the
calling function.

Suggested by Coccinelle.

Signed-off-by: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
---
 drivers/i2c/busses/i2c-lpc2k.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index 13b0c12e2dba..43dc9b7043e4 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -362,10 +362,8 @@ static int i2c_lpc2k_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c->base);
 
 	i2c->irq = platform_get_irq(pdev, 0);
-	if (i2c->irq < 0) {
-		dev_err(&pdev->dev, "can't get interrupt resource\n");
+	if (i2c->irq < 0)
 		return i2c->irq;
-	}
 
 	init_waitqueue_head(&i2c->wait);
 
-- 
2.17.1

