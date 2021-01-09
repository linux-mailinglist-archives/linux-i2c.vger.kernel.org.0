Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2A22EFFA4
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jan 2021 13:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbhAIMo4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Jan 2021 07:44:56 -0500
Received: from www.zeus03.de ([194.117.254.33]:50728 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726686AbhAIMo4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 9 Jan 2021 07:44:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=FNgj15D3k91S4V
        PodKXKk0mfMNri6JlDcD9jzLuY7is=; b=jG9LZex9OCBy9LoWiwc1v1/z2Fc58F
        1zSNXBam222mZH/BMojcb4NVcImikoid5/ydJwnIRvkhEF+C3II2AP57DGdnzGbF
        rAT/WNOUxj5GQx2w8h9zSZZgYdau0MePyWHPlkPfGcUUnqHnAQ9yhRg0OF6jiZOC
        +XyXh6zboWCEw=
Received: (qmail 1725205 invoked from network); 9 Jan 2021 13:43:33 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2021 13:43:33 +0100
X-UD-Smtp-Session: l3s3148p1@CqFLBXe4VpYgAwDPXyBeAD+yeC5KBZLe
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] i2c: s3c2410: advertise SMBus transfers using RECV_LEN
Date:   Sat,  9 Jan 2021 13:43:12 +0100
Message-Id: <20210109124314.27466-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
References: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This driver implements I2C_M_RECV_LEN, so it can advertise the SMBus
transfers needing it. This also enables client devices to check for the
RECV_LEN capability.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 3eafe0eb3e4c..62a903fbe912 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -781,7 +781,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 /* declare our i2c functionality */
 static u32 s3c24xx_i2c_func(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_NOSTART |
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL_ALL | I2C_FUNC_NOSTART |
 		I2C_FUNC_PROTOCOL_MANGLING;
 }
 
-- 
2.29.2

