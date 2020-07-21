Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBDBC228CC9
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 01:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731428AbgGUXpR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 19:45:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:51532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726555AbgGUXpR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jul 2020 19:45:17 -0400
Received: from embeddedor (unknown [201.162.241.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA62F20771;
        Tue, 21 Jul 2020 23:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595374357;
        bh=43Ks1BE66c2skOUrYRVoH9u+hQ/eis0KeY/m2/I51Ew=;
        h=Date:From:To:Cc:Subject:From;
        b=Aqi0MTlKY71zsxajxX3+yKLjpZqGRjf8m6ELK6UvWd8PgdfH3tzB/5qRGu6Se2LVg
         YHWIR23vBvdcQeElhKDUxSZjzjG59B57oDmzUJER/fE2SJWioiSOrgtCnJhBL8z1Ux
         NtdW8FpDF0bxXLmhago7MSFymh1e7Ix7JWgiiYN0=
Date:   Tue, 21 Jul 2020 18:38:14 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] i2c: designware: Use fallthrough pseudo-keyword
Message-ID: <20200721233814.GA3058@embeddedor>
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
 drivers/i2c/busses/i2c-designware-pcidrv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 8522134f9ea9..55c83a7a24f3 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -90,7 +90,7 @@ static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 	switch (pdev->device) {
 	case 0x0817:
 		dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
-		/* fall through */
+		fallthrough;
 	case 0x0818:
 	case 0x0819:
 		c->bus_num = pdev->device - 0x817 + 3;
-- 
2.27.0

