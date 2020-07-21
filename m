Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4E1C228CDF
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 01:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbgGUXuR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 19:50:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:53106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbgGUXuR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jul 2020 19:50:17 -0400
Received: from embeddedor (unknown [201.162.241.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1612020657;
        Tue, 21 Jul 2020 23:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595374231;
        bh=+aPBvm7PmwXf+ngJL5CufUYjRJ3afrbzvRdmLvuJAP8=;
        h=Date:From:To:Cc:Subject:From;
        b=DhtsisWRwm2dlRvbaqMHNVA5sEWVBHDWKH3gNt33GCOvF8b+8kSJfvxD4OF8B5lQC
         58qVUze20NBouZFXVeBVQQq/n2MjKjw+S8PzPuR+YsRukNbjwgICvim36U6Pjg4Ep3
         eP+M/CBQUqnG5KwDdBLrQqHB8tPzOS2Jwt0OxQaI=
Date:   Tue, 21 Jul 2020 18:36:09 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] i2c: synquacer: Use fallthrough pseudo-keyword
Message-ID: <20200721233609.GA2882@embeddedor>
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
 drivers/i2c/busses/i2c-synquacer.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index c9a3dba6a75d..31be1811d5e6 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -398,8 +398,7 @@ static irqreturn_t synquacer_i2c_isr(int irq, void *dev_id)
 
 		if (i2c->state == STATE_READ)
 			goto prepare_read;
-
-		/* fall through */
+		fallthrough;
 
 	case STATE_WRITE:
 		if (bsr & SYNQUACER_I2C_BSR_LRB) {
-- 
2.27.0

