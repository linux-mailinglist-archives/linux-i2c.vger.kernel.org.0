Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B15228C4D
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 00:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgGUW7e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 18:59:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:47626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726555AbgGUW7e (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jul 2020 18:59:34 -0400
Received: from embeddedor (unknown [201.162.241.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E9F920720;
        Tue, 21 Jul 2020 22:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595372374;
        bh=OgO9aenT3Jhr5/9ApzMmBuefPOdAkNaeDlRsjFkF6eQ=;
        h=Date:From:To:Cc:Subject:From;
        b=ZMZQQ6QeycSQsck3Zn0opnaKhBkhQtdsygL/DFlvTv9oFFkNhH5R32Ajx1GRqwlz/
         RGUDygrVOkSySfsd0/cYXs5+ZPA9brHXAQI5o1r9KrKiMfZBwAO3JppaXTq2EMTJST
         ObS9/iTtVL4LhqqMpxAtRbe/+GYy28bVzQoo6pNU=
Date:   Tue, 21 Jul 2020 18:05:10 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH v2][next] i2c: digicolor: Use fallthrough pseudo-keyword
Message-ID: <20200721230510.GA684@embeddedor>
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

Acked-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Update URL. Use proper URL to Linux v5.7 documentation.

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

