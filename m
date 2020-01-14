Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0960613A36E
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2020 10:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgANJGX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jan 2020 04:06:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:45276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725860AbgANJGW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Jan 2020 04:06:22 -0500
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 028CD2187F;
        Tue, 14 Jan 2020 09:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578992781;
        bh=1QdT5zcgMqUV9FQI8pZN69jmKogFDORtHYamRxk5D/w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kMbXRtDbiem2zAJQlpe6HEH7Wj6+6TPStJ8CTlaxOdYOqvaq3+TZ6flAKq0lkTH7b
         LhSzd0v0DO5K2RlNP6DKiY1VndN6F77ikf/vj/1/uFFfZv/SBHNKarqpPr5MT++82y
         ZqZKfBNovlw6o1U2FrRxZ27llN4WsBtGaVYL8jSs=
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
Subject: [PATCH v2 3/4] i2c: highlander: Use proper printk format for iomem pointer
Date:   Tue, 14 Jan 2020 10:06:04 +0100
Message-Id: <1578992765-1418-3-git-send-email-krzk@kernel.org>
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

    drivers/i2c/busses/i2c-highlander.c: In function ‘highlander_i2c_smbus_xfer’:
    drivers/i2c/busses/i2c-highlander.c:325:22: warning:
        format ‘%d’ expects argument of type ‘int’,
        but argument 3 has type ‘size_t {aka long unsigned int}’ [-Wformat=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. None
---
 drivers/i2c/busses/i2c-highlander.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-highlander.c b/drivers/i2c/busses/i2c-highlander.c
index abfe3094c047..803dad70e2a7 100644
--- a/drivers/i2c/busses/i2c-highlander.c
+++ b/drivers/i2c/busses/i2c-highlander.c
@@ -322,7 +322,7 @@ static int highlander_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		tmp |= (SMMR_MODE0 | SMMR_MODE1);
 		break;
 	default:
-		dev_err(dev->dev, "unsupported xfer size %d\n", dev->buf_len);
+		dev_err(dev->dev, "unsupported xfer size %zu\n", dev->buf_len);
 		return -EINVAL;
 	}
 
-- 
2.7.4

