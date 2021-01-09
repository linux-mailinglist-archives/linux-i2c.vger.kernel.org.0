Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB6E62EFFA7
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jan 2021 13:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbhAIMox (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Jan 2021 07:44:53 -0500
Received: from www.zeus03.de ([194.117.254.33]:50686 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726685AbhAIMox (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 9 Jan 2021 07:44:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=ZRdwBwqhqHXGGH
        jlABb5ul9pWZH2vm9hbg2UWIErqqM=; b=mKO3xMy8ugDjQHCWVmCyevEnxKlpkv
        yCLkAQVWeYrDG0zYjssfpQxwDZzx1V4MtygplLu3OrTQGoC818WAjPO6MfUMe+cy
        0j+o9ZzqfBCDCd+tMfYhzhQUTCejuu2SXK69AIKHVuJtzbLsDHsdd8A6iK3GYyr9
        kXRox55jDoWoM=
Received: (qmail 1725177 invoked from network); 9 Jan 2021 13:43:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2021 13:43:32 +0100
X-UD-Smtp-Session: l3s3148p1@Fw85BXe4UpYgAwDPXyBeAD+yeC5KBZLe
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] i2c: algo: bit: use new macro to specifiy capabilities
Date:   Sat,  9 Jan 2021 13:43:10 +0100
Message-Id: <20210109124314.27466-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
References: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Let's use the new macro for emulating SMBus with RECV_LEN support.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/algos/i2c-algo-bit.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index 913db013fe90..fc90293afcbf 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -622,9 +622,7 @@ static int bit_xfer_atomic(struct i2c_adapter *i2c_adap, struct i2c_msg msgs[],
 
 static u32 bit_func(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_NOSTART | I2C_FUNC_SMBUS_EMUL |
-	       I2C_FUNC_SMBUS_READ_BLOCK_DATA |
-	       I2C_FUNC_SMBUS_BLOCK_PROC_CALL |
+	return I2C_FUNC_I2C | I2C_FUNC_NOSTART | I2C_FUNC_SMBUS_EMUL_ALL |
 	       I2C_FUNC_10BIT_ADDR | I2C_FUNC_PROTOCOL_MANGLING;
 }
 
-- 
2.29.2

