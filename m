Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E94612D2A6
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2019 18:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbfL3R2E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Dec 2019 12:28:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:33510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727207AbfL3R2E (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Dec 2019 12:28:04 -0500
Received: from localhost.localdomain (unknown [194.230.155.138])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5763F2071E;
        Mon, 30 Dec 2019 17:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577726883;
        bh=/hvbWvEUGKZyj8PDCsO8CkkPdQuyd4EzT3CfyjXqoBo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sjUJkJlFlXc7qvNGfbINWcfoWAUNZ1YWnfr9t+TFRgHuztwl3+qJ+Q+KNg+JBm5FR
         hnbj+8etvYUrjPYq8+o22doewO9DwZ7tLSUZ3wno8hLClGgguXfIvTUKQDu6S1fK67
         +/5ilxp1f9xoF1Hc8cLVTdPNIprISgNCk/2l4ryk=
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
Subject: [PATCH 2/5] i2c: pnx: Use proper printk format for resource_size_t
Date:   Mon, 30 Dec 2019 18:27:48 +0100
Message-Id: <20191230172751.17985-2-krzk@kernel.org>
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

resource_size_t should be printed with its own size-independent format
to fix warnings when compiling on 64-bit platform (e.g. with
COMPILE_TEST):

    drivers/i2c/busses/i2c-pnx.c: In function ‘i2c_pnx_probe’:
    drivers/i2c/busses/i2c-pnx.c:737:47: warning:
        format ‘%x’ expects argument of type ‘unsigned int’,
        but argument 5 has type ‘resource_size_t {aka long long unsigned int}’ [-Wformat=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/i2c/busses/i2c-pnx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index 6e0e546ef83f..053c35d99aad 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -734,8 +734,8 @@ static int i2c_pnx_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto out_clock;
 
-	dev_dbg(&pdev->dev, "%s: Master at %#8x, irq %d.\n",
-		alg_data->adapter.name, res->start, alg_data->irq);
+	dev_dbg(&pdev->dev, "%s: Master at %pa[p], irq %d.\n",
+		alg_data->adapter.name, &(res->start), alg_data->irq);
 
 	return 0;
 
-- 
2.17.1

