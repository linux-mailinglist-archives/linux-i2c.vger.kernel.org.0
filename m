Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B48454F48ED
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 02:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbiDEVzl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 17:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1455481AbiDEQAF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 12:00:05 -0400
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E94F1400B;
        Tue,  5 Apr 2022 08:15:52 -0700 (PDT)
Received: from zn.tnic (p2e55dff8.dip0.t-ipconnect.de [46.85.223.248])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4A8E11EC0535;
        Tue,  5 Apr 2022 17:15:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1649171747;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7LpwbTRZSZl3UcUUxK/gc+JLeRFgEvrqb5/MIf7cLWA=;
        b=UliPEgQUaAlMXoOHtohjpWYugorgyctYyvye+BbeTMhPLfH3wh33PXgF0F95VjaFyiY4sT
        dLx2BXmJC/1kxtwqOS5ZtrTBw0T22l+dKjSpkyO3hOoHkVPb1WlfcYQD3whjXnIr6DA9AH
        MoJu5CL9vF/fVEoGvN5VLRXgThEIeD4=
From:   Borislav Petkov <bp@alien8.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH 05/11] i2c: ismt: Fix undefined behavior due to shift overflowing the constant
Date:   Tue,  5 Apr 2022 17:15:11 +0200
Message-Id: <20220405151517.29753-6-bp@alien8.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405151517.29753-1-bp@alien8.de>
References: <20220405151517.29753-1-bp@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

Fix:

  drivers/i2c/busses/i2c-ismt.c: In function ‘ismt_hw_init’:
  drivers/i2c/busses/i2c-ismt.c:770:2: error: case label does not reduce to an integer constant
    case ISMT_SPGT_SPD_400K:
    ^~~~
  drivers/i2c/busses/i2c-ismt.c:773:2: error: case label does not reduce to an integer constant
    case ISMT_SPGT_SPD_1M:
    ^~~~

See https://lore.kernel.org/r/YkwQ6%2BtIH8GQpuct@zn.tnic for the gory
details as to why it triggers with older gccs only.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Seth Heasley <seth.heasley@intel.com>
Cc: Neil Horman <nhorman@tuxdriver.com>
Cc: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org
---
 drivers/i2c/busses/i2c-ismt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
index f4820fd3dc13..c0364314877e 100644
--- a/drivers/i2c/busses/i2c-ismt.c
+++ b/drivers/i2c/busses/i2c-ismt.c
@@ -145,8 +145,8 @@
 #define ISMT_SPGT_SPD_MASK	0xc0000000	/* SMBus Speed mask */
 #define ISMT_SPGT_SPD_80K	0x00		/* 80 kHz */
 #define ISMT_SPGT_SPD_100K	(0x1 << 30)	/* 100 kHz */
-#define ISMT_SPGT_SPD_400K	(0x2 << 30)	/* 400 kHz */
-#define ISMT_SPGT_SPD_1M	(0x3 << 30)	/* 1 MHz */
+#define ISMT_SPGT_SPD_400K	(0x2U << 30)	/* 400 kHz */
+#define ISMT_SPGT_SPD_1M	(0x3U << 30)	/* 1 MHz */
 
 
 /* MSI Control Register (MSICTL) bit definitions */
-- 
2.35.1

