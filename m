Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08C8B363B5C
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Apr 2021 08:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237360AbhDSGSv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Apr 2021 02:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbhDSGSu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Apr 2021 02:18:50 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB1FC06174A;
        Sun, 18 Apr 2021 23:18:21 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id w4so28928884wrt.5;
        Sun, 18 Apr 2021 23:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Tr6F7ybjQeVI2xqj6bIFk+x8CxQvHKZTlU9GCzqyZ6c=;
        b=VEDIxhpqpHgYntVRGwIxixy2ecSfhkHydEE8KYT8Bg6jXy5HhOsPv/ltjgME0PFlQb
         QVvJ00mTXPGQo9ClGxb0tdtKtjqlalxRp7jRRfwCgYLxJ60euJaD2z0Xw3J52sBSEarg
         vmOMBBI9PJcS1NN1ohkvuQEfbPSarJxp0+yXLfq8hYHVwCeob0oC3EJ0nhfZ//8ikEv4
         DxriggBydqBhNdCeS4BD3IF2qhS9R9IkxWQcsh0Ach9g6p+Jp34PMQqSsVpjUJ2i47TX
         XdkiK+57U94Q5cocPsl4Ps/zoQKmDzUHCi87n8KP5NUmiX/wvBEnajyo0o9kP5qyWoX3
         P1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Tr6F7ybjQeVI2xqj6bIFk+x8CxQvHKZTlU9GCzqyZ6c=;
        b=XGuvBeUZ4soQH+81vr8BMrtKXDOa85dnNUWoScMqLB1wmmBjPmcYztzSytKeVmkbMn
         3+GPqaVZjLsrKsI9oL24JfbY8pBYW706ISvibwh+3VB1ISAnHUiC5RSBPztWGTfs/Kzx
         qE9PVhWqR5jUijRCJkEqsSSNpSaQx9Of9iseX83YvASkGrwGqTQI+S7yERU8la8vdPeW
         KfY41XPO3IjZcjhYmxY1ru0w/DQQTkZ9ax8ITiFEPfTIyXL80pZhrkCDWocbwYUrFFsN
         ABqbSXlk+Rt8XWJCXQZimhb/cRX4ciRPjqmGwrQ0sIGudXNPvDZ9lgO2KkiwA6gs1Ik7
         BANw==
X-Gm-Message-State: AOAM531oyIGX6j+YKwLWexMOu6Y9XF1Al8uhyFOKINih2AR2kBCIqZjE
        Xfnuhaijm2EIUNHmy2mmH6g=
X-Google-Smtp-Source: ABdhPJxSVnkOXGq4BEKoVGMDD49h9sU6df8QAQzU9QM9ga9rLs2pDP6wG6hBV0Che8tFK0y5yO/WtQ==
X-Received: by 2002:a5d:4b12:: with SMTP id v18mr12495721wrq.45.1618813099877;
        Sun, 18 Apr 2021 23:18:19 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2dc6:900:a414:a08d:9e82:6738])
        by smtp.gmail.com with ESMTPSA id 2sm16821601wmi.19.2021.04.18.23.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 23:18:19 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>, linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: adjust to removing i2c designware platform data
Date:   Mon, 19 Apr 2021 08:18:09 +0200
Message-Id: <20210419061809.15045-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Commit 5a517b5bf687 ("i2c: designware: Get rid of legacy platform data")
removes ./include/linux/platform_data/i2c-designware.h, but misses to
adjust the SYNOPSYS DESIGNWARE I2C DRIVER section in MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches F: include/linux/platform_data/i2c-designware.h

Remove the file entry to this removed file as well.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210419

Andy, please ack.
Lee, please pick this minor patch on your -next tree.

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bbe356508f29..6b903aad27f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17667,7 +17667,6 @@ R:	Mika Westerberg <mika.westerberg@linux.intel.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-designware-*
-F:	include/linux/platform_data/i2c-designware.h
 
 SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
 M:	Jaehoon Chung <jh80.chung@samsung.com>
-- 
2.17.1

