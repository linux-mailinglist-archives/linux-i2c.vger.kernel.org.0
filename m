Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2006537A6D
	for <lists+linux-i2c@lfdr.de>; Mon, 30 May 2022 14:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbiE3MM2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 May 2022 08:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232772AbiE3MMY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 May 2022 08:12:24 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF76264DA;
        Mon, 30 May 2022 05:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653912741; x=1685448741;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DeTJ//ACZ+GbIqNDL5ldU1GM6Zqrwpx5eq9jPZbEEw8=;
  b=I+zgfExuFz4NzPjUbdfMB3F6wBgGIYXhl9khqF8hmFH7Hw+6ltSx/kr3
   Vh95NZA0lIll9byvFAXxnF9IGrEKFbbT16i87O2NQJcV0dAJ0dMqvOe+O
   7QMItW1IdJcgrOa/BRzvAvNQWlz13i+GCWIIEVApdJQkZ2tm/oYlNn5Pg
   Mwvd1WfBE4B9uZge30xHH75KnM1BX9UWVHJb3w5MeXfS5qV6AfdMIWqDJ
   QdKSIUf7Zky4h398SBFp3sF43Tbz57sHq04a9F/CrMlzAgf/nRixg0JGx
   JGziovAAp0WCYOHXII1fhY5ETANM1IU5H0aI/MSFrDTP6fbwvKQ85oLGu
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="300334557"
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; 
   d="scan'208";a="300334557"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 05:12:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; 
   d="scan'208";a="605161105"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 30 May 2022 05:12:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6B5511A7; Mon, 30 May 2022 15:12:21 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        dave.hansen@linux.intel.com
Subject: [PATCH v1 1/1] MAINTAINERS: Update Synopsys DesingWare I2C to Supported
Date:   Mon, 30 May 2022 15:02:47 +0300
Message-Id: <20220530120247.70582-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The actual status of the code is Supported (from x86 perspective).

Reported-by: dave.hansen@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 56dd473d5d59..f8ff2b523498 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19066,7 +19066,7 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Mika Westerberg <mika.westerberg@linux.intel.com>
 R:	Jan Dabros <jsd@semihalf.com>
 L:	linux-i2c@vger.kernel.org
-S:	Maintained
+S:	Supported
 F:	drivers/i2c/busses/i2c-designware-*
 
 SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
-- 
2.35.1

