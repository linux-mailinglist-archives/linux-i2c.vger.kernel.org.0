Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F6D222E33
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 23:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgGPVza (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 17:55:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:49234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbgGPVza (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Jul 2020 17:55:30 -0400
Received: from embeddedor (unknown [201.162.240.161])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C393820760;
        Thu, 16 Jul 2020 21:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594936530;
        bh=WnFzp0aKaFdtWvWGvJqN641XGoRa+VJNUrG66a7Tuvk=;
        h=Date:From:To:Cc:Subject:From;
        b=FAycc2Upmlubfxv83I/78APO7YdW4MlwCTT5ac1vvdJLjZBzKu42MLrF0Ve1JttqI
         2tevsowrJ6QrKjv9wxnx8iNlQVL/eKBw5NDtjb7texLOwRDPJjiqGLnDodioW2SmV1
         zFni898F3TwpsSOQZFYpRB+iuwnpVpQBleDRm1l4=
Date:   Thu, 16 Jul 2020 17:00:55 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] i2c: digicolor: Use fallthrough pseudo-keyword
Message-ID: <20200716220055.GA19603@embeddedor>
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
 drivers/i2c/busses/i2c-digicolor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-digicolor.c
index 332f00437479..f67639dc74b7 100644
--- a/drivers/i2c/busses/i2c-digicolor.c
+++ b/drivers/i2c/busses/i2c-digicolor.c
@@ -187,7 +187,7 @@ static irqreturn_t dc_i2c_irq(int irq, void *dev_id)
 			break;
 		}
 		i2c->state = STATE_WRITE;
-		/* fall through */
+		fallthrough;
 	case STATE_WRITE:
 		if (i2c->msgbuf_ptr < i2c->msg->len)
 			dc_i2c_write_buf(i2c);
-- 
2.27.0

