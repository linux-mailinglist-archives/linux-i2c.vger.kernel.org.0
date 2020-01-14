Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9DC13A36C
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2020 10:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728819AbgANJGU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jan 2020 04:06:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:45238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725860AbgANJGU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Jan 2020 04:06:20 -0500
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7378217BA;
        Tue, 14 Jan 2020 09:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578992779;
        bh=mPgCwspC2Gdb6VmnE5JZXmFnOgnZUW49uwGxw9FEZbI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oNOtFLJe/GXxJ5ySHI6C6N7+iMc6zu29dmwk+7GowZAJ9Yb1mon4kJiTQzxeckCLs
         fNoHvgdx6w6adIp7DTTYmfCIERIAXjkKqz9dY5Qt3/Th4hx+6i/gFO5/2SH2yVn3Vw
         2NVetF0s5/Pk1OaJjahGIkY6KQlTJGS92smKlhb0=
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
Subject: [PATCH v2 2/4] i2c: pnx: Use proper printk format for resource_size_t
Date:   Tue, 14 Jan 2020 10:06:03 +0100
Message-Id: <1578992765-1418-2-git-send-email-krzk@kernel.org>
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

resource_size_t should be printed with its own size-independent format
to fix warnings when compiling on 64-bit platform (e.g. with
COMPILE_TEST):

    drivers/i2c/busses/i2c-pnx.c: In function ‘i2c_pnx_probe’:
    drivers/i2c/busses/i2c-pnx.c:737:47: warning:
        format ‘%x’ expects argument of type ‘unsigned int’,
        but argument 5 has type ‘resource_size_t {aka long long unsigned int}’ [-Wformat=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Use %pap, not %pa[p].
---
 drivers/i2c/busses/i2c-pnx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index 6e0e546ef83f..79bb1c68d485 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -734,8 +734,8 @@ static int i2c_pnx_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto out_clock;
 
-	dev_dbg(&pdev->dev, "%s: Master at %#8x, irq %d.\n",
-		alg_data->adapter.name, res->start, alg_data->irq);
+	dev_dbg(&pdev->dev, "%s: Master at %pap, irq %d.\n",
+		alg_data->adapter.name, &(res->start), alg_data->irq);
 
 	return 0;
 
-- 
2.7.4

