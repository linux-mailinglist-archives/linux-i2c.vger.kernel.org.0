Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1078853EB40
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 19:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241896AbiFFQm2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 12:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241869AbiFFQmQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 12:42:16 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C9112A96;
        Mon,  6 Jun 2022 09:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654533727; x=1686069727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kPfOvWxtiOQgydvhidTbirNyYEpGUtcQOWxp4O2/dTk=;
  b=M1FkoIGpdtkIE3Ex55nVqOW7QEhDG/b53A6t9t023pQ8w9TJh7gF4Sdr
   Yrl+Ihv0EpPGpRndSIQSjBEK4WsOY2CnvITaZO1UUpOQq0MYXYR98S6b8
   k3DC0mvy0s76Q7j+EQ0xtdNrvXmJakE8JiJnB4d24CFMJNnwwQilAZtIT
   oFbByyItxnNNquCkBJaWKp9FJtzXkKYYWwIOUu7VAOwjihC6r+RzH7CLg
   LnOf94LG3AVeUQB55+xfqeBSiUvStc0RDUijJkGaYJiyNXc5w3rMEu/4F
   xxEC02k4gm81dVxxaJFdx0nA03cILCGpg+RVQUxdfmaYgKfRaEttqxbYg
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="275446410"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="275446410"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 09:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="579224475"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 06 Jun 2022 09:41:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B81D6F60; Mon,  6 Jun 2022 19:41:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Henning Schild <henning.schild@siemens.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: [PATCH v6 07/12] EDAC, pnd2: Use proper I/O accessors and address space annotation
Date:   Mon,  6 Jun 2022 19:41:33 +0300
Message-Id: <20220606164138.66535-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver uses rather voodoo kind of castings and I/O accessors.
Replace it with proper __iomem annotation and readl()/readq() calls.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Henning Schild <henning.schild@siemens.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
 drivers/edac/pnd2_edac.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/edac/pnd2_edac.c b/drivers/edac/pnd2_edac.c
index c94ca1f790c4..7d1df120e24c 100644
--- a/drivers/edac/pnd2_edac.c
+++ b/drivers/edac/pnd2_edac.c
@@ -265,7 +265,7 @@ static u64 get_sideband_reg_base_addr(void)
 static int dnv_rd_reg(int port, int off, int op, void *data, size_t sz, char *name)
 {
 	struct pci_dev *pdev;
-	char *base;
+	void __iomem *base;
 	u64 addr;
 	unsigned long size;
 
@@ -297,8 +297,9 @@ static int dnv_rd_reg(int port, int off, int op, void *data, size_t sz, char *na
 			return -ENODEV;
 
 		if (sz == 8)
-			*(u32 *)(data + 4) = *(u32 *)(base + off + 4);
-		*(u32 *)data = *(u32 *)(base + off);
+			*(u64 *)data = readq(base + off);
+		else
+			*(u32 *)data = readl(base + off);
 
 		iounmap(base);
 	}
-- 
2.35.1

