Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F418222E31
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 23:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgGPVya (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 17:54:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:49066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbgGPVy3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Jul 2020 17:54:29 -0400
Received: from embeddedor (unknown [201.162.240.161])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30DF120760;
        Thu, 16 Jul 2020 21:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594936469;
        bh=7Y79PlBLypjiGciQs1QDqok54Ha2YLGjS+r3ut4HDNg=;
        h=Date:From:To:Cc:Subject:From;
        b=MngByaZG0kg0WZVtJ42cy/lgMbbecMBeapv3OPMc3HDpO/izT0MUY9RkIaTq7+6Pi
         HqOJfBm9IcAEbK7IN/19PLo77nBwblKbuZMCBzxN4KL6QwHcXWMVJ1TetXoU6AXYxO
         s4GXnMYYqIbiVciH0ztFzbxsA3z0rvyM2m4Add2s=
Date:   Thu, 16 Jul 2020 16:59:54 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] i2c: slave-eeprom: Use fallthrough pseudo-keyword
Message-ID: <20200716215954.GA19481@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1].

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/i2c/i2c-slave-eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index 593f2fd39d17..5c7ae421cacf 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -66,7 +66,7 @@ static int i2c_slave_eeprom_slave_cb(struct i2c_client *client,
 	case I2C_SLAVE_READ_PROCESSED:
 		/* The previous byte made it to the bus, get next one */
 		eeprom->buffer_idx++;
-		/* fallthrough */
+		fallthrough;
 	case I2C_SLAVE_READ_REQUESTED:
 		spin_lock(&eeprom->buffer_lock);
 		*val = eeprom->buffer[eeprom->buffer_idx & eeprom->address_mask];
-- 
2.27.0

