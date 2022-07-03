Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD1D1564875
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Jul 2022 17:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbiGCPmf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Jul 2022 11:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbiGCPmd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Jul 2022 11:42:33 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2850D633C;
        Sun,  3 Jul 2022 08:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656862952; x=1688398952;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PSyqYyC0J2kJSoqRvHgJQSUMUuLg3p+H4Cjpxh3d8gQ=;
  b=MUxtuedVSVXOvdRdCQ0MlYirX5stqMxuiJLfq3gn0UCP1JxMcTnnxqkj
   aj2ZVIrvu8GEQNcgbng5eXnf1iuJ4oOfduqFzLbdUDYGrhboVdaCtf8WQ
   zqH96fG+RqPFe4DH/vGyhBnYQO8pcZfgo2zD+aPWCa9dqB+ObWTDFsroB
   qSQuAj5ecZxsI1rT+Nxbsi6kcPhmsD5Fk2Ll6B9Y1/CaSdSxwjDlLkDhG
   K8Ng7RT7GLDcEVZY4Svgfd/Okr1yja7E0mzuPBbblf2498owNPx6EMvL2
   NZ+cJVsHrjpOTySHoFfeKvoBo1PCh8RxjYNcnNtk9QXaci9Dlje5h0TRg
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="265986455"
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; 
   d="scan'208";a="265986455"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2022 08:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; 
   d="scan'208";a="596759636"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 03 Jul 2022 08:42:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CF93111D; Sun,  3 Jul 2022 18:42:33 +0300 (EEST)
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
Subject: [PATCH v2 1/2] lib/string_helpers: Add str_read_write() helper
Date:   Sun,  3 Jul 2022 18:42:31 +0300
Message-Id: <20220703154232.55549-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add str_read_write() helper to retun 'read' or 'write' string literal.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no changes
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

