Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2115B228CB3
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 01:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgGUX1w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 19:27:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:45284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbgGUX1w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jul 2020 19:27:52 -0400
Received: from embeddedor (unknown [201.162.241.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 96D7E2073A;
        Tue, 21 Jul 2020 23:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595374071;
        bh=TpGye4OXRucMZOFEZvMVKT883+Bt6kZ+SrxTDUF+e7I=;
        h=Date:From:To:Cc:Subject:From;
        b=DfYkeNBHQ0sJiJyC3VjBNiqfqxwOqUufJIH/i/hDWOy7Gr1P9Y6u7Rkr4ZG0jeLqJ
         7u2xWpPlNAqEmj53IGiKlnYqNwc1IaT1a0c0CHftyOIvfjOY4s+9hs9XKnhQRzS1pN
         HIGvyzInyvugKzRhpSJvMnbuBEZDtgTQbFdCjIxM=
Date:   Tue, 21 Jul 2020 18:33:29 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Jim Cromie <jim.cromie@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] i2c: scx200_acb: Use fallthrough pseudo-keyword
Message-ID: <20200721233329.GA2718@embeddedor>
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
 drivers/i2c/busses/scx200_acb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/scx200_acb.c b/drivers/i2c/busses/scx200_acb.c
index bd9afa383d12..7b42a18bd05c 100644
--- a/drivers/i2c/busses/scx200_acb.c
+++ b/drivers/i2c/busses/scx200_acb.c
@@ -151,7 +151,7 @@ static void scx200_acb_machine(struct scx200_acb_iface *iface, u8 status)
 
 	case state_repeat_start:
 		outb(inb(ACBCTL1) | ACBCTL1_START, ACBCTL1);
-		/* fallthrough */
+		fallthrough;
 
 	case state_quick:
 		if (iface->address_byte & 1) {
-- 
2.27.0

