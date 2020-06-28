Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B4320C7BF
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jun 2020 13:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgF1Lw4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Jun 2020 07:52:56 -0400
Received: from www.zeus03.de ([194.117.254.33]:42022 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726351AbgF1Lwy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 28 Jun 2020 07:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=ogxUbn2uxfSNsC
        u9FzVENdQEngeMa7FBUaE74m5JXK0=; b=IT9f3e8LHSRIlflqZfXAZrMlAsJBTm
        /WXm0qg/H7Org3Fp1x95RKt0JB6cBkWVfDttx+qW8tWqF9KIfqKvZSuIRnFQPbuj
        MpwXbkyUz7uAeJ48KsEKuVJrwPWBz5al9r9B9sp1M2a6JzK2UnKT6PkzeisHkhw6
        ErOAipNbKLLZ0=
Received: (qmail 1708589 invoked from network); 28 Jun 2020 13:52:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2020 13:52:52 +0200
X-UD-Smtp-Session: l3s3148p1@WyEDlSOp7MogAwDPXykLAJ34nb66bSnN
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Robert Richter <rrichter@marvell.com>,
        Wolfram Sang <wsa@kernel.org>,
        David Daney <david.daney@cavium.com>,
        Jan Glauber <jan.glauber@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] i2c: octeon: check correct size of maximum RECV_LEN packet
Date:   Sun, 28 Jun 2020 13:52:45 +0200
Message-Id: <20200628115245.9638-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200628115245.9638-1-wsa+renesas@sang-engineering.com>
References: <20200628115245.9638-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I2C_SMBUS_BLOCK_MAX defines already the maximum number as defined in the
SMBus 2.0 specs. I don't see a reason to add 1 here.

Fixes: 886f6f8337dd ("i2c: octeon: Support I2C_M_RECV_LEN")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Only build tested, I don't have the HW. Please let me know if I
overlooked something, but to the best of my knowledge, this +1 is wrong.

 drivers/i2c/busses/i2c-octeon-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index d9607905dc2f..845eda70b8ca 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -347,7 +347,7 @@ static int octeon_i2c_read(struct octeon_i2c *i2c, int target,
 		if (result)
 			return result;
 		if (recv_len && i == 0) {
-			if (data[i] > I2C_SMBUS_BLOCK_MAX + 1)
+			if (data[i] > I2C_SMBUS_BLOCK_MAX)
 				return -EPROTO;
 			length += data[i];
 		}
-- 
2.20.1

