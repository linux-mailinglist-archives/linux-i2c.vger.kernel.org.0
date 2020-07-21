Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99923228CA4
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 01:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731381AbgGUXUq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 19:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:40110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728799AbgGUXUq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jul 2020 19:20:46 -0400
Received: from embeddedor (unknown [201.162.241.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D4DA12073A;
        Tue, 21 Jul 2020 23:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595373646;
        bh=k12uJFo9GijfkE6amONA1RHG4y8f9peyXOXnnmnq4f8=;
        h=Date:From:To:Cc:Subject:From;
        b=aobTux0AHyL3+gneL86gXNyDcTGcd1RN6m6n0I6QAA9jIN3Ou0DyKjJVTa62RxrK3
         B0cj+wW4PZTECLMRu8u2fbFTqFwE7+GGsIBNhuoNrh6xSoOuE0WD4aiD33clnUAcxv
         VfUkbWFYbylwDbtsgyMnMo2mnQYKxydsylIbTdjQ=
Date:   Tue, 21 Jul 2020 18:26:23 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH v2][next] i2c: slave-eeprom: Use fallthrough pseudo-keyword
Message-ID: <20200721232623.GA2140@embeddedor>
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

[1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Update URL. Use proper URL to Linux v5.7 documentation.

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

