Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A14F1397AB
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2020 18:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgAMRaC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 12:30:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:53302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgAMRaC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Jan 2020 12:30:02 -0500
Received: from localhost.localdomain (unknown [194.230.155.229])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57874206DA;
        Mon, 13 Jan 2020 17:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578936601;
        bh=yxdNHMBNa1z7mPo0Ki+HxaAbVu5m6892gO1e+zJHjGA=;
        h=From:To:Cc:Subject:Date:From;
        b=gtQghRIfG5gHQVy7sTT6AcZgKlpP4R+SHaXpnii03pqmgEZTYiQWe/7IE1sBAzyag
         E3pewk0ojo6QGFT2Ndv+IbskUV9KOnVPnZqxc2CVfAwqcZdoPQmxoP3eQuBxWmKYed
         x1iwBMvXBRcx1p5HSHXa7Y1R1aXnv4/HgVO/m2KU=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] i2c: iop3xx: Fix memory leak in probe error path
Date:   Mon, 13 Jan 2020 18:29:54 +0100
Message-Id: <20200113172954.5096-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When handling devm_gpiod_get_optional() errors, free the memory already
allocated.  This fixes Smatch warnings:

    drivers/i2c/busses/i2c-iop3xx.c:437 iop3xx_i2c_probe() warn: possible memory leak of 'new_adapter'
    drivers/i2c/busses/i2c-iop3xx.c:442 iop3xx_i2c_probe() warn: possible memory leak of 'new_adapter'

Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/i2c/busses/i2c-iop3xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-iop3xx.c b/drivers/i2c/busses/i2c-iop3xx.c
index 38556381f4ca..2f8b8050a223 100644
--- a/drivers/i2c/busses/i2c-iop3xx.c
+++ b/drivers/i2c/busses/i2c-iop3xx.c
@@ -433,13 +433,17 @@ iop3xx_i2c_probe(struct platform_device *pdev)
 	adapter_data->gpio_scl = devm_gpiod_get_optional(&pdev->dev,
 							 "scl",
 							 GPIOD_ASIS);
-	if (IS_ERR(adapter_data->gpio_scl))
-		return PTR_ERR(adapter_data->gpio_scl);
+	if (IS_ERR(adapter_data->gpio_scl)) {
+		ret = PTR_ERR(adapter_data->gpio_scl);
+		goto free_both;
+	}
 	adapter_data->gpio_sda = devm_gpiod_get_optional(&pdev->dev,
 							 "sda",
 							 GPIOD_ASIS);
-	if (IS_ERR(adapter_data->gpio_sda))
-		return PTR_ERR(adapter_data->gpio_sda);
+	if (IS_ERR(adapter_data->gpio_sda)) {
+		ret = PTR_ERR(adapter_data->gpio_sda);
+		goto free_both;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
-- 
2.17.1

