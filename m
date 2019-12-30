Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6D5312D2AA
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2019 18:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbfL3R2K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Dec 2019 12:28:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:33734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727207AbfL3R2K (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Dec 2019 12:28:10 -0500
Received: from localhost.localdomain (unknown [194.230.155.138])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B536820730;
        Mon, 30 Dec 2019 17:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577726889;
        bh=pDY2jgrEvo3eCGKykGqpYhFSgX4nnKOmj1O3sl70LGU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yW/fGdwVeC/XZXDIQ8/J9YupbFrwIPe45lulGGilx3WLfB/M15RJog2O3ruzS6Uyl
         StHDrTongR2eAP293fgQ7dQyUlbJWGkUPV20CoTNBYy1qWOWe5ekVArtzzWng4wSxa
         5coDyCrdsfXtu1kAQe//Sq1R9v2RUp2m16IhC8mc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Max Staudt <max@enpas.org>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Elie Morisse <syniurge@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 4/5] i2c: stu300: Use proper printk format for iomem pointer
Date:   Mon, 30 Dec 2019 18:27:50 +0100
Message-Id: <20191230172751.17985-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230172751.17985-1-krzk@kernel.org>
References: <20191230172751.17985-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

iomem pointers should be printed with pointer format to hide the
actual value and fix warnings when compiling on 64-bit platform (e.g. with
COMPILE_TEST):

    drivers/i2c/busses/i2c-stu300.c: In function ‘stu300_wait_while_busy’:
    drivers/i2c/busses/i2c-stu300.c:446:76: warning:
        cast from pointer to integer of different size [-Wpointer-to-int-cast]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/i2c/busses/i2c-stu300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stu300.c b/drivers/i2c/busses/i2c-stu300.c
index 8c3e2d409d63..42e0a53e7fa4 100644
--- a/drivers/i2c/busses/i2c-stu300.c
+++ b/drivers/i2c/busses/i2c-stu300.c
@@ -444,7 +444,7 @@ static int stu300_wait_while_busy(struct stu300_dev *dev)
 		       "Attempt: %d\n", i+1);
 
 		dev_err(&dev->pdev->dev, "base address = "
-			"0x%08x, reinit hardware\n", (u32) dev->virtbase);
+			"0x%p, reinit hardware\n", dev->virtbase);
 
 		(void) stu300_init_hw(dev);
 	}
-- 
2.17.1

