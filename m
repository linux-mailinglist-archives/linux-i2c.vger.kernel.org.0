Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEEE91A28A4
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbgDHSYr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:24:47 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33260 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730868AbgDHSYp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:24:45 -0400
Received: by mail-pf1-f196.google.com with SMTP id c138so3450581pfc.0;
        Wed, 08 Apr 2020 11:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6pXCyMz/hgXB1r77DKpvsj8gTFG4HyxUEA9kPHJFiu4=;
        b=EjxsYuMFaE02XNdx/ds+zMM6V4qa61qZ22mVxtDrQU6QKJzPEzGuT0UTUrmpcCYk/A
         TcTijBL6w6xjXbq85IKCtcBdIrOY5hQNWz/h3yBVxbCldHqxkpmH7oDfOLyUdzPY2XjI
         7HsBd7ZoVV0GD/gcUjGSozg+4cKhMR3uvXkjBYFUtk1qtb277WgxNpDayb1PL8fRnjqI
         Zy1/gNozImfdOP2IPpNFCL4s3dl0NJX6J/UKrr0ks+LSQKKNMbkSckXcQoJEqdMfeoYx
         sMn1Z+u1Q4u5fWk6jKiuMH3viEvmWzdHSfzYMXP9R9CnkfLie7mbPulnqtGEYDli5Lc6
         sUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6pXCyMz/hgXB1r77DKpvsj8gTFG4HyxUEA9kPHJFiu4=;
        b=hfa+a2Vc/iwlVr2CLu2aicBvi+ZFXdK0X7i3RB3Nn9kovT7W6ISlYV0YXpnlSnsmhW
         1WhH6QyDgO6NMd3XhJvJm75kXwjJRtV9+4HRxZGWhntx7Ak6tjyQWCOprxQ/c78tqbOp
         z99XRhFWizjnokPAQOJN48Ssx1hH73uBlcwVtTYsC86HoSiNiKSTF7lvoay3C8/0Y4FU
         QeJtQVN4vDbr3P1+nqdcVu3WpDD2AaSIUMy/Jn1e/Mlpmm1CaLnoqUR19x9dDsTn9dTf
         Vu9gvSlN2lNWSl25HBA+z3wgS87XcJlVETu3FBJDNeCgKeXK41uXGEM7wE8CAXF1JinU
         AC2g==
X-Gm-Message-State: AGi0PuYhKOzROK/F6JQypgVt5j7ZelJl4F+z2Aq0g93L/N8WkncnpSDU
        YbePKYEPoMIwPhUdxJjVaH8=
X-Google-Smtp-Source: APiQypLo/hktnNaf3za7TY8byxlfJEhPVwUCHO8DYf0IiYeYlNvE37Bel3/FQzGIZPNZZ4qxI3uelw==
X-Received: by 2002:a62:1b05:: with SMTP id b5mr9125749pfb.281.1586370283246;
        Wed, 08 Apr 2020 11:24:43 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id 132sm17428652pfc.183.2020.04.08.11.24.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:24:42 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, nsekhar@ti.com,
        bgolaszewski@baylibre.com, baruch@tkos.co.il,
        wsa+renesas@sang-engineering.com, kgene@kernel.org,
        krzk@kernel.org, paul@crapouillou.net, vz@mleia.com,
        khilman@baylibre.com, gregory.clement@bootlin.com,
        rrichter@marvell.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, heiko@sntech.de, baohua@kernel.org,
        linus.walleij@linaro.org, mripard@kernel.org, wens@csie.org,
        ardb@kernel.org, gcherian@marvell.com, jun.nie@linaro.org,
        shawnguo@kernel.org, tglx@linutronix.de, zhouyanjie@wanyeetech.com,
        martin.blumenstingl@googlemail.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v2 20/24] i2c: stu300: convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:23:07 +0800
Message-Id: <20200408182311.26869-21-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200408182311.26869-1-zhengdejin5@gmail.com>
References: <20200408182311.26869-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

use devm_platform_ioremap_resource() to simplify code, which
contains platform_get_resource and devm_ioremap_resource.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v1 -> v2:
	- no changed

 drivers/i2c/busses/i2c-stu300.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stu300.c b/drivers/i2c/busses/i2c-stu300.c
index 42e0a53e7fa4..9a03779c149e 100644
--- a/drivers/i2c/busses/i2c-stu300.c
+++ b/drivers/i2c/busses/i2c-stu300.c
@@ -860,7 +860,6 @@ static int stu300_probe(struct platform_device *pdev)
 {
 	struct stu300_dev *dev;
 	struct i2c_adapter *adap;
-	struct resource *res;
 	int bus_nr;
 	int ret = 0;
 
@@ -876,8 +875,7 @@ static int stu300_probe(struct platform_device *pdev)
 	}
 
 	dev->pdev = pdev;
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dev->virtbase = devm_ioremap_resource(&pdev->dev, res);
+	dev->virtbase = devm_platform_ioremap_resource(pdev, 0);
 	dev_dbg(&pdev->dev, "initialize bus device I2C%d on virtual "
 		"base %p\n", bus_nr, dev->virtbase);
 	if (IS_ERR(dev->virtbase))
-- 
2.25.0

