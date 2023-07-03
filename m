Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93904745BF5
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 14:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbjGCMOT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 08:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjGCMOR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 08:14:17 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6E910E;
        Mon,  3 Jul 2023 05:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688386457; x=1719922457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6dRCLDNqHkkgOUVmba5HT205hg+Hl4f7VC7TUVOvuDs=;
  b=In5Upfr6C5gXiONAMV1wQ16x/2QH4eupis0ImI9fmQs/oIit5CGE3Vfu
   Yuf8spOZYtPt3pwy1PHuRLCsRnwy51aG16KSzHQvEEDJ614Ouj8EKsIcL
   zoL9c3KEFd5vT2dXtE9xjDRnGxic8/5fcYJUBDqy2+tETF03FA3MjL42c
   45GXZCsbQQlU+yg21obn/mpfJqc6WiqaFNBPEv+NCBs2comcvyaB5V7Qn
   EAZWLJSSLlbJDYYm4EKCyNUvNc0IliaJvHF1gB0svq9HIBh4HSF4v8TyF
   x0La9plWQBrmJEVJExkH1mCqcNWu5HJ7547N8/SlKlGinEljTQgodHKtR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="361726070"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="361726070"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 05:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="788508205"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="788508205"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 03 Jul 2023 05:14:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 28A8C17C; Mon,  3 Jul 2023 15:14:13 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v4 5/5] ACPI: scan: Provide symbol declarations
Date:   Mon,  3 Jul 2023 15:14:11 +0300
Message-Id: <20230703121411.69606-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230703121411.69606-1-andriy.shevchenko@linux.intel.com>
References: <20230703121411.69606-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Compiler is not happy about a couple of symbols that, it thinks,
are not declared:

  warning: symbol 'acpi_device_lock' was not declared. Should it be static?
  warning: symbol 'acpi_wakeup_device_list' was not declared. Should it be static?

Include "sleep.h" to have them explicitly declared and make
the compiler happy.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/acpi/scan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index ec1c9bec8bae..5b145f1aaa1b 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -23,6 +23,7 @@
 #include <linux/dma-direct.h>
 
 #include "internal.h"
+#include "sleep.h"
 
 #define ACPI_BUS_CLASS			"system_bus"
 #define ACPI_BUS_HID			"LNXSYBUS"
-- 
2.40.0.1.gaa8946217a0b

