Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8538013A36F
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2020 10:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728935AbgANJGZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jan 2020 04:06:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:45354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725860AbgANJGY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Jan 2020 04:06:24 -0500
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 426A324655;
        Tue, 14 Jan 2020 09:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578992784;
        bh=xHEq0cIdKqev7KZs75cgmcmftzh7L7N3M6qGIbXNz8Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gaul7AfCo4oNymqOZlbeiUthJaRz3l3JrhQqXcivr1KLkJIUe2AuQxY95K2XO7deh
         kq8I+w6VvUE1rOAaWom1uTtBRLo5wE6mD77Ka3bDlaArwGa712UU4D0k5aYwzixBkq
         kdF/mhDlq5auEQrNSOTzx8W1uQ/iJo+ipm+wIND0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 4/4] i2c: stu300: Use proper printk format for iomem pointer
Date:   Tue, 14 Jan 2020 10:06:05 +0100
Message-Id: <1578992765-1418-4-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578992765-1418-1-git-send-email-krzk@kernel.org>
References: <1578992765-1418-1-git-send-email-krzk@kernel.org>
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

---

Changes since v1:
1. Add Linus' review tag.
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
2.7.4

