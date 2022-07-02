Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B33B564076
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Jul 2022 15:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbiGBN7f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Jul 2022 09:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiGBN7f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Jul 2022 09:59:35 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7EF9BF56;
        Sat,  2 Jul 2022 06:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656770374; x=1688306374;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5+9mOmrkQARlLFpA6fKyHF3zesf+qeyZln9SHF45wiE=;
  b=Ov/YObM6XQPUPK4M7K9dCIiuZAisGFz68gMr815drFwiKc6ryU7AMgLW
   v1y0ub7hCHUC9fTuo+tgFXkiz2/a0jlUn/uifKDJ9SqZc+GqbV9OKCmN+
   6f0p1ijcb4xCRrLwGcLFRFnLXy/BDzTQSVDTMMLeKNgNfbu3mNRU6htpy
   2xuQjT4EdEOZVVtXa5lfF5uJnHCI+W9Mb55NSD1RferQe/7Q4Xq7Vj2Ke
   ff7PnWhMEtd/EEroSfGAHAFTM0/JO+DD9gQnLNW3FFRNgUntnsYStDm/y
   fNgovUa5TCeOrjCskVKpco67UHfKmb5kkrRS5/Ge66ti7hq8/WEQxkcRB
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="281595120"
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="281595120"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 06:59:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="566635210"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 02 Jul 2022 06:59:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9869C11D; Sat,  2 Jul 2022 16:59:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Michael Walle <michael@walle.cc>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Till Harbaum <till@harbaum.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v1 1/2] lib/string_helpers: Add str_read_write() helper
Date:   Sat,  2 Jul 2022 16:59:24 +0300
Message-Id: <20220702135925.73406-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add str_read_write() helper to retun 'read' or 'write' string literal.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/string_helpers.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 4d72258d42fd..9e22cd78f3b8 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -126,4 +126,9 @@ static inline const char *str_enabled_disabled(bool v)
 	return v ? "enabled" : "disabled";
 }
 
+static inline const char *str_read_write(bool v)
+{
+	return v ? "read" : "write";
+}
+
 #endif
-- 
2.35.1

