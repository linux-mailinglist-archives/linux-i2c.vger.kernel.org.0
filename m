Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B16E746BD64
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 15:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbhLGOVA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 09:21:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232891AbhLGOU7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Dec 2021 09:20:59 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA1FC061574
        for <linux-i2c@vger.kernel.org>; Tue,  7 Dec 2021 06:17:29 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso1866706wml.1
        for <linux-i2c@vger.kernel.org>; Tue, 07 Dec 2021 06:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hms9maxth3tfl967mHRi3GsZJgZuyJ0zaMexlXG7ZCs=;
        b=njGh3bevvOMEWvAuNMridA2Wu/AoJVjOJod5IqWGiE1pPRrOIpSJVQYoclXJhWW0+A
         m4qJxtyL1gZZg0Lqezz/yUrpgidgle5Jds6ml/So2c1iYYvAV2pxnXxq5tG+iiYN4nEu
         M38qN0X2Ea3vuTykNq6X/vahONWOjDyxjbECPh4xRHw1mmehdpYseAulxcMNQzMOaF6A
         6QAw6JfM1WLZT9yIoqLmTs1mCsw7IzfCNJJOXdXlJjsX66DaT9XvDJIhxKtKgyLxxdNE
         VPNF22F6qR3tGslDeVVD0Y+LI0eg2r4AOsduGcGli0FsW327NfXqdpSQeMOPEc1ut0Kp
         6ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hms9maxth3tfl967mHRi3GsZJgZuyJ0zaMexlXG7ZCs=;
        b=pXtoGDh/XRc55cRCi5dTaQYmg01G2M+FmlYEwt3z8u2ZAdGRqWCLxQ9uqqPMBEWSxq
         fKj58Q5ei8sp3reXjOyERPOXpNP9eKFQeLYAJ4LNSlhYo9/aj7ubtVqQeBDlg8DTqKmS
         EvT+57akv7WzfkHvRWtoY8HgSiVcIh04lhXoPgSm+VDP8pObxFW3lqW8QFgDcGVNq8Wh
         OkK51r/RlvKVhUHrhr/ruw4rSOffGR2edugF1naR33KuSsV/1RrxXunOCG7vf71bLIpP
         8F6XzFOnInz6KHZLBs5anGXIQexiD2qXFNHypwZ/3VP8Ba8DHXrQabvsDc8wCJh/gCtw
         vxdA==
X-Gm-Message-State: AOAM531c+e/T4i0SY54asiXy+y2Xj8MpbzhYdmwUruqHnv6tqcQCr3cO
        8BBQ4xZJg8ubBQTeX2PTVuc=
X-Google-Smtp-Source: ABdhPJySOuirg4tvqLwlK5vx6F/pExIIiFpejCfy/BlZcjljWkm1TTowbQLFKDezYky4m/P33Sq37g==
X-Received: by 2002:a05:600c:3489:: with SMTP id a9mr7400567wmq.120.1638886647697;
        Tue, 07 Dec 2021 06:17:27 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id m36sm2847401wms.25.2021.12.07.06.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 06:17:26 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org
Subject: [PATCH] i2c: aspeed: Remove unused includes
Date:   Tue,  7 Dec 2021 15:17:22 +0100
Message-Id: <20211207141722.440213-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

No symbols from the linux/irqchip/chained_irq.h and linux/irqdomain.h
headers are used in the driver, so they can be removed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 67e8b97c0c95..771e53d3d197 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -16,8 +16,6 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
-#include <linux/irqchip/chained_irq.h>
-#include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
-- 
2.33.1

