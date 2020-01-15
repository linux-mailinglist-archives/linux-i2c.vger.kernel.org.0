Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B235913CDA0
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 21:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729590AbgAOUDS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 15:03:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:60354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726566AbgAOUDS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Jan 2020 15:03:18 -0500
Received: from localhost.localdomain (unknown [194.230.155.229])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59E9022522;
        Wed, 15 Jan 2020 20:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579118597;
        bh=0591tE+4OH/hfGGAGciUPBvAKhLxHKpVzkbvCGRvx8k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VH6MeVzg99G/HehQJLYXUFXW4Rqw09+KbJXBW9sNLmHoAqKXs7CNPgQ1QiErcktrP
         xrICDTpL9xzMyCqxaLfnlgmiZwaj9BnyOVa/uONPlKpn+jkQJIfQABTXTcNcxq/WJE
         1ve0NlpvZNqg1z3egUB48A+//tTacFb9UiCqFVNE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 3/3] i2c: highlander: Use proper printk format for size_t
Date:   Wed, 15 Jan 2020 21:02:50 +0100
Message-Id: <20200115200250.10849-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115200250.10849-1-krzk@kernel.org>
References: <20200115200250.10849-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

size_t should be printed with its own format to be 64-bit friendly and
fix warning when compiling on 64-bit platform (e.g. with COMPILE_TEST):

    drivers/i2c/busses/i2c-highlander.c: In function ‘highlander_i2c_smbus_xfer’:
    drivers/i2c/busses/i2c-highlander.c:325:22: warning:
        format ‘%d’ expects argument of type ‘int’,
        but argument 3 has type ‘size_t {aka long unsigned int}’ [-Wformat=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. Rewrite incorrect commit msg.

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
2.17.1

